#Requires AutoHotkey v2.0
#SingleInstance

; WinGetPos ,,&TaskbarWidth, &TaskbarHeight, "ahk_class Shell_TrayWnd"
global WorkableScreenHeight := A_ScreenHeight - 49
global WorkableScreenWidth := A_ScreenWidth

; Debug Commands
^!+`:: Reload()
^!+e:: DisplayWinGetPos()

!`:: CycleApp()
^!+q:: WinClose("A")
^!+r:: ToggleFullAndCenter()

; Workflows
^!+b:: OpenOrMinimize("chrome.exe")
^!+Enter:: TerminalOrBrowser()

; Window Move commands
^!+f:: WinFullscreen()

^!+l:: {
    WinRestore("A")
    WinMoveEx(WorkableScreenWidth / 2, 1, WorkableScreenWidth / 2, WorkableScreenHeight, "A")
}
^!+h:: {
    WinRestore("A")
    WinMoveEx(1, 1, WorkableScreenWidth / 2, WorkableScreenHeight, "A")
}
^!+k:: {
    WinRestore("A")
    WinMoveEx(1, 1, WorkableScreenWidth, WorkableScreenHeight / 2, "A")
}
^!+j:: {
    WinRestore("A")
    WinMoveEx(1, WorkableScreenHeight / 2, WorkableScreenWidth, WorkableScreenHeight / 2, "A")
}

^!+;:: {
    WinRestore("A")
    WinMoveEx(1, 1, 638, WorkableScreenHeight, "A")
}

^!+':: {
    WinRestore("A")
    WinMoveEx(641, 1, WorkableScreenWidth - 642, WorkableScreenHeight, "A")
}


^!+c:: CenterToScreen()


CenterToScreen() {
    WinGetPos &X, &Y, &W, &H, "A"
    toHeight := 0
    toWidth := 0
    if (H > WorkableScreenHeight) {
        toHeight := WorkableScreenHeight
    } else {
        toHeight := H
    }

    if (W > WorkableScreenWidth) {
        toWidth := WorkableScreenWidth
    } else {
        toWidth := W
    }

    if (H == 1401) {
        WinMoveEx((WorkableScreenWidth - toWidth) / 2, 1, toWidth, toHeight, "A")
    } else {
        WinMoveEx((WorkableScreenWidth - toWidth) / 2, (WorkableScreenHeight - toHeight) / 2, toWidth, toHeight, "A")
    }

}

TerminalOrBrowser() {
    if ( not WinExist("ahk_exe WindowsTerminal.exe")) {
        Run("wt.exe")
    }
    if ( not WinExist("ahk_exe chrome.exe")) {
        Run("chrome.exe")
    }
    if (WinActive("ahk_exe WindowsTerminal.exe")) {
        WinActivate("ahk_exe chrome.exe")
    } else if (WinActive("ahk_exe chrome.exe")) {
        WinActivate("ahk_exe WindowsTerminal.exe")
    } else {
        Return
    }
}

DisplayWinGetPos() {

    WinGetPos &X, &Y, &W, &H, "A"
    MsgBox(Format("X: {1}   Y: {2}   W: {3}   H: {4}", X, Y, W, H))
}

ToggleFullAndCenter() {
    WinGetPos &X, &Y, &W, &H, "A"
    if (X == -8 and Y == -8) {
        WinRestore("A")
    } else {
        WinMaximize("A")
    }
}

WinFullscreen() {
    WinState := WinGetMinMax("A")
    if (WinState == 1) {
        WinRestore("A")
    } else if (WinState == 0) {
        WinMaximize("A")
    } else {
        Return
    }
}

WinInvisible() {
    WinMoveEx(3000, 0, 0, 0, "A")
}

OpenOrMinimize(class?) {
    if (WinExist("ahk_exe" class)) {
        if ( not WinActive("ahk_exe" class)) {
            WinActivate("ahk_exe" class)
        } else {
            WinActivate("ahk_exe" class)
            WinMinimize("A")
            ; WinActivate("ahk_class Shell_TrayWnd")
        }
    } else {
        Run(class)
    }
}

CycleApp() {
    ActiveProcess := WinGetProcessName("A")
    OpenWindowsAmount := WinGetCount("ahk_exe" ActiveProcess)
    ; If only one Window exist, do nothing
    if (OpenWindowsAmount = 1) {
        Return
    } else {
        FullTitle := WinGetTitle("A")
        AppTitle := SubStr(FullTitle, InStr(FullTitle, " ", false, -1) + 1)
        SetTitleMatchMode(2)
        WindowsWithSameTitleList := WinGetList("ahk_exe" ActiveProcess)
        ; If several Window of same type (title checking) exist
        if (WindowsWithSameTitleList.Length > 1) {
            ; Activate next Window
            WinActivate("ahk_id " WindowsWithSameTitleList[WindowsWithSameTitleList.Length])
        }
        Return
    }
    Return
}


; Get window position without the invisible border.
WinGetPosEx(&X?, &Y?, &W?, &H?, hwnd?) {
    static DWMWA_EXTENDED_FRAME_BOUNDS := 9
    if !IsSet(hwnd)
        hwnd := WinExist() ; last found window
    if !(hwnd is integer)
        hwnd := WinExist(hwnd)
    DllCall("dwmapi\DwmGetWindowAttribute"
        , "ptr", hwnd
        , "uint", DWMWA_EXTENDED_FRAME_BOUNDS
        , "ptr", RECT := Buffer(16, 0)
        , "uint", RECT.size
        , "uint")
    X := NumGet(RECT, 0, "int")
    Y := NumGet(RECT, 4, "int")
    W := NumGet(RECT, 8, "int") - X
    H := NumGet(RECT, 12, "int") - Y

}

; Move window and fix offset from invisible border.
WinMoveEx(X?, Y?, W?, H?, hwnd?) {
    if !(hwnd is integer)
        hwnd := WinExist(hwnd)
    if !IsSet(hwnd)
        hwnd := WinExist()
    ; compare pos and get offset
    WinGetPosEx(&fX, &fY, &fW, &fH, hwnd)
    WinGetPos(&wX, &wY, &wW, &wH, hwnd)
    xDiff := fX - wX
    hDiff := wH - fH
    pixel := 1
    ; new X, Y, W, H with offset corrected.
    IsSet(X) && nX := X - xDiff - pixel
    IsSet(Y) && nY := Y - pixel
    IsSet(W) && nW := W + (xDiff + pixel) * 2
    IsSet(H) && nH := H + hDiff + (pixel * 2)
    WinMove(nX?, nY?, nW?, nH?, hwnd?)
}
