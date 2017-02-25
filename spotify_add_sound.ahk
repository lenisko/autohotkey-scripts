; Spotify - add or remove sound from 'Your music' - https://github.com/lenisko/spotify-ahk

^Space::							; ctrl+space -- add sound to music
{
	SpotifyToggle("icon_add.png")
	return
}

+^Space::							; shift+ctrl+space -- remove sound from music
{
	SpotifyToggle("icon_remove.png")
	return
}

SpotifyToggle(icon)
{
	if !WinExist("ahk_class SpotifyMainWindow")		; stop function when spotify is not present
		return

	if WinActive("ahk_class SpotifyMainWindow") {		; check if spotify window is active
		KeepSpotifyWindowOpen := true			; don't minimalize it at the end if it is
	} else {
		KeepSpotifyWindowOpen := false
	}

	CoordMode, Mouse, Screen
	MouseGetPos, x, y 					; save original mouse position
	DetectHiddenWindows, On
	WinActivate, ahk_class SpotifyMainWindow 		; show spotify window
	WinGetActiveStats, _title, aw, ah, _x, _y		; save widow height

	if (KeepSpotifyWindowOpen == false) {
		WinWaitActive, ahk_class SpotifyMainWindow  	; wait before imagesearch
	}

	Sleep 50						; <you might need to fix this value>

	CoordMode, Pixel, Client
	ImageSearch, fx, fy, 0, 0, 500, ah, %icon%		; search button like png image in area

	if (ErrorLevel=0) { 					; execute block on match
		CoordMode, Mouse, Client
		Click %fx%, %fy% 				; click to add sound
		CoordMode, Mouse, Screen
		MouseMove %x%, %y% 				; move mouse to original position

	}
	DetectHiddenWindows, Off
	if (KeepSpotifyWindowOpen == false) {
		WinMinimize, ahk_class SpotifyMainWindow 	; minimalize spotify
	}
}
