#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Global variables
lastCommand := ""
vimMode := false

; Caps Lock toggles Vim mode
$CapsLock::
    vimMode := !vimMode
    if (vimMode) {
        Gui, 99:+AlwaysOnTop -Caption +ToolWindow
        Gui, 99:Font, s15 bold
        Gui, 99:Add, Text, cAA0000, VI-NORMAL (Caps Lock to Exit)
        Gui, 99:Color, 000000
        Gui, 99:Show, NoActivate x0 y10, VIM-Mode Activated
    } else {
        Gui, 99:Destroy
    }
Return

#If (vimMode) ; Only activate these commands when Vim mode is on

    ; Cursor movements
    h::SendInput {Left}
    j::SendInput {Down}
    k::SendInput {Up}
    l::SendInput {Right}

    ; Page movements
    w::SendInput ^{Right}
    b::SendInput ^{Left}

    ; Cut, Delete, and Backspace functionality
    x::SendInput ^x
    d::SendInput {Delete}
    '::SendInput {Backspace}

    ; Page Up and Page Down functionality
    i::SendInput {PgUp}
    ^i::SendInput ^{PgUp}
    u::SendInput {PgDn}
    ^u::SendInput ^{PgDn}

    ; Undo functionality
    z::SendInput ^z

    ; Windows key + Left/Right functionality
    n::SendInput #{Left}
    m::SendInput #{Right}
    
    ; Other commands
    +h::SendInput +{Left}
    +j::SendInput +{Down}
    +k::SendInput +{Up}
    +l::SendInput +{Right}
    y::SendInput ^c
    p::SendInput ^v
    /::SendInput ^f
    `;::SendInput {Enter}
    s::SendInput ^s

    ; Ctrl + Home/End (gg/G)
    g::SendInput ^{Home}
    +g::SendInput ^{End}

    ; , as Home and . as End
    ,::SendInput {Home}
    .::SendInput {End}

    ; Shift + , and Shift + . for selecting to Home and End
    +,::SendInput +{Home}
    +.::SendInput +{End}

    ; Shift + w and Shift + b for selecting word-wise movements
    +w::SendInput +^{Right}
    +b::SendInput +^{Left}

    ; remap o to F2
    o::SendInput {F2}


#If

; Ensure Alt + k still works for moving up
!k::SendInput !{Up}

; Ensure Alt + d works as delete
!d::SendInput {Delete}

; End Vim mode
endVIM() {
    Gui, 99:Destroy
}
