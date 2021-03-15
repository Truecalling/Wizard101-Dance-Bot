# Wizard-101-Dance-Bot

--Fix release by St. Jimmy 7-20-19
Works for all world versions, Thanks Jimmy.

Instructions for use:
- You must have autoit installed. https://www.autoitscript.com/site/autoit/downloads/
- W101 UI size must be "regular"
- Put the w101 client in windowed mode, 800x600
- Don't have any other tabs open that refresh the windows (youtube). Even if its on another monitor. 
- Make sure Bloom is on. Bot tends to work better with bloom on.
- Go to pet pavilion and stand in front of the minigame circle so the prompt to press X is displayed
- Run the script, a box will come up asking for your current energy and will play that many games divided by 8 (eg. you only want it to play 5 games type "40" into the box)
- Press "OK" and leave your computer running, should work fine so long as you don't touch your mouse or keyboard
- Press "q" at anytime to end the script.

Thanks to Ben Coombe for the source code, https://www.youtube.com/watch?v=wi06FfyZGTc.
Thanks to Zachary King for the original.


Update release by St. Jimmy 7-26-19:
- Few bug fixes.
- Added randomizer for dance game input delay.
- Replaced 8 energy cost, now its manual and always counts correctly.
- Re-added breakpoint #2 code, only use if you are ending up with errors where game shows right but program read it as "left".
- Added #RequireAdmin as WizTool launches w101 as Admin.

Update release by St. Jimmy 10-17-20:
- Reverted to original pixelsearch in 1 case.
- Reduced delay between turns.
- Energy Elixir redone, also now infinitely loops (keeps buying energy until pet is leveled up).
- Added a check to verify player has loaded into dance game before searching moves, this was causing massive issues.

Update release by St. Jimmy 3-14-21:
-Reverted to fixed pixelsearch in 1 case.


Backup folder is for if you are having errors while in dance game.

Video from St. Jimmy 7-20-19 
V1 (fix release)
https://streamable.com/rmap0

Video from St. Jimmy 7-26-19
V2 (fix, addon)
https://streamable.com/x4mtw
