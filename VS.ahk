#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetControlDelay -1


F2::
ControlClick, NetUIHWND2,ahk_exe WINWORD.EXE,,left, NA x170 y109

;ControlClick, WindowsForms10.ToolbarWindow32.app.0.14a4f1c_r51_ad11, LEFT, 1

;, ExcludeTitle, ExcludeText


;if WinExist("ahk_exe devenv.exe")
;    WinActivate, ahk_exe devenv.exe
;else
;    Run, ahk_exe devenv.exe
;ControlClick, RButton
;{ControlClick, WindowsForms10.ToolbarWindow32.app.0.14a4f1c_r51_ad11, ahk_exe devenv.exe, LEFT, 1, X40, ExcludeTitle, ExcludeText}

;ControlClick [, Control-or-Pos, WinTitle, WinText, WhichButton, ClickCount, Options, ExcludeTitle, ExcludeText]