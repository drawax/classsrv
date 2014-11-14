// Átalakított tuningmenü
// Eredeti: http://forum.sa-mp.com/showthread.php?t=21692
// Átalakította GameStar
// www.sa-mp.hu

#include <a_samp>
#include <F_Menu>
#include <zcmd>

#define COLOR_GREEN 	(0x33AA33AA)
#define COLOR_RED 		(0xFF0000FF)
#define COLOR_YELLOW 	(0xFFFF00AA)
#define COLOR_LIGHTBLUE (0x33CCFFAA)
#define COLOR_PURPLE 	(0x9900FFAA)
#define COLOR_BLUE 		(0x0000FFAA)

new TuningMenu,TuningMenu1,Paintjobs,Colors,Colors1,Exhausts,Frontbumper,Rearbumper,Roof,Spoilers,Sideskirts,
Bullbars,Wheels,Wheels1,Carstereo,Hydraulics,Nitro;

public OnFilterScriptInit()
{
    F_Menu_OnInit();
    
	TuningMenu = F_CreateMenu("Tuning",20.0, 120.0, 200.0);
    F_AddMenuItem(TuningMenu,"Fest§ munk˜k");
    F_AddMenuItem(TuningMenu,"Sz¢nek");
    F_AddMenuItem(TuningMenu,"Kipufog¦k");
    F_AddMenuItem(TuningMenu,"Els§ l¨kh˜r¢t¦k");
    F_AddMenuItem(TuningMenu,"H˜ts¦ l¨kh˜r¢t¦k");
    F_AddMenuItem(TuningMenu,"Tet§k");
    F_AddMenuItem(TuningMenu,"Szžlterel§k");
    F_AddMenuItem(TuningMenu,"Oldald¢szek");
    F_AddMenuItem(TuningMenu,"Bullbars");
    F_AddMenuItem(TuningMenu,"Kerekek");
    F_AddMenuItem(TuningMenu,"Basszus");
    F_AddMenuItem(TuningMenu,"> K¨vetkez§ oldalra");
    
    Paintjobs = F_CreateMenu("Fest§munk˜k",20.0, 120.0, 200.0);
	F_AddMenuItem(Paintjobs,"Fest§ munka 1");
	F_AddMenuItem(Paintjobs,"Fest§ munka 2");
	F_AddMenuItem(Paintjobs,"Fest§ munka 3");
	F_AddMenuItem(Paintjobs,"Fest§ munka 4");
	F_AddMenuItem(Paintjobs,"Fest§ munka 5");
	F_AddMenuItem(Paintjobs,"> F§men¬");
	
	Colors = F_CreateMenu("Színek",20.0, 120.0, 200.0);
	F_AddMenuItem(Colors,"Fekete");
	F_AddMenuItem(Colors,"Fehér");
	F_AddMenuItem(Colors,"Piros");
	F_AddMenuItem(Colors,"Kék");
	F_AddMenuItem(Colors,"Zöld");
	F_AddMenuItem(Colors,"Sárga");
	F_AddMenuItem(Colors,"Pink");
	F_AddMenuItem(Colors,"Barna");
	F_AddMenuItem(Colors,"> K¨vetkez§ oldalra");
	
	Colors1 = F_CreateMenu("Színek",20.0, 120.0, 200.0);
    F_AddMenuItem(Colors1,"Szürke");
	F_AddMenuItem(Colors1,"Arany");
	F_AddMenuItem(Colors1,"Sötétkék");
	F_AddMenuItem(Colors1,"Világoskék");
	F_AddMenuItem(Colors1,"Zöld");
	F_AddMenuItem(Colors1,"Halványszürke");
	F_AddMenuItem(Colors1,"Mélypiros");
	F_AddMenuItem(Colors1,"Mélybarna");
	F_AddMenuItem(Colors1,"> F§men¬");
	
	Exhausts = F_CreateMenu("Kipufogók",20.0, 120.0, 200.0);
	F_AddMenuItem(Exhausts,"Wheel Arch Alien");
	F_AddMenuItem(Exhausts,"Wheel Arch X-Flow");
	F_AddMenuItem(Exhausts,"Locos Low Chromer");
	F_AddMenuItem(Exhausts,"Locos Low Slamin");
	F_AddMenuItem(Exhausts,"> F§men¬");
	
	Frontbumper = F_CreateMenu("Elsõ lökhárítók",20.0, 120.0, 200.0);
	F_AddMenuItem(Frontbumper,"Wheel Arch Alien");
	F_AddMenuItem(Frontbumper,"Wheel Arch X-Flow");
	F_AddMenuItem(Frontbumper,"Locos Low Chromer");
	F_AddMenuItem(Frontbumper,"Locos Low Slamin");
	F_AddMenuItem(Frontbumper,"> F§men¬");
	
	Rearbumper = F_CreateMenu("Hátsó lökhárítók",20.0, 120.0, 200.0);
	F_AddMenuItem(Rearbumper,"Wheel Arch Alien");
	F_AddMenuItem(Rearbumper,"Wheel Arch X-Flow");
	F_AddMenuItem(Rearbumper,"Locos Low Chromer");
	F_AddMenuItem(Rearbumper,"Locos Low Slamin");
	F_AddMenuItem(Rearbumper,"> F§men¬");
	
	Roof = F_CreateMenu("Tetõk",20.0, 120.0, 200.0);
	F_AddMenuItem(Roof,"Wheel Arch Alien Roof Vent");
	F_AddMenuItem(Roof,"Wheel Arch X-Flow Roof Vent");
	F_AddMenuItem(Roof,"Locos Low Hardtop Roof");
	F_AddMenuItem(Roof,"Locos Low Softtop Roof");
	F_AddMenuItem(Roof,"> F§men¬");
	
	Spoilers = F_CreateMenu("Szélterelõk",20.0, 120.0, 200.0);
	F_AddMenuItem(Spoilers,"Alien Spoiler");
	F_AddMenuItem(Spoilers,"X-Flow Spoiler");
	F_AddMenuItem(Spoilers,"> F§men¬");
	
	Sideskirts = F_CreateMenu("Oldaldíszek",20.0, 120.0, 200.0);
	F_AddMenuItem(Sideskirts,"Wheel Arch Alien");
	F_AddMenuItem(Sideskirts,"Wheel Arch X-Flow");
    F_AddMenuItem(Sideskirts,"Locos Low Chrome Strip");
    F_AddMenuItem(Sideskirts,"Locos Low Chrome Flames");
    F_AddMenuItem(Sideskirts,"Locos Low Chrome Arches");
    F_AddMenuItem(Sideskirts,"Locos Low Chrome Trim");
    F_AddMenuItem(Sideskirts,"Locos Low Wheelcovers");
	F_AddMenuItem(Sideskirts,"> F§men¬");
	
	Bullbars = F_CreateMenu("Bullbars",20.0, 120.0, 200.0);
	F_AddMenuItem(Bullbars,"Locos Low Chrome Grill");
	F_AddMenuItem(Bullbars,"Locos Low Chrome Bars");
	F_AddMenuItem(Bullbars,"Locos Low Chrome Lights");
	F_AddMenuItem(Bullbars,"Locos Low Chrome Bullbar");
	F_AddMenuItem(Bullbars,"> F§men¬");
	
	Wheels = F_CreateMenu("Kerekek",20.0, 120.0, 200.0);
	F_AddMenuItem(Wheels,"Offroad");
	F_AddMenuItem(Wheels,"Mega");
	F_AddMenuItem(Wheels,"Wires");
	F_AddMenuItem(Wheels,"Twist");
	F_AddMenuItem(Wheels,"Grove");
	F_AddMenuItem(Wheels,"Import");
	F_AddMenuItem(Wheels,"Atomic");
	F_AddMenuItem(Wheels,"Ahab");
	F_AddMenuItem(Wheels,"Virtual");
	F_AddMenuItem(Wheels,"Access");
	F_AddMenuItem(Wheels,"> K¨vetkez§ oldalra");
	F_AddMenuItem(Wheels,"> F§men¬");
	
	Wheels1 = F_CreateMenu("TuningMenu",20.0, 120.0, 200.0);
	F_AddMenuItem(Wheels1,"Trance");
	F_AddMenuItem(Wheels1,"Shadow");
	F_AddMenuItem(Wheels1,"Rimshine");
	F_AddMenuItem(Wheels1,"Classic");
	F_AddMenuItem(Wheels1,"Cutter");
	F_AddMenuItem(Wheels1,"Switch");
	F_AddMenuItem(Wheels1,"Dollar");
	F_AddMenuItem(Wheels1,"> F§men¬");
	
	Carstereo = F_CreateMenu("TuningMenu",20.0, 120.0, 200.0);
	F_AddMenuItem(Carstereo,"Bass Boost");
	F_AddMenuItem(Carstereo,"> F§men¬");
	
 	TuningMenu1= F_CreateMenu("Tuning",20.0, 120.0, 200.0);
    F_AddMenuItem(TuningMenu1,"Hidraulika");
    F_AddMenuItem(TuningMenu1,"Nitró");
    F_AddMenuItem(TuningMenu1,"Javítás");
    F_AddMenuItem(TuningMenu1,"> F§men¬");
    
	Hydraulics = F_CreateMenu("Hidraulika",20.0, 120.0, 200.0);
	F_AddMenuItem(Hydraulics,"Hidraulika beszerelése");
	F_AddMenuItem(Hydraulics,"> F§men¬");
	
	Nitro = F_CreateMenu("Nitró",20.0, 120.0, 200.0);
	F_AddMenuItem(Nitro,"2x");
	F_AddMenuItem(Nitro,"5x");
	F_AddMenuItem(Nitro,"10x");
	F_AddMenuItem(Nitro,"> F§men¬");

	F_SetMenuTitleBoxColor(TuningMenu, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(TuningMenu, 0xFF000099);
	F_SetMenuTitleBoxColor(TuningMenu1, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(TuningMenu1, 0xFF000099);
	F_SetMenuTitleBoxColor(Paintjobs, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Paintjobs, 0xFF000099);
	F_SetMenuTitleBoxColor(Colors, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Colors, 0xFF000099);
	F_SetMenuTitleBoxColor(Colors1, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Colors1, 0xFF000099);
	F_SetMenuTitleBoxColor(Exhausts, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Exhausts, 0xFF000099);
	F_SetMenuTitleBoxColor(Frontbumper, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Frontbumper, 0xFF000099);
	F_SetMenuTitleBoxColor(Rearbumper, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Rearbumper, 0xFF000099);
	F_SetMenuTitleBoxColor(Roof, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Roof, 0xFF000099);
	F_SetMenuTitleBoxColor(Spoilers, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Spoilers, 0xFF000099);
	F_SetMenuTitleBoxColor(Sideskirts, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Sideskirts, 0xFF000099);
	F_SetMenuTitleBoxColor(Bullbars, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Bullbars, 0xFF000099);
	F_SetMenuTitleBoxColor(Wheels, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Wheels, 0xFF000099);
	F_SetMenuTitleBoxColor(Wheels1, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Wheels1, 0xFF000099);
	F_SetMenuTitleBoxColor(Carstereo, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Carstereo, 0xFF000099);
	F_SetMenuTitleBoxColor(Nitro, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Nitro, 0xFF000099);
	F_SetMenuTitleBoxColor(Hydraulics, 0xCC000099);
	F_SetMenuSelectedItemBoxColor(Hydraulics, 0xFF000099);
	
	print("Tuning menu loaded.");
	return 1;
}

public OnFilterScriptExit()
{
    F_DestroyMenu(TuningMenu);
	F_DestroyMenu(TuningMenu1);
	F_DestroyMenu(Paintjobs);
	F_DestroyMenu(Colors);
	F_DestroyMenu(Colors1);
	F_DestroyMenu(Exhausts);
	F_DestroyMenu(Frontbumper);
	F_DestroyMenu(Rearbumper);
	F_DestroyMenu(Roof);
	F_DestroyMenu(Spoilers);
	F_DestroyMenu(Sideskirts);
	F_DestroyMenu(Bullbars);
	F_DestroyMenu(Wheels);
	F_DestroyMenu(Wheels1);
	F_DestroyMenu(Carstereo);
	F_DestroyMenu(Hydraulics);
	F_DestroyMenu(Nitro);
    print("Tuning menu unloaded.");
	return 1;
}

COMMAND:tuning(playerid,params[])
{
	if(!IsPlayerInAnyVehicle(playerid)){
	    return SendClientMessage(playerid,COLOR_RED,"Nem vagy jármûben!");
	}else if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER){
	    return SendClientMessage(playerid,COLOR_RED,"Vezetned kell a kocsit!");
	}else{
		switch(GetPVarInt(playerid,"TuningModel")) {
	        case 562,565,559,561,560,575,534,567,536,535,576,411,579,602,496,518,527,589,597,419,533,526,474,545,517,410,600,436,580,439,549,491,445,604,507,585,587,466,492,546,551,516,426, 547, 405, 409, 550, 566, 540, 421,
			529,431,438,437,420,525,552,416,433,427,490,528,407,544,470,598,596,599,601,428,499,609,524,578,486,406,573,455,588,403,514,423,414,443,515,456,422,482,530,418,572,413,440,543,583,478,554,402,542,603,475,568,504,
			457,483,508,429,541,415,480,434,506,451,555,477,400,404,489,479,442,458,467,558:{
			    F_ShowMenuForPlayer(TuningMenu, playerid);
			    TogglePlayerControllable(playerid,0);
	 			SendClientMessage(playerid, COLOR_GREEN, "Válassz ki egy elemet, és a SZÓKÖZ gombbal alkalmazhatod");
			}
			default:return SendClientMessage(playerid,COLOR_RED,"Nem vagy tuningolható jármûben!");
		}
	}
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(newstate == PLAYER_STATE_DRIVER)SetPVarInt(playerid,"TuningModel",GetVehicleModel(GetPlayerVehicleID(playerid)));else SetPVarInt(playerid,"TuningModel",0);
	return 1;
}

public F_OnPlayerExitedMenu(playerid, menuid)
{
	F_HideMenuForPlayer(menuid, playerid);
	TogglePlayerControllable(playerid, true);
	return 1;
}

public F_OnPlayerSelectedMenuRow(playerid, menuid, row){
 	if(menuid==TuningMenu){
	    switch(row){
	        case 0:F_ShowMenuForPlayer(Paintjobs, playerid);
	        case 1:F_ShowMenuForPlayer(Colors, playerid);
	        case 2:F_ShowMenuForPlayer(Exhausts, playerid);
	        case 3:F_ShowMenuForPlayer(Frontbumper, playerid);
	        case 4:F_ShowMenuForPlayer(Rearbumper, playerid);
	        case 5:F_ShowMenuForPlayer(Roof, playerid);
	        case 6:F_ShowMenuForPlayer(Spoilers, playerid);
	        case 7:F_ShowMenuForPlayer(Sideskirts, playerid);
			case 8:F_ShowMenuForPlayer(Bullbars, playerid);
	        case 9:F_ShowMenuForPlayer(Wheels, playerid);
	        case 10:F_ShowMenuForPlayer(Carstereo, playerid);
	        case 11:F_ShowMenuForPlayer(TuningMenu1, playerid);
		}
	}
	if(menuid ==Paintjobs){
		switch(row){
		    case 0:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560 ||GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534
				||GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 535 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 558){
					new car = GetPlayerVehicleID(playerid);
					ChangeVehiclePaintjob(car,0);
					SendClientMessage(playerid,COLOR_BLUE,"Sikeresen rátetetettél az autódra egy festõmunkát");
					F_ShowMenuForPlayer(Paintjobs, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez a festõmunka csak Wheel Arch Angels és Loco Low Co jármûveken alkalmazható");
	       			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560 ||GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||
				GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 535 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 558){
	   				new car = GetPlayerVehicleID(playerid);
					ChangeVehiclePaintjob(car,1);
					SendClientMessage(playerid,COLOR_BLUE,"Sikeresen rátetetettél az autódra egy festõmunkát");
					F_ShowMenuForPlayer(Paintjobs, playerid);
				}else{
		  			SendClientMessage(playerid,COLOR_YELLOW,"Ez a festõmunka csak Wheel Arch Angels és Loco Low Co jármûveken alkalmazható");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560 ||GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||
				GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 535 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 558){
	   				new car = GetPlayerVehicleID(playerid);
					ChangeVehiclePaintjob(car,2);
					SendClientMessage(playerid,COLOR_BLUE,"Sikeresen rátetetettél az autódra egy festõmunkát");
					F_ShowMenuForPlayer(Paintjobs, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez a festõmunka csak Wheel Arch Angels és Loco Low Co jármûveken alkalmazható");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560 ||GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||
				GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 535 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 558){
	   				new car = GetPlayerVehicleID(playerid);
					ChangeVehiclePaintjob(car,3);
					SendClientMessage(playerid,COLOR_BLUE,"Sikeresen rátetetettél az autódra egy festõmunkát");
					F_ShowMenuForPlayer(Paintjobs, playerid);
				}else{
					SendClientMessage(playerid,COLOR_YELLOW,"Ez a festõmunka csak Wheel Arch Angels és Loco Low Co jármûveken alkalmazható");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 4:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560 ||GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||
				GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 535 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 558){
	   				new car = GetPlayerVehicleID(playerid);
					ChangeVehiclePaintjob(car,4);
					SendClientMessage(playerid,COLOR_BLUE,"Sikeresen rátetetettél az autódra egy festõmunkát");
					F_ShowMenuForPlayer(Paintjobs, playerid);
				}else{
	  				SendClientMessage(playerid,COLOR_YELLOW,"Ez a festõmunka csak Wheel Arch Angels és Loco Low Co jármûveken alkalmazható");
			    	F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 5:F_ShowMenuForPlayer(TuningMenu, playerid);
		}
	}
	if(menuid ==Colors) {
		switch(row){
		    case 0:{
				if(GetPlayerMoney(playerid) >= 0) {
	      			new car = GetPlayerVehicleID(playerid);
	         		ChangeVehicleColor(car,0,0);
	           		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
		            F_ShowMenuForPlayer(Colors, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
		   			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,1,1);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,3,3);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors, playerid);
				}else{
		 			SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
		    		F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,79,79);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 4:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,86,86);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 5:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,6,6);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
   			case 6:{
	   			if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
			       	ChangeVehicleColor(car,126,126);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 7:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,66,66);
	        		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 8:F_ShowMenuForPlayer(Colors1, playerid);
	 	}
 	}
	if(menuid ==Colors1) {
		switch(row){
		    case 0:{
				if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
	         		ChangeVehicleColor(car,24,24);
	           		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
		            F_ShowMenuForPlayer(Colors1, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
   			case 1:{
			   	if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
		        	ChangeVehicleColor(car,123,123);
	       			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors1, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,53,53);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors1, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,93,93);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors1, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 4:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,83,83);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors1, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 5:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,60,60);
		        	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors1, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	   				F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
   			case 6:{
	   			if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,126,126);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors1, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 7:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			ChangeVehicleColor(car,110,110);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen átfestetted az autód");
			        F_ShowMenuForPlayer(Colors1, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 8:F_ShowMenuForPlayer(TuningMenu, playerid);
	 	}
	}
	if(menuid ==Exhausts){
		switch(row){
		    case 0:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	      			new car = GetPlayerVehicleID(playerid);
	      			if(GetPVarInt(playerid,"TuningModel") == 562){
			           	AddVehicleComponent(car,1034);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien kipufogót egy Elegyre");
		            	F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
	    				AddVehicleComponent(car,1046);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien kipufogót egy Flashre");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
	    				AddVehicleComponent(car,1065);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien kipufogót egy Jesterre");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
	    				AddVehicleComponent(car,1064);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien kipufogót egy Startumra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
	    				AddVehicleComponent(car,1028);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien kipufogót egy Sultanra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1089);
			 	    	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien kipufogót egy Uranusra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
	 				}
	 			}else{
    				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 562){
	          			AddVehicleComponent(car,1037);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow kipufogót egy Elegyre");
			            F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
	    				AddVehicleComponent(car,1045);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow kipufogót egy Flashre");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
	    				AddVehicleComponent(car,1066);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow kipufogót egy Jesterre");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
	    				AddVehicleComponent(car,1059);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow kipufogót egy Startumra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
	    				AddVehicleComponent(car,1029);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow kipufogót egy Sultanra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1092);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow kipufogót egy Uranusra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 535){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 575) {
	          			AddVehicleComponent(car,1044);
	            		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer kipufogót egy Brodwayra");
			            F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 534){
	    				AddVehicleComponent(car,1126);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer kipufogót egy Remingtonra");
	    				F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 567){
	    				AddVehicleComponent(car,1129);
	        			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer kipufogót egy Savannára");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 536){
	    				AddVehicleComponent(car,1104);
				    	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer kipufogót egy Bladera");
				    	F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 535){
	    				AddVehicleComponent(car,1113);
				    	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer kipufogót egy Slamvanra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 576){
	    				AddVehicleComponent(car,1136);
					   	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer kipufogót egy Tornadora");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Locos Low Car autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 535){
					new car = GetPlayerVehicleID(playerid);
	    			if(GetPVarInt(playerid,"TuningModel") == 575){
	       				AddVehicleComponent(car,1043);
	           			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin kipufogót egy Brodwayra");
			            F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 534){
	    				AddVehicleComponent(car,1127);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin kipufogót egy Remingonra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 567){
	    				AddVehicleComponent(car,1132);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin kipufogót egy Savannára");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 536){
	    				AddVehicleComponent(car,1105);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin kipufogót egy Bladera");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 535){
	    				AddVehicleComponent(car,1114);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin kipufogót egy Slamvanra");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 576){
	    				AddVehicleComponent(car,1135);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin kipufogót egy Tornadora");
					    F_ShowMenuForPlayer(Exhausts, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Locos Low Car autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 4:F_ShowMenuForPlayer(TuningMenu, playerid);
		}
	}
	if(menuid ==Frontbumper) {
		switch(row){
		    case 0:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	      			new car = GetPlayerVehicleID(playerid);
	         		if(GetPVarInt(playerid,"TuningModel") == 562){
			            AddVehicleComponent(car,1171);
		              	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien elsõ lökhárítót egy Elegyre");
			           	F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
					    AddVehicleComponent(car,1153);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien elsõ lökhárítót egy Flashre");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
					    AddVehicleComponent(car,1160);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien elsõ lökhárítót egy Jesterre");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
					    AddVehicleComponent(car,1155);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien elsõ lökhárítót egy Statrumra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
					    AddVehicleComponent(car,1169);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien elsõ lökhárítót egy Sultanra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
				   		AddVehicleComponent(car,1166);
				     	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien elsõ lökhárítót egy Uranusra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 562){
				        AddVehicleComponent(car,1172);
	           			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow elsõ lökhárítót egy Elegyre");
			            F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
	    				AddVehicleComponent(car,1152);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow elsõ lökhárítót egy Flashre");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
	    				AddVehicleComponent(car,1173);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow elsõ lökhárítót egy Jesterre");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
	    				AddVehicleComponent(car,1157);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow elsõ lökhárítót egy Statrumra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
	    				AddVehicleComponent(car,1170);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow elsõ lökhárítót egy Sultanra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1165);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow elsõ lökhárítót egy Uranusra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}
				}else{
	 				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 535){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 575){
	          			AddVehicleComponent(car,1174);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer elsõ lökhárítót egy Brodwayra");
			            F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 534){
	    				AddVehicleComponent(car,1179);
				    	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer elsõ lökhárítót egy Remingtonra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 567){
	    				AddVehicleComponent(car,1189);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer elsõ lökhárítót egy Savannára");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 536){
	    				AddVehicleComponent(car,1182);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer elsõ lökhárítót egy Bladera");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 535){
		   				AddVehicleComponent(car,1115);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer elsõ lökhárítót egy Slamvanra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 576){
	    				AddVehicleComponent(car,1191);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer elsõ lökhárítót egy Tornadora");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Locos Low Car autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 535){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 575){
	          			AddVehicleComponent(car,1175);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin elsõ lökhárítót egy Brodwayra");
			            F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 534){
						AddVehicleComponent(car,1185);
		    			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin elsõ lökhárítót egy Remingtonra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 567){
	    				AddVehicleComponent(car,1188);
				    	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin elsõ lökhárítót egy Savannára");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 536){
	    				AddVehicleComponent(car,1181);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin elsõ lökhárítót egy Bladera");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 535){
	    				AddVehicleComponent(car,1116);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin elsõ lökhárítót egy Slamvanra");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 576){
	    				AddVehicleComponent(car,1190);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin elsõ lökhárítót egy Tornadora");
					    F_ShowMenuForPlayer(Frontbumper, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Locos Low Car autókra lehet felszerelni!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 4:F_ShowMenuForPlayer(TuningMenu, playerid);
 		}
	}
	if(menuid ==Rearbumper) {
		switch(row){
		    case 0:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
					new car = GetPlayerVehicleID(playerid);
	    			if(GetPVarInt(playerid,"TuningModel") == 562){
	      				AddVehicleComponent(car,1149);
	        			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien hátsó lökhárítót egy Elegyre");
	          			F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
	    				AddVehicleComponent(car,1150);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien hátsó lökhárítót egy Flashra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
	    				AddVehicleComponent(car,1159);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien hátsó lökhárítót egy Jesterre");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
	    				AddVehicleComponent(car,1154);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien hátsó lökhárítót egy Stratumra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
	    				AddVehicleComponent(car,1141);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien hátsó lökhárítót egy Sultanra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1168);
			 	    	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien hátsó lökhárítót egy Uranusra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angles autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 562){
	          			AddVehicleComponent(car,1148);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow hátsó lökhárítót egy Elegyre");
			            F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
	    				AddVehicleComponent(car,1151);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow hátsó lökhárítót egy Flashra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
	    				AddVehicleComponent(car,1161);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow hátsó lökhárítót egy Jesterre");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
	    				AddVehicleComponent(car,1156);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow hátsó lökhárítót egy Stratumra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
	    				AddVehicleComponent(car,1140);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow hátsó lökhárítót egy Sultanra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1167);
		   				SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow hátsó lökhárítót egy Uranusra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angles autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 535){
	       			new car = GetPlayerVehicleID(playerid);
			        if(GetPVarInt(playerid,"TuningModel") == 575){
	          			AddVehicleComponent(car,1176);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer hátsó lökhárítót egy Brodwayra");
			            F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 534){
	    				AddVehicleComponent(car,1180);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer hátsó lökhárítót egy Remingtonra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 567){
	    				AddVehicleComponent(car,1187);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer hátsó lökhárítót egy Savannara");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 536){
	    				AddVehicleComponent(car,1184);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer hátsó lökhárítót egy Bladera");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 535){
	    				AddVehicleComponent(car,1109);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer hátsó lökhárítót egy Slamvanra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 576){
	    				AddVehicleComponent(car,1192);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chromer hátsó lökhárítót egy Tornadora");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Locos Low autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 534 ||GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 535){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 575){
	          			AddVehicleComponent(car,1177);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin hátsó lökhárítót egy Brodwayra");
			            F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 534){
	    				AddVehicleComponent(car,1178);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin hátsó lökhárítót egy Remingtonra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 567){
	    				AddVehicleComponent(car,1186);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin hátsó lökhárítót egy Savannára");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 536){
	    				AddVehicleComponent(car,1183);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin hátsó lökhárítót egy Bladera");
	    				F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 535){
		   				AddVehicleComponent(car,1110);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin hátsó lökhárítót egy Slamvanra");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 576){
					    AddVehicleComponent(car,1193);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Slamin hátsó lökhárítót egy Tornadora");
					    F_ShowMenuForPlayer(Rearbumper, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Locos Low autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 4:F_ShowMenuForPlayer(TuningMenu, playerid);
		}
	}
	if(menuid ==Roof) {
		switch(row){
		    case 0:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	      			new car = GetPlayerVehicleID(playerid);
	         		if(GetPVarInt(playerid,"TuningModel") == 562){
	          			AddVehicleComponent(car,1035);
	           			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien tetõt egy Elegyre");
		            	F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
	    				AddVehicleComponent(car,1054);
					    SendClientMessage(playerid,COLOR_BLUE,"[Sikeresen felszereltettél egy Wheel Arch Alien tetõt egy Flashre");
					    F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
	    				AddVehicleComponent(car,1067);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien tetõt egy Jesterre");
					    F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
	    				AddVehicleComponent(car,1055);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien tetõt egy Stratumra");
					    F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
	    				AddVehicleComponent(car,1032);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien tetõt egy Sultanra");
					    F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1088);
			 	    	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien tetõt egy Uranusra");
					    F_ShowMenuForPlayer(Roof, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 562) {
	          			AddVehicleComponent(car,1035);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow tetõt egy Elegyre");
			            F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
	    				AddVehicleComponent(car,1053);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow tetõt egy Flashre");
					    F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
	    				AddVehicleComponent(car,1068);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow tetõt egy Jesterre");
					    F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
	    				AddVehicleComponent(car,1061);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow tetõt egy Stratumra");
					    F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
	    				AddVehicleComponent(car,1033);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow tetõt egy Sultanra");
					    F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1091);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow tetõt egy Uranusra");
					    F_ShowMenuForPlayer(Roof, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536){
	   				new car = GetPlayerVehicleID(playerid);
	   				if(GetPVarInt(playerid,"TuningModel") == 567){
	       				AddVehicleComponent(car,1130);
	           			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Hardtop tetõt egy Brodwayra");
			            F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 536){
	    				AddVehicleComponent(car,1128);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Hardtop tetõt egy Bladera");
					    F_ShowMenuForPlayer(Roof, playerid);
					}
				}else{
					SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Savannán és Bladen alkalmazható!");
					F_ShowMenuForPlayer(Roof, playerid);
				}
			}
			case 3:{
				if(GetPVarInt(playerid,"TuningModel") == 567 ||GetPVarInt(playerid,"TuningModel") == 536){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 567){
	          			AddVehicleComponent(car,1131);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Softtop tetõt egy Brodwayra");
			            F_ShowMenuForPlayer(Roof, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 536){
	    				AddVehicleComponent(car,1103);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Softtop tetõt egy Bladera");
					    F_ShowMenuForPlayer(Roof, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Brodwayn és Bladen alkalmazható!");
					F_ShowMenuForPlayer(Roof, playerid);
				}
			}
			case 4:F_ShowMenuForPlayer(TuningMenu, playerid);
		}
	}
	if(menuid ==Spoilers) {
		switch(row){
		    case 0:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	      			new car = GetPlayerVehicleID(playerid);
	         		if(GetPVarInt(playerid,"TuningModel") == 562){
			           	AddVehicleComponent(car,1147);
		              	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien szélterelõt egy Elegyre");
			           	F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
					    AddVehicleComponent(car,1049);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien szélterelõt egy Flashra");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
					    AddVehicleComponent(car,1162);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien szélterelõt egy Jesterre");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
					    AddVehicleComponent(car,1158);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien szélterelõt egy Stratumra");
					   	F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
					    AddVehicleComponent(car,1138);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien szélterelõt egy Sultanra");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
					    AddVehicleComponent(car,1164);
				     	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien szélterelõt egy Uranusra");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
					new car = GetPlayerVehicleID(playerid);
	    			if(GetPVarInt(playerid,"TuningModel") == 562){
	       				AddVehicleComponent(car,1146);
	           			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow szélterelõt egy Elegyre");
		          		F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
	    				AddVehicleComponent(car,1150);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow szélterelõt egy Flashra");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
					    AddVehicleComponent(car,1158);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow szélterelõt egy Jesterre");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
					    AddVehicleComponent(car,1060);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow szélterelõt egy Stratumra");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
					    AddVehicleComponent(car,1139);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow szélterelõt egy Sultanra");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
					    AddVehicleComponent(car,1163);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow szélterelõt egy Uranusra");
					    F_ShowMenuForPlayer(Spoilers, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
  			case 2:F_ShowMenuForPlayer(TuningMenu, playerid);
		}
	}
	if(menuid ==Sideskirts) {
		switch(row){
		    case 0:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	      			new car = GetPlayerVehicleID(playerid);
	         		if(GetPVarInt(playerid,"TuningModel") == 562) {
	          			AddVehicleComponent(car,1036);
			           	AddVehicleComponent(car,1040);
		              	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien oldaldíszt egy Elegyre");
			           	F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 565){
					    AddVehicleComponent(car,1047);
					    AddVehicleComponent(car,1051);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien oldaldíszt egy Flashre");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
					    AddVehicleComponent(car,1069);
					    AddVehicleComponent(car,1071);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien oldaldíszt egy Jesterre");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
					   	AddVehicleComponent(car,1056);
					    AddVehicleComponent(car,1062);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien oldaldíszt egy Stratumra");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
					    AddVehicleComponent(car,1026);
					    AddVehicleComponent(car,1027);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien oldaldíszt egy Sultanra");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1090);
					    AddVehicleComponent(car,1094);
			 	    	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch Alien oldaldíszt egy Uranusra");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPVarInt(playerid,"TuningModel") == 562 ||GetPVarInt(playerid,"TuningModel") == 565 ||GetPVarInt(playerid,"TuningModel") == 559 ||GetPVarInt(playerid,"TuningModel") == 561 ||GetPVarInt(playerid,"TuningModel") == 560){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 562){
					    AddVehicleComponent(car,1039);
					    AddVehicleComponent(car,1041);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow oldaldíszt egy Elegyre");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}
					else if(GetPVarInt(playerid,"TuningModel") == 565){
					    AddVehicleComponent(car,1048);
					    AddVehicleComponent(car,1052);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow oldaldíszt egy Flashre");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 559){
					    AddVehicleComponent(car,1070);
					    AddVehicleComponent(car,1072);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow oldaldíszt egy Jesterre");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 561){
					    AddVehicleComponent(car,1057);
					    AddVehicleComponent(car,1063);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow oldaldíszt egy Stratumra");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 560){
					    AddVehicleComponent(car,1031);
					    AddVehicleComponent(car,1030);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow oldaldíszt egy Sultanra");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 558){
	    				AddVehicleComponent(car,1093);
					    AddVehicleComponent(car,1095);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Wheel Arch X-Flow oldaldíszt egy Uranusra");
					    F_ShowMenuForPlayer(Sideskirts, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ezt csak Wheel Arch Angels autókra lehet felszerelni!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPVarInt(playerid,"TuningModel") == 575 ||GetPVarInt(playerid,"TuningModel") == 536 ||GetPVarInt(playerid,"TuningModel") == 576 ||GetPVarInt(playerid,"TuningModel") == 567){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 575) {
	 		       		AddVehicleComponent(car,1042);
	    		      	AddVehicleComponent(car,1099);
				        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Strip oldaldíszt egy Brodwayra");
	           			F_ShowMenuForPlayer(Sideskirts, playerid);
					}else if(GetPVarInt(playerid,"TuningModel") == 567){
					    AddVehicleComponent(car,1102);
					    AddVehicleComponent(car,1133);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Strip oldaldíszt egy Savannára");
		    		    F_ShowMenuForPlayer(Sideskirts, playerid);
	           		}else if(GetPVarInt(playerid,"TuningModel") == 576){
					    AddVehicleComponent(car,1134);
					    AddVehicleComponent(car,1137);
				   		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Strip oldaldíszt egy Tornadora");
	    				F_ShowMenuForPlayer(Sideskirts, playerid);
	        		}else if(GetPVarInt(playerid,"TuningModel") == 536){
					    AddVehicleComponent(car,1108);
					    AddVehicleComponent(car,1107);
					    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Strip oldaldíszt egy Bladera");
	    				F_ShowMenuForPlayer(Sideskirts, playerid);
	        		}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Brodwayn, Savannán, Tornadon és Bladen alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPVarInt(playerid,"TuningModel") == 534 ||GetPVarInt(playerid,"TuningModel") == 534){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 534){
	          			AddVehicleComponent(car,1122);
		            	AddVehicleComponent(car,1101);
			            SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Flames oldaldíszt egy Remingtonra");
			            F_ShowMenuForPlayer(Sideskirts, playerid);
					}
				}else{
				    SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Remingtonon alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 4:{
				if(GetPVarInt(playerid,"TuningModel") == 534 ||GetPVarInt(playerid,"TuningModel") == 534){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 534) {
	          			AddVehicleComponent(car,1106);
	           			AddVehicleComponent(car,1124);
				        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Arches oldaldíszt egy Remingtonra");
			        	F_ShowMenuForPlayer(Sideskirts, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Remingtonon alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 5:{
				if(GetPVarInt(playerid,"TuningModel") == 535){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 535){
	          			AddVehicleComponent(car,1118);
		            	AddVehicleComponent(car,1120);
			            SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Trim oldaldíszt egy Slamvanra");
	      				F_ShowMenuForPlayer(Sideskirts, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Slamvanon alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
	  		case 6:{
		  		if(GetPVarInt(playerid,"TuningModel") == 535){
	     			new car = GetPlayerVehicleID(playerid);
	        		if(GetPVarInt(playerid,"TuningModel") == 535){
	          			AddVehicleComponent(car,1119);
				        AddVehicleComponent(car,1121);
	   					SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Wheelcovers oldaldíszt egy Slamvanra");
	        			F_ShowMenuForPlayer(Sideskirts, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Slamvanon alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
   			case 7:F_ShowMenuForPlayer(TuningMenu, playerid);
		}
	}
	if(menuid ==Bullbars) {
		switch(row){
	        case 0:{
				if(GetPVarInt(playerid,"TuningModel") == 534){
		        	new car = GetPlayerVehicleID(playerid);
			        if(GetPVarInt(playerid,"TuningModel") == 534){
	          			AddVehicleComponent(car,1100);
				        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Grill elemet egy Remingtonra");
				        F_ShowMenuForPlayer(Bullbars, playerid);
			        }
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Remingtonon alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPVarInt(playerid,"TuningModel") == 534){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 534){
	          			AddVehicleComponent(car,1123);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Bars elemet egy Remingtonra");
			            F_ShowMenuForPlayer(Bullbars, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Remingtonon alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPVarInt(playerid,"TuningModel") == 534){
	   				new car = GetPlayerVehicleID(playerid);
	       			if(GetPVarInt(playerid,"TuningModel") == 534){
	          			AddVehicleComponent(car,1125);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Lights elemet egy Remingtonra");
			            F_ShowMenuForPlayer(Bullbars, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Remingtonon alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
	        case 3:{
				if(GetPVarInt(playerid,"TuningModel") == 535){
		        	new car = GetPlayerVehicleID(playerid);
			        if(GetPVarInt(playerid,"TuningModel") == 535){
	          			AddVehicleComponent(car,1117);
		            	SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltettél egy Locos Low Chrome Lights elemet egy Slamvanra");
			            F_ShowMenuForPlayer(Bullbars, playerid);
					}
				}else{
	   				SendClientMessage(playerid,COLOR_YELLOW,"Ez csak Slamvanon alkalmazható!");
					F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 4:F_ShowMenuForPlayer(TuningMenu, playerid);
		}
	}
	if(menuid ==Wheels) {
		switch(row){
			case 0:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1025);
	          		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Offroad Wheels ");
	            	F_ShowMenuForPlayer(Wheels, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1074);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Mega Wheels");
			        F_ShowMenuForPlayer(Wheels, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1076);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Wires Wheels");
			        F_ShowMenuForPlayer(Wheels, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1078);
			        SendClientMessage(playerid,COLOR_BLUE,"[Sikeresen felszereltetted ezt a kereket: Twist Wheels");
			        F_ShowMenuForPlayer(Wheels, playerid);
				}else{
		 			SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
		    		F_ShowMenuForPlayer(Wheels, playerid);
				}
			}
			case 4:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1081);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Grove Wheels");
			        F_ShowMenuForPlayer(Wheels, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 5:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1082);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Import Wheels");
			        F_ShowMenuForPlayer(Wheels, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
	   		case 6:{
	   			if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
		        	AddVehicleComponent(car,1085);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Atomic Wheels");
			        F_ShowMenuForPlayer(Wheels, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 7:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1096);
	        		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Ahab Wheels");
			        F_ShowMenuForPlayer(Wheels, playerid);
				}else{
				    SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 8:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
				    AddVehicleComponent(car,1097);
	     			SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Virtual Wheels");
	     			F_ShowMenuForPlayer(Wheels, playerid);
				}else{
	 				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
		    		F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
	 		case 9:{
			 	if(GetPlayerMoney(playerid) >= 0){
	    			new car = GetPlayerVehicleID(playerid);
	   				AddVehicleComponent(car,1098);
		          	SendClientMessage(playerid,COLOR_BLUE,"[Sikeresen felszereltetted ezt a kereket: Access Wheels");
				    F_ShowMenuForPlayer(Wheels, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
	        case 10:F_ShowMenuForPlayer(Wheels1, playerid);
			case 11:F_ShowMenuForPlayer(TuningMenu, playerid);
		}
 	}
	if(menuid ==Wheels1) {
		switch(row){
		    case 0:{
				if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
	         		AddVehicleComponent(car,1084);
	           		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Trance Wheels ");
	           		F_ShowMenuForPlayer(Wheels1, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 1:{
				if(GetPlayerMoney(playerid) >= 0){
				    new car = GetPlayerVehicleID(playerid);
				    AddVehicleComponent(car,1073);
				    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Shadow Wheels");
				    F_ShowMenuForPlayer(Wheels1, playerid);
				}else{
		       		SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				   	F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPlayerMoney(playerid) >= 0){
				    new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1075);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Rimshine Wheels");
			        F_ShowMenuForPlayer(Wheels1, playerid);
				}else{
	 				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
		    		F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1077);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Classic Wheels");
			        F_ShowMenuForPlayer(Wheels1, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(Wheels, playerid);
				}
			}
			case 4:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
				    AddVehicleComponent(car,1079);
				    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Cutter Wheels");
				    F_ShowMenuForPlayer(Wheels1, playerid);
				}else{
		       		SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 5:{
				if(GetPlayerMoney(playerid) >= 0){
				    new car = GetPlayerVehicleID(playerid);
		            AddVehicleComponent(car,1080);
				    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Switch Wheels");
				    F_ShowMenuForPlayer(Wheels1, playerid);
				}else{
				    SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
	   		case 6:{
	   			if(GetPlayerMoney(playerid) >= 0){
				    new car = GetPlayerVehicleID(playerid);
				    AddVehicleComponent(car,1083);
				    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen felszereltetted ezt a kereket: Dollar Wheels");
				    F_ShowMenuForPlayer(Wheels1, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
	        case 7:F_ShowMenuForPlayer(TuningMenu, playerid);
	 	}
 	}
	if(menuid ==Carstereo) {
		switch(row){
		    case 0:{
				if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
	         		AddVehicleComponent(car,1086);
	           		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen beszereltetted a basszus növelõ rendszert!");
		            F_ShowMenuForPlayer(Carstereo, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
	   			}
			}
			case 1:F_ShowMenuForPlayer(TuningMenu, playerid);
	 	}
	}
	if(menuid ==Hydraulics) {
		switch(row){
		    case 0:{
				if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
			        AddVehicleComponent(car,1087);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen beszereltetted a  hidraulikát!");
			        F_ShowMenuForPlayer(Hydraulics, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	   				F_ShowMenuForPlayer(TuningMenu, playerid);
			    }
			}
			case 1:F_ShowMenuForPlayer(TuningMenu, playerid);
		 }
 	}
	if(menuid ==Nitro) {
		switch(row){
		    case 0:{
				if(GetPlayerMoney(playerid) >= 0){
	      			new car = GetPlayerVehicleID(playerid);
	         		AddVehicleComponent(car,1008);
	           		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen beszereltetted a 2X nitró töltetet");
	           		F_ShowMenuForPlayer(Nitro, playerid);
				}else{
	   				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
				    F_ShowMenuForPlayer(TuningMenu, playerid);
	    		}
			}
			case 1:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1009);
			        SendClientMessage(playerid,COLOR_BLUE,"Sikeresen beszereltetted az 5X nitró töltetet");
			        F_ShowMenuForPlayer(Nitro, playerid);
				}else{
	 				SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 2:{
				if(GetPlayerMoney(playerid) >= 0){
	   				new car = GetPlayerVehicleID(playerid);
	       			AddVehicleComponent(car,1010);
				    SendClientMessage(playerid,COLOR_BLUE,"Sikeresen beszereltetted a 10X nitró töltetet");
				    F_ShowMenuForPlayer(Nitro, playerid);
				}else{
					SendClientMessage(playerid,COLOR_RED,"Nincs elég pénzed!");
	    			F_ShowMenuForPlayer(TuningMenu, playerid);
				}
			}
			case 3:F_ShowMenuForPlayer(TuningMenu, playerid);
	 	}
	}
	if(menuid ==TuningMenu1) {
	    switch(row){
	        case 0:if(IsPlayerConnected(playerid))F_ShowMenuForPlayer(Hydraulics, playerid);
	        case 1:if(IsPlayerConnected(playerid))F_ShowMenuForPlayer(Nitro, playerid);
	       	case 2:{
         		new car = GetPlayerVehicleID(playerid);
				RepairVehicle(car);
		 		SendClientMessage(playerid,COLOR_BLUE,"Sikeresen rendbehozattad a jármûved");
				F_ShowMenuForPlayer(TuningMenu1, playerid);
			}
	       	case 3:if(IsPlayerConnected(playerid))F_ShowMenuForPlayer(TuningMenu, playerid);
		}
	}
	return 0;
}
