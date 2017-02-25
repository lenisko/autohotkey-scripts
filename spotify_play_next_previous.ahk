; Spotify - play next and previous on mouse buttons - https://github.com/lenisko/spotify-ahk

#IfWinActive ahk_class SpotifyMainWindow
	XButton1::Media_Next						; Mouse4 -- play next
	XButton2::Media_Prev						; Mouse5 -- play previous
#IfWinActive
