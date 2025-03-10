WinGetPos , , &TaskbarWidth, &TaskbarHeight, "ahk_class Shell_TrayWnd"
; MsgBox(Format("{1}, {2}", TaskbarWidth, TaskbarHeight))

global WorkableScreenHeight := A_ScreenHeight - 48
global WorkableScreenWidth := A_ScreenWidth

isWithin(width, size) {
    if (width > size - 20 and width < size + 40) {
        return true
    }
    return false
}

isHalf(width) {
    half := WorkableScreenWidth / 2
    return isWithin(width, half)
}

isThird(width) {
    third := WorkableScreenWidth / 4 * 3
    return isWithin(width, third)
}
isFourth(width) {
    fourth := WorkableScreenWidth / 4
    return isWithin(width, fourth)
}

TerminalOrBrowser() {
    Browser := ""
    BrowserName := ""

    if (DevMode == true) {
        Browser := Format("ahk_exe {1}", DevModeBrowserName)
        BrowserName := DevModeBrowserName
    } else {
        Browser := Format("ahk_exe {1}", DefaultBrowserName)
        BrowserName := DefaultBrowserName
    }


    if ( not WinExist(DefaultTerminal) or not WinExist(Browser)) {
        if ( not WinExist(DefaultTerminal)) {
            Run(DefaultTerminalName)
        }
        if ( not WinExist(Format(Browser))) {
            Run(BrowserName)
        }
        return
    }
    if (WinActive(DefaultTerminal)) {
        WinActivate(Format(Browser))
    } else if (WinActive(Browser)) {
        WinActivate(DefaultTerminal)
    } else {
        WinActivate(DefaultTerminal)
    }
}

DisplayWinGetPos() {
    WinGetPos &X, &Y, &W, &H, "A"
    ;     "X:  " . X . " |  Y:  " . Y
    ; variableString := (
    ;     "W:  " . W . " |  H:  " . H
    ; )
    ; MsgBox(variableString)
    MsgBox(Format("X:`t{1}`tY:`t{2}`nW:`t{3}`tH:`t{4}`nWSW:`t{5}`tWSH:`t{6} `n`nWindow Title:`t{7}`n{8} `n {9} ", X, Y, W, H, WorkableScreenWidth, WorkableScreenHeight, WinGetTitle("A"), WinGetID("A"), A_ScriptDir))
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
    if (WinExist(DefaultBrowser)) {
        if ( not WinActive(DefaultBrowser)) {
            WinActivate(DefaultBrowser)
        } else {
            WinActivate(DefaultBrowser)
            WinMinimize("A")
            ; WinActivate("ahk_class Shell_TrayWnd")
        }
    } else {
        Run(DefaultBrowserName)
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
