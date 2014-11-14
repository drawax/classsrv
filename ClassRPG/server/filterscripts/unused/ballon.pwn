#include <a_samp>

/*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/
/*\\\\\\\\\\\Script made by Geso\\\\\\\\\\\*/
/*http://forum.sa-mp.com/member.php?u=76396*/
/*\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\*/

//#define POLICE_USE //uncomment if you want only police to use it.
//#define ADMIN_USE //uncomment if you want only admins to use it.

/*
AddSPU(spuid, Float:x, Float:y, Float:z, Float:rotation, color1, color2, lightonoroff) //lightonoroff: 1 = on, 0 = off.

You can use this function to create SPU's without using the dialog, i.e. in OnFilterScriptInit.
SPU-id stands for the type you need:
1  --- Sultan with lamp on dashboard.
2  --- Sultan with lamp on roof.
3  --- Cheetah with lamp on dashboard.
4  --- Cheetah with lamp on roof.
5  --- Washington with lamp on dashboard.
6  --- Washington with lamp on roof.
7  --- Premier with lamp on dashboard.
8  --- Premier with lamp on roof.
9  --- Huntley with lamp on dashboard.
10 --- Huntley with lamp on roof.
11 --- Buffalo with lamp on dashboard.
12 --- Buffalo with lamp on roof.
13 --- LSPD with lamp on dashboard.
14 --- LSPD with lamp on roof.
15 --- SFPD with lamp on dashboard.
16 --- SFPD with lamp on roof.
17 --- LVPD with lamp on dashboard.
18 --- LVPD with lamp on roof.
19 --- FireTruck
20 --- FBI-Truck
21 --- Towtruck
22 --- Stretch with lamp on dashboard.
23 --- Stretch with lamp on roof.
24 --- PCJ-600
25 --- FCR-900
26 --- Wayfarer
27 --- Super GT
28 --- Burrito with lamp on dashboard.
29 --- Burrito with lamp on roof.
30 --- BF Injection
31 --- Patriot
32 --- Barracks
33 --- Rhino
*/

#define COLOR_RED 0xAA3333AA

#define DIALOG1_MSG "Sultan [dashboard]\nSultan [roof]\nCheetah [dashboard]\nCheetah [roof]\nWashington [dashboard]\nWashington [roof]\nPremier [dashboard]\nPremier [roof]\nHuntley [dashboard]\nHuntley [roof]\nMore"
#define DIALOG2_MSG "Buffalo [dashboard]\nBuffalo [roof]\nLSPD Cruiser[dashboard]\nLSPD Cruiser[roof]\nSFPD Cruiser[dashboard]\nSFPD Cruiser[roof]\nLVPD Cruiser[dashboard]\nLVPD Cruiser[roof]\nFiretruck\nFBI Truck \nMore"
#define DIALOG3_MSG "Tow Truck\nStretch [dashboard]\nStretch [roof]\nPCJ-600\nFCR-900\nWayfarer\nSuper GT\nBurrito [dashboard]\nBurrito [roof]\nBF Injection\nPatriot\nBarracks\nRhino"

new IsSpu[MAX_VEHICLES] = 0;
new Lamp[MAX_VEHICLES] = 0;
new light[MAX_VEHICLES];

enum Coords
{
	SPU,
	VehicleID,
	Float:X,
	Float:Y,
	Float:Z,
};

new Offsets[33][Coords] = {
	{1, 560, 0.398071289,0.75390625,0.43879509},
	{2, 560, -0.35644531250, 0.0388183593, 0.863788605}, 
	{3, 415, 0.409729004, 0.526367188, 0.206963539}, 
	{4, 415, -0.290039062, -0.284179688, 0.631957054},
	{5, 421, 0.421691895, 0.804931641, 0.256482124}, 
	{6, 421, -0.323303223, 0.0207519532, 0.731482506}, 
	{7, 426, 0.575378418, 0.786132812, 0.361483574}, 
	{8, 426, -0.455505371, -0.143066406, 0.861475945}, 
	{9, 579, 0.454345703, 0.575683594, 0.645122528}, 
	{10, 579, -0.442626953, -0.269042969, 1.27014542}, 
	{11, 402, 0.53515625, 0.562988281, 0.278743744}, 
	{12, 402, -0.412841797, -0.474365234, 0.778804779}, 
	{13, 596, 0.53515625, 0.771728516, 0.373809814},
	{14, 596, -0.0048828125, -0.860107422, 0.848770142}, 
	{15, 597, 0.53515625, 0.771728516, 0.373809814}, 
	{16, 597, -0.0048828125, -0.860107422, 0.848770142}, 
	{17, 598, 0.406738281, 0.696777344, 0.398208618}, 
	{18, 598, -0.0048828125, -0.860107422, 0.848770142}, 
	{19, 544, 0.522338867, 2.5925293, 1.46867275},
	{20, 528, 0.563842773, 0.754882812, 0.487258911}, 
	{21, 525, -0.0089111328, 0.273193359, 1.4037838}, 
	{22, 409, 0.420776367, 1.80236816, 0.368680954}, 
	{23, 409, -0.439941406, 0.824829102, 0.842817307}, 
	{24, 461, 0.00000000, -0.932861328, 0.494509697}, 
	{25, 521, 0.00000000, -0.928955078, 0.558652878}, 
	{26, 586, 0.00000000, -1.20178223, 0.671886444}, 
	{27, 506, 0.541137695, 0.282714844, 0.272130013}, 
	{28, 482, 0.493530273, 1.39465332, 0.442443848}, 
	{29, 482, -0.392211914, 0.565551758, 0.941601753}, 
	{30, 424, -0.624511719, 0.139648438, 0.918135643},
	{31, 470, -0.617797851, 0.056640625, 1.10928631},
	{32, 433, -0.577392578, 1.23217773, 1.70311642},
	{33, 432, -1.21105957, -3.84765625, 1.17495251}
};

public OnFilterScriptInit()
{
	print("\n----------------------------------------");
	print(" SPU's v4.0[Special Police Units] by Geso ");
	print("----------------------------------------\n");
	//AddSPU(23, -2082.1675, 1366.9668, 7.1007, 0, 0, 0, 1); Example, this will create a black Stretch with a light at Esplanade Point, north of SF.
	return 1;
}

public OnFilterScriptExit()
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/spu", cmdtext, true) == 0)
	{
		#if defined ADMIN_USE
		if(!IsPlayerAdmin(playerid)) return 1;
		#endif
		#if defined POLICE_USE
		if(GetPlayerSkin(playerid) != 280 && GetPlayerSkin(playerid) != 281 && GetPlayerSkin(playerid) != 282 && GetPlayerSkin(playerid) != 283 && GetPlayerSkin(playerid) != 284 && GetPlayerSkin(playerid) != 285 && GetPlayerSkin(playerid) != 286 && GetPlayerSkin(playerid) != 287 && GetPlayerSkin(playerid) != 288) return 1;
		#endif
	    ShowPlayerDialog(playerid, 1123, DIALOG_STYLE_LIST, "So you want to have a SPU, what one do you want then?", DIALOG1_MSG, "Take it", "Leave it" );
		return 1;
	}
    if (strcmp("/destroyspu", cmdtext, true) == 0)
  	{
	    #if defined ADMIN_USE
		if(!IsPlayerAdmin(playerid)) return 1;
		#endif
		#if defined POLICE_USE
		if(GetPlayerSkin(playerid) != 280 && GetPlayerSkin(playerid) != 281 && GetPlayerSkin(playerid) != 282 && GetPlayerSkin(playerid) != 283 && GetPlayerSkin(playerid) != 284 && GetPlayerSkin(playerid) != 285 && GetPlayerSkin(playerid) != 286 && GetPlayerSkin(playerid) != 287 && GetPlayerSkin(playerid) != 288) return 1;
		#endif
		if(IsPlayerConnected(playerid))
   		{

			new vid = GetPlayerVehicleID(playerid);
			if(IsSpu[vid] > 0)
			{
                    IsSpu[vid] = 0;
                    if(Lamp[vid] == 1)
                    {
                    DestroyObject(light[vid]);
                    Lamp[vid] = 0;
                    }
   					DestroyVehicle(vid);
       				return 1;
			}
			else
 		    {
				   SendClientMessage(playerid, COLOR_RED, "This is not a SPU vehicle.");
			}
		}
		return 1;
	}
	return 0;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	if(response == 1 && dialogid == 1123)
	{
		switch(listitem)
		{
            case 0:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 1)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 1;
					}
				}
			}
            case 1:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 2)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 2;
					}
				}
			}
            case 2:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 3)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 3;
					}
				}
			}
            case 3:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 4)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 4;
					}
				}
			}
			case 4:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 5)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 5;
					}
				}
			}
            case 5:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 6)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 6;
					}
				}
			}//done
			case 6:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 7)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 7;
					}
				}
			}
			case 7:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 8)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 8;
					}
				}
			}
			case 8:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 9)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 9;
					}
				}
			}
			case 9:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 10)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 10;
					}
				}
			}
			case 10:
            {//new dialog
	            ShowPlayerDialog(playerid, 1133, DIALOG_STYLE_LIST, "So you want to have a SPU, what one do you want then?", DIALOG2_MSG, "Take it", "Leave it" );
			}
		}
	}
	if(response == 1 && dialogid == 1133)
	{
		switch(listitem)
		{
            case 0:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 11)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 11;
					}
				}
			}
            case 1:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 12)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 12;
					}
				}
			}
			case 2:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 13)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 13;
					}
				}
			}
            case 3:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 14)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 14;
					}
				}
			}
			case 4:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 15)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 15;
					}
				}
			}
            case 5:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 16)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 16;
					}
				}
			}
            case 6:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 17)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 17;
					}
				}
			}
            case 7:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 18)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 18;
					}
				}
			}
            case 8:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 19)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 19;
					}
				}
			}
            case 9:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 20)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 20;
					}
				}
			}
			case 10:
            {//new dialog
	            ShowPlayerDialog(playerid, 1143, DIALOG_STYLE_LIST, "So you want to have a SPU, what one do you want then?", DIALOG3_MSG, "Take it", "Leave it" );
			}
		}
	}
	if(response == 1 && dialogid == 1143)
	{
		switch(listitem)
		{
            case 0:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 21)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 21;
					}
				}
			}
            case 1:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 22)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 22;
					}
				}
			}
			case 2:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 23)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 23;
					}
				}
			}
			case 3:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 24)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 24;
					}
				}
			}
			case 4:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 25)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 25;
					}
				}
			}
			case 5:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 26)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 26;
					}
				}
			}
			case 6:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 27)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 27;
					}
				}
			}
			case 7:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 28)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 28;
					}
				}
			}
			case 8:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 29)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 29;
					}
				}
			}
			case 9:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 30)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 30;
					}
				}
			}
			case 10:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 31)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 31;
					}
				}
			}
			case 11:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 32)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 32;
					}
				}
			}
			case 12:
            {
     			new Float:x, Float:y, Float:z, Float:angle;
	 			GetPlayerPos(playerid, x, y, z);
	 			GetPlayerFacingAngle(playerid, angle);
				for(new i=0; i<sizeof(Offsets); i++)
               	{
					if(Offsets[i][SPU] == 33)
					{
					    new vehicleid=CreateVehicle(Offsets[i][VehicleID], x, y, z, angle, 0, 0, -1);
				        PutPlayerInVehicle(playerid, vehicleid, 0);
				        SetVehicleVirtualWorld(vehicleid, GetPlayerVirtualWorld(playerid));
				        LinkVehicleToInterior(vehicleid, GetPlayerInterior(playerid));
						light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						Lamp[vehicleid] = 1;
						IsSpu[vehicleid] = 33;
					}
				}
			}
		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	if((newkeys & KEY_SUBMISSION) && !(oldkeys & KEY_SUBMISSION))
	{
         VehicleLightSwitch(playerid);
	}
	return 1;
}

AddSPU(spuid, Float:x, Float:y, Float:z, Float:rotation, color1, color2, lightonoroff)
{
	if(lightonoroff == 1)
	{
		for(new i=0; i<sizeof(Offsets); i++)
 	    {
			if(Offsets[i][SPU] == spuid)
			{
                new vehicleid = CreateVehicle(Offsets[i][VehicleID], x, y, z, rotation, color1, color2, -1);
                Lamp[vehicleid] = 1;
                IsSpu[vehicleid] = spuid;
		    	light[vehicleid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
		    	AttachObjectToVehicle(light[vehicleid], vehicleid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
		    	printf("AddSPU(%d), succesfully created.", spuid);
		    	return 1;
			}
		}
	}
	if(lightonoroff == 0)
	{
	    for(new i=0; i<sizeof(Offsets); i++)
 	    {
			if(Offsets[i][SPU] == spuid)
			{
                new vehicleid = CreateVehicle(Offsets[i][VehicleID], x, y, z, rotation, color1, color2, -1);
                Lamp[vehicleid] = 0;
                IsSpu[vehicleid] = spuid;
                printf("AddSPU(%d), succesfully created.", spuid);
                return 1;
			}
		}
	}
	return 1;
}

VehicleLightSwitch(playerid)
{
		new vid = GetPlayerVehicleID(playerid);
		if(vid == INVALID_VEHICLE_ID) return 1;
		if(IsSpu[vid] != 0)
		{
 			if(Lamp[vid] == 1)
 			{
				 DestroyObject(light[vid]);
				 Lamp[vid] = 0;
				 return 1;
			}
			if(Lamp[vid] == 0)
 			{
 				 for(new i=0; i<sizeof(Offsets); i++)
               	 {
					 if(Offsets[i][SPU] == IsSpu[vid])
					 {
						 light[vid] = CreateObject(18646,Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 96.0);
						 AttachObjectToVehicle(light[vid], vid, Offsets[i][X], Offsets[i][Y], Offsets[i][Z], 0.0, 0.0, 0.0);
						 Lamp[vid] = 1;
					 }
				 }
				 return 1;
			}
	    }
	    return 1;
}