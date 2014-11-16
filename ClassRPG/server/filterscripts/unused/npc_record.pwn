//-------------------------------------------------
//
//  Recording player data for NPC playback
//  Kye 2009
//
//-------------------------------------------------

#pragma tabsize 0

#include <a_samp>
#include <core>
#include <float>

#include "../include/gl_common.inc"

//-------------------------------------------------

public OnPlayerCommandText(playerid, cmdtext[])
{
	new cmd[256];
	new idx;
	cmd = strtok(cmdtext, idx);
	
	//if(!IsPlayerAdmin(playerid)) return 0; // this is an admin only script
	
	// Start recording vehicle data (/vrecord recording_name[])
	// Find the recording_name[] file in /scriptfiles/
 	if(strcmp(cmd, "/felv�tel", true) == 0) {
	    new tmp[512];
      	tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid,0xFF0000FF,"Usage: /felv�tel {name}");
			return 1;
		}
		if(!IsPlayerInAnyVehicle(playerid)) {
            SendClientMessage(playerid,0xFF0000FF,"Felv�tel: �lj be egy kocsiba.");
			return 1;
		}
		StartRecordingPlayerData(playerid,PLAYER_RECORDING_TYPE_DRIVER,tmp);
		SendClientMessage(playerid,0xFF0000FF,"Felv�tel: indul.");
		return 1;
	}

	// Start recording onfoot data (/ofrecord recording_name[])
	// Find the recording_name[] file in /scriptfiles/
 	if(strcmp(cmd, "/ofrecord", true) == 0) {
	    new tmp[512];
      	tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid,0xFF0000FF,"Usage: /ofrecord {name}");
			return 1;
		}
 		if(IsPlayerInAnyVehicle(playerid)) {
            SendClientMessage(playerid,0xFF0000FF,"Felv�tel: Leave the vehicle and reuse the command.");
			return 1;
		}
		StartRecordingPlayerData(playerid,PLAYER_RECORDING_TYPE_ONFOOT,tmp);
		SendClientMessage(playerid,0xFF0000FF,"Felv�tel: kezd�s.");
		return 1;
	}
	
	// Stop recording any data
	if(strcmp(cmd, "/felv�telstop", true) == 0) {
		StopRecordingPlayerData(playerid);
		SendClientMessage(playerid,0xFF0000FF,"Felv�tel: meg�ll�tva.");
		return 1;
	}

	return 0;
}

//-------------------------------------------------
// EOF


