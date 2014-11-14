#if defined __game_system_system_pause
	#endinput
#endif
#define __game_system_system_pause

/////////////////////////////////////////////////////////
// OnPlayerPause                                       //
//    Script By SeoToX                                 //
//       for ClassRPG.net                              //
//                                                     //
// Description:                                        //
// - Detect when a player ESC / Tabbing                //
//                                                     //
// Callbacks:                                          //
// - OnPlayerPause( playerid, bool:paused )            //
//                                                     //
// Per-player variables:                               //
// - gPaused[playerid] (bool) - paused or not          //
// - gPausedTime[playerid] - time paused               //
/////////////////////////////////////////////////////////

new gPaused[MAX_PLAYERS], gPausedTime[MAX_PLAYERS];
forward OnPlayerPause(playerid, paused);

stock onPause_Update(playerid)
{
	if(gPaused[playerid])
	{
		CallLocalFunction("OnPlayerPause", "dd", playerid, 0);
		gPaused[playerid] = 0;
	}

	gPausedTime[playerid] = 0;
}

stock onPause_Init()
{
	SetTimer("onPause_Timer", 990, 1);
}

fpublic onPause_Timer()
{
	foreach(Jatekosok, p)
	{
		gPausedTime[p]++;
		if(gPausedTime[p] == 2)
		{
			CallLocalFunction("OnPlayerPause", "dd", p, 1);
			gPaused[p] = 1;
		}
	}
}