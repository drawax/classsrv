
#include <a_samp>

#include <zcmd>
#include <streamer>
#include <sscanf2>

//Colorlist
#define COLOR_GREY 0x808080FF
#define COLOR_WHITE 0xFFFFFFFF
#define COLOR_YELLOW 0xFFFF00FF
#define COLOR_GREEN 0x088A08FF

//Forwards
forward GetVehicleModelIDFromName(vname[]);

//Defines


//PlayerInfo
enum pInfo
{

	bool:pCanSpawnVehicle,
	pSpawnVehicle,
}

//Client Variables
new PlayerInfo[MAX_PLAYERS][pInfo];

//Server Variables
new  Float:pX,
Float:pY, Float:pZ, Float:pAngle;





new VehicleNames[212][] = {
{"Landstalker"},{"Bravura"},{"Buffalo"},{"Linerunner"},{"Perrenial"},{"Sentinel"},{"Dumper"},
{"Firetruck"},{"Trashmaster"},{"Stretch"},{"Manana"},{"Infernus"},{"Voodoo"},{"Pony"},{"Mule"},
{"Cheetah"},{"Ambulance"},{"Leviathan"},{"Moonbeam"},{"Esperanto"},{"Taxi"},{"Washington"},
{"Bobcat"},{"Mr Whoopee"},{"BF Injection"},{"Hunter"},{"Premier"},{"Enforcer"},{"Securicar"},
{"Banshee"},{"Predator"},{"Bus"},{"Rhino"},{"Barracks"},{"Hotknife"},{"Trailer 1"},{"Previon"},
{"Coach"},{"Cabbie"},{"Stallion"},{"Rumpo"},{"RC Bandit"},{"Romero"},{"Packer"},{"Monster"},
{"Admiral"},{"Squalo"},{"Seasparrow"},{"Pizzaboy"},{"Tram"},{"Trailer 2"},{"Turismo"},
{"Speeder"},{"Reefer"},{"Tropic"},{"Flatbed"},{"Yankee"},{"Caddy"},{"Solair"},{"Berkley's RC Van"},
{"Skimmer"},{"PCJ-600"},{"Faggio"},{"Freeway"},{"RC Baron"},{"RC Raider"},{"Glendale"},{"Oceanic"},
{"Sanchez"},{"Sparrow"},{"Patriot"},{"Quad"},{"Coastguard"},{"Dinghy"},{"Hermes"},{"Sabre"},
{"Rustler"},{"ZR-350"},{"Walton"},{"Regina"},{"Comet"},{"BMX"},{"Burrito"},{"Camper"},{"Marquis"},
{"Baggage"},{"Dozer"},{"Maverick"},{"News Chopper"},{"Rancher"},{"FBI Rancher"},{"Virgo"},{"Greenwood"},
{"Jetmax"},{"Hotring"},{"Sandking"},{"Blista Compact"},{"Police Maverick"},{"Boxville"},{"Benson"},
{"Mesa"},{"RC Goblin"},{"Hotring Racer A"},{"Hotring Racer B"},{"Bloodring Banger"},{"Rancher"},
{"Super GT"},{"Elegant"},{"Journey"},{"Bike"},{"Mountain Bike"},{"Beagle"},{"Cropdust"},{"Stunt"},
{"Tanker"}, {"Roadtrain"},{"Nebula"},{"Majestic"},{"Buccaneer"},{"Shamal"},{"Hydra"},{"FCR-900"},
{"NRG-500"},{"HPV1000"},{"Cement Truck"},{"Tow Truck"},{"Fortune"},{"Cadrona"},{"FBI Truck"},
{"Willard"},{"Forklift"},{"Tractor"},{"Combine"},{"Feltzer"},{"Remington"},{"Slamvan"},
{"Blade"},{"Freight"},{"Streak"},{"Vortex"},{"Vincent"},{"Bullet"},{"Clover"},{"Sadler"},
{"Firetruck LA"},{"Hustler"},{"Intruder"},{"Primo"},{"Cargobob"},{"Tampa"},{"Sunrise"},{"Merit"},
{"Utility"},{"Nevada"},{"Yosemite"},{"Windsor"},{"Monster A"},{"Monster B"},{"Uranus"},{"Jester"},
{"Sultan"},{"Stratum"},{"Elegy"},{"Raindance"},{"RC Tiger"},{"Flash"},{"Tahoma"},{"Savanna"},
{"Bandito"},{"Freight Flat"},{"Streak Carriage"},{"Kart"},{"Mower"},{"Duneride"},{"Sweeper"},
{"Broadway"},{"Tornado"},{"AT-400"},{"DFT-30"},{"Huntley"},{"Stafford"},{"BF-400"},{"Newsvan"},
{"Tug"},{"Trailer 3"},{"Emperor"},{"Wayfarer"},{"Euros"},{"Hotdog"},{"Club"},{"Freight Carriage"},
{"Trailer 3"},{"Andromada"},{"Dodo"},{"RC Cam"},{"Launch"},{"Police Car (LSPD)"},{"Police Car (SFPD)"},
{"Police Car (LVPD)"},{"Police Ranger"},{"Picador"},{"S.W.A.T. Van"},{"Alpha"},{"Phoenix"},{"Glendale"},
{"Sadler"},{"Luggage Trailer A"},{"Luggage Trailer B"},{"Stair Trailer"},{"Boxville"},{"Farm Plow"},
{"Utility Trailer"}};

main()
{
	print("\n>Vehicle spawn!\n");
}


public GetVehicleModelIDFromName(vname[])
{
	for(new i = 0; i < 211; i++)
	{
		if ( strfind(VehicleNames[i], vname, true) != -1 )
			return i + 400;
	}
	return -1;
}

CMD:v(playerid, params[])
{
	new Vehicle[32], VehicleID, ColorOne, ColorTwo;
	PlayerInfo[playerid][pCanSpawnVehicle] = true;
	if(sscanf(params, "s[32]D(1)D(1)", Vehicle, ColorOne, ColorTwo))
	{
	    PlayerInfo[playerid][pCanSpawnVehicle] = true;
	    SendClientMessage(playerid, COLOR_GREY, "[USAGE]: /v[Vehiclename/Vehicleid] [Color 1 (optional)] [Color 2 (optional)]");
	    SendClientMessage(playerid, COLOR_GREY, "[USAGE]: Like /v Turismo , /v Elegy /v Nrg /v 522");
	    return 1;
	}
	
	if(PlayerInfo[playerid][pCanSpawnVehicle])
	{
	    VehicleID = GetVehicleModelIDFromName(Vehicle);
	    /*if(VehicleID != 425 && VehicleID != 432 && VehicleID != 447 &&
	       VehicleID != 430 && VehicleID != 417 && VehicleID != 435 &&
           VehicleID != 446 && VehicleID != 449 && VehicleID != 450 &&
	       VehicleID != 452 && VehicleID != 453 && VehicleID != 454 &&
  		   VehicleID != 460 && VehicleID != 464 && VehicleID != 465 &&
  		   VehicleID != 469 && VehicleID != 472 && VehicleID != 473 &&
		   VehicleID != 476 && VehicleID != 484 && VehicleID != 487 &&
		   VehicleID != 488 && VehicleID != 493 && VehicleID != 497 &&
		   VehicleID != 501 && VehicleID != 511 && VehicleID != 512 &&
		   VehicleID != 513 && VehicleID != 519 && VehicleID != 520 &&
		   VehicleID != 537 && VehicleID != 538 && VehicleID != 548 &&
		   VehicleID != 553 && VehicleID != 563 && VehicleID != 564 &&
		   VehicleID != 569 && VehicleID != 570 && VehicleID != 577 &&
		   VehicleID != 584 && VehicleID != 590 && VehicleID != 591 &&
		   VehicleID != 592 && VehicleID != 593 && VehicleID != 594 &&
		   VehicleID != 595 && VehicleID != 606 && VehicleID != 607 &&
		   VehicleID != 608 && VehicleID != 610 && VehicleID != 611) {*/
			if(VehicleID == -1 )
			{
				VehicleID = strval(Vehicle);

				if(VehicleID < 400 || VehicleID > 611 )
				{
					return SendClientMessage(playerid, COLOR_GREY, "You entered an invalid vehiclename!");
				}
			}

			GetPlayerPos(playerid, pX, pY, pZ);
			GetPlayerFacingAngle(playerid, pAngle);

			DestroyVehicle(PlayerInfo[playerid][pSpawnVehicle]);
			PlayerInfo[playerid][pSpawnVehicle] = CreateVehicle(VehicleID, pX, pY, pZ+2.0, pAngle, ColorOne, ColorTwo, -1);
			LinkVehicleToInterior(PlayerInfo[playerid][pSpawnVehicle], GetPlayerInterior(playerid));
			PutPlayerInVehicle(playerid, PlayerInfo[playerid][pSpawnVehicle], 0);
			SendClientMessage(playerid, COLOR_GREY, "You succesfully spawned this vehicle!");
		/*} else {
		    SendClientMessage(playerid, COLOR_GREY, "You are not allowed to spawn this vehicle!!");
		}*/
	} else {
		SendClientMessage(playerid, COLOR_GREY, "You can not spawn vehicles in this zone!");
	}
	return 1;
}