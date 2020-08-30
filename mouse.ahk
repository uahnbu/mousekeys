pressingCtrl := False
pressingLeft := False
pressingRight := False
pressingUp := False
pressingDown := False

NumpadClear::Click
NumpadIns::Click Down
NumpadDel::Click Up

#If !GetKeyState("NumLock", "T")
    NumpadAdd::Send {LButton}{LButton}
    NumpadSub::RButton
    NumpadDiv::Click WheelUp
    NumpadMult::Click WheelDown
#If

~Ctrl::
    If pressingLeft {
        If pressingUp {
            SetTimer MoveUpLeftSlow, 1
            SetTimer MoveUpLeft, Delete
        } Else If pressingDown {
            SetTimer MoveDownLeftSlow, 1
            SetTimer MoveDownLeft, Delete
        } Else {
            SetTimer MoveLeftSlow, 1
            SetTimer MoveRightSlow, 1
            SetTimer MoveLeft, Delete
        }
    } Else If pressingRight {
        If pressingUp {
            SetTimer MoveUpRightSlow, 1
            SetTimer MoveUpRight, Delete
        } Else If pressingDown {
            SetTimer MoveDownRightSlow, 1
            SetTimer MoveDownRight, Delete
        } Else {
            SetTimer MoveRightSlow, 1
            SetTimer MoveRight, Delete
        }
    } Else If pressingUp {
        SetTimer MoveUpSlow, 1
        SetTimer MoveDownSlow, 1
        SetTimer MoveUp, Delete
    } Else If pressingDown {
        SetTimer MoveDownSlow, 1
        SetTimer MoveDown, Delete
    }
Return

~Ctrl UP::
    If pressingLeft {
        If pressingUp {
            SetTimer MoveUpLeftSlow, Delete
            SetTimer MoveUpLeft, 1
        } Else If pressingDown {
            SetTimer MoveDownLeftSlow, Delete
            SetTimer MoveDownLeft, 1
        } Else {
            SetTimer MoveLeftSlow, Delete
            SetTimer MoveRightSlow, Delete
            SetTimer MoveLeft, 1
        }
    } Else If pressingRight {
        If pressingUp {
            SetTimer MoveUpRightSlow, Delete
            SetTimer MoveUpRight, 1
        } Else If pressingDown {
            SetTimer MoveDownRightSlow, Delete
            SetTimer MoveDownRight, 1
        } Else {
            SetTimer MoveRightSlow, Delete
            SetTimer MoveRight, 1
        }
    } Else If pressingUp {
        SetTimer MoveUpSlow, Delete
        SetTimer MoveDownSlow, Delete
        SetTimer MoveUp, 1
    } Else If pressingDown {
        SetTimer MoveDownSlow, Delete
        SetTimer MoveDown, 1
    }
Return

^NumpadLeft::
    If !pressingLeft {
        pressingLeft := True
        If pressingUp {
            SetTimer MoveUpLeftSlow, 1
            SetTimer MoveDownLeftSlow, Delete
            SetTimer MoveLeftSlow, Delete
        } Else If pressingDown {
            SetTimer MoveDownLeftSlow, 1
            SetTimer MoveUpLeftSlow, Delete
            SetTimer MoveLeftSlow, Delete
        } Else {
            SetTimer MoveLeftSlow, 1
            SetTimer MoveUpLeftSlow, Delete
            SetTimer MoveDownLeftSlow, Delete
        }
        SetTimer MoveRightSlow, Delete
        SetTimer MoveUpSlow, Delete
        SetTimer MoveDownSlow, Delete
    }
Return
^NumpadRight::
    If !pressingRight {
        pressingRight := True
        If pressingUp {
            SetTimer MoveUpRightSlow, 1
            SetTimer MoveDownRightSlow, Delete
            SetTimer MoveRightSlow, Delete
        } Else If pressingDown {
            SetTimer MoveUpRightSlow, Delete
            SetTimer MoveDownRightSlow, 1
            SetTimer MoveRightSlow, Delete
        } Else {
            SetTimer MoveUpRightSlow, Delete
            SetTimer MoveDownRightSlow, Delete
            SetTimer MoveRightSlow, 1
        }
        SetTimer MoveLeftSlow, Delete
        SetTimer MoveUpSlow, Delete
        SetTimer MoveDownSlow, Delete
    }
Return
^NumpadUp::
    If !pressingUp {
        pressingUp := True
        If pressingLeft {
            SetTimer MoveUpLeftSlow, 1
            SetTimer MoveUpRightSlow, Delete
            SetTimer MoveUpSlow, Delete
        } Else If pressingRight {
            SetTimer MoveUpLeftSlow, Delete
            SetTimer MoveUpRightSlow, 1
            SetTimer MoveUpSlow, Delete
        } Else {
            SetTimer MoveUpLeftSlow, Delete
            SetTimer MoveUpRightSlow, Delete
            SetTimer MoveUpSlow, 1
        }
        SetTimer MoveLeftSlow, Delete
        SetTimer MoveRightSlow, Delete
        SetTimer MoveDownSlow, Delete
    }
Return
^NumpadDown::
    If !pressingDown {
        pressingDown := True
        If pressingLeft {
            SetTimer MoveDownLeftSlow, 1
            SetTimer MoveDownRightSlow, Delete
            SetTimer MoveDownSlow, Delete
        } Else If pressingRight {
            SetTimer MoveDownLeftSlow, Delete
            SetTimer MoveDownRightSlow, 1
            SetTimer MoveDownSlow, Delete
        } Else {
            SetTimer MoveDownLeftSlow, Delete
            SetTimer MoveDownRightSlow, Delete
            SetTimer MoveDownSlow, 1
        }
        SetTimer MoveLeftSlow, Delete
        SetTimer MoveRightSlow, Delete
        SetTimer MoveUpSlow, Delete
    }
Return

^NumpadLeft UP::
    pressingLeft := False
    SetTimer MoveUpLeftSlow, Delete
    SetTimer MoveDownLeftSlow, Delete
    SetTimer MoveLeftSlow, Delete
    SetTimer MoveUpLeft, Delete
    SetTimer MoveDownLeft, Delete
    SetTimer MoveLeft, Delete
    If pressingUp
        SetTimer MoveUpSlow, 1
    If pressingDown
        SetTimer MoveDownSlow, 1
    If pressingRight
        SetTimer MoveRightSlow, 1
Return
^NumpadRight UP::
    pressingRight := False
    SetTimer MoveUpRightSlow, Delete
    SetTimer MoveDownRightSlow, Delete
    SetTimer MoveRightSlow, Delete
    SetTimer MoveUpRight, Delete
    SetTimer MoveDownRight, Delete
    SetTimer MoveRight, Delete
    If pressingUp
        SetTimer MoveUpSlow, 1
    If pressingDown
        SetTimer MoveDownSlow, 1
    If pressingLeft
        SetTimer MoveLeftSlow, 1
Return
^NumpadUp UP::
    pressingUp := False
    SetTimer MoveUpLeftSlow, Delete
    SetTimer MoveUpRightSlow, Delete
    SetTimer MoveUpSlow, Delete
    SetTimer MoveUpLeft, Delete
    SetTimer MoveUpRight, Delete
    SetTimer MoveUp, Delete
    If pressingLeft
        SetTimer MoveLeftSlow, 1
    If pressingRight
        SetTimer MoveRightSlow, 1
    If pressingDown
        SetTimer MoveDownSlow, 1
Return
^NumpadDown UP::
    pressingDown := False
    SetTimer MoveDownLeftSlow, Delete
    SetTimer MoveDownRightSlow, Delete
    SetTimer MoveDownSlow, Delete
    SetTimer MoveDownLeft, Delete
    SetTimer MoveDownRight, Delete
    SetTimer MoveDown, Delete
    If pressingLeft
        SetTimer MoveLeftSlow, 1
    If pressingRight
        SetTimer MoveRightSlow, 1
    If pressingUp
        SetTimer MoveUpSlow, 1
Return

MoveLeftSlow() {
    MouseMove -10, 0, 1, R
}
MoveRightSlow() {
    MouseMove 10, 0, 1, R
}
MoveUpSlow() {
    MouseMove 0, -10, 1, R
}
MoveDownSlow() {
    MouseMove 0, 10, 1, R
}
MoveUpLeftSlow() {
    MouseMove -10, -10, 1, R
}
MoveUpRightSlow() {
    MouseMove 10, -10, 1, R
}
MoveDownLeftSlow() {
    MouseMove -10, 10, 1, R
}
MoveDownRightSlow() {
    MouseMove 10, 10, 1, R
}

#InputLevel 1

    NumpadLeft::
        If !pressingLeft {
            pressingLeft := True
            If pressingUp {
                SetTimer MoveUpLeft, 1
                SetTimer MoveDownLeft, Delete
                SetTimer MoveLeft, Delete
            } Else If pressingDown {
                SetTimer MoveDownLeft, 1
                SetTimer MoveUpLeft, Delete
                SetTimer MoveLeft, Delete
            } Else {
                SetTimer MoveLeft, 1
                SetTimer MoveUpLeft, Delete
                SetTimer MoveDownLeft, Delete
            }
            SetTimer MoveRight, Delete
            SetTimer MoveUp, Delete
            SetTimer MoveDown, Delete
        }
    Return
    NumpadRight::
        If !pressingRight {
            pressingRight := True
            If pressingUp {
                SetTimer MoveUpRight, 1
                SetTimer MoveDownRight, Delete
                SetTimer MoveRight, Delete
            } Else If pressingDown {
                SetTimer MoveUpRight, Delete
                SetTimer MoveDownRight, 1
                SetTimer MoveRight, Delete
            } Else {
                SetTimer MoveUpRight, Delete
                SetTimer MoveDownRight, Delete
                SetTimer MoveRight, 1
            }
            SetTimer MoveLeft, Delete
            SetTimer MoveUp, Delete
            SetTimer MoveDown, Delete
        }
    Return
    NumpadUp::
        If !pressingUp {
            pressingUp := True
            If pressingLeft {
                SetTimer MoveUpLeft, 1
                SetTimer MoveUpRight, Delete
                SetTimer MoveUp, Delete
            } Else If pressingRight {
                SetTimer MoveUpLeft, Delete
                SetTimer MoveUpRight, 1
                SetTimer MoveUp, Delete
            } Else {
                SetTimer MoveUpLeft, Delete
                SetTimer MoveUpRight, Delete
                SetTimer MoveUp, 1
            }
            SetTimer MoveLeft, Delete
            SetTimer MoveRight, Delete
            SetTimer MoveDown, Delete
        }
    Return
    NumpadDown::
        If !pressingDown {
            pressingDown := True
            If pressingLeft {
                SetTimer MoveDownLeft, 1
                SetTimer MoveDownRight, Delete
                SetTimer MoveDown, Delete
            } Else If pressingRight {
                SetTimer MoveDownLeft, Delete
                SetTimer MoveDownRight, 1
                SetTimer MoveDown, Delete
            } Else {
                SetTimer MoveDownLeft, Delete
                SetTimer MoveDownRight, Delete
                SetTimer MoveDown, 1
            }
            SetTimer MoveLeft, Delete
            SetTimer MoveRight, Delete
            SetTimer MoveUp, Delete
        }
    Return

    NumpadLeft UP::
        pressingLeft := False
        SetTimer MoveUpLeftSlow, Delete
        SetTimer MoveDownLeftSlow, Delete
        SetTimer MoveLeftSlow, Delete
        SetTimer MoveUpLeft, Delete
        SetTimer MoveDownLeft, Delete
        SetTimer MoveLeft, Delete
        If pressingUp
            SetTimer MoveUp, 1
        If pressingDown
            SetTimer MoveDown, 1
        If pressingRight
            SetTimer MoveRight, 1
    Return
    NumpadRight UP::
        pressingRight := False
        SetTimer MoveUpRightSlow, Delete
        SetTimer MoveDownRightSlow, Delete
        SetTimer MoveRightSlow, Delete
        SetTimer MoveUpRight, Delete
        SetTimer MoveDownRight, Delete
        SetTimer MoveRight, Delete
        If pressingUp
            SetTimer MoveUp, 1
        If pressingDown
            SetTimer MoveDown, 1
        If pressingLeft
            SetTimer MoveLeft, 1
    Return
    NumpadUp UP::
        pressingUp := False
        SetTimer MoveUpLeftSlow, Delete
        SetTimer MoveUpRightSlow, Delete
        SetTimer MoveUpSlow, Delete
        SetTimer MoveUpLeft, Delete
        SetTimer MoveUpRight, Delete
        SetTimer MoveUp, Delete
        If pressingLeft
            SetTimer MoveLeft, 1
        If pressingRight
            SetTimer MoveRight, 1
        If pressingDown
            SetTimer MoveDown, 1
    Return
    NumpadDown UP::
        pressingDown := False
        SetTimer MoveDownLeftSlow, Delete
        SetTimer MoveDownRightSlow, Delete
        SetTimer MoveDownSlow, Delete
        SetTimer MoveDownLeft, Delete
        SetTimer MoveDownRight, Delete
        SetTimer MoveDown, Delete
        If pressingLeft
            SetTimer MoveLeft, 1
        If pressingRight
            SetTimer MoveRight, 1
        If pressingUp
            SetTimer MoveUp, 1
    Return

    MoveLeft() {
        MouseMove -50, 0, 1, R
    }
    MoveRight() {
        MouseMove 50, 0, 1, R
    }
    MoveUp() {
        MouseMove 0, -50, 1, R
    }
    MoveDown() {
        MouseMove 0, 50, 1, R
    }
    MoveUpLeft() {
        MouseMove -50, -50, 1, R
    }
    MoveUpRight() {
        MouseMove 50, -50, 1, R
    }
    MoveDownLeft() {
        MouseMove -50, 50, 1, R
    }
    MoveDownRight() {
        MouseMove 50, 50, 1, R
    }