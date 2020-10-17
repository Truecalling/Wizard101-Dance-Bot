#include <Array.au3>
#RequireAdmin
;Credits to Zachary King and Ben Coombe for this project
;Fix/Addon Release by St. Jimmy
WinActivate("Wizard101")
HotKeySet("q", "_Exit")
Local $Loop = 1
Local $Times = InputBox("Games to play", "Please enter current energy")
Local $Age = InputBox("Cost to play?", "2 = Baby, 4 = Teen, 6 = Adult, 8 = Ancient, 10 = Epic, 12 = Mega, 14 = Ultra")
Local $Level = InputBox("What Level", "W = Wizard City, K = Krokotopia, M = Marlybone, S = MooShu, D = Dragonspyre")
Local $Delay = 350
$Times = Floor($Times/$Age)
Local $Energy = InputBox("Do you want to buy energy when you run out?", "Y or N")
WinActivate("Wizard101")
Local $ClientPos = WinGetPos("Wizard101")
While $Loop <= $Times
   Send("x")
   Sleep(300)
   If($Level = "W") Then
	  MouseClick("Left", $ClientPos[0] + 222, $ClientPos[1] + 462)
   EndIf
   If($Level = "K") Then
	  MouseClick("Left", $ClientPos[0] + 310, $ClientPos[1] + 460)
   EndIf
   If($Level = "M") Then
	  MouseClick("Left", $ClientPos[0] + 403, $ClientPos[1] + 459)
   EndIf
   If($Level = "S") Then
	  MouseClick("Left", $ClientPos[0] + 495, $ClientPos[1] + 462)
   EndIf
   If($Level = "D") Then
	  MouseClick("Left", $ClientPos[0] + 590, $ClientPos[1] + 470)
   EndIf
   MouseClick("Left", $ClientPos[0] + 590, $ClientPos[1] + 545)
   Sleep(250)
   MouseMove($ClientPos[0] + 639,$ClientPos[1] + 405,50)
   Sleep(250)
   Local $MoveArray[7] = []
   ;first break point fixed 7-20-19 St. Jimmy
   While PixelGetColor($ClientPos[0] + 332, $ClientPos[1] + 209) = 0x8B0C30
	  Sleep(20)
   WEnd
   ;pixelsearch check for exit button in dance to verify client has loaded, 10-17-20 by St. Jimmy
   ConsoleWrite("Entering Dance... ")
   While Not PixelGetColor($ClientPos[0] + 787, $ClientPos[1] + 609) = 0xEF0000
	  Sleep(50)
   WEnd
   ConsoleWrite("...Dance Loaded")
   For $Round = 2 to 6
	  Local $Moves = 0
	  While $Moves <= $Round
		 PixelSearch($ClientPos[0] + 403, $ClientPos[1] + 560, $ClientPos[0] + 403, $ClientPos[1] + 560, 0xF4E940, 15)
		 If Not(@error) Then
			PixelSearch($ClientPos[0] + 409, $ClientPos[1] + 568, $ClientPos[0] + 409, $ClientPos[1] + 568, 0xCCBD17, 15)
			If Not(@Error) Then
			   ConsoleWrite("UP, ")
			   _ArrayInsert($MoveArray, $Moves, "Up")
			Else
			   ConsoleWrite("DOWN, ")
			   _ArrayInsert($MoveArray, $Moves, "Down")
			EndIf
			$Moves = $Moves + 1
			Sleep(200)
		 EndIf
		 PixelSearch($ClientPos[0] + 415, $ClientPos[1] + 571, $ClientPos[0] + 415, $ClientPos[1] + 571, 0xF1E516, 15)
		 If Not(@error) Then
			;second break point fixed 7-20-19 St. Jimmy
			;BREAK POINT REVERTED TO ORIGINAL 10-16-20 BY ST.JIMMY FOR 2020 SPRING/SUMMER UPDATE
			;If break point here, replace current line with line below.
			PixelSearch($ClientPos[0] + 400, $ClientPos[1] + 582, $ClientPos[0] + 400, $ClientPos[1] + 582, 0x978917, 15)
			;PixelSearch($ClientPos[0] + 389, $ClientPos[1] + 571, $ClientPos[0] + 489, $ClientPos[1] + 571, 0x87831D, 15)
			If Not(@Error) Then
			   ConsoleWrite("LEFT, ")
			   _ArrayInsert($MoveArray, $Moves, "Left")
			Else
			   ConsoleWrite("RIGHT, ")
			   _ArrayInsert($MoveArray, $Moves, "Right")
			EndIf
			$Moves = $Moves + 1
			Sleep(200)
		 EndIf
	  WEnd
	  Sleep(400)
	  For $i = 0 to $Moves
		 If $MoveArray[$i] == "Down" Then
			ConsoleWrite("Sending Down, ")
			Send("s")
			$Delay = Random(250,450)
			Sleep($Delay)
		 ElseIf $MoveArray[$i] == "Up" Then
			ConsoleWrite("Sending Up, ")
			Send("w")
			$Delay = Random(250,450)
			Sleep($Delay)
		 ElseIf $MoveArray[$i] == "Right" Then
			ConsoleWrite("Sending Right, ")
			Send("d")
			$Delay = Random(250,450)
			Sleep($Delay)
		 ElseIf $MoveArray[$i] == "Left" Then
			ConsoleWrite("Sending Left, ")
			Send("a")
			$Delay = Random(250,450)
			Sleep($Delay)
		 EndIf
	  Next
   Next
   Sleep(2500)
   MouseClick("Left", $ClientPos[0] + 582, $ClientPos[1] + 536)
   Sleep(200)
   MouseClick("Left", $ClientPos[0] + 219, $ClientPos[1] + 465)
   Sleep(200)
   MouseClick("Left", $ClientPos[0] + 584, $ClientPos[1] + 536)
   Sleep(200)
   MouseClick("Left", $ClientPos[0] + 224, $ClientPos[1] + 537)
   ;last updated 7-21-19 by St. Jimmy. Fix release designed for 11a community
   $Loaded = False
   While $Loaded == False
	  ;updated 10-16-20 by St. Jimmy. Replaced PS check with new pet emblem
	  PixelSearch($ClientPos[0] + 271, $ClientPos[1] + 555, $ClientPos[0] + 271, $ClientPos[1] + 555, 0xEF7EB8, 5)
	  If Not(@Error) Then
		 $Loaded = True
	  Else
		 Sleep(50)
	  EndIf
   WEnd
   $Loop = $Loop + 1
   ;Buy Energy
   ;Fixed/Improved 10-17-20 by St. Jimmy, changed for new UI updates and now infinitely loops till pet levels up or out of crowns
   If($Energy = "Y") Then
	  If($Loop > $Times) Then
		 Send("x")
		 MouseClick("Left", $ClientPos[0] + 396, $ClientPos[1] + 536)
		 Sleep(150)
		 MouseClick("Left", $ClientPos[0] + 398, $ClientPos[1] + 366)
		 Sleep(150)
		 MouseClick("Left", $ClientPos[0] + 336, $ClientPos[1] + 421)
		 Sleep(150)
		 MouseClick("Left", $ClientPos[0] + 403, $ClientPos[1] + 428)
		 Sleep(150)
		 $Loop = 1
	  EndIf
   EndIf
WEnd

Func _Exit()
   ProcessClose("DanceBot.au3")
   Exit
EndFunc
