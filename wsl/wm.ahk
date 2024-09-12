#Requires AutoHotkey v2.0
#SingleInstance

; WinGetPos ,,&TaskbarWidth, &TaskbarHeight, "ahk_class Shell_TrayWnd"
global WorkableScreenHeight := A_ScreenHeight - 49
global WorkableScreenWidth := A_ScreenWidth

global SpeakerMode := true

global DefaultBrowser := "chrome.exe"

FolderPath := "C:\temp"
FileName := "C:\temp\count.ini"
If !DirExist(FolderPath) {
    DirCreate(FolderPath)
}
If !FileExist(FileName) {
    IniWrite("Speakers (PD200X Podcast Microphone)", FileName, "Audio", "default")
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

windowBanList := ["dota2.exe"]


#HotIf not WinActive("ahk_exe dota2.exe")
#HotIf not WinActive("ahk_exe BlackDessert64.exe")
; Debug Commands
^!+`:: Reload()
^!+g:: DisplayWinGetPos()
^!+XButton1:: MsgBox("Mouse Forward")
^!+XButton2:: MsgBox("Mouse Backward")
^!+q:: Send("(")
^!+a:: Send(")")
^!+w:: Send("{{}")
^!+s:: Send("{}}")
^!+e:: Send("[")
^!+d:: Send("]")

!`:: CycleApp()
<#q:: WinClose("A")
^!+r:: ToggleFullAndCenter()

; Workflows
^!+b:: OpenOrMinimize(DefaultBrowser)
^!+Enter:: TerminalOrBrowser()

; Window Move commands
^!+f:: WinFullscreen()

isHalf(W) {
    half := WorkableScreenWidth / 2
    if (W > half - 20 and W < half + 40) {
        return True
    }
    return False
}

isFourth(W) {
    fourth := WorkableScreenWidth / 4
    if (W > fourth - 20 and W < fourth + 40) {
        return True
    }
    return False
}

isThird(W) {
    third := WorkableScreenWidth / 4 * 3
    if (W > third - 20 and W < third + 40) {
        return True
    }
    return False
}

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

class _ArrayEx extends Array {
    static __New() {
        super.Prototype.Sort := ObjBindMethod(this, "Sort")
        super.Prototype.Contains := ObjBindMethod(this, "Contains")
    }

    static Sort(arr) {
        tempMap := Map()
        Loop (arr.length) {
            tempMap[arr[A_Index]] := "placeholder"
        }
        for k, v in tempMap {
            arr[A_Index] := k
        }
    }

    static Contains(haystack, needle) {
        for index, value in haystack {
            if (value = needle) {
                return index
            }
        }
        return false
    }
}


List := EnumAudioEndpoints()

Devices := ""
for Device in List
    Devices .= Format("{} ({})`n`n", Device["Name"], Device["ID"])

; Sets default audio device on startup
; Options:
;   - Speakers
;   - Microphone 3.5 Port
; SetDefaultEndpoint(GetDeviceID(List, "Speakers (Realtek(R) Audio)"))
DefaultAudio := IniRead(FileName, "Audio", "default")
SetDefaultEndpoint(GetDeviceID(List, DefaultAudio))
if (DefaultAudio == "Speakers (PD200X Podcast Microphone)") {
    TraySetIcon("C:\Users\Barsi\Documents\IEM.png")
} else {
    TraySetIcon("C:\Users\Barsi\Documents\Speakers.png")
}
; F6::
; {
;     SetDefaultEndpoint(GetDeviceID(List, "DENON-AVR (NVIDIA High Definition Audio)"))
;     SetDefaultEndpoint(GetDeviceID(List, "Microphone (Yeti Stereo Microphone)"))
; }


/*
    Generates a collection of audio endpoint devices that meet the specified criteria.
    Parameters:
        DataFlow:
            The data-flow direction for the endpoint devices in the collection.
            0   Audio rendering stream. Audio data flows from the application to the audio endpoint device, which renders the stream.
            1   Audio capture stream. Audio data flows from the audio endpoint device that captures the stream, to the application.
            2   Audio rendering or capture stream. Audio data can flow either from the application to the audio endpoint device, or from the audio endpoint device to the application.
        StateMask:
            The state or states of the endpoints that are to be included in the collection.
            1   Active. The audio adapter that connects to the endpoint device is present and enabled. In addition, if the endpoint device plugs into a jack on the adapter, then the endpoint device is plugged in.
            2   Disabled. The user has disabled the device in the Windows multimedia control panel (Mmsys.cpl).
            4   Not present. The audio adapter that connects to the endpoint device has been removed or disabled.
            8   Unplugged. The audio adapter that contains the jack for the endpoint device is present and enabled, but the endpoint device is not plugged into the jack. Only a device with jack-presence detection can be in this state.
    Return value:
        Returns an array of Map objects with the following keys:
        ID      Endpoint ID string that identifies the audio endpoint device.
        Name    The friendly name of the endpoint device.
*/
EnumAudioEndpoints(DataFlow := 2, StateMask := 1)
{
    List := []

    ; IMMDeviceEnumerator interface.
    ; https://docs.microsoft.com/en-us/windows/win32/api/mmdeviceapi/nn-mmdeviceapi-immdeviceenumerator
    IMMDeviceEnumerator := ComObject("{BCDE0395-E52F-467C-8E3D-C4579291692E}", "{A95664D2-9614-4F35-A746-DE8DB63617E6}")

    ; IMMDeviceEnumerator::EnumAudioEndpoints method.
    ; https://docs.microsoft.com/en-us/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdeviceenumerator-enumaudioendpoints
    ComCall(3, IMMDeviceEnumerator, "UInt", DataFlow, "UInt", StateMask, "UPtrP", &IMMDeviceCollection := 0)

    ; IMMDeviceCollection::GetCount method.
    ; https://docs.microsoft.com/en-us/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevicecollection-getcount
    ComCall(3, IMMDeviceCollection, "UIntP", &DevCount := 0)  ; Retrieves a count of the devices in the device collection.

    loop DevCount
    {
        List.Push(Device := Map())

        ; IMMDeviceCollection::Item method.
        ; https://docs.microsoft.com/en-us/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevicecollection-item
        ComCall(4, IMMDeviceCollection, "UInt", A_Index - 1, "UPtrP", &IMMDevice := 0)

        ; IMMDevice::GetId method.
        ; https://docs.microsoft.com/en-us/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-getid
        ComCall(5, IMMDevice, "PtrP", &pBuffer := 0)
        Device["ID"] := StrGet(pBuffer)
        DllCall("Ole32.dll\CoTaskMemFree", "UPtr", pBuffer)

        ; MMDevice::OpenPropertyStore method.
        ; https://docs.microsoft.com/en-us/windows/win32/api/mmdeviceapi/nf-mmdeviceapi-immdevice-openpropertystore
        ComCall(4, IMMDevice, "UInt", 0x00000000, "UPtrP", &IPropertyStore := 0)

        Device["Name"] := GetDeviceProp(IPropertyStore, "{A45C254E-DF1C-4EFD-8020-67D146A850E0}", 14)

        ObjRelease(IPropertyStore)
        ObjRelease(IMMDevice)
    }

    ObjRelease(IMMDeviceCollection)

    return List
}

/*
    Set default audio render endpoint.
    Role:
        0x1   Default Device.
        0x2   Default Communication Device.
*/
SetDefaultEndpoint(DeviceID, Role := 3)
{
    ; Undocumented COM-interface IPolicyConfig.
    IPolicyConfig := ComObject("{870AF99C-171D-4F9E-AF0D-E63Df40c2BC9}", "{F8679F50-850A-41CF-9C72-430F290290C8}")
    if (Role & 0x1)
        ComCall(13, IPolicyConfig, "Str", DeviceID, "Int", 0)  ; Default Device
    if (Role & 0x2)
        ComCall(13, IPolicyConfig, "Str", DeviceID, "Int", 2)  ; Default Communication Device
}

/*
    Device Properties (Core Audio APIs)
    https://docs.microsoft.com/en-us/windows/win32/coreaudio/device-properties

    026E516E-B814-414B-83CD-856D6FEF4822, 2   The friendly name of the audio adapter to which the endpoint device is attached.
    A45C254E-DF1C-4EFD-8020-67D146A850E0, 2   The device description of the endpoint device.
    A45C254E-DF1C-4EFD-8020-67D146A850E0,14   The friendly name of the endpoint device.
*/
InitDeviceProp(clsid, n)
{
    clsid := CLSIDFromString(clsid, Buffer(16 + 4))
    NumPut("Int", n, clsid, 16)
    return clsid
}

GetDeviceProp(ptr, clsid, n)
{
    ; IPropertyStore::GetValue method.
    ; https://docs.microsoft.com/en-us/windows/win32/api/propsys/nf-propsys-ipropertystore-getvalue
    ComCall(5, ptr, "Ptr", InitDeviceProp(clsid, n), "Ptr", pvar := PropVariant())
    return String(pvar)
}

GetDeviceID(list, name)
{
    for device in list
        if InStr(device["Name"], name)
            return device["ID"]
    throw
}

CLSIDFromString(Str, Buffer := 0)
{
    if (!Buffer)
        Buffer := Buffer(16)
    DllCall("Ole32\CLSIDFromString", "Str", Str, "Ptr", Buffer, "HRESULT")
    return Buffer
}

class PropVariant
{
    __New()
    {
        this.buffer := Buffer(A_PtrSize == 4 ? 16 : 24)
        this.ptr := this.buffer.ptr
        this.size := this.buffer.size
    }

    __Delete()
    {
        DllCall("Ole32\PropVariantClear", "Ptr", this.ptr, "HRESULT")
    }

    ToString()
    {
        return StrGet(NumGet(this.ptr, 8, "UPtr"))  ; LPWSTR PROPVARIANT.pwszVal
    }
}
