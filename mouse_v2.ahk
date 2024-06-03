SLOW_SPEED := A_ScreenWidth // 320
FAST_SPEED := A_ScreenWidth // 80

ctrlKey := False

stack := []

state := [False, False, False, False, False, False, False, False]

if !GetKeyState("NumLock", "T") {
    *NumpadAdd::{
        Send "{LButton}{LButton}"
    }

    *NumpadSub::{
        Send "{RButton}"
    }

    *NumpadMult::{
        Click "WheelDown"
    }

    *NumpadDiv::{
        Click "WheelUp"
    }
}

*NumpadClear::{
    Click
}

*NumpadIns::{
    Click "Down"
}

*NumpadDel::{
    Click "Up"
}

~Control::{
    global ctrlKey
    ctrlKey := True
}
~Control UP::{
    global ctrlKey
    ctrlKey := False
}

; 0    0    0    0    0
; 0    4    3    2    0
; 0    1    0   -1    0
; 0   -2   -3   -4    0
; 0    0    0    0    0

*NumpadUp::{
    HandlePress( 3)
}

*NumpadDown::{
    HandlePress(-3)
}

*NumpadLeft::{
    HandlePress( 1)
}

*NumpadRight::{
    HandlePress(-1)
}

*NumpadHome::{
    HandlePress( 4)
}

*NumpadEnd::{
    HandlePress(-2)
}

*NumpadPgUp::{
    HandlePress( 2)
}

*NumpadPgDn::{
    HandlePress(-4)
}

*NumpadUp UP::{
    HandleRelease( 3)
}

*NumpadDown UP::{
    HandleRelease(-3)
}

*NumpadLeft UP::{
    HandleRelease( 1)
}

*NumpadRight UP::{
    HandleRelease(-1)
}

*NumpadHome UP::{
    HandleRelease( 4)
}

*NumpadEnd UP::{
    HandleRelease(-2)
}

*NumpadPgUp UP::{
    HandleRelease( 2)
}

*NumpadPgDn UP::{
    HandleRelease(-4)
}

HandlePress(dir) {
    global stack, state
    if state[dir + 5]
        return
    key := GetKeyCombination()
    if key
        SetMovement(key, False)
    state[dir + 5] := True
    stack.Push(dir)
    SetMovement(GetKeyCombination(), True)
}

HandleRelease(dir) {
    global stack, state
    SetMovement(GetKeyCombination(), False)
    state[dir + 5] := False
    for index, value in stack
        if (value = dir) {
            stack.RemoveAt(index)
            break
        }
    key := GetKeyCombination()
    if key
        SetMovement(key, True)
}

GetKeyCombination() {
    global stack
    if !stack.Length
        return 0
    last := 0
    Loop stack.Length {
        curr := stack[stack.Length - A_Index + 1]
        if !Mod(curr, 2)
            return curr
        if (last && last != -curr)
            return last + curr
        last := curr
    }
    return stack[stack.Length]
}

SetMovement(dir, enabling) {
    vdir := ["Down", "", "Up"][1 + (dir + 4) // 3]
    hdir := ["Left", "", "Right"][3 - Mod(dir + 4, 3)]
    fn := "Move" . vdir . hdir
    SetTimer %fn%, +enabling
}

GetSpeed() {
    global ctrlKey, SLOW_SPEED, FAST_SPEED
    return ctrlKey ? SLOW_SPEED : FAST_SPEED
}

MoveLeft() {
    speed := GetSpeed()
    MouseMove -speed, 0, 1, "R"
}
MoveRight() {
    speed := GetSpeed()
    MouseMove  speed, 0, 1, "R"
}
MoveUp() {
    speed := GetSpeed()
    MouseMove 0, -speed, 1, "R"
}
MoveDown() {
    speed := GetSpeed()
    MouseMove 0,  speed, 1, "R"
}
MoveUpLeft() {
    speed := GetSpeed()
    MouseMove -speed, -speed, 1, "R"
}
MoveUpRight() {
    speed := GetSpeed()
    MouseMove  speed, -speed, 1, "R"
}
MoveDownLeft() {
    speed := GetSpeed()
    MouseMove -speed,  speed, 1, "R"
}
MoveDownRight() {
    speed := GetSpeed()
    MouseMove  speed,  speed, 1, "R"
}