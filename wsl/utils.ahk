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
