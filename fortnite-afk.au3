#include <MsgBoxConstants.au3>
#include <Constants.au3>

While True
   $gameState = checkState()
   ConsoleWrite("Current game state: " & $gameState & @CRLF)

   Switch $gameState
   Case "IN GAME"
	  afkSleep()
   Case "IN LOBBY"
	  pressPlay()
   Case "IN SERVER SELECTION"
	  enterCreative()
   Case "IN ESCAPE MENU"
	  leaveGame()
   Case "IN LEAVE CREATIVE MENU"
	  leaveCreative()
   Case "IN INVENTORY"
	  exitInventory()
   EndSwitch

WEnd

Func checkState()
   Local Const $ADVERTISEMENT_CHECKSUM = "unknown"
   Local Const $INGAME_CHECKSUM_REGION = [112, 973, 347, 988]
   Local Const $LOBBY_CHECKSUM_REGION = [729, 1033, 1064, 1062]
   Local Const $SELECTSERVER_CHECKSUM_REGION = [1050, 974, 1058, 1038]
   Local Const $ESCAPEMENU_CHECKSUM_REGION = [1516, 569, 1531, 599]
   Local Const $LEAVECREATIVE_CHECKSUM_REGION = [477, 342, 625, 369]
   Local Const $INVENTORY_CHECKSUM_REGION = [1779, 1054, 1799, 1059]
   Local Const $REGIONS = [$INGAME_CHECKSUM_REGION, $LOBBY_CHECKSUM_REGION, _
     $SELECTSERVER_CHECKSUM_REGION, $ESCAPEMENU_CHECKSUM_REGION, $LEAVECREATIVE_CHECKSUM_REGION, $INVENTORY_CHECKSUM_REGION]
   Local Const $CHECKSUMS = [2991838282, 1144248448, 450041709, 3213948929, 2358595122, 4071091018]
   Local Const $GAME_STATES = ["IN GAME", "IN LOBBY", "IN SERVER SELECTION", "IN ESCAPE MENU", "IN LEAVE CREATIVE MENU", "IN INVENTORY"]

   Local $isState

   For $i = 0 To UBound($REGIONS)-1 Step 1
	  $isState = checkRegion($REGIONS[$i], $CHECKSUMS[$i])

	  If $isState Then
		 Return $GAME_STATES[$i]
	  EndIf
   Next

   Return "UNKNOWN"
EndFunc

Func checkRegion($region, $checksum)
   If PixelChecksum($region[0], $region[1], $region[2], $region[3]) == $checksum Then
	  Return True
   Else
	  Return False
   EndIf
EndFunc

Func afkSleep()
   Local $endAfk = 3 ; time in seconds to afk farm
   Local $timer = 0

   While $timer < $endAfk
	  $timer = $timer + 1
	  ConsoleWrite($timer & @CRLF)
	  Sleep(1000)
   WEnd
EndFunc

Func pressPlay()
   MouseMove(1663,770)
   MouseClick($MOUSE_CLICK_LEFT)
EndFunc

Func enterCreative()
   MouseMove(774, 897)
   MouseClick($MOUSE_CLICK_LEFT)
EndFunc

Func leaveGame()
   MouseMove(1629, 501)
   MouseClick($MOUSE_CLICK_LEFT)
EndFunc

Func leaveCreative()
   MouseMove(1149,781)
   MouseClick($MOUSE_CLICK_LEFT)
EndFunc

Func exitInventory()
   SendKeepActive("Fortnite")
   Send("{ESC}")
   SendKeepActive("")
EndFunc