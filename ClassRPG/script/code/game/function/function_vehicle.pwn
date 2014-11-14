#if defined __game_function_function_vehic
	#endinput
#endif
#define __game_function_function_vehic

stock KocsiRendszam(kocsi, bool:kell_ra_rakas = true)
{
	new string[20];
	if(!NPCKocsi[kocsi] && kell_ra_rakas) // Buszra nem kell rendszám
	{
		format(string, sizeof(string), "CLS-%d", kocsi);
		SetVehicleNumberPlate(kocsi, string);
	}
}

stock JarmuRendszam(kocsi, bool:kell_ra_rakas = true)
{
	new string[20];
	if(!NPCKocsi[kocsi] && kell_ra_rakas)
	{
		if(IsAVsKocsi(kocsi))
		{	
			format(string, sizeof(string), "V-%d", IsAVsKocsi(kocsi));
		}
		else if(IsFrakcioKocsi(kocsi)) 	
		{
			format(string, sizeof(string), "F-%d", kocsi);
		}
		else
		{
			format(string, sizeof(string), "");
		}
		SetVehicleNumberPlate(kocsi, string);
	}
}

stock BereltKocsi(kocsi)
{
	new munkakocsi = IsMunkaKocsi(kocsi);
	if(munkakocsi == NINCS) return 0;
	
	new mid = MunkaKocsiID(kocsi, munkakocsi);
	if(mid == NINCS) return 0;
		
	if(MunkaKocsi[munkakocsi][mid][kBerelido] > UnixTime)
		return 1;
	
	return 0;
}