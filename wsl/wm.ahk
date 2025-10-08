#Requires AutoHotkey v2.0
#SingleInstance

; #Include "%A_ScriptDir%/audio.ahk"
#Include "%A_ScriptDir%/utils.ahk"
#Include "%A_ScriptDir%/id.ahk"
; #Include "%A_ScriptDir%/momot.ahk"

global DevMode := false

; global DefaultBrowserName := "zen.exe"
; global DefaultBrowserName := "vivaldi.exe"
global DefaultBrowserName := "chrome.exe"
global DevModeBrowserName := "chrome.exe"
global DefaultBrowser := Format("ahk_exe {1}", DefaultBrowserName)
global DevModeBrowser := Format("ahk_exe {1}", DevModeBrowserName)

; global DefaultTerminal := "WindowsTerminal.exe"
global DefaultTerminalName := "wezterm-gui.exe"
; global DefaultTerminalName := "Cursor.exe"
global DefaultTerminal := Format("ahk_exe {1}", DefaultTerminalName)

global LastCommand := ""
setLastCommand(cmd) {
    global LastCommand := cmd
}
global RESIZE_BY := 15
; global IEM_LOCATION := "Speakers (PD200X Podcast Microphone)"
global IEM_LOCATION := "Headphones (USB-C to 3.5mm Headphone Jack Adapter)"


MonitorFromWindow(WinTitle := "A", Mode := 2) {
    if (!Hwnd := WinExist(WinTitle)) {
        return
    }

    MonitorInfo := Buffer(40), NumPut("UInt", MonitorInfo.Size, MonitorInfo)
    hMonitor := DllCall("MonitorFromWindow", "UInt", Hwnd, "UInt", Mode)
    DllCall("GetMonitorInfo", "Ptr", hMonitor, "Ptr", MonitorInfo)
    MonitorLeft := NumGet(MonitorInfo, 4, "Int"), MonitorTop := NumGet(MonitorInfo, 8, "Int")
    MonitorRight := NumGet(MonitorInfo, 12, "Int"), MonitorBottom := NumGet(MonitorInfo, 16, "Int")
    Loop (MonitorGetCount()) {
        MonitorGet(A_Index, &Left, &Top, &Right, &Bottom)
        if (MonitorLeft = Left && MonitorTop = Top && MonitorRight = Right && MonitorBottom = Bottom) {
            MsgBox(A_Index)
            MsgBox(Left)
            MsgBox(Right)
            MsgBox(Top)
            MsgBox(Bottom)
        }
    }
}


; F15:: {
;     if (SpeakerMode == true) {
;         SetDefaultEndpoint(GetDeviceID(List, IEM_LOCATION))
;         global SpeakerMode := false
;         TraySetIcon("C:\Users\Barsi\Documents\IEM.png")
;         ; IniWrite("Headphones (USB-C to 3.5mm Headphone Jack Adapter)", FileName, "Audio", "default")
;         IniWrite(IEM_LOCATION, FileName, "Audio", "default")
;     } else {
;         SetDefaultEndpoint(GetDeviceID(List, "Speakers (Realtek(R) Audio)"))
;         global SpeakerMode := true
;         TraySetIcon("C:\Users\Barsi\Documents\Speakers.png")
;
;         IniWrite("Speakers (Realtek(R) Audio)", FileName, "Audio", "default")
;     }
;
;
; }

^!+F15:: {
    volume := SoundGetVolume()
    SoundSetVolume(5)
    if (DevMode == true) {
        global DevMode := false
        SoundBeep(2500)
    } else {
        global DevMode := true
        SoundBeep(500)
    }
    SoundSetVolume(volume)
}


; Debug Commands
^!+r:: Reload()
^!+g:: DisplayWinGetPos()
^!+XButton1:: MsgBox("Mouse Forward")
^!+XButton2:: MsgBox("Mouse Backward")

!`:: CycleApp()
<#q:: WinClose("A")

; Workflows
^!+b:: OpenOrMinimize(DefaultBrowser)
^!+d:: {
    window := "ahk_exe Discord.exe"
    if (WinExist(window)) {
        if ( not WinActive(window)) {
            WinActivate(window)
        } else {
            WinActivate(window)
            WinMinimize("A")
            ; WinActivate("ahk_class Shell_TrayWnd")
        }
    } else {
        Run(window)
    }
}
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
    WinMoveEx(0, 0, 2055, WorkableScreenHeight, "A")

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

; F12:: {  ; F12 = Auto-click
;     Static on := False
;     master_volume := SoundGetVolume()
;     SoundSetVolume(20)
;     If on := !on
;         SetTimer(Click, 50), Click(), SoundBeep(1500)
;     Else SetTimer(Click, 0), SoundBeep(1000)
;     SoundSetVolume(master_volume)
; }


; F12:: {  ; F12 = Auto-click
;     Static on := False
;     If on := !on
;         SendInput("{s down}{d down}")
;     Else
;         SendInput("{s up}{d up}")
; }

; F12:: {
;     MouseGetPos &xpos, &ypos
;     LeftClick(xpos, ypos)
;     ; Sleep(200)
;     LeftClick(xpos, ypos + 150)
;     MouseMove(xpos, ypos)
; }

; F1:: {
;     CoordMode("Mouse", "Screen")
;     MouseGetPos &xpos, &ypos
;     RightClick(xpos, ypos)
;     LeftClick(xpos + 20, ypos + 270)
;     SendInput("{Enter}")
;     MouseMove(xpos, ypos)
; }

; F1:: MoveWindowToNextMonitor()

MoveWindowToNextMonitor() {
    ; Get the active window
    activeWindow := WinGetID("A")

    ; Get window position and size
    WinGetPos(&winX, &winY, &winWidth, &winHeight, activeWindow)

    ; Get monitor count
    monitorCount := MonitorGetCount()

    ; If only one monitor, do nothing
    if (monitorCount <= 1) {
        return
    }

    ; Find which monitor the window is currently on
    currentMonitor := GetMonitorFromWindow(winX, winY)

    ; Calculate next monitor (wrap around to 1 if at the end)
    nextMonitor := currentMonitor >= monitorCount ? 1 : currentMonitor + 1

    WinState := WinGetMinMax(activeWindow)
    if (WinState == 1) {
        WinRestore(activeWindow)
    }

    ; Move window to the next monitor
    MoveWindowToMonitor(activeWindow, currentMonitor, nextMonitor, winX, winY, winWidth, winHeight)

    ; Focus on window
    WinActivate(activeWindow)

    ;If it was previously fullscreened, fullscreen it again
    if (WinState == 1) {
        WinMaximize(activeWindow)
    }
}

MoveWindowToPrevMonitor() {
    ; Get the active window
    activeWindow := WinGetID("A")

    ; Get window position and size
    WinGetPos(&winX, &winY, &winWidth, &winHeight, activeWindow)

    ; Get monitor count
    monitorCount := MonitorGetCount()

    ; If only one monitor, do nothing
    if (monitorCount <= 1) {
        return
    }

    ; Find which monitor the window is currently on
    currentMonitor := GetMonitorFromWindow(winX, winY)

    ; Calculate previous monitor (wrap around to last if at the beginning)
    prevMonitor := currentMonitor <= 1 ? monitorCount : currentMonitor - 1

    ; Move window to the previous monitor
    MoveWindowToMonitor(activeWindow, currentMonitor, prevMonitor, winX, winY, winWidth, winHeight)
}

MoveWindowToMonitor(windowID, currentMonitor, targetMonitor, winX, winY, winWidth, winHeight) {
    ; Get work areas for both monitors
    MonitorGetWorkArea(currentMonitor, &currentLeft, &currentTop, &currentRight, &currentBottom)
    MonitorGetWorkArea(targetMonitor, &targetLeft, &targetTop, &targetRight, &targetBottom)

    ; Calculate relative position on current monitor
    currentWidth := currentRight - currentLeft
    currentHeight := currentBottom - currentTop
    targetWidth := targetRight - targetLeft
    targetHeight := targetBottom - targetTop

    relativeX := (winX - currentLeft) / currentWidth
    relativeY := (winY - currentTop) / currentHeight

    ; Calculate new position on target monitor
    newX := targetLeft + (relativeX * targetWidth)
    newY := targetTop + (relativeY * targetHeight)

    ; Ensure window fits within the target monitor
    if (newX + winWidth > targetRight) {
        newX := targetRight - winWidth
    }
    if (newY + winHeight > targetBottom) {
        newY := targetBottom - winHeight
    }
    if (newX < targetLeft) {
        newX := targetLeft
    }
    if (newY < targetTop) {
        newY := targetTop
    }

    ; Move the window
    WinMove(newX, newY, , , windowID)
}

GetMonitorFromWindow(winX, winY) {
    monitorCount := MonitorGetCount()

    Loop monitorCount {
        MonitorGetWorkArea(A_Index, &left, &top, &right, &bottom)

        if (winX >= left && winX < right && winY >= top && winY < bottom) {
            return A_Index
        }
    }

    ; If not found, return monitor 1
    return 1
}
