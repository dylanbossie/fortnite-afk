#include <Constants.au3>

; Hotkey to terminate the script
HotKeySet("{F8}", "Terminate")

$doFarming = True
While True
   $gameState = checkState()
   ConsoleWrite("Current game state: " & $gameState & @CRLF)

   Select
   Case $gameState == "IN GAME" And $doFarming == True
	  afkSleep()
	  $doFarming = False
   Case $gameState == "IN GAME" And $doFarming == False
	  openEscapeMenu()
   Case $gameState == "IN LOBBY"
	  $doFarming = restartFarming()
   Case $gameState == "IN SERVER SELECTION"
	  enterCreative()
   Case $gameState == "IN ESCAPE MENU" And $doFarming == True
	  exitEscapeMenu()
   Case $gameState == "IN ESCAPE MENU" And $doFarming == False
	  leaveGame()
   Case $gameState == "IN LEAVE CREATIVE MENU"
	  leaveCreative()
   Case $gameState == "IN INVENTORY"
	  exitInventory()
   Case $gameState == "IN CHALLENGE COMPLETE"
	  claimLoot()
   Case $gameState == "UNKNOWN"
	  handleExceptions()
   Case Else
	  Exit(1)
   EndSelect

WEnd

Func checkState()
   Local Const $CHALLENGE_COMPLETE_CHECKSUM_REGION = [75, 34, 92, 66]
   Local Const $INGAME_CHECKSUM_REGION = [456, 974, 495, 987]
   Local Const $LOBBY_CHECKSUM_REGION = [729, 1033, 1064, 1062]
   Local Const $SELECTSERVER_CHECKSUM_REGION = [1050, 974, 1058, 1038]
   Local Const $ESCAPEMENU_CHECKSUM_REGION = [1516, 569, 1531, 599]
   Local Const $LEAVECREATIVE_CHECKSUM_REGION = [477, 342, 625, 369]
   Local Const $INVENTORY_CHECKSUM_REGION = [1779, 1054, 1799, 1059]
   Local Const $REGIONS = [$CHALLENGE_COMPLETE_CHECKSUM_REGION, $INGAME_CHECKSUM_REGION, $LOBBY_CHECKSUM_REGION, _
     $SELECTSERVER_CHECKSUM_REGION, $ESCAPEMENU_CHECKSUM_REGION, $LEAVECREATIVE_CHECKSUM_REGION, _
	 $INVENTORY_CHECKSUM_REGION]
   Local Const $CHECKSUMS = [3283299190, 3143933228, 1144248448, 450041709, 3213948929, 2358595122, 4071091018]
   Local Const $GAME_STATES = ["IN CHALLENGE COMPLETE", "IN GAME", "IN LOBBY", "IN SERVER SELECTION", _
     "IN ESCAPE MENU", "IN LEAVE CREATIVE MENU", "IN INVENTORY"]

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
   Local $endAfk = 4580; time in seconds to afk farm, 4580s is the max number of ticks/lobby
   Local $timer = 0

   ConsoleWrite("Farming XP for: " & $endAfk & " seconds" & @CRLF)
   While $timer < $endAfk
	  $timer = $timer + 1
	  ConsoleWrite($timer & @CRLF)
	  Sleep(1000)
   WEnd
EndFunc

Func restartFarming()
   MouseMove(1663,770)
   MouseClick($MOUSE_CLICK_LEFT)
   Sleep(3000)
   Return True
EndFunc

Func enterCreative()
   MouseMove(672, 883)
   MouseClick($MOUSE_CLICK_LEFT)
   ConsoleWrite("Waiting to enter creative..." & @CRLF)
   Sleep(20000)
EndFunc

Func leaveGame()
   MouseMove(1629, 501)
   MouseClick($MOUSE_CLICK_LEFT)
   Sleep(3000)
EndFunc

Func leaveCreative()
   MouseMove(1149,781)
   MouseClick($MOUSE_CLICK_LEFT)
   ConsoleWrite("Waiting to enter lobby..." & @CRLF)
   Sleep(13000)
EndFunc

Func exitInventory()
   pressEsc()
   Sleep(3000)
EndFunc

Func openEscapeMenu()
   ConsoleWrite("Attempting to restart XP farm..." & @CRLF)
   pressEsc()
   Sleep(3000)
EndFunc

Func exitEscapeMenu()
   pressEsc()
EndFunc

Func handleExceptions()
   Sleep(10000)
   pressEsc()
   Sleep(3000)
EndFunc

Func claimLoot()
   MouseMove(1096, 937)
   MouseClick($MOUSE_CLICK_LEFT)
   Sleep(2000)
EndFunc

;;;;; Helper Functions ;;;;;
Func pressEsc()
   SendKeepActive("Fortnite")
   Send("{ESC}")
   SendKeepActive("")
EndFunc

Func Terminate()
   Exit(0)
EndFunc