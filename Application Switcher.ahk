#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Menu, Tray, Icon, shell32.dll, 16 ;this changes the icon into a little laptop thingy. just useful for making it distinct from the others.
#singleinstance force ;so you can only run 1 script at a time and it doens't bother you about it.





;Taryn's Basic Application Switcher
;######## THIS IS THE BEST SCRIPT I'VE EVER WRITTEN. #########

;And also one of the simplest. Basically, If you press the "explorer" key (F1) it will instantly:
; 1. Create an explorer window if one is not already running.
; 2. Open the LAST ACTIVE explorer window if Explorer is not already active
; 3. If you keep pressing the key, it will cycle through Explorer windows in the order they were last activated

;Programs like chrome are a little different. It will open Chrome if it's not already open,
;but when you keep pressing the button, it hits "CTRL TAB" to advance you forwards through your tabs.

;This is all significantly superior to switching between applications by CLICKING on them in the taskbar,
;and also very superior to using WIN 1, WIN 2, WIN 3 etc to switch between applications.

;You will want to tailor this script to launch your own most commonly used applications.
;You can use Window Spy (it comes with autohotkey) to figure out the ahk_exe and ahk_class of your applications.
;There is a video explaining all of this:
; https://www.youtube.com/watch?v=OqyQABySV8k

;If you have a macro keyboard, I reccomend that you add ^ to each of theese shortcuts, and assign you macro
;keys to CTRL F1, CTRL F2 and so on. That way, your Function keys are freed, to be used for other things.




#IfWinActive 

;Hyper Tab holds the "BACK" script.
#^!+Tab::
if WinActive("ahk_class MozillaWindowClass")
	Send ^+{tab} ;CTRL SHIFT TAB is the shortcut for "go to previous tab"
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^+{tab}
if WinActive("ahk_class Notepad++")
	Send ^+{tab}
if WinActive("ahk_exe explorer.exe")
	Send !{left} ;ALT LEFT is the explorer shortcut to go "back" or "down" one folder level.
if WinActive("ahk_class SpotifyMainWindow")
	Send ^{left}
Return

;Hyper E Brings up Explorer
#^!+E::
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, taranexplorers, ahk_class CabinetWClass ;You have to make a new group for each application, don't use the same one for all of them!
if WinActive("ahk_exe explorer.exe")
	GroupActivate, taranexplorers, r
else
	WinActivate ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
Return

;Hyper C brings up Chrome
#^!+C::
;In unknown circumstances, if chrome is opened with this script, it becomes a blank screen, and cannot open unless you restart your computer.
;you can comment out the next two lines if that happens to you...
IfWinNotExist, ahk_class Chrome_WidgetWin_1
	Run, chrome.exe
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^{tab}
else
	WinActivate ahk_class Chrome_WidgetWin_1
Return

;Hyper W brings up Word
#^!+W::
Process, Exist, WINWORD.EXE
	If errorLevel = 0
		Run, WINWORD.EXE
	else
	{
	GroupAdd, taranwords, ahk_class OpusApp
	if WinActive("ahk_class OpusApp")
		GroupActivate, taranwords, r
	else
		WinActivate ahk_class OpusApp
	}
Return

;Hyper V brings up Visual Studio
;#^!+V::
;Process, Exist, VISUALSTUDIO.EXE
;	If errorLevel = 0
;		Run, VISUALSTUDIO.EXE
;	else
;		WinActivate VISUALSTUDIO.EXE
;	}
;Return

;Hyper I brings up Internet Explorer
#^!+I::
IfWinNotExist, ahk_class IEFrame
	Run, ahk_exe iexplorer.exe
if WinActive("ahk_class IEFrame")
	Send ^{tab}
else
	WinActivate ahk_class IEFrame
Return


;Hyper S brings up Spotify
#^!+S::
IfWinNotExist, ahk_class SpotifyMainWindow
	Run, Spotify.exe
if WinActive("ahk_class SpotifyMainWindow")
	Send ^{tab}
else
	WinActivate ahk_class SpotifyMainWindow
Return

;Hyper N brings up One Note
#^!+N::
IfWinNotExist, ahk_class Framework::CFrame
	Run, ONENOTE.exe
if WinActive("ahk_class Framework::CFrame")
	Send ^{tab}
else
	WinActivate ahk_class Framework::CFrame
Return

;Hyper O brings up Outlook
;#^!+O::
;IfWinNotExist, ahk_class REPLACEME
;	Run, OUTLOOK.exe
;if WinActive("ahk_class REPLACEME")
;	Send ^{tab}
;else
;	WinActivate ahk_class REPLACEME
;Return

;Hyper J brings up Jabber
;#^!+J::
;IfWinNotExist, ahk_class REPLACEME
;	Run, REPLACEME.exe
;if WinActive("ahk_class REPLACEME")
;	Send ^{tab}
;else
;	WinActivate ahk_class REPLACEME
;Return



;Begin stuff from Taryn's advanced file
;BEGIN INSTANT APPLICATION SWITCHER SCRIPTS;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


#IfWinActive


windowSaver()
{
WinGet, lolexe, ProcessName, A
WinGetClass, lolclass, A ; "A" refers to the currently active window
global savedCLASS = "ahk_class "lolclass
global savedEXE = lolexe ;is this the way to do it? IDK.
}

;SHIFT + macro key G14




switchToSavedApp(savedCLASS)
{
;msgbox, savedCLASS is %savedCLASS%
if savedCLASS = ahk_class Notepad++
	{
	;msgbox, is notepad++
	if WinActive("ahk_class Notepad++")
		{
		sleep 5
		Send ^{tab}
		}
	}
;msgbox,,,got to here,0.5
windowSwitcher(savedCLASS, savedEXE)
}





back(){
;; if WinActive("ahk_class MozillaWindowClass")
;tooltip, baaaack
if WinActive("ahk_exe firefox.exe")
	Send ^+{tab}
if WinActive("ahk_class Chrome_WidgetWin_1")
	Send ^+{tab}
if WinActive("ahk_class Notepad++")
	Send ^+{tab}
if WinActive("ahk_exe Adobe Premiere Pro.exe")
	Send ^!+b ;ctrl alt shift B  is my shortcut in premiere for "go back"(in bins)(the project panel)
if WinActive("ahk_exe explorer.exe")
	Send !{left} ;alt left is the explorer shortcut to go "back" or "down" one folder level.
if WinActive("ahk_class OpusApp")
	sendinput, {F2} ;"go to previous comment" in Word.
}


; This is a script that will always go to The last explorer window you had open.
; If explorer is already active, it will go to the NEXT last Explorer window you had open.
; CTRL Numpad2 is pressed with a single button stoke from my logitech G15 keyboard -- Macro key 17.

switchToExplorer(){
IfWinNotExist, ahk_class CabinetWClass
	Run, explorer.exe
GroupAdd, taranexplorers, ahk_class CabinetWClass
if WinActive("ahk_exe explorer.exe")
	GroupActivate, taranexplorers, r
else
	WinActivate ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
}

; ;trying to activate these windows in reverse order from the above. it does not work.
; ^+F2::
; IfWinNotExist, ahk_class CabinetWClass
	; Run, explorer.exe
; GroupAdd, taranexplorers, ahk_class CabinetWClass
; if WinActive("ahk_exe explorer.exe")
	; GroupActivate, taranexplorers ;but NOT most recent.
; else
	; WinActivatebottom ahk_class CabinetWClass ;you have to use WinActivatebottom if you didn't create a window group.
; Return

;closes all explorer windows :/
;^!F2 -- for searchability

closeAllExplorers()
{
WinClose,ahk_group taranexplorers
}


switchToWord()
{
Process, Exist, WINWORD.EXE
;msgbox errorLevel `n%errorLevel%
	If errorLevel = 0
		Run, WINWORD.EXE
	else
	{
	IfWinExist, Microsoft Office Word, OK ;checks to see if the annoying "do you want to continue searching from the beginning of the document" dialouge box is present.
		sendinput, {escape}
	else if WinActive("ahk_class OpusApp")
		sendinput, {F3} ;set to "go to next comment" in Word.
	else
		WinActivate ahk_class OpusApp
	}
}


switchWordWindow()
{
; Process, Exist, WINWORD.EXE
; ;msgbox errorLevel `n%errorLevel%
	; If errorLevel = 0
		; Run, WINWORD.EXE
	; else
	; {
	GroupAdd, taranwords, ahk_class OpusApp
	if WinActive("ahk_class OpusApp")
		GroupActivate, taranwords, r
	else
		WinActivate ahk_class OpusApp
	; }
}



switchToChrome()
{
IfWinNotExist, ahk_exe chrome.exe
	Run, chrome.exe

if WinActive("ahk_exe chrome.exe")
	Sendinput ^{tab}
else
	WinActivate ahk_exe chrome.exe
}

switchToStreamDeck(){
IfWinNotExist, ahk_exe StreamDeck.exe
	{
	Run, C:\Program Files\Elgato\StreamDeck\StreamDeck.exe
	}
else
	{
	WinActivate ahk_exe StreamDeck.exe
	}
}


#IfWinActive
windowSwitcher(theClass, theEXE)
{
;msgbox,,, switching to `nsavedCLASS = %theClass% `nsavedEXE = %theEXE%, 0.5
IfWinNotExist, %theClass%
	Run, % theEXE
if not WinActive(theClass)
	WinActivate %theClass%
}




ExplorerViewChange_Window(explorerHwnd)
{
;https://autohotkey.com/boards/viewtopic.php?t=28304
	if (!explorerHwnd)
		return
	;msgbox,,, % explorerHwnd, 0.5
	Windows := ComObjCreate("Shell.Application").Windows
	for window in Windows
		if (window.hWnd == explorerHwnd)
			sFolder := window.Document
			
	;sFolder.ShellView := 1
	sFolder.CurrentViewMode := 4 ; Details
	;tooltip % sFolder.CurrentViewMode
	;sFolder.SORTCOLUMNS := PKEY_ItemNameDisplay, SORT_DESCENDING, bsssssss
}

;;;must look through that thread to find the direct "sort by name, sort by date" thingies.

ExplorerViewChange_List(explorerHwnd)
{
	if (!explorerHwnd)
		return
	;msgbox,,, % explorerHwnd, 0.5
	Windows := ComObjCreate("Shell.Application").Windows
	for window in Windows
		if (window.hWnd == explorerHwnd)
			sFolder := window.Document
	if (sFolder.CurrentViewMode == 8)
		sFolder.CurrentViewMode := 6 ; Tiles
	else if (sFolder.CurrentViewMode == 6)
		sFolder.CurrentViewMode := 4 ; Details
	else if (sFolder.CurrentViewMode == 4)
		sFolder.CurrentViewMode := 3 ; List
	else if (sFolder.CurrentViewMode == 3) {
		sFolder.CurrentViewMode := 2 ; Small icons
		sFolder.IconSize := 16 ; Actually make the icons small...
	} else if (sFolder.CurrentViewMode == 2) {
		sFolder.CurrentViewMode := 1 ; Icons
		sFolder.IconSize := 48 ; Medium icon size
	} else if (sFolder.CurrentViewMode == 1) {
		if (sFolder.IconSize == 256)
			sFolder.CurrentViewMode := 8 ; Go back to content view
		else if (sFolder.IconSize == 48)
			sFolder.IconSize := 96 ; Large icons
		else
			sFolder.IconSize := 256 ; Extra large icons
	}
	ObjRelease(Windows)
	tooltip % sFolder.CurrentViewMode
}



ExplorerViewChange_ICONS(explorerHwnd)
{

	if (!explorerHwnd)
	{
		tooltip, exiting.
		sleep 100
		return
	}
	;msgbox,,, % explorerHwnd, 0.5
	Windows := ComObjCreate("Shell.Application").Windows
	for window in Windows
		if (window.hWnd == explorerHwnd)
			sFolder := window.Document
	if (sFolder.CurrentViewMode >= 2) {
		sFolder.CurrentViewMode := 1 ; icons
		sFolder.IconSize := 256 ; make the icons big...
		;tooltip, large 1
	} else if (sFolder.CurrentViewMode == 1) {
		if (sFolder.IconSize == 48){
			sFolder.IconSize := 256
			;tooltip, large
			}
		else if (sFolder.IconSize == 256){
			sFolder.IconSize := 96
			;tooltip, you are now at medium icons
			}
		else if (sFolder.IconSize == 96) {
			sFolder.IconSize := 48 ; smallish icons
			;tooltip, you are now at smallish icons
			}
		else {
			sFolder.CurrentViewMode := 1
			sFolder.IconSize := 256
			;tooltip, reset
		}
	}
	;tooltip % sFolder.IconSize
	;tooltip, %explorerHwnd%
	;sleep 100
	;tooltip, % sFolder.CurrentViewMode
}


; ExplorerViewChange_ICONS(explorerHwnd)
; {

	; if (!explorerHwnd)
	; {
		; tooltip, exiting.
		; sleep 100
		; return
	; }
	; ;msgbox,,, % explorerHwnd, 0.5
	; Windows := ComObjCreate("Shell.Application").Windows
	; for window in Windows
		; if (window.hWnd == explorerHwnd)
			; sFolder := window.Document
	; if (sFolder.CurrentViewMode >= 2) {
		; sFolder.CurrentViewMode := 1 ; Small icons
		; sFolder.IconSize := 48 ; Actually make the icons small...
	; } else if (sFolder.CurrentViewMode == 1) {
		; if (sFolder.IconSize == 256){
			; sFolder.CurrentViewMode := 2 ; Go back to small icons
			; sFolder.IconSize := 48
			; }
		; else if (sFolder.IconSize == 48)
			; sFolder.IconSize := 96 ; Large icons
		; else
			; sFolder.IconSize := 256 ; Extra large icons
	; }
	; ;tooltip % sFolder.IconSize
	; ;tooltip, %explorerHwnd%
	; ;sleep 100
	; ;tooltip, % sFolder.CurrentViewMode
; }



; ; ;testing the script here...
; ; #If (exphWnd := WinActive("ahk_class CabinetWClass"))
; ; ^+::
; ; ^=::
; ; tooltip, waaaaaaaaat
; ; ExplorerViewChange_Window(exphWnd)
; ; return
; ; #If





;;;;;;;scripts from this guy;;;;;;;;;;;;;;;;
;https://github.com/asvas/AsVas_AutoHotkey_Scripts/blob/master/ahk_Scripts.ahk
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;not CURRENTLY used anywhere...;;;;

; c::F_Switch("chrome.exe","ahk_class Chrome_WidgetWin_1","chromegroup")
; +c::F_Run("chrome.exe")
;
; w::F_Switch("WINWORD.EXE","ahk_class OpusApp","wordgroup") ;,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word 2016.lnk")
; +w::F_Run("WINWORD.EXE") ;,"C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Word 2016.lnk")


;Function for hiding/Showing the intercept.exe window
F_Intercept_visibility()
{
IfWinActive ahk_exe intercept.exe
	WinHide ahk_exe intercept.exe
else
	WinShow ahk_exe intercept.exe
return
}

;---------------------------------------------------------------------------------
;Function for running intercept.exe
F_Intercept_run()
{
Run, intercept.exe
Sleep 250
WinActivate ahk_exe intercept.exe
send y
WinHide ahk_exe intercept.exe
return
}

;---------------------------------------------------------------------------------
;Run Function - Running specific executable
F_Run(Target,TPath = 0)
{
if TPath = 0 
	Run, %Target%
else
	Run, %TPath% ;Command for running target if conditions are satisfied
}

;---------------------------------------------------------------------------------
;Switch Function - Switching between different instances of the same executable or running it if missing
F_Switch(Target,TClass,TGroup,TPath = 0)
{
IfWinExist, ahk_exe %Target% ;Checking state of existence
	{
	GroupAdd, %TGroup%, %TClass% ;Definition of the group (grouping all instance of this class) (Not the perfect spot as make fo unnecessary reapeats of the command with every cycle, however the only easy option to keep the group up to date with the introduction of new instances)
	ifWinActive %TClass% ;Status check for active window if belong to the same instance of the "Target"
		{
		GroupActivate, %TGroup%, r ;If the condition is met cycle between targets belonging to the group
		}
	else
		WinActivate %TClass% ;you have to use WinActivatebottom if you didn't create a window group.
	}
else
	{
	if TPath = 0 
		Run, %Target%
	else
		Run, %TPath% ;Command for running target if conditions are satisfied
	}
Return
}
;;;;;;scripts from another guy END;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;END OF FUNCTIONS;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;