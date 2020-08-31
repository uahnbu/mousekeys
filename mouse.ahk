pressingUp := False
pressingDown := False
pressingLeft := False
pressingRight := False
lastHorizontal := 0
lastVertical := 0

^NumpadClear::Click
^NumpadIns::Click Down
^NumpadDel::Click Up
NumpadClear::Click
NumpadIns::Click Down
NumpadDel::Click Up

#If !GetKeyState("NumLock", "T")
    ^NumpadAdd::Send {LButton}{LButton}
    ^NumpadSub::RButton
    ^NumpadDiv::Click WheelUp
    ^NumpadMult::Click WheelDown
    NumpadAdd::Send {LButton}{LButton}
    NumpadSub::RButton
    NumpadDiv::Click WheelUp
    NumpadMult::Click WheelDown
#If

^NumpadUp::
NumpadUp::
    If !pressingUp {
        pressingUp := True, lastVertical := 1
        If pressingDown {
            If pressingLeft && (!pressingRight || lastHorizontal = 1) {
                SetTimer MoveDownLeft, Delete
                SetTimer MoveUpLeft, 1
            } Else If pressingRight && (!pressingLeft || lastHorizontal = 2) {
                SetTimer MoveDownRight, Delete
                SetTimer MoveUpRight, 1
            } Else {
                SetTimer MoveDown, Delete
                SetTimer MoveUp, 1
            }
        } Else If pressingLeft && (!pressingRight || lastHorizontal = 1) {
            SetTimer MoveLeft, Delete
            SetTimer MoveUpLeft, 1
        } Else If pressingRight && (!pressingLeft || lastHorizontal = 2) {
            SetTimer MoveRight, Delete
            SetTimer MoveUpRight, 1
        } Else
            SetTimer MoveUp, 1
    }
Return

^NumpadDown::
NumpadDown::
    If !pressingDown {
        pressingDown := True, lastVertical := 2
        If pressingUp {
            If pressingLeft && (!pressingRight || lastHorizontal = 1) {
                SetTimer MoveUpLeft, Delete
                SetTimer MoveDownLeft, 1
            } Else If pressingRight && (!pressingLeft || lastHorizontal = 2) {
                SetTimer MoveUpRight, Delete
                SetTimer MoveDownRight, 1
            } Else {
                SetTimer MoveUp, Delete
                SetTimer MoveDown, 1
            }
        } Else If pressingLeft && (!pressingRight || lastHorizontal = 1) {
            SetTimer MoveLeft, Delete
            SetTimer MoveDownLeft, 1
        } Else If pressingRight && (!pressingLeft || lastHorizontal = 2) {
            SetTimer MoveRight, Delete
            SetTimer MoveDownRight, 1
        } Else
            SetTimer MoveDown, 1
    }
Return

^NumpadLeft::
NumpadLeft::
    If !pressingLeft {
        pressingLeft := True, lastHorizontal := 1
        If pressingRight {
            If pressingUp && (!pressingDown || lastVertical = 1) {
                SetTimer MoveUpRight, Delete
                SetTimer MoveUpLeft, 1
            } Else If pressingDown && (!pressingUp || lastVertical = 2) {
                SetTimer MoveDownRight, Delete
                SetTimer MoveDownLeft, 1
            } Else {
                SetTimer MoveRight, Delete
                SetTimer MoveLeft, 1
            }
        } Else If pressingUp && (!pressingDown || lastVertical = 1) {
            SetTimer MoveUp, Delete
            SetTimer MoveUpLeft, 1
        } Else If pressingDown && (!pressingUp || lastVertical = 2) {
            SetTimer MoveDown, Delete
            SetTimer MoveDownLeft, 1
        } Else
            SetTimer MoveLeft, 1
    }
Return

^NumpadRight::
NumpadRight::
    If !pressingRight {
        pressingRight := True, lastHorizontal := 2
        If pressingLeft {
            If pressingUp && (!pressingDown || lastVertical = 1) {
                SetTimer MoveUpLeft, Delete
                SetTimer MoveUpRight, 1
            } Else If pressingDown && (!pressingUp || lastVertical = 2) {
                SetTimer MoveDownLeft, Delete
                SetTimer MoveDownRight, 1
            } Else {
                SetTimer MoveLeft, Delete
                SetTimer MoveRight, 1
            }
        } Else If pressingUp && (!pressingDown || lastVertical = 1) {
            SetTimer MoveUp, Delete
            SetTimer MoveUpRight, 1
        } Else If pressingDown && (!pressingUp || lastVertical = 2) {
            SetTimer MoveDown, Delete
            SetTimer MoveDownRight, 1
        } Else
            SetTimer MoveRight, 1
    }
Return

^NumpadUp UP::
NumpadUp UP::
    pressingUp := False
    If (pressingDown) {
        lastVertical := 2
        If pressingLeft && (!pressingRight || lastHorizontal = 1) {
            SetTimer MoveUpLeft, Delete
            SetTimer MoveDownLeft, 1
        } Else If pressingRight && (!pressingLeft || lastHorizontal = 2) {
            SetTimer MoveUpRight, Delete
            SetTimer MoveDownRight, 1
        } Else {
            SetTimer MoveUp, Delete
            SetTimer MoveDown, 1
        }
    } Else {
        lastVertical := 0
        If pressingLeft && (!pressingRight || lastHorizontal = 1) {
            SetTimer MoveUpLeft, Delete
            SetTimer MoveLeft, 1
        } Else If pressingRight && (!pressingLeft || lastHorizontal = 2) {
            SetTimer MoveUpRight, Delete
            SetTimer MoveRight, 1
        } Else
            SetTimer MoveUp, Delete
    }
Return

^NumpadDown UP::
NumpadDown UP::
    pressingDown := False
    If (pressingUp) {
        lastVertical := 1
        If pressingLeft && (!pressingRight || lastHorizontal = 1) {
            SetTimer MoveDownLeft, Delete
            SetTimer MoveUpLeft, 1
        } Else If pressingRight && (!pressingLeft || lastHorizontal = 2) {
            SetTimer MoveDownRight, Delete
            SetTimer MoveUpRight, 1
        } Else {
            SetTimer MoveDown, Delete
            SetTimer MoveUp, 1
        }
    } Else {
        lastVertical := 0
        If pressingLeft && (!pressingRight || lastHorizontal = 1) {
            SetTimer MoveDownLeft, Delete
            SetTimer MoveLeft, 1
        } Else If pressingRight && (!pressingLeft || lastHorizontal = 2) {
            SetTimer MoveDownRight, Delete
            SetTimer MoveRight, 1
        } Else
            SetTimer MoveDown, Delete
    }
Return

^NumpadLeft UP::
NumpadLeft UP::
    pressingLeft := False
    If (pressingRight) {
        lastHorizontal := 2
        If pressingUp && (!pressingDown || lastVertical = 1) {
            SetTimer MoveUpLeft, Delete
            SetTimer MoveUpRight, 1
        } Else If pressingDown && (!pressingUp || lastVertical = 2) {
            SetTimer MoveDownLeft, Delete
            SetTimer MoveDownRight, 1
        } Else {
            SetTimer MoveLeft, Delete
            SetTimer MoveRight, 1
        }
    } Else {
        lastHorizontal := 0
        If pressingUp && (!pressingDown || lastVertical = 1) {
            SetTimer MoveUpLeft, Delete
            SetTimer MoveUp, 1
        } Else If pressingDown && (!pressingUp || lastVertical = 2) {
            SetTimer MoveDownLeft, Delete
            SetTimer MoveDown, 1
        } Else
            SetTimer MoveLeft, Delete
    }
Return

^NumpadRight UP::
NumpadRight UP::
    pressingRight := False
    If (pressingLeft) {
        lastHorizontal := 1
        If pressingUp && (!pressingDown || lastVertical = 1) {
            SetTimer MoveUpRight, Delete
            SetTimer MoveUpLeft, 1
        } Else If pressingDown && (!pressingUp || lastVertical = 2) {
            SetTimer MoveDownRight, Delete
            SetTimer MoveDownLeft, 1
        } Else {
            SetTimer MoveRight, Delete
            SetTimer MoveLeft, 1
        }
    } Else {
        lastHorizontal := 0
        If pressingUp && (!pressingDown || lastVertical = 1) {
            SetTimer MoveUpRight, Delete
            SetTimer MoveUp, 1
        } Else If pressingDown && (!pressingUp || lastVertical = 2) {
            SetTimer MoveDownRight, Delete
            SetTimer MoveDown, 1
        } Else
            SetTimer MoveRight, Delete
    }
Return

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
