; F1:: PrintID("front")
; F2:: PrintID("back")
; F1:: EncodeBogoGlass(true)
; F2:: EncodeBogoGlass(false)
; F1:: {
; 	SendInput "{LButton down}"
; 	MouseMove(200, 200)
; 	SendInput "{LButton up}"
; }
; F1:: EncodeBorbonPix()
; F1:: EncodeBorbonSig()
; F2:: EncodeBorobnPixP2()
F3:: MoveFirstItem()
F1:: TemplateFull()

TemplateFull() {
	time := 200

	CoordMode("Mouse", "Screen")
	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(1322, 64) ; New
	Sleep(time)

	LeftClick(1603, 374) ; Photo Button
	LeftClick(1652, 389) ; Browse
	LeftClick(1260, 535) ; Double Click Picture
	LeftClick(1260, 535) ; Double Click Picture

	MoveFirstItem()

	LeftClick(1603, 695) ; Sig Button
	LeftClick(1652, 720) ; Browse
	LeftClick(1260, 535) ; Double Click Picture
	LeftClick(1260, 535) ; Double Click Picture

	MoveFirstItem()

	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(1318, 63) ; Double Click Picture
}
MoveFirstItem() {
	CoordMode("Mouse", "Screen")
	MouseMove(475, 244)
	Sleep(200)
	SendInput "{LButton down}"
	MouseMove(400, 205)
	Sleep(200)
	MouseMove(800, 205)
	Sleep(200)
	MouseMove(218, 205)
	SendInput "{LButton up}"
}

EncodeBorbonSig() {
	time := 650
	CoordMode("Mouse", "Screen")
	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(1396, 65)
	Sleep(time)
	LeftClick(1875, 414)
	LeftClick(1929, 435)
	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(1262, 535)
	LeftClick(1515, 772)
	Sleep(200)
	MoveFirstItem()
	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(1317, 64)
	Sleep(500)
	LeftClick(2541, 63)
	LeftClick(1409, 101)
	LeftClick(1409, 101)
	LeftClick(1323, 121)
}


EncodeBorbonPix() {
	time := 650
	CoordMode("Mouse", "Screen")
	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(1396, 65)
	Sleep(time)
	LeftClick(1875, 133)
	LeftClick(1929, 154)
	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(1262, 535)
	LeftClick(1515, 772)
	Sleep(200)
	MoveFirstItem()
	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(1875, 133)
	LeftClick(1929, 200)
	WinActivate("ahk_exe IDFlow.exe")
	LeftClick(974, 754)
}
; EncodeBorobnPixP2() {
; 	CoordMode("Mouse", "Screen")
; 	WinActivate("ahk_exe IDFlow.exe")
; 	; For picture
; 	; LeftClick(1383, 918)
; 	LeftClick(1317, 64)
; 	Sleep(500)
; 	LeftClick(2541, 63)
; 	LeftClick(1409, 101)
; 	LeftClick(1409, 101)
; 	LeftClick(1323, 121)
; }

LeftClick(x, y) {
	MouseClick("left", x, y)
	Sleep(200)
}

EncodeBogoGlass(pix) {
	time := 750
	; Click edit
	CoordMode("Mouse", "Screen")
	MouseClick("left", 1391, 59)
	Sleep(time)
	; Click pix/sig button
	if (pix == true) {
		MouseClick("left", 1763, 131)
		;Click browse
		MouseClick("left", 1811, 153)
		Sleep(time)
	} else {
		MouseClick("left", 1763, 261)
		MouseClick("left", 1811, 287)
		Sleep(time)
	}
	; Choose photo
	MouseClick("left", 1256, 539)
	MouseClick("left", 1256, 539)
	Sleep(time)
	; Turn off crop
	MouseClick("left", 975, 758)
	MouseClick("left", 1388, 915)
	; Save
	MouseClick("left", 1314, 60)
	Sleep(time)
	MouseClick("left", 2160, 60)
	MouseMove(334, 228)


}

PrintID(side) {
	speed := 750
	if WinExist("ahk_exe IDFlow.exe") {
		WinActivate("ahk_exe IDFlow.exe")
	}
	CoordMode "Mouse", "Screen"
	; Click Print
	MouseClick "left", 264, 54
	Sleep speed
	; Click Setup
	MouseClick "left", 1394, 527
	Sleep speed
	; Click Properties
	MouseClick "left", 1410, 540
	Sleep speed
	; Click Pvc ID
	MouseClick "left", 1137, 816
	MouseClick "left", 1137, 816
	Sleep speed
	; Click OK
	MouseClick "left", 1461, 1081
	Sleep speed
	; Click PrintSide Dropdown
	MouseClick "left", 1282, 813
	Sleep speed
	if (side == "front") {
		MouseClick "left", 1282, 828
	} else if (side = "back") {
		MouseClick "left", 1282, 842
	} else if (side = "both") {
		MouseClick "left", 1819, 1290
	}

	Sleep speed
	; Click PrintOptionsOk
	MouseClick "left", 1323, 870
	Sleep speed


	; Click Print
	MouseClick "left", 1253, 837
}
