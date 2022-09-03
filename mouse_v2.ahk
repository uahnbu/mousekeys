stack  := []
state := []

#If !GetKeyState("NumLock", "T")
    ^NumpadAdd::
    *NumpadAdd:: Send {LButton}{LButton}

    ^NumpadSub::
    *NumpadSub:: RButton

    ^NumpadMult::
    *NumpadMult::Click WheelDown

    ^NumpadDiv::
    *NumpadDiv:: Click WheelUp
#If

^NumpadClear::
*NumpadClear::Click

^NumpadIns::
*NumpadIns::  Click Down

^NumpadDel::
*NumpadDel::  Click Up

~Control::    state[0] := True
~Control UP:: state[0] := False

; 0    0    0    0    0
; 0    4    3    2    0
; 0    1    0   -1    0
; 0   -2   -3   -4    0
; 0    0    0    0    0

^NumpadUp::
*NumpadUp::      HandlePress( 3)

^NumpadDown::
*NumpadDown::    HandlePress(-3)

^NumpadLeft::
*NumpadLeft::    HandlePress( 1)

^NumpadRight::
*NumpadRight::   HandlePress(-1)

^NumpadHome::
*NumpadHome::    HandlePress( 4)

^NumpadEnd::
*NumpadEnd::     HandlePress(-2)

^NumpadPgUp::
*NumpadPgUp::    HandlePress( 2)

^NumpadPgDn::
*NumpadPgDn::    HandlePress(-4)

^NumpadUp UP::
NumpadUp UP::    HandleRelease( 3)

^NumpadDown UP::
NumpadDown UP::  HandleRelease(-3)

^NumpadLeft UP::
NumpadLeft UP::  HandleRelease( 1)

^NumpadRight UP::
NumpadRight UP:: HandleRelease(-1)

^NumpadHome UP::
NumpadHome UP::  HandleRelease( 4)

^NumpadEnd UP::
NumpadEnd UP::   HandleRelease(-2)

^NumpadPgUp UP::
NumpadPgUp UP::  HandleRelease( 2)

^NumpadPgDn UP::
NumpadPgDn UP::  HandleRelease(-4)

HandlePress(dir) {
    Global stack, state
    If state[dir + 5]
        Return
    key := GetKeyCombination()
    If key
        SetMovement(key, False)
    state[dir + 5] := True
    stack.Push(dir)
    SetMovement(GetKeyCombination(), True)
}

HandleRelease(dir) {
    Global stack, state
    SetMovement(GetKeyCombination(), False)
    state[dir + 5] := False
    For index, value in stack
        If (value = dir) {
            stack.RemoveAt(index)
            Break
        }
    key := GetKeyCombination()
    If key
        SetMovement(key, True)
}

GetKeyCombination() {
    Global stack
    If !stack.Length()
        Return 0
    last := 0
    Loop % stack.Length() {
        curr := stack[stack.Length() - A_Index + 1]
        If !Mod(curr, 2)
            Return curr
        If (last && last != -curr)
            Return last + curr
        last := curr
    }
    Return stack[stack.Length()]
}

SetMovement(dir, enabling) {
    vdir := ["Down", "", "Up"][1 + (dir + 4) // 3]
    hdir := ["Left", "", "Right"][3 - Mod(dir + 4, 3)]
    If enabling
        SetTimer % "Move" . vdir . hdir, 1
    Else
        SetTimer % "Move" . vdir . hdir, Delete
}

MoveLeft() {
    Global state
    If state[0]
        MouseMove -50,   0, 1, R
    Else
        MouseMove -10,   0, 1, R
}
MoveRight() {
    Global state
    If state[0]
        MouseMove  50,   0, 1, R
    Else
        MouseMove  10,   0, 1, R
}
MoveUp() {
    Global state
    If state[0]
        MouseMove   0, -50, 1, R
    Else
        MouseMove   0, -10, 1, R
}
MoveDown() {
    Global state
    If state[0]
        MouseMove   0,  50, 1, R
    Else
        MouseMove   0,  10, 1, R
}
MoveUpLeft() {
    Global state
    If state[0]
        MouseMove -50, -50, 1, R
    Else
        MouseMove -10, -10, 1, R
}
MoveUpRight() {
    Global state
    If state[0]
        MouseMove  50, -50, 1, R
    Else
        MouseMove  10, -10, 1, R
}
MoveDownLeft() {
    Global state
    If state[0]
        MouseMove -50,  50, 1, R
    Else
        MouseMove -10,  10, 1, R
}
MoveDownRight() {
    Global state
    If state[0]
        MouseMove  50,  50, 1, R
    Else
        MouseMove  10,  10, 1, R
}