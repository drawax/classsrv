
forward OnSetVehiclePos(vehicleid, Float:x, Float:y, Float:z);

fpublic SeeHooks_SetVehiclePos(vehicleid, Float:x, Float:y, Float:z)
{
    SetVehiclePos(vehicleid, x, y, z);
    CallLocalFunction("OnSetVehiclePos", "dfff", vehicleid, x, y, z);
}

#if defined _ALS_SetVehiclePos
    #undef SetVehiclePos
#else
    #define _ALS_SetVehiclePos
#endif
#define SetVehiclePos SeeHooks_SetVehiclePos

forward OnPutPlayerInVehicle(playerid, vehicleid, seatid);

fpublic SeeHooks_PutPlayerInVehicle(playerid, vehicleid, seatid)
{
    PutPlayerInVehicle(playerid, vehicleid, seatid);
    CallLocalFunction("OnPutPlayerInVehicle", "ddd", playerid, vehicleid, seatid);
}

#if defined _ALS_PutPlayerInVehicle // TESZTKRISZ
    #undef PutPlayerInVehicle
#else
    #define _ALS_PutPlayerInVehicle
#endif
#define PutPlayerInVehicle SeeHooks_PutPlayerInVehicle

/*#if defined _ALS_LinkVehicleTointerior
	#undef LinkVehicleToInterior
#else
	#define _ALS_LinkVehicleToInterior
#endif

#define LinkVehicleToInterior P_LinkVehicleToInterior

#if !defined SetVehicleInterior
#define SetVehicleInterior LinkVehicleTointerior
#endif*/