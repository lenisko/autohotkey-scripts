; Suspend System - Suspend system after provided time - https://github.com/lenisko/spotify-ahk
InputBox, UserInput, Suspend System, Perform sleep in (minutes)., , 185, 125
if !ErrorLevel
    If (UserInput >= 0) and (UserInput <= 35791)
    {
        Sleep, (1000 * UserInput)
        DllCall("PowrProf\SetSuspendState", 
            "int", 0,           ; Pass 1 instead of 0 to hibernate rather than suspend.
            "int", 0,           ; Pass 1 instead of 0 to suspend immediately rather than asking each application for permission.
            "int", 0            ; Pass 1 instead of 0 to disable all wake events.
        )
    }
    Else
        MsgBox, Value should be between >= 0 and <= 35791
