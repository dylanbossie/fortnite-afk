#include <Constants.au3>

;
; AutoIt Version: 3.0
; Language:       English
; Platform:       Win10
; Author:         Bobblehead
;
; Script Function:
;   Fortnite Creative Lobby AFK XP Farming Tool
;

; XP gain times: 3:39,3:24,3:09,2:54 and 2:39
; Games start at 3:54:50

; Enter a solo creative hub game before executing this script
While True
   ; AFK in lobby for 5 ticks of XP
   afkSleep()

   ; Click to make sure Fortnite is active window
   MouseMove(1835, 1054)
   MouseClick($MOUSE_CLICK_LEFT)

   Sleep(500)

   ; Open in-game menu
   Send("{ESC}")
   ; Click 'Leave Game'
   MouseMove(1629, 501)
   MouseClick($MOUSE_CLICK_LEFT)

   Sleep(500)

   ; Click 'Leave' to confirm leaving hub
   MouseMove(1149,781)
   MouseClick($MOUSE_CLICK_LEFT)

   ; Wait for lobby to load
   Sleep(15000)

   ; Close any shop advertisements
   MouseMove(1774, 1019)
   MouseClick($MOUSE_CLICK_LEFT)

   Sleep(5000)

   ; Claim any level-up rewards
   MouseMove(1093, 932)
   MouseClick($MOUSE_CLICK_LEFT)

   Sleep(5000)

   ; Click 'PLAY'
   MouseMove(1663,770)
   MouseClick($MOUSE_CLICK_LEFT)

   Sleep(2000)

   ; Join a solo creative hub game
   MouseMove(774, 897)
   MouseClick($MOUSE_CLICK_LEFT)

   ; Wait for creative game to load
   Sleep(30000)

WEnd

Func afkSleep()
   Local $endAfk = 4580000
   Local $timer = 0

   While $timer < $endAfk
	  $timer = $timer + 1
	  ConsoleWrite($timer & @CRLF)
	  Sleep(1000)
   WEnd
EndFunc
