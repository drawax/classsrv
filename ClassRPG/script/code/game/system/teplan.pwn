#if defined __game_system_lvrablas
	#endinput
#endif
#define __game_system_lvrablas

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
		


CMD:tozsde(playerid, params[])
{
	if(!IsRyan(playerid))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "Egyel�re csak Ryan b� haszn�lhatja ezt a parancsot!");
	new type[32];
	if(sscanf(params, "s[16]", type))
		return Msg(playerid, "/t�zsde [aktiv�l�s / deaktiv�l�s / jelsz�]");
			
	if(egyezik(type, "aktiv�l�s"))
	{
		SendRadioMessageFormat(FRAKCIO_SCPD, COLOR_DBLUE, "** �rtes�t�s: %s aktiv�lta Las Venturas-i T�zsde v�delmi rendszer�t", ICPlayerName(playerid));
		SendRadioMessageFormat(FRAKCIO_FBI, COLOR_DBLUE, "** �rtes�t�s: %s aktiv�lta Las Venturas-i T�zsde v�delmi rendszer�t", ICPlayerName(playerid));
		SendRadioMessageFormat(FRAKCIO_NAV, COLOR_DBLUE, "** �rtes�t�s: %s aktiv�lta Las Venturas-i T�zsde v�delmi rendszer�t", ICPlayerName(playerid));
		LezerBekapcs();
		//SendRadioMessageFormat(FRAKCIO_KATONASAG, COLOR_DBLUE, "** �rtes�t�s: %s  aktiv�lta Las Venturas-i T�zsde v�delmi rendszer�t", ICPlayerName(playerid));
	}
	elseif(egyezik(type, "deaktiv�l�s"))
	{
		SendRadioMessageFormat(FRAKCIO_SCPD, COLOR_DBLUE, "** �rtes�t�s: %s deaktiv�lta Las Venturas-i T�zsde v�delmi rendszer�t", ICPlayerName(playerid));
		SendRadioMessageFormat(FRAKCIO_FBI, COLOR_DBLUE, "** �rtes�t�s: %s deaktiv�lta Las Venturas-i T�zsde v�delmi rendszer�t", ICPlayerName(playerid));
		SendRadioMessageFormat(FRAKCIO_NAV, COLOR_DBLUE, "** �rtes�t�s: %s deaktiv�lta Las Venturas-i T�zsde v�delmi rendszer�t", ICPlayerName(playerid));
		LezerKikapcs();
		//SendRadioMessageFormat(FRAKCIO_KATONASAG, COLOR_DBLUE, "** �rtes�t�s: %s  aktiv�lta Las Venturas-i T�zsde v�delmi rendszer�t", ICPlayerName(playerid));
	}
	elseif(egyezik(type, "jelsz�"))
	{
		new jelszoka[10];
		new typeketto[32];
		if(sscanf(params, "ss[16]", type, typeketto))
			return Msg(playerid, "/t�zsde jelsz� [Megn�z / �t�r]");
			
		if(egyezik(typeketto, "megn�z"))
		{
			if(IsACop(playerid) && Munkarang(playerid, 6))
			{
				SendFormatMessage(playerid,COLOR_YELLOW,"A jelsz�: %s",TozsdeJelszo);
				return 1;
			}
			else
			{
				Msg(playerid,"Nincs jogod a haszn�lat�ra! Minimum rang 6!");
				return 1;
			}
		}
		elseif(egyezik(typeketto, "�t�r"))
		{
			if(IsACop(playerid) && Munkarang(playerid, 6))
			{
				if(sscanf(params, "{s[6]}{s[4]}c[32]", jelszoka))
					return Msg(playerid,"/jelsz� �t�r [jelsz�]");
				if(strlen(jelszoka) >= 5 && strlen(jelszoka) <= 10)
				{
					SendFormatMessage(playerid, COLOR_YELLOW,"Jelsz� Sikeresen M�dos�tva! | �j jelsz�: %s", jelszoka);
					TozsdeJelszo =  jelszoka;
				}
				else
					Msg(playerid,"Hiba: A jelsz� minimum 5, maximum 10 karakter lehet!");
			}
			else
			{
				Msg(playerid,"Nincs jogod a haszn�lat�ra! Minimum rang 6!");
				return 1;
			}
		}
		
	}
	return 1;
}

stock UjTozsdeJelszo()
{
	//Amikb�l �llhat a jelsz�
    new TJ[36][] = {"1","2","3","4","5","6","7","8","9","0","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
	//A 10 karakter randomiz�l�sa amib�l a jelsz� lesz.
    new sz1 = random(sizeof(TJ)), sz2 = random(sizeof(TJ)), sz3 = random(sizeof(TJ)), sz4 = random(sizeof(TJ)), sz5 = random(sizeof(TJ)),
    sz6 = random(sizeof(TJ)), sz7 = random(sizeof(TJ)), sz8 = random(sizeof(TJ)), sz9 = random(sizeof(TJ)), sz10 = random(sizeof(TJ));
	//Jelsz� ki�rat�sa
	Format(TozsdeJelszo,"%s%s%s%s%s%s%s%s%s%s",TJ[sz1],TJ[sz2],TJ[sz3],TJ[sz4],TJ[sz5],TJ[sz6],TJ[sz7],TJ[sz8],TJ[sz9],TJ[sz10]);
	printf("Rendszer: Uj LV Tozsde Jelszo: %s",TozsdeJelszo);
	return 1;
}

stock TozsdeRiaszto(bool:start)
{
	if(start)
	{
		PlayAudioStreamForPlayer(playerid, "Kell egy j� riaszt� effect.mp3", 0, 0, 0, 50.0, 1); // M�g nincs Koordi hozz� 0 0 0 hely�re
		Msg(playerid,"A riaszt� megsz�lalt! Jobban teszitek ha menek�lt�k");
	}
	else
	{
		StopAudioStreamForPlayer(playerid);
	}
}

stock TozsdeFeltoresTimer(playerid)
{
	new RandomTalalas;
 	RandomTalalas = Rand(0,9);
  	switch(RandomTalalas)
  	{
   		case 0..4:
   		{
			SendFormatMessage(playerid,COLOR_GREEN,"A jelsz�: %s",TozsdeJelszo);
			Cselekves(playerid,"felt�rte a rendszert,de valamit elrontott", 0);
			foreach(Jatekosok, b)
			{
				if(IsACop(b) && OnDuty[b])
					//M�g nincs koordi 0 0 0 hely�re
					SetPlayerCheckpoint(b, 0, 0, 0, 1), SCM(b,COLOR_ALLDEPT,"** RIAD� ** Bet�rtek a Las Venturasi T�zsde Biztons�gi rendszer�be!");
			}
			MunkaFolyamatban[playerid] = 0;
			TozsdeRiaszto(true);
			LezerKikapcs();
		}
		case 5..9:
   		{
			SendFormatMessage(playerid,COLOR_GREEN,"A t�zsde l�zer�t kontroll�l� jelsz�: %s", TozsdeJelszo);
			
			Cselekves(playerid,"felt�rte a biztons�gi rendszert.", 0);
			MunkaFolyamatban[playerid] = 0;
			LezerKikapcs();
   		}
		default:
		{
			SendFormatMessage(playerid,COLOR_GREEN,"A t�zsde l�zer�t kontroll�l� jelsz�: %s", TozsdeJelszo);
			Cselekves(playerid,"felt�rte a biztons�gi rendszert ", 0);
			MunkaFolyamatban[playerid] = 0;
			LezerKikapcs();
		}
   	}
	return 1;
}

stock LezerBekapcs()
{
	if(VanLezer) return false;
    lezer[0] = CreateDynamicObject(19081, 2150.0380859375, 1612.4652099609, 993.5439453125, 0, 359.99996948242, 180.24993896484);
	lezer[1] = CreateDynamicObject(19081, 2150.1171875, 1617.7203369141, 993.5439453125, 0, 359.99450683594, 180.24719238281);
	lezer[2] = CreateDynamicObject(19081, 2150.146484375, 1622.6157226563, 993.5439453125, 0, 359.99450683594, 180.24719238281);
	lezer[3] = CreateDynamicObject(19081, 2150.146484375, 1622.615234375, 996.0439453125, 0, 359.99450683594, 180.24719238281);
	lezer[4] = CreateDynamicObject(19081, 2150.0029296875, 1617.5610351563, 996.0439453125, 0, 359.99450683594, 180.24719238281);
	lezer[5] = CreateDynamicObject(19081, 2150.033203125, 1612.3712158203, 996.0439453125, 0, 359.99450683594, 180.99719238281);
	lezer[6] = CreateDynamicObject(19081, 2150.033203125, 1612.37109375, 996.0439453125, 0, 10.489013671875, 179.99426269531);
	lezer[7] = CreateDynamicObject(19081, 2150.0859375, 1617.5764160156, 996.0439453125, 0, 10.486450195313, 179.98901367188);
	lezer[8] = CreateDynamicObject(19081, 2150.134765625, 1622.6197509766, 996.0439453125, 0, 10.486450195313, 179.98901367188);
	lezer[9] = CreateDynamicObject(19081, 2136.6711425781, 1622.6243896484, 996.05548095703, 0, 10.250091552734, 0);
	lezer[10] = CreateDynamicObject(19081, 2136.6049804688, 1617.5009765625, 996.05548095703, 0, 10.244750976563, 0);
	lezer[11] = CreateDynamicObject(19081, 2136.1369628906, 1612.16015625, 996.05548095703, 0, 10.244750976563, 1.25);
	lezer[12] = CreateDynamicObject(19081, 2151.2768554688, 1611.8565673828, 997.36950683594, 0, 32.499938964844, 0);
	lezer[13] = CreateDynamicObject(19081, 2151.2426757813, 1617.0734863281, 997.36950683594, 0, 32.49755859375, 0);
	lezer[14] = CreateDynamicObject(19081, 2151.2736816406, 1622.1203613281, 997.36950683594, 0, 32.49755859375, 0);
	lezer[15] = CreateDynamicObject(19081, 2151.2697753906, 1611.8082275391, 992.66534423828, 0, 326.74996948242, 0);
	lezer[16] = CreateDynamicObject(19081, 2151.3142089844, 1616.9853515625, 992.66534423828, 0, 326.74987792969, 0);
	lezer[17] = CreateDynamicObject(19081, 2151.2629394531, 1622.1345214844, 992.66534423828, 0, 326.74987792969, 0);
	lezer[18] = CreateDynamicObject(19081, 2129.603515625, 1612.4478759766, 995.09729003906, 0, 0, 0);
	lezer[19] = CreateDynamicObject(19081, 2139.3237304688, 1617.3081054688, 995.02221679688, 0, 0, 0);
	lezer[20] = CreateDynamicObject(19081, 2139.1013183594, 1612.0637207031, 995.02221679688, 0, 0, 0);
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
/*forward LvTozsdeLezerTimer(playerid);
fpublic LvTozsdeLezerTimer(playerid)
{
	CopMsg(COLOR_ALLDEPT, "T�zsde Sz�m�t�g�pes Rendszere: Figyelem! Valaki t�z kikapcsolta Las Venturai T�zsde l�zereit! V�ge.");
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "Vigy�zzatok, �szrevett�k, hogy kikapcsolt�tok a l�zereket! T�n�s innen!");
	LezerBekapcs();
	return 1;
}*/