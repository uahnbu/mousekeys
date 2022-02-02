pressingUp := False
pressingDown := False
pressingLeft := False
pressingRight := False
lastHorizontal := 0
lastVertical := 0

^NumpadClear::Click
^NumpadIns::Click Down
^NumpadDel::Click Up
*NumpadClear::Click
*NumpadIns::Click Down
*NumpadDel::Click Up

#If !GetKeyState("NumLock", "T")
    ^NumpadAdd::Send {LButton}{LButton}
    ^NumpadSub::RButton
    ^NumpadDiv::Click WheelUp
    ^NumpadMult::Click WheelDown
    *NumpadAdd::Send {LButton}{LButton}
    *NumpadSub::RButton
    *NumpadDiv::Click WheelUp
    *NumpadMult::Click WheelDown
#If

^NumpadUp::
*NumpadUp::
    PressUp()
Return

^NumpadDown::
*NumpadDown::
    PressDown()
Return

^NumpadLeft::
*NumpadLeft::
    PressLeft()
Return

^NumpadRight::
*NumpadRight::
    PressRight()
Return

^NumpadHome::
*NumpadHome::
    PressUp()
    PressLeft()
Return

^NumpadEnd::
*NumpadEnd::
    PressDown()
    PressLeft()
Return

^NumpadPgUp::
*NumpadPgUp::
    PressUp()
    PressRight()
Return

^NumpadPgDn::
*NumpadPgDn::
    PressDown()
    PressRight()
Return

^NumpadUp UP::
NumpadUp UP::
    ReleaseUp()
Return

^NumpadDown UP::
NumpadDown UP::
    ReleaseDown()
Return

^NumpadLeft UP::
NumpadLeft UP::
    ReleaseLeft()
Return

^NumpadRight UP::
NumpadRight UP::
    ReleaseRight()
Return

^NumpadHome UP::
NumpadHome UP::
    ReleaseUp()
    ReleaseLeft()
Return

^NumpadEnd UP::
NumpadEnd UP::
    ReleaseDown()
    ReleaseLeft()
Return

^NumpadPgUp UP::
NumpadPgUp UP::
    ReleaseUp()
    ReleaseRight()
Return

^NumpadPgDn UP::
NumpadPgDn UP::
    ReleaseDown()
    ReleaseRight()
Return

PressUp() {
    global
    If (lastVertical = -1)
        Return
    offDirection := ["Left", "", "Right"][lastHorizontal + 2]
    If (pressingDown || lastHorizontal != 0)
        SetTimer % "Move" . ["", "Down"][pressingDown + 1] . offDirection, Delete
    SetTimer % "MoveUp" . offDirection, 1
    lastVertical := -1, pressingUp := True
}

PressDown() {
    global
    If (lastVertical = 1)
        Return
    offDirection := ["Left", "", "Right"][lastHorizontal + 2]
    If (pressingUp || lastHorizontal != 0)
        SetTimer % "Move" . ["", "Up"][pressingUp + 1] . offDirection, Delete
    SetTimer % "MoveDown" . offDirection, 1
    lastVertical := 1, pressingDown := True
}

PressLeft() {
    global
    If (lastHorizontal = -1)
        Return
    offDirection := ["Up", "", "Down"][lastVertical + 2]
    If (pressingRight || lastVertical != 0)
        SetTimer % "Move" . offDirection . ["", "Right"][pressingRight + 1], Delete
    SetTimer % "Move" . offDirection . "Left", 1
    lastHorizontal := -1, pressingLeft := True
}

PressRight() {
    global
    If (lastHorizontal = 1)
        Return
    offDirection := ["Up", "", "Down"][lastVertical + 2]
    If (pressingLeft || lastVertical != 0)
        SetTimer % "Move" . offDirection . ["", "Left"][pressingLeft + 1], Delete
    SetTimer % "Move" . offDirection . "Right", 1
    lastHorizontal := 1, pressingRight := True
}

ReleaseUp() {
    global
    lastVertical := pressingDown, pressingUp := False
    offDirection := ["Left", "", "Right"][lastHorizontal + 2]
    SetTimer % "MoveUp" . offDirection, Delete
    If (pressingDown || lastHorizontal != 0)
        SetTimer % "Move" . ["", "Down"][pressingDown + 1] . offDirection, 1
}

ReleaseDown() {
    global
    lastVertical := -pressingUp, pressingDown := False
    offDirection := ["Left", "", "Right"][lastHorizontal + 2]
    SetTimer % "MoveDown" . offDirection, Delete
    If (pressingUp || lastHorizontal != 0)
        SetTimer % "Move" . ["", "Up"][pressingUp + 1] . offDirection, 1
}

ReleaseLeft() {
    global
    lastHorizontal := pressingRight, pressingLeft := False
    offDirection := ["Up", "", "Down"][lastVertical + 2]
    SetTimer % "Move" . offDirection . "Left", Delete
    If (pressingRight || lastVertical != 0)
        SetTimer % "Move" . offDirection . ["", "Right"][pressingRight + 1], 1
}

ReleaseRight() {
    global
    lastHorizontal := -pressingLeft, pressingRight := False
    offDirection := ["Up", "", "Down"][lastVertical + 2]
    SetTimer % "Move" . offDirection . "Right", Delete
    If (pressingLeft || lastVertical != 0)
        SetTimer % "Move" . offDirection . ["", "Left"][pressingLeft + 1], 1
}

MoveLeft() {
    If GetKeyState("Ctrl", "P")
        MouseMove -50, 0, 1, R
    Else
        MouseMove -10, 0, 1, R
}
MoveRight() {
    If GetKeyState("Ctrl", "P")
        MouseMove 50, 0, 1, R
    Else
        MouseMove 10, 0, 1, R
}
MoveUp() {
    If GetKeyState("Ctrl", "P")
        MouseMove 0, -50, 1, R
    Else
        MouseMove 0, -10, 1, R
}
MoveDown() {
    If GetKeyState("Ctrl", "P")
        MouseMove 0, 50, 1, R
    Else
        MouseMove 0, 10, 1, R
}
MoveUpLeft() {
    If GetKeyState("Ctrl", "P")
        MouseMove -50, -50, 1, R
    Else
        MouseMove -10, -10, 1, R
}
MoveUpRight() {
    If GetKeyState("Ctrl", "P")
        MouseMove 50, -50, 1, R
    Else
        MouseMove 10, -10, 1, R
}
MoveDownLeft() {
    If GetKeyState("Ctrl", "P")
        MouseMove -50, 50, 1, R
    Else
        MouseMove -10, 10, 1, R
}
MoveDownRight() {
    If GetKeyState("Ctrl", "P")
        MouseMove 50, 50, 1, R
    Else
        MouseMove 10, 10, 1, R
}
