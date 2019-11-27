#include <Array.au3>
#RequireAdmin
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
   ConsoleWrite("Game Starting... ")
   Sleep(1300)
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
			;If break point here, replace current line with line below.
			;PixelSearch($ClientPos[0] + 400, $ClientPos[1] + 582, $ClientPos[0] + 400, $ClientPos[1] + 582, 0x978917, 15)
			PixelSearch($ClientPos[0] + 389, $ClientPos[1] + 571, $ClientPos[0] + 489, $ClientPos[1] + 571, 0x87831D, 15)
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
	  Sleep(500)
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
	  PixelSearch($ClientPos[0] + 279, $ClientPos[1] + 556, $ClientPos[0] + 279, $ClientPos[1] + 556, 0xEE76B4, 5)
	  If Not(@Error) Then
		 $Loaded = True
	  Else
		 Sleep(50)
	  EndIf
   WEnd
   $Loop = $Loop + 1
   ;Buy Energy
   If($Energy = "Y") Then
	  If($Loop > $Times) Then
		 MouseClick("Left", $ClientPos[0] + 32, $ClientPos[1] + 63)
		 Sleep(150)
		 MouseClick("Left", $ClientPos[0] + 510, $ClientPos[1] + 107)
		 Sleep(150)
		 MouseClick("Left", $ClientPos[0] + 108, $ClientPos[1] + 513)
		 Sleep(150)
		 MouseClick("Left", $ClientPos[0] + 733, $ClientPos[1] + 487)
		 Sleep(150)
		 MouseClick("Left", $ClientPos[0] + 286, $ClientPos[1] + 427)
		 Sleep(150)
		 MouseClick("Left", $ClientPos[0] + 804, $ClientPos[1] + 67)
		 Sleep(50)
	  EndIf
   EndIf
WEnd

Func _Exit()
   ProcessClose("DanceBot.au3")
   Exit
EndFunc
