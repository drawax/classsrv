#if defined __game_system_teplan
	#endinput
#endif
#define __game_system_teplan

/*******************  *************     *********           *
		*			  * 				*		  *			*	
        *			  *					*			*		*
		*			  *					*			*		*
		*			  *************		*		  *			*	
		*			  *					**********			*
		*			  *					*					*
		*			  *					*					*
		*			  *					*					*	
		*			  *************		*					**/	
		

//Egyelõre átírva strcmp-re 
/*CMD:tozsde(playerid, params[])
{
	if(!IsRyan(playerid))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "Egyelõre csak Ryan bá használhatja ezt a parancsot!");
	new type[32];
	new typeketto[32];
	new jelszoka[24];
	if(sscanf(params, "s[16]", type))
		return Msg(playerid, "/tõzsde [aktiválás / deaktiválás / jelszó]");
			
	if(egyezik(type, "aktiválás"))
	{	
		if(sscanf(params, "{s[9]}s[24]", jelszoka))
			return Msg(playerid, "/tõzsde aktiválás [jelszó]");
			
		if(egyezik(params[1],TozsdeJelszo))
		{
			SendRadioMessageFormat(FRAKCIO_SCPD, COLOR_DBLUE, "** Értesítés: %s aktiválta Las Venturas-i Tõzsde védelmi rendszerét", ICPlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_FBI, COLOR_DBLUE, "** Értesítés: %s aktiválta Las Venturas-i Tõzsde védelmi rendszerét", ICPlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_NAV, COLOR_DBLUE, "** Értesítés: %s aktiválta Las Venturas-i Tõzsde védelmi rendszerét", ICPlayerName(playerid));
			LezerBekapcs();
			foreach(Jatekosok, b)
				TozsdeRiaszto(b, false);
		}
		else Msg(playerid, "Hibás jelszó!");
	}
	elseif(egyezik(type, "deaktiválás"))
	{
		if(sscanf(params, "{s[9]}s[24]", jelszoka))
			return Msg(playerid, "/tõzsde deaktiválás [jelszó]");
		if(egyezik(params[1],TozsdeJelszo))
		{
			SendRadioMessageFormat(FRAKCIO_SCPD, COLOR_DBLUE, "** Értesítés: %s deaktiválta Las Venturas-i Tõzsde védelmi rendszerét", ICPlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_FBI, COLOR_DBLUE, "** Értesítés: %s deaktiválta Las Venturas-i Tõzsde védelmi rendszerét", ICPlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_NAV, COLOR_DBLUE, "** Értesítés: %s deaktiválta Las Venturas-i Tõzsde védelmi rendszerét", ICPlayerName(playerid));
			LezerKikapcs();
			foreach(Jatekosok, b)
				TozsdeRiaszto(b, false);
		}
		else Msg(playerid, "Hibás jelszó!");
	}
	elseif(egyezik(type, "jelszó"))
	{
		
		if(sscanf(params, "{s[6]}s[16]", typeketto))
			return Msg(playerid, "/tõzsde jelszó [Megnéz / Átír]");
			
		if(egyezik(typeketto, "megnéz"))
		{
			if(IsACop(playerid) && Munkarang(playerid, 6))
			{
				SendFormatMessage(playerid,COLOR_YELLOW,"A jelszó: %s",TozsdeJelszo);
				return 1;
			}
			else
			{
				Msg(playerid,"Nincs jogod a használatára! Minimum rang 6!");
				return 1;
			}
		}
		elseif(egyezik(typeketto, "átír"))
		{
			if(IsACop(playerid) && Munkarang(playerid, 6))
			{
				if(sscanf(params, "{s[6]}{s[4]}c[24]", jelszoka))
					return Msg(playerid,"/tõzsde jelszó Átír [jelszó]");
				if(strlen(jelszoka) >= 10 && strlen(jelszoka) <= 24)
				{
					SendFormatMessage(playerid, COLOR_YELLOW,"Jelszó Sikeresen Módosítva! | Új jelszó: %s", jelszoka);
					TozsdeJelszo =  jelszoka;
				}
				else
					Msg(playerid,"Hiba: A jelszó minimum 10, maximum 24 karakter lehet!");
			}
			else
			{
				Msg(playerid,"Nincs jogod a használatára! Minimum rang 6!");
				return 1;
			}
		}
		
	}
	return 1;
}*/

//Ryan LÉZER KÖRZET
stock LezerKorzet(playerid, areaid)
{
	if(areaid == lezerzona)
	{
		if (VanLezer)
		{
			if(Szajkendo[playerid] || Maszk[playerid])
				CopMsg(COLOR_ALLDEPT, "[FIGYELEM] Néma riasztás: Valaki belépett a Las Venturai Tõzsde Lézersugarába! ");
			else
			{
				CopMsgFormat(COLOR_ALLDEPT, "[FIGYELEM] Néma riasztás: %s belépett a Las Venturai Tõzsde Lézersugarába! ", ICPlayerName(playerid));
				SendClientMessage(playerid, COLOR_LIGHTRED, "Beléptél a lézer mezõbe! A kamera azonosított, mivel nem volt rajtad kendõ/maszk!");
				if(!IsACop(playerid))
				{
					SetPlayerCriminal(playerid,255, "Tõzsde Betörés!");
					SendClientMessage(playerid, COLOR_YELLOW, "Feljelentettek betörésért!");
				}
				else 
				{
					SendRadioMessageFormat(FRAKCIO_FBI, COLOR_YELLOW2, "** [FBI] Értesítés: %s áthatolt a Las Venturasi tõzsde lézerein! Ellenõrizd!", ICPlayerName(playerid));
					SendClientMessage(playerid, COLOR_YELLOW, "Az illetéktelen behatolásod jelezve az FBI-nak!");
				}
			}
		}
		else SendClientMessage(playerid, COLOR_YELLOW, "[Debug Ryannek] Lefutott a VanLezer cumó!");
	}
	
	return 1;
}


stock UjTozsdeJelszo()
{
	//Amikbõl állhat a jelszó
    new TJ[36][] = {"1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
	//A 10 karakter randomizálása amibõl a jelszó lesz.
    new 
		sz1 = random(sizeof(TJ)), 
		sz2 = random(sizeof(TJ)),
		sz3 = random(sizeof(TJ)),
		sz4 = random(sizeof(TJ)),
		sz5 = random(sizeof(TJ)),
		sz6 = random(sizeof(TJ)),
		sz7 = random(sizeof(TJ)),
		sz8 = random(sizeof(TJ)),
		sz9 = random(sizeof(TJ)),
		sz10 = random(sizeof(TJ))
	;
	//Jelszó kiíratása
	Format(TozsdeJelszo,"%s%s%s%s%s%s%s%s%s%s",TJ[sz1],TJ[sz2],TJ[sz3],TJ[sz4],TJ[sz5],TJ[sz6],TJ[sz7],TJ[sz8],TJ[sz9],TJ[sz10]);
	printf("Rendszer: Uj LV Tozsde Jelszo: %s",TozsdeJelszo);
	return 1;
}

stock TozsdeRiaszto( playerid, bool:start=false )
{
	if(start)
	{
		PlayAudioStreamForPlayer(playerid, "Kell egy jó riasztó effect.mp3", 0, 0, 0, 50.0, 1); // Még nincs Koordi hozzá 0 0 0 helyére
		Msg(playerid,"A riasztó megszólalt! Jobban teszitek ha menekültök");
	}
	else
	{
		if(IsPlayerInRangeOfPoint(playerid, 50.0, 0, 0, 0)) // Kell a koordi ide is
			StopAudioStreamForPlayer(playerid);
	}
	return 1;
}

/*forward LvTozsdeLezerTimer(playerid);
fpublic LvTozsdeLezerTimer(playerid)
{
	CopMsg(COLOR_ALLDEPT, "Tõzsde Számítógépes Rendszere: Figyelem! Valaki tíz kikapcsolta Las Venturai Tõzsde lézereit! Vége.");
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "Vigyázzatok, észrevették, hogy kikapcsoltátok a lézereket! Tünés innen!");
	LezerBekapcs();
	return 1;
}*/
forward TozsdeFeltoresTimer(playerid);
fpublic TozsdeFeltoresTimer(playerid)
{
	new RandomTalalas;
 	RandomTalalas = Rand(0,9);
  	switch(RandomTalalas)
  	{
   		case 0..4:
   		{
			SendFormatMessage(playerid,COLOR_GREEN,"A jelszó: %s",TozsdeJelszo);
			Cselekves(playerid,"feltörte a rendszert és kikapcsolta a lézereket, de valamit elrontott", 0);
			
			foreach(Jatekosok, b)
			{
				if(IsACop(b) && OnDuty[b])
				{
					SetPlayerCheckpoint(b, 0, 0, 0, 1); //Még nincs koordi 0 0 0 helyére
					CopMsg(COLOR_ALLDEPT,"** RIADÓ ** Betörtek a Las Venturasi Tõzsde Biztonsági rendszerébe!");
				}	
				
			}
			MunkaFolyamatban[playerid] = 0;
			TozsdeRiaszto(playerid, true);
			LezerKikapcs();
		}
		case 5..9:
   		{
			SendFormatMessage(playerid,COLOR_GREEN,"A tõzsde lézerét kontrolláló jelszó: %s", TozsdeJelszo);
			
			Cselekves(playerid,"feltörte a biztonsági rendszert.", 0);
			MunkaFolyamatban[playerid] = 0;
			LezerKikapcs();
   		}
		default:
		{
			SendFormatMessage(playerid,COLOR_GREEN,"A tõzsde lézerét kontrolláló jelszó: %s", TozsdeJelszo);
			Cselekves(playerid,"feltörte a biztonsági rendszert ", 0);
			MunkaFolyamatban[playerid] = 0;
			LezerKikapcs();
		}
   	}
	return 1;
}

stock LezerBekapcs()
{
	if(VanLezer) return false;
    lezer[0] = CreateDynamicObject(19081, 2150.0380859375, 1612.4652099609, 993.5439453125, 0, 359.99996948242, 180.24993896484, 1333, 1);
	lezer[1] = CreateDynamicObject(19081, 2150.1171875, 1617.7203369141, 993.5439453125, 0, 359.99450683594, 180.24719238281, 1333, 1);
	lezer[2] = CreateDynamicObject(19081, 2150.146484375, 1622.6157226563, 993.5439453125, 0, 359.99450683594, 180.24719238281, 1333, 1);
	lezer[3] = CreateDynamicObject(19081, 2150.146484375, 1622.615234375, 996.0439453125, 0, 359.99450683594, 180.24719238281, 1333, 1);
	lezer[4] = CreateDynamicObject(19081, 2150.0029296875, 1617.5610351563, 996.0439453125, 0, 359.99450683594, 180.24719238281, 1333, 1);
	lezer[5] = CreateDynamicObject(19081, 2150.033203125, 1612.3712158203, 996.0439453125, 0, 359.99450683594, 180.99719238281, 1333, 1);
	lezer[6] = CreateDynamicObject(19081, 2150.033203125, 1612.37109375, 996.0439453125, 0, 10.489013671875, 179.99426269531, 1333, 1);
	lezer[7] = CreateDynamicObject(19081, 2150.0859375, 1617.5764160156, 996.0439453125, 0, 10.486450195313, 179.98901367188, 1333, 1);
	lezer[8] = CreateDynamicObject(19081, 2150.134765625, 1622.6197509766, 996.0439453125, 0, 10.486450195313, 179.98901367188, 1333, 1);
	lezer[9] = CreateDynamicObject(19081, 2136.6711425781, 1622.6243896484, 996.05548095703, 0, 10.250091552734, 0, 1333, 1);
	lezer[10] = CreateDynamicObject(19081, 2136.6049804688, 1617.5009765625, 996.05548095703, 0, 10.244750976563, 0, 1333, 1);
	lezer[11] = CreateDynamicObject(19081, 2136.1369628906, 1612.16015625, 996.05548095703, 0, 10.244750976563, 1.25, 1333, 1);
	lezer[12] = CreateDynamicObject(19081, 2151.2768554688, 1611.8565673828, 997.36950683594, 0, 32.499938964844, 0, 1333, 1);
	lezer[13] = CreateDynamicObject(19081, 2151.2426757813, 1617.0734863281, 997.36950683594, 0, 32.49755859375, 0, 1333, 1);
	lezer[14] = CreateDynamicObject(19081, 2151.2736816406, 1622.1203613281, 997.36950683594, 0, 32.49755859375, 0, 1333, 1);
	lezer[15] = CreateDynamicObject(19081, 2151.2697753906, 1611.8082275391, 992.66534423828, 0, 326.74996948242, 0, 1333, 1);
	lezer[16] = CreateDynamicObject(19081, 2151.3142089844, 1616.9853515625, 992.66534423828, 0, 326.74987792969, 0, 1333, 1);
	lezer[17] = CreateDynamicObject(19081, 2151.2629394531, 1622.1345214844, 992.66534423828, 0, 326.74987792969, 0, 1333, 1);
	lezer[18] = CreateDynamicObject(19081, 2129.603515625, 1612.4478759766, 995.09729003906, 0, 0, 0, 1333, 1);
	lezer[19] = CreateDynamicObject(19081, 2139.3237304688, 1617.3081054688, 995.02221679688, 0, 0, 0, 1333, 1);
	lezer[20] = CreateDynamicObject(19081, 2139.1013183594, 1612.0637207031, 995.02221679688, 0, 0, 0, 1333, 1);
	VanLezer = true;
	return true;
}
stock LezerKikapcs()
{
	for(new i=0; i < sizeof(lezer); i++)
	{
			DestroyDynamicObject(lezer[i]);
			lezer[i] = NINCS;
	}
	VanLezer = false;
	return 1;
}

