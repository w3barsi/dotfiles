#Requires AutoHotkey v2.0
#SingleInstance
#Include "%A_ScriptDir%/audio.ahk"
#Include "%A_ScriptDir%/utils.ahk"


global DefaultBrowser := "chrome.exe"


F15:: {
    if (SpeakerMode == true) {
        SetDefaultEndpoint(GetDeviceID(List, "Speakers (PD200X Podcast Microphone)"))
        global SpeakerMode := false
        TraySetIcon("C:\Users\Barsi\Documents\IEM.png")
        IniWrite("Speakers (PD200X Podcast Microphone)", FileName, "Audio", "default")
    } else {
        SetDefaultEndpoint(GetDeviceID(List, "Speakers (Realtek(R) Audio)"))
        global SpeakerMode := true
        TraySetIcon("C:\Users\Barsi\Documents\Speakers.png")

        IniWrite("Speakers (Realtek(R) Audio)", FileName, "Audio", "default")
    }

}

Komorebic(cmd) {
    RunWait(format("komorebic.exe {}", cmd), , "Hide")
}
^!+1:: Komorebic("move-to-workspace 0")
^!+2:: Komorebic("move-to-workspace 1")
^!+3:: Komorebic("move-to-workspace 2")
^!+q:: Komorebic("focus-workspace 0")
^!+w:: Komorebic("focus-workspace 1")
^!+e:: Komorebic("focus-workspace 2")

#HotIf not WinActive("ahk_exe dota2.exe")
#HotIf not WinActive("ahk_exe BlackDessert64.exe")
; Debug Commands
^!+r:: Reload()
^!+g:: DisplayWinGetPos()
^!+XButton1:: MsgBox("Mouse Forward")
^!+XButton2:: MsgBox("Mouse Backward")

!`:: CycleApp()
<#q:: WinClose("A")
; ^!+r:: ToggleFullAndCenter()

; Workflows
^!+b:: OpenOrMinimize(DefaultBrowser)
^!+Enter:: TerminalOrBrowser()

; Window Move commands
^!+f:: WinFullscreen()

^!+l:: {
    WinGetPos &X, &Y, &W, &H, "A"
    WinRestore("A")

    if (isFourth(X) and isThird(W)) {
        WinMoveEx(WorkableScreenWidth / 4 * 3, 1, (WorkableScreenWidth / 4) - 1, WorkableScreenHeight, "A")
    } else if (isHalf(X) and isHalf(W)) {
        WinMoveEx(WorkableScreenWidth / 4, 1, (WorkableScreenWidth / 4 * 3) - 1, WorkableScreenHeight, "A")
    } else if ( not isHalf(X)) {
        WinMoveEx(WorkableScreenWidth / 2, 1, (WorkableScreenWidth / 2) - 1, WorkableScreenHeight, "A")
    }
}


^!+h:: {
    WinGetPos &X, &Y, &W, &H, "A"
    WinRestore("A")

    ;is window in left or window in left and size is
    if ( not (X > -8 and X <= 0) or ((X > -8 and X <= 0) and (W > 620 and W < 1260))) {
        WinMoveEx(1, 1, WorkableScreenWidth / 2, WorkableScreenHeight, "A")
    } else if ((X > -8 and X <= 0) and (W > 1260 and W < 1300)) {
        WinMoveEx(1, 1, WorkableScreenWidth - (WorkableScreenWidth / 4), WorkableScreenHeight, "A")
    } else {
        WinMoveEx(1, 1, WorkableScreenWidth / 4, WorkableScreenHeight, "A")
    }
}
^!+k:: {
    WinRestore("A")
    WinMoveEx(1, 2, WorkableScreenWidth, WorkableScreenHeight / 2, "A")
}
^!+j:: {
    WinRestore("A")
    WinMoveEx(1, WorkableScreenHeight / 2, WorkableScreenWidth, WorkableScreenHeight / 2, "A")
}

^!+;:: {
    WinRestore("A")
    WinMoveEx(1, 2, WorkableScreenWidth / 4, WorkableScreenHeight, "A")
}

^!+':: {
    WinRestore("A")
    WinMoveEx(641, 2, WorkableScreenWidth / 4 * 3, WorkableScreenHeight, "A")
}

^!+\:: {
    WinGetPos &X, &Y, &W, &H, "A"
    if (H > 1080 and H < 1100) {
        WinMoveEx(640, 1082, 1920, WorkableScreenHeight - 1082, "A")
    } else {
        WinRestore("A")
        WinMoveEx(640, 1, 1920, 1080, "A")
    }
}

^!+c:: {
    ; Checks if fullscreen and return if it is
    WinState := WinGetMinMax("A")
    if (WinState == 1) {
        return 0
    }

    WinGetPos &X, &Y, &W, &H, "A"
    toHeight := 0
    toWidth := 0
    if (H > WorkableScreenHeight + 20) {
        toHeight := WorkableScreenHeight
    }
    if (W > WorkableScreenWidth + 20) {
        toWidth := WorkableScreenWidth
    }
    if (toWidth == 0 and toHeight == 0) {
        WinMoveEx((WorkableScreenWidth - W) / 2, ((WorkableScreenHeight - H) / 2) + 4, , , "A")
    } else {
        WinMoveEx((WorkableScreenWidth - toWidth) / 2, ((WorkableScreenHeight - toHeight) / 2) + 4, toWidth, toHeight, "A")
    }
}


TerminalOrBrowser() {
    if ( not WinExist("ahk_exe WindowsTerminal.exe") or not WinExist(Format("ahk_exe {1}", DefaultBrowser))) {
        if ( not WinExist("ahk_exe WindowsTerminal.exe")) {
            Run("C:\Program Files\WindowsApps\Microsoft.WindowsTerminal_1.20.11781.0_x64__8wekyb3d8bbwe\WindowsTerminal.exe")
        }
        if ( not WinExist(Format("ahk_exe {1}", DefaultBrowser))) {
            Run(DefaultBrowser)
        }
        return
    }
    if (WinActive("ahk_exe WindowsTerminal.exe")) {
        WinActivate(Format("ahk_exe {1}", DefaultBrowser))
    } else if (WinActive(Format("ahk_exe {1}", DefaultBrowser))) {
        WinActivate("ahk_exe WindowsTerminal.exe")
    } else {
        WinActivate("ahk_exe WindowsTerminal.exe")
    }
}

DisplayWinGetPos() {
    WinGetPos &X, &Y, &W, &H, "A"
    ;     "X:  " . X . " |  Y:  " . Y
    ; variableString := (
    ;     "W:  " . W . " |  H:  " . H
    ; )
    ; MsgBox(variableString)
    MsgBox(Format("X: {1}`tY: {2}`nW: {3}`tH: {4} `n`nWindow Title:`n`t{5}`n{6}", X, Y, W, H, WinGetTitle("A"), WinGetID("A")))
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


; F12:: {  ; F12 = Auto-click
;     Static on := False
;     master_volume := SoundGetVolume()
;     SoundSetVolume(20)
;     If on := !on
;         SetTimer(Click, 1), Click(), SoundBeep(1500)
;     Else SetTimer(Click, 0), SoundBeep(1000)
;     SoundSetVolume(master_volume)
; }
