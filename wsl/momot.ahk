`:: {
    SendInput("{Tab}")
    SendInput("{Tab}")
    SendInput("{Tab}")
    SendInput("{Tab}")
}

F1:: {
    ; send ctrl+c
    SendInput("{Ctrl Down}{c}{Ctrl Up}")
    WinActivate("ahk_exe msedge.exe")
    SendInput("{Tab}")
    SendInput("{Tab}")
    SendInput("{Tab}")
    SendInput("{Ctrl Down}{Shift Down}{v}{Ctrl Up}{Shift Up}")

    CoordMode("Mouse", "Screen")
    MouseMove(1172, 1352)
    Sleep(50)
    SendInput("{WheelDown}")
    SendInput("{WheelDown}")
    SendInput("{WheelDown}")
}

F2:: {
    ; send ctrl+shift+v
    SendInput("{Ctrl Down}{Shift Down}{v}{Ctrl Up}{Shift Up}")
}
