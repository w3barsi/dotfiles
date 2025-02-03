#Requires AutoHotkey v2.0
#SingleInstance
#Include "%A_ScriptDir%/audio.ahk"
#Include "%A_ScriptDir%/utils.ahk"
; #Include "%A_ScriptDir%/id.ahk"


global DefaultBrowserName := "zen.exe"
global DefaultBrowser := Format("ahk_exe {1}", DefaultBrowserName)
; global DefaultTerminal := "WindowsTerminal.exe"
global DefaultTerminalName := "wezterm-gui.exe"
global DefaultTerminal := Format("ahk_exe {1}", DefaultTerminalName)

global LastCommand := ""
setLastCommand(cmd) {
    global LastCommand := cmd
}

global RESIZE_BY := 15

F15:: {
    if (SpeakerMode == true) {
        SetDefaultEndpoint(GetDeviceID(List, "Headphones (USB-C to 3.5mm Headphone Jack Adapter)"))
        global SpeakerMode := false
        TraySetIcon("C:\Users\Barsi\Documents\IEM.png")
        IniWrite("Headphones (USB-C to 3.5mm Headphone Jack Adapter)", FileName, "Audio", "default")
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

; Debug Commands
^!+r:: Reload()
^!+g:: DisplayWinGetPos()
^!+XButton1:: MsgBox("Mouse Forward")
^!+XButton2:: MsgBox("Mouse Backward")

!`:: CycleApp()
<#q:: WinClose("A")

; Workflows
^!+b:: OpenOrMinimize(DefaultBrowser)
^!+Enter:: TerminalOrBrowser()

; Window Move commands
^!+f:: {
    WinState := WinGetMinMax("A")
    if (WinState == 1) {
        WinRestore("A")
    } else if (WinState == 0) {
        WinMaximize("A")
    } else {
        Return
    }

    setLastCommand("f")
}

^!+l:: {
    WinGetPosEx &X, &Y, &W, &H, "A"
    WinRestore("A")

    if (LastCommand == "k") {
        WinMoveEx(WorkableScreenWidth / 2, 0, WorkableScreenWidth / 2, WorkableScreenHeight / 2, "A")
    } else if (LastCommand == "j") {
        WinMoveEx(WorkableScreenWidth / 2, WorkableScreenHeight / 2, WorkableScreenWidth / 2, WorkableScreenHeight / 2, "A")
    } else if ( not LastCommand == "l") {
        WinMoveEx(WorkableScreenWidth / 2, 0, (WorkableScreenWidth / 2), WorkableScreenHeight, "A")
    } else if (LastCommand == "l" and isHalf(W)) {
        WinMoveEx(WorkableScreenWidth / 4, 0, (WorkableScreenWidth / 4) * 3, WorkableScreenHeight, "A")
    } else if (LastCommand == "l" and isThird(W)) {
        WinMoveEx((WorkableScreenWidth / 4) * 3, 0, WorkableScreenWidth / 4, WorkableScreenHeight, "A")
    } else if (LastCommand == "l" and isFourth(W)) {
        WinMoveEx(WorkableScreenWidth / 2, 0, (WorkableScreenWidth / 2), WorkableScreenHeight, "A")
    }


    setLastCommand("l")
}

^!+h:: {
    WinGetPosEx &X, &Y, &W, &H, "A"
    WinRestore("A")

    if (LastCommand == "k") {
        WinMoveEx(0, 0, WorkableScreenWidth / 2, WorkableScreenHeight / 2, "A")
    } else if (LastCommand == "j") {
        WinMoveEx(0, WorkableScreenHeight / 2, WorkableScreenWidth / 2, WorkableScreenHeight / 2, "A")
    } else if ( not LastCommand == "h") {
        WinMoveEx(0, 0, (WorkableScreenWidth / 2), WorkableScreenHeight, "A")
    } else if (LastCommand == "h" and isHalf(W)) {
        WinMoveEx(0, 0, (WorkableScreenWidth / 4) * 3, WorkableScreenHeight, "A")
    } else if (LastCommand == "h" and isThird(W)) {
        WinMoveEx(0, 0, (WorkableScreenWidth / 4), WorkableScreenHeight, "A")
    } else if (LastCommand == "h" and isFourth(W)) {
        WinMoveEx(0, 0, (WorkableScreenWidth / 2), WorkableScreenHeight, "A")
    }

    setLastCommand("h")
}

^!+k:: {
    WinRestore("A")
    WinMoveEx(0, 0, WorkableScreenWidth, WorkableScreenHeight / 2, "A")

    setLastCommand("k")
}
^!+j:: {
    WinRestore("A")
    WinMoveEx(0, WorkableScreenHeight / 2, WorkableScreenWidth, WorkableScreenHeight / 2, "A")

    setLastCommand("j")
}

^!+;:: {
    WinRestore("A")
    WinMoveEx(0, 0, WorkableScreenWidth / 4, WorkableScreenHeight, "A")

    setLastCommand(";")
}

^!+':: {
    WinRestore("A")
    WinMoveEx(WorkableScreenWidth / 4, 0, (WorkableScreenWidth / 4) * 3, WorkableScreenHeight, "A")

    setLastCommand("'")
}

^!+\:: {
    WinGetPosEx &X, &Y, &W, &H, "A"
    WinRestore("A")
    WinMoveEx(WorkableScreenWidth / 4, 0, (WorkableScreenWidth / 4) * 3, 1080, "A")

    setLastCommand("\")
}

^!+c:: {
    ; Checks if fullscreen and return if it is
    WinState := WinGetMinMax("A")
    if (WinState == 1) {
        return 0
    }
    WinGetPosEx &X, &Y, &W, &H, "A"

    toX := ((WorkableScreenWidth - W) / 2) < 0 ? 0 : ((WorkableScreenWidth - W) / 2)
    toY := ((WorkableScreenHeight - H) / 2) < 0 ? 0 : ((WorkableScreenHeight - H) / 2)
    toHeight := H > WorkableScreenHeight ? WorkableScreenHeight : H
    toWidth := W > WorkableScreenWidth ? WorkableScreenWidth : W

    WinMoveEx(toX, toY, , , "A")

    setLastCommand("c")
}

^!+-:: {
    ; Checks if fullscreen
    WinState := WinGetMinMax("A")
    if (WinState == 1) {
        WinRestore("A")
    }

    if (LastCommand == "f") {
        WinMoveEx(0, 0, WorkableScreenWidth, WorkableScreenHeight, "A")
    }

    WinGetPosEx &X, &Y, &W, &H, "A"
    WinMoveEx(X + RESIZE_BY, Y + RESIZE_BY, W - (RESIZE_BY * 2), H - (RESIZE_BY * 2), "A")

    setLastCommand("-")
}

^!++:: {
    if (LastCommand == "f") {
        return
    }

    ; Checks if fullscreen
    WinState := WinGetMinMax("A")
    if (WinState == 1) {
        WinRestore("A")
    }

    WinGetPosEx &X, &Y, &W, &H, "A"

    moveXBy := X - RESIZE_BY <= 0 ? 0 : X - RESIZE_BY
    moveYBy := Y - RESIZE_BY <= 0 ? 0 : Y - RESIZE_BY
    changeWidthTo := W + RESIZE_BY > WorkableScreenWidth ? WorkableScreenWidth : W + (RESIZE_BY * 2)
    changeHeightTo := H + RESIZE_BY > WorkableScreenHeight ? WorkableScreenHeight : H + (RESIZE_BY * 2)

    WinMoveEx(moveXBy, moveYBy, changeWidthTo, changeHeightTo, "A")

    setLastCommand("+")
}

Click() {
    MouseClick("Left")
}

F12:: {  ; F12 = Auto-click
    Static on := False
    master_volume := SoundGetVolume()
    SoundSetVolume(20)
    If on := !on
        SetTimer(Click, 1), Click(), SoundBeep(1500)
    Else SetTimer(Click, 0), SoundBeep(1000)
    SoundSetVolume(master_volume)
}

; Move the active window to the next monitor
; Move the active window to the next monitor
; Move the active window to the next monitor
!^+Space:: {
    Send "{LWin down}{Shift down}{Left}{Shift up}{LWin up}"
}
