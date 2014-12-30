#if defined __game_commands_Admin
	#endinput
#endif
#define __game_commands_Admin

/****************************
 *           cmdk           *
 *    á: 1   ó: 4   ú: 7    *
 *    é: 2   ö: 5   ü: 8    *
 *    í: 3   õ: 6   û: 9    *  
 ****************************/
 
CMD:adminfelirat(playerid, params[])//feliratot rak a fejed fölés by Amos
{
	if(!IsSuper(playerid)) return 1;
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0) return Msg(playerid, "Most nem beszélhetsz!");
	if(Leutve[playerid]) return Msg(playerid,"Leütve nem cselekedhetsz semmit!");
	new result[100], string[140];
	if(sscanf(params, "s[100]", result))
	{
		Msg(playerid, "Használat: /adminfelirat [leírás]");
		Msg(playerid, "A kikapcsolásához: /adminfelirat ki");
		return 1;
	}
	if(strlen(result) >3) return Msg(playerid, "A leírásnak hosszabbnak kell lennie, mint 3 karakter.");
	if(strcmp(result, "ki", true) == 0)
	{
		if(adminszoveg[playerid] == 0) return Msg(playerid, "Most már nincsen felirat a fejed fölött.");
		DestroyDynamic3DTextLabel(adminfelirat[playerid]);
		Msg(playerid, "/adminfelirat törölve.");
		acselekves[playerid] = 0;
		return 1;
	}
	if(adminszoveg[playerid] == 0)
	{
		format(string, sizeof(string), "* %s *", playerid);
		adminfelirat[playerid] = CreateDynamic3DTextLabel(string, COLOR_RED, 0.0, 0.0, 0.0, 40.0, playerid);
		format(string, sizeof(string), "FELIRAT: %s", string);
		Msg(playerid, "/fme kirakva a fejed fölé.");
		SendClientMessage(playerid, COLOR_RED, string);
		adminszoveg[playerid] = 1;
	}
	else
	{
		format(string, sizeof(string), "* %s *", playerid);
		UpdateDynamic3DTextLabelText(adminfelirat[playerid], COLOR_RED, string);
		format(string, sizeof(string), "FELIRAT: %s", string);
		SendClientMessage(playerid, COLOR_RED, string);
		return 1;
	}
	return 1;
}

ALIAS(b5k2s):poke;//BÖKÉS
ALIAS(b5k):poke;
CMD:poke(playerid, params[])
{
		if(!Admin(playerid, 1))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[Hiba]: Ezt a parancsot nem használhatod!");
			
        new jatekos, oka[64];
        if(sscanf(params, "us[64]", jatekos, oka))
            return SendClientMessage(playerid, COLOR_WHITE, "Használata: /poke [Játékos] [Oka]");
			
		if(jatekos == INVALID_PLAYER_ID || IsPlayerNPC(jatekos))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[Hiba]: Nincs ilyen játékos!");
			
		SendFormatMessage(playerid, COLOR_LIGHTRED, "Megbökted %s-t, Oka: %s", PlayerName(jatekos), oka);
		SendFormatMessage(jatekos, COLOR_LIGHTRED, "[Bökés] %s megbökött | Oka: %s", PlayerName(playerid), oka);
			

		return 1;
}

ALIAS(adafk):adminafk;//ADMINAFK
CMD:adminafk(playerid, params[])
{
	if(!Admin(playerid, 2) && !IsScripter(playerid)) return Msg(playerid, "Nem-nem");
	if(AdminDuty[playerid]) return Msg(playerid, "Adminszoliba elrejtõzni? Nehéz lesz.. :D");
	{
		if(GetPlayerColor(playerid) == COLOR_INVISIBLE)
		{
			SetPlayerColor(playerid, COLOR_BLACK);
			Msg(playerid, "Bekapcsolva!");
			Msg(playerid, "CSAK MEGFIGYELÉSRE HASZNÁLHATÓ!! Ha másra használod, vagy kiadod másnak, akkor SÚLYOS büntetésre számíts!!!", false, COLOR_YELLOW);
		}
		else
		{
			SetPlayerColor(playerid, COLOR_INVISIBLE);
			Msg(playerid, "Kikapcsolva!");
		}
	}
	return 1;
}

 
ALIAS(5l2sid6):olesido;//ÖLÉSIDÕ
CMD:olesido(playerid, params[])
{
	SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: A következõ kórház %d másodperccel több idõ lesz az öléseid száma miatt.", PlayerInfo[playerid][pOlesIdo]);
	new p1[32], p2, p3;
	if(Admin(playerid, 4))
	{
		if(sscanf(params, "s[16]ud", p1, p2, p3)) return Msg(playerid, "/ölésidõ [give/set] [játékos] [mennyiség (másodpercben!)]");
		if(egyezik(p1, "give"))
		{
			if(p2 == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(PlayerInfo[p2][pOlesIdo] < -p3) return Msg(playerid, "Mínuszba nem rakhatod az összes kórházidejét!");
			PlayerInfo[p2][pOlesIdo] += p3;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Hozzáadtál %s kórházidejéhez ennyit: %d | Új kórházideje: %d", PlayerName(p2), p3, PlayerInfo[p2][pOlesIdo]);
			format(_tmpString,sizeof(_tmpString),"<< %s hozzáadott %s kórházidejéhez %d másodpercet | Új kórházideje: %d", AdminName(playerid), PlayerName(p2), p3, PlayerInfo[p2][pOlesIdo]);
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
		}
		elseif(egyezik(p1, "set"))
		{
			if(p2 == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			new olesideje = PlayerInfo[p2][pOlesIdo];
			if(p3 < 0) return Msg(playerid, "Mínuszba nem rakhatod az összes kórházidejét!");
			PlayerInfo[p2][pOlesIdo] = p3;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Beállítottad %s kórházidejét ennyire: %d | Régi kórházideje: %d", PlayerName(p2), p3, olesideje);
			format(_tmpString,sizeof(_tmpString),"<< %s beállította %s kórházidejét %d másodpercre | Régi kórházideje: %d", AdminName(playerid), PlayerName(p2), p3, olesideje);
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
		}
	}
	return 1;
}

CMD:carresiset(playerid, params[])//CRSSET
{
	if(!IsScripter(playerid)) return 1;
	new param[32],func[256];
	if(sscanf(params, "s[32]S()[256]", param, func)) 
	{
		Msg(playerid,"/carresiset [idõ / db / info]");
		Msg(playerid,"idõ = -1 kikapcsol, ezek a beálítások szerver restartig maradnak!");
		return 1;
	}
	if(egyezik(param,"idõ") || egyezik(param,"ido"))
	{
		if(sscanf(func, "d",ResiCounter)) return Msg(playerid,"/carresiset idõ (3600 == 1 óra)");
	
		if(ResiCounter < NINCS) ResiCounter=NINCS;
		CarRespawnSzamlalo = NINCS;
		ResiCounterFIX = ResiCounter;
		SendFormatMessage(playerid,COLOR_YELLOW,"Az idõ átírva: %d sec",ResiCounter);
		
	}
	if(egyezik(param,"db"))
	{
	
		if(sscanf(func, "d",CarresiDB)) return Msg(playerid,"/carresiset db (3600 == 1 óra)");
	
		if(CarresiDB < 1) CarresiDB=10;
		SendFormatMessage(playerid,COLOR_YELLOW,"A DB átírva: %d -re",CarresiDB);

	
	}
	if(egyezik(param,"info"))
	{
		
		SendFormatMessage(playerid,COLOR_YELLOW,"[INFO] %d DB, %d sec idõ, %d Szamlalo ",CarresiDB, ResiCounter, CarRespawnSzamlalo);
	
	}

	return 1;
}

CMD:object(playerid, params[])//OBJECT
{
	if(!Admin(playerid, 1338) && !IsScripter(playerid) && PlayerInfo[playerid][pID] != 8172362) return 1;
	
	new param[32];
	new func[256];
	
	if(sscanf(params, "s[32]S()[256]", param, func)) 
	{
		Msg(playerid, "/object [funkció]");
		Msg(playerid, "Funkciók: [Go | uj | mod| üres | töröl | közel | objecttorles]");
		Msg(playerid, "mod= módósít");
		return 1;
	}
	if(egyezik(param, "objecttorles"))
	{
		if(!Admin(playerid,5555)) return 1;
		
		new Float:x,Float:y,Float:z,Float:t, type;
		if(sscanf(func, "p<,>dffff", type,x,y,z,t)) return Msg(playerid, "/object objecttorles [tipus],[x],[y],[z],[tavol]");
		
		new id = NINCS;
		
		for(new a = 0; a < MAX_OBJECTSZ; a++)
		{
			if(OBJECT_TOROL[a][sTipus] == 0)
			{
				id = a;
				break;
			}
		}
		
		OBJECT_TOROL[id][sTipus] = type;
		OBJECT_TOROL[id][sPosX] = x;
		OBJECT_TOROL[id][sPosY] = y;
		OBJECT_TOROL[id][sPosZ] = z;
		OBJECT_TOROL[id][sTav] = t;
		
		foreach(Jatekosok, xx)
		{
			RemoveBuildingForPlayer(xx, type, x, y, z, t);
		}
		
		
		INI_Save(INI_TYPE_OBJECTTORLES, id);
		//RemoveBuildingForPlayer(playerid, 3338, -113.4063, -1235.7266, 1.5000, 0.25);
		//RemoveBuildingForPlayer(playerid, 3244, -113.4063, -1235.7266, 1.5000, 0.25);
	}
	if(egyezik(param, "go"))
	{
		
		new atmid;
		if(sscanf(func, "d", atmid)) return Msg(playerid, "/object go [OBJECT ID]");
		
		if(atmid < 0 || atmid > MAX_OBJECTSZ) return Msg(playerid, "Hibás object ID.");
		SetPlayerPos(playerid, OBJECT[atmid][sPosX], OBJECT[atmid][sPosY], OBJECT[atmid][sPosZ]+1.5);
		SendFormatMessage(playerid,  COLOR_LIGHTGREEN, "* Teleportáltál az object-hez. (ID: %d - Koordínáta: X: %f | Y: %f | Z: %f) ", atmid, OBJECT[atmid][sPosX], OBJECT[atmid][sPosY], OBJECT[atmid][sPosZ]);
	}
	if(egyezik(param, "uj"))
	{
		new tipus;
		if(sscanf(func, "d", tipus))
		{
			Msg(playerid, "/object uj [típus]");
			Msg(playerid, "Hotdog: 1340, | Italautomata: 1775 | Csokiautomata: 1776 | Szerencsegép: 2754 | Telefon: 1216");
			Msg(playerid, "Ha nem írsz id-t automata üresra rakja.");
			
			if(IsSuper(playerid))
			{
				Msg(playerid,"19808-19999 (19901 kivételével)");
				Msg(playerid,"Sebeség korlátok: 30: 19878 50: 19880 90: 19884 130:19888 Övezet30: 19893 / 19895");
				Msg(playerid,"Bukkanó: 19915 Villamos: 19936 Vasút:19937 Busz: 19946 Autópálya:19808/19809 Magasság: 19867");
				Msg(playerid,"kötelezõ haladási irány elõlre: 19818 elõlre-jobbra: 19819 elõlre-balra: 19820 balra: 19821 jobbra:19822");
				Msg(playerid, "1225 robbanó");
			}
			return 1;
		}
		new id = NINCS;
		
		for(new a = 0; a < MAX_OBJECTSZ; a++)
		{
			if(OBJECT[a][sTipus] == 0)
			{
				id = a;
				break;
			}
		}
		
		
		
		
		if(id < 0 || id >= MAX_OBJECTSZ) return Msg(playerid, "Nincs üres hely!");

		new Float:X, Float:Y, Float:Z, Float:A;
		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerFacingAngle(playerid, A);
		
		id=UresObject();
		if(id == NINCS) return Msg(playerid, "Nincs üres hely");

	
		OBJECT[id][sInt] =GetPlayerInterior(playerid);
		OBJECT[id][sVw]=GetPlayerVirtualWorld(playerid);
		
		if(tipus == 1340)
		{
			Z+=0.12;
			A-=90.0;
		}
		else if(tipus == 1775)
			Z+=0.1;
		else if(tipus == 1776)
			Z+=0.08;
		else if(tipus == 1216)
			Z-=0.32;
		else if(tipus == 2754)
		{
			Z+=0.08;
			A+=90.0;
		}
		else if(!Admin(playerid,1337)) return Msg(playerid, "Szerintem rossz object");
		
		if(19808 <= tipus <= 19999)
			Z-=1.0;
			
		OBJECT[id][sTipus] = tipus;
		OBJECT[id][sPosX] = X;
		OBJECT[id][sPosY] = Y;
		OBJECT[id][sPosZ] = Z;
		OBJECT[id][sPosZX] = 0.0;
		OBJECT[id][sPosZY] = 0.0;
		OBJECT[id][sPosA] = A;

		if(OBJECT[id][sObjectID] > 0)
			if(IsValidDynamicObject(OBJECT[id][sObjectID])) DestroyDynamicObject(OBJECT[id][sObjectID]),OBJECT[id][sObjectID]=INVALID_OBJECT_ID;
		
		OBJECT[id][sObjectID] = CreateDynamicObject (tipus, X, Y, Z, 0.0, 0.0, OBJECT[id][sPosA], OBJECT[id][sVw], OBJECT[id][sInt]);

		SendFormatMessage(playerid,  COLOR_LIGHTGREEN, "* OBJECT lerakva. (ID: %d - Típus: %d Koordínáta: X: %.2f | Y: %.2f | Z: %.2f | A: %.2f | VW: %d | INT: %d) ", id, tipus, OBJECT[id][sPosX], OBJECT[id][sPosY], OBJECT[id][sPosZ], OBJECT[id][sPosA], OBJECT[id][sVw],OBJECT[id][sInt]);
		Streamer_Update(playerid);
		SetPlayerPos(playerid, X, Y, Z+3.0);
		
		
		EditDynamicObject(playerid, OBJECT[id][sObjectID]);
		
		ObjectSzerkeszt[playerid] = id;
		
	}
	if(egyezik(param, "vw"))
	{
		
		new Float:PPos[3], Float:legkozelebb = 5000.0, Float:tav;
		new vw;
		if(sscanf(func, "d", vw)) return Msg(playerid, "/object vw");
		
		GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
		new id;
		for(new a = 0; a < MAX_OBJECTSZ; a++)
		{
			tav = GetDistanceBetweenPoints(PPos[0], PPos[1], PPos[2], OBJECT[a][sPosX], OBJECT[a][sPosY], OBJECT[a][sPosZ]);
			if(tav < legkozelebb)
			{
				legkozelebb = tav;
				id = a;
			}
		}
		
		OBJECT[id][sVw] = vw;
		if(OBJECT[id][sObjectID] > 0)
			if(IsValidDynamicObject(OBJECT[id][sObjectID])) DestroyDynamicObject(OBJECT[id][sObjectID]),OBJECT[id][sObjectID]=INVALID_OBJECT_ID;
		
		OBJECT[id][sObjectID] = CreateDynamicObject (OBJECT[id][sTipus], OBJECT[id][sPosX], OBJECT[id][sPosY], OBJECT[id][sPosZ], OBJECT[id][sPosZX], OBJECT[id][sPosZY], OBJECT[id][sPosA], OBJECT[id][sVw], OBJECT[id][sInt]);
		
		INI_Save(INI_TYPE_OBJECT, id);
	}
	if(egyezik(param, "mod") || egyezik(param, "modosit"))
	{
		
		new Float:PPos[3], Float:legkozelebb = 5000.0, Float:tav;
		
		GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
		new id;
		for(new a = 0; a < MAX_OBJECTSZ; a++)
		{
			tav = GetDistanceBetweenPoints(PPos[0], PPos[1], PPos[2], OBJECT[a][sPosX], OBJECT[a][sPosY], OBJECT[a][sPosZ]);
			if(tav < legkozelebb)
			{
				legkozelebb = tav;
				id = a;
			}
		}
		
		EditDynamicObject(playerid, OBJECT[id][sObjectID]);
		
		ObjectSzerkeszt[playerid] = id;
	
	
	}
	if(egyezik(param, "töröl"))
	{
		new id;
		new Float:PPos[3], Float:legkozelebb = 5000.0, Float:tav;
		
		if(sscanf(func, "d", id))
		{
		
			GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
			
			for(new a = 0; a < MAX_OBJECTSZ; a++)
			{
				tav = GetDistanceBetweenPoints(PPos[0], PPos[1], PPos[2], OBJECT[a][sPosX], OBJECT[a][sPosY], OBJECT[a][sPosZ]);
				if(tav < legkozelebb)
				{
					legkozelebb = tav;
					id = a;
				}
			}
		
		}
		
		if(id < 0 || id >= MAX_OBJECTSZ) return Msg(playerid, "Hibás SORSZÁM ID.");
		if(OBJECT[id][sObjectID] > 0)
				if(IsValidDynamicObject(OBJECT[id][sObjectID]))DestroyDynamicObject(OBJECT[id][sObjectID]),OBJECT[id][sObjectID]=INVALID_OBJECT_ID;

		OBJECT[id][sTipus] = 0;
		OBJECT[id][sPosX] = 0.0;
		OBJECT[id][sPosY] = 0.0;
		OBJECT[id][sPosZ] = 0.0;
		OBJECT[id][sPosA] = 0.0;
		OBJECT[id][sVw] = 0;
		OBJECT[id][sInt] = 0;
		OBJECT[id][sObjectID] =0;
		SendFormatMessage(playerid,  COLOR_LIGHTGREEN, "Törölve Object: %d",id);
		
		INI_Save(INI_TYPE_OBJECT, id);
		//SaveOBJECT();
	}
	if(egyezik(param, "üres"))
	{
		new szamlalo;
		for(new a = 0; a < MAX_OBJECTSZ; a++)
		{
			if(OBJECT[a][sTipus] == 0)
			{
				SendFormatMessage(playerid,  COLOR_LIGHTGREEN, "*Üres Object: ID: %d ",a);
				szamlalo++;
				if(szamlalo > 6) return 1;
			}
		}
	}
	if(egyezik(param, "közel"))
	{
		SendClientMessage(playerid, COLOR_WHITE, "====[ Legközelebbi object ]=====");
		new Float:PPos[3], Float:legkozelebb = 5000.0, Float:tav;
		GetPlayerPos(playerid, PPos[0], PPos[1], PPos[2]);
		new kozel;
		for(new a = 0; a < MAX_OBJECTSZ; a++)
		{
			tav = GetDistanceBetweenPoints(PPos[0], PPos[1], PPos[2], OBJECT[a][sPosX], OBJECT[a][sPosY], OBJECT[a][sPosZ]);
			if(tav < legkozelebb)
			{
				legkozelebb = tav;
				kozel = a;
			}
		}

		if(legkozelebb == 5000.0) return Msg(playerid, "Nincs találat");

		SendFormatMessage(playerid, COLOR_LIGHTBLUE, "ID: %d Objectid: %d VW: %d INT: %d", kozel,OBJECT[kozel][sTipus],OBJECT[kozel][sVw],OBJECT[kozel][sInt]);
		SetPlayerCheckpoint(playerid, OBJECT[kozel][sPosX], OBJECT[kozel][sPosY], OBJECT[kozel][sPosZ], 2);
		return 1;
	}
	return 1;
}

CMD:ondutyskin(playerid, params[])//ONDUTYSKIN
{
	if(!Admin(playerid, 1)) return 1;
	if(!AdminDuty[playerid]) return Msg(playerid, "Nem vagy ondutyban!");
	if(!AdminDutySkin[playerid])
	{
		AdminDutySkin[playerid] = 1;
		SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
		Msg(playerid, "Frakción kívüli karakterskin beállítva - bekapcsolva");
	}
	else
	{
		AdminDutySkin[playerid] = 0;
		if(PlayerInfo[playerid][pChar] > 0 && OnDuty[playerid] || PlayerInfo[playerid][pChar] > 0 && !LegalisSzervezetTagja(playerid) && !Civil(playerid))
			SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
		else
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
		Msg(playerid, "Frakciós karakterskin beállítva - kikapcsolva");
	}
	return 1;
}

/*ALIAS(mulat1s):mulatas;
CMD:mulatas(playerid, params[])
{
	if(SQLID(playerid) == 1 || SQLID(playerid) == 5637 || SQLID(playerid) == 8172424 || IsTerno(playerid))
	{
		if(MulatasTime > UnixTime) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Pihenj kicsit, még nem mulathatsz! Legközelebb %d másodperc múlva kezdhetsz el mulatozni", MulatasTime-UnixTime);
		MulatasTime = UnixTime+3600;
		ABroadCastFormat(Pink, 1, "<< %s mulatós császár jelen van - mulatás elkezdve! >>", AdminName(playerid));
		foreach(Jatekosok, p)
		{
			if(Admin(p, 1) && PlayerInfo[p][pRadio] == 1 && Logged(p) && Zsebradio[p] == 0 && DiscobanVan{p} == 0)
				PlayAudioStreamForPlayer(p, "https://dl.dropboxusercontent.com/u/125530140/Cs%C3%B3r%C3%B3%20Lali%20-%20Lali%20pop.mp3");
		}
	}
	return 1;
}*/

ALIAS(tilt1sok):tiltasok;
CMD:tiltasok(playerid, params[])
{
	new who; new count = 0;
	if(!Admin(playerid, 5)) return 1;
	if(sscanf(params, "u", who)) return Msg(playerid, "/tiltások [Név/ID]");
	SendFormatMessage(playerid, COLOR_ADD, "==========[ %s tiltásai ]==========", PlayerName(who));
	if(PlayerInfo[who][pFrakcioTiltIdo] >0) SendFormatMessage(playerid,COLOR_YELLOW,"El van tiltva a frakcióktól %d órára! Oka: %s",PlayerInfo[who][pFrakcioTiltIdo],PlayerInfo[who][pFrakcioTiltOk]), count++;
	if(PlayerInfo[who][pJogsiTiltIdo] >0 && !egyezik(PlayerInfo[who][pJogsiTiltOk],"NINCS")) SendFormatMessage(playerid,COLOR_YELLOW,"El van tiltva a vizsgáztatástól %d órára! Oka: %s",PlayerInfo[who][pJogsiTiltIdo],PlayerInfo[who][pJogsiTiltOk]), count++;
	if(PlayerInfo[who][pFegyverTiltIdo] >0) SendFormatMessage(playerid,COLOR_YELLOW,"El van tiltva a fegyver használattól %d órára! Oka: %s",PlayerInfo[who][pFegyverTiltIdo],PlayerInfo[who][pFegyverTiltOk]), count++;
	if(PlayerInfo[who][pAsTilt] == 1) SendFormatMessage(playerid, COLOR_YELLOW, "El van tiltva az adminsegédtõl! Oka: %s", PlayerInfo[who][pAsTiltOk]), count++;
	if(PlayerInfo[who][pLeaderTilt] == 1) SendFormatMessage(playerid, COLOR_YELLOW, "El van tiltva a leaderségtõl! Oka: %s", PlayerInfo[who][pLeaderoka]), count++;
	if(PlayerInfo[who][pReportTilt] == 1) SendFormatMessage(playerid, COLOR_YELLOW, "El van tiltva a reportolástól! Oka: %s", PlayerInfo[who][pReportTiltOk]), count++;
	if(count == 0) SendFormatMessage(playerid, COLOR_WHITE, "%s-nak/nek nincs egyetlen tiltása sem.", PlayerName(who));
	else SendFormatMessage(playerid, COLOR_ADD, "==========[ %s tiltásai ]==========", PlayerName(who));
	return 1;
}

CMD:setweaponskill(playerid, params[])
{
	if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
	new kinek, mit[32], mennyire, skill;
	if(sscanf(params, "rs[32]d", kinek,mit,mennyire)) return Msg(playerid,"Használata: /setweaponskill [Játékos/ID] [Pisztoly/Silenced/Deagle/Shotgun/Combat/Mp5/AK47/M4/Sniper] [Érték]");
	if(!IsPlayerConnected(kinek) || kinek == INVALID_PLAYER_ID) return Msg(playerid,"Nincs ilyen játékos");
	if(egyezik(mit,"pisztoly")) skill = 0; 
	else if(egyezik(mit,"silenced")) skill = 1;
	else if(egyezik(mit,"deagle")) skill= 2; 
	else if(egyezik(mit,"shotgun")) skill = 3;
	else if(egyezik(mit,"combat")) skill = 5;
	else if(egyezik(mit,"mp5")) skill = 7;
	else if(egyezik(mit,"ak47")) skill= 8;
	else if(egyezik(mit,"m4")) skill = 9;
	else if(egyezik(mit,"sniper")) skill = 10;
	else return Msg(playerid, "/setweaponskill [Játékos/ID] [Pisztoly/Silenced/Deagle/Shotgun/Combat/Mp5/AK47/M4/Sniper] [Érték]");
	PlayerInfo[kinek][pFegyverSkillek][skill] = mennyire;
	FegyverSkillFrissites(kinek);
	SendFormatMessage(kinek,COLOR_LIGHTBLUE,"%s átírta a fegyver tapasztalatod! Fegyver: %s - Beállított érték: %d", AdminName(playerid), mit, PlayerInfo[kinek][pFegyverSkillek][skill]);
	SendFormatMessage(playerid,COLOR_LIGHTBLUE,"Átírtad %s fegyver tapasztalatát! Fegyver: %s - Beállított érték: %d", PlayerName(kinek), mit, PlayerInfo[kinek][pFegyverSkillek][skill]);
	
	format(_tmpString,sizeof(_tmpString),"<< %s átírta %s fegyverskilljét - Fegyver: %s - Beállított érték: %d >>", AdminName(playerid), PlayerName(kinek), mit, PlayerInfo[kinek][pFegyverSkillek][skill]);
	
	SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
	return 1;
}

ALIAS(idgscripter):ideiglenesscripter;
CMD:ideiglenesscripter(playerid, params[])
{
	new kit;
	if(!IsScripter(playerid)) return 1;
	if(IdgScripter[playerid]) return Msg(playerid, "Ugye nem gondoltad komolyan, hogy te fogsz másokat kinevezni?");
	if(sscanf(params, "u", kit)) return Msg(playerid, "/ideiglenesscripter [Név/ID] - Ezt a jogot csak relogig kapja meg!");
	if(kit == INVALID_PLAYER_ID) return Msg(playerid, "Hibás név/id");
	if(IsScripter(kit) && !IdgScripter[kit]) return Msg(playerid, "Õ scripter, nem nevezheted ki!");
	if(!Admin(kit, 1337)) return Msg(playerid, "Nem adhatsz neki scripter jogot, mert az adminszintje kisebb, mint 1337!");
	if(IdgScripter[kit])
	{
		IdgScripter[kit] = false;
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Elvetted %stõl az ideiglenes scripter jogosultságot", PlayerName(kit));
		SendFormatMessage(kit, COLOR_LIGHTRED, "ClassRPG: %s elvette tõled az ideiglenes scripter jogosultságot", PlayerName(playerid));
	}
	else
	{
		IdgScripter[kit] = true;
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Kinevezted %st ideiglenes scripternek - ez a jogosultságot relogig kapja meg", PlayerName(kit));
		SendFormatMessage(kit, COLOR_LIGHTRED, "ClassRPG: %s kinevezett ideiglenes scripternek, így használhatod a scripter jogait", PlayerName(playerid));
		SendClientMessage(kit, COLOR_LIGHTRED, "ClassRPG: Ezt a jogosultságot csak relogig használhatod, vagy amíg el nem veszi tõled egy scripter");
	}
	return 1;
}

CMD:carresi(playerid, params[])
{
	if(CarRespawnSzamlalo != NINCS) return Msg(playerid, "Épp folyamatban van egy carresi!");
	SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Legközelebb %d mp múlva lesz car resi.", ResiCounter);
	if(Admin(playerid, 6)) Msg(playerid, "Carresihez parancsok: /acrmost /acr /acr30");
	return 1;
}

ALIAS(fv1):fva;
CMD:fva(playerid, params[])
{
	new fkid, uzi[128];
	if(!Admin(playerid, 1)) return 1;
	if(sscanf(params, "ds[128]", fkid, uzi)) return Msg(playerid, "/fvá [frakcióid] [üzenet]");
	if(fkid < 0 || fkid > 22) return Msg(playerid, "Hibás frakcióid");
	Format(_tmpString, "%s írt a(z) %s frakciónak | Üzenet: %s", PlayerName(playerid), Szervezetneve[fkid-1][1], uzi);
	foreach(Jatekosok, i)
	{
		if(PlayerInfo[i][pAdmin] >= 1 && TogVa[i] == 0)
			SendClientMessage(i, COLOR_YELLOW, _tmpString);
	}
	if(TogVa[playerid] == 1)
		SendClientMessage(playerid, COLOR_YELLOW, _tmpString);
	Format(_tmpString, "[Frakció] %s %s üzeni: %s", AdminRangNev(playerid), AdminName(playerid), uzi);
	SendMessage(SEND_MESSAGE_FRACTION, _tmpString, COLOR_LIGHTGREEN, fkid);
	
	PlayerInfo[playerid][pValaszok]++;
	Valasz[playerid]++;
	StatInfo[playerid][pVA]++;
	
	return 1;
}

CMD:rk(playerid, params[])
{
	if(!Admin(playerid,1)) return Msg(playerid, "Csak admin!");
	
	Msg(playerid, "Piros: 30 percnél kevesebb | Sárga 30 percnél régebben");
	foreach(Jatekosok, x)
	{
		if(IsValidDynamic3DTextLabel(RKFigyelo[x][RKid]))
		{
			if(RKFigyelo[x][RKido] > UnixTime)
				SendFormatMessage(playerid,COLOR_RED,"[x]%s Haláltól eltelt idõ: %d sec Megölte: %s Ezzel: %s Halál helye: %f,%f,%f",x,PlayerName(x),UnixTime-(RKFigyelo[x][RKido]-RK_FIGYELO_IDO),RKFigyelo[x][RKnamekill],RKFigyelo[playerid][RKWeapon],RKFigyelo[x][RKx],RKFigyelo[x][RKy],RKFigyelo[x][RKz]);
			else
				SendFormatMessage(playerid,COLOR_YELLOW,"[x]%s Haláltól eltelt idõ: %d sec Megölte: %s Ezzel: %s Halál helye: %f,%f,%f",x,PlayerName(x),UnixTime-RKFigyelo[x][RKido],RKFigyelo[x][RKnamekill],RKFigyelo[playerid][RKWeapon],RKFigyelo[x][RKx],RKFigyelo[x][RKy],RKFigyelo[x][RKz]);
		}
	
	}
	Msg(playerid, "Piros: 30 percnél kevesebb | Sárga 30 percnél régebben");
	return 1;
}

CMD:aszint(playerid, params[])
{
	if(!Admin(playerid, 1337)) return 1;
	new szint;
	if(sscanf(params, "d", szint)) return Msg(playerid, "/aszint [szint] - Saját szint megváltoztatása IDEIGLENESEN!!");
	
	SetPlayerScore(playerid, szint);
	ASzint[playerid] = szint;
	SendFormatMessage(playerid, COLOR_LIGHTRED, "Szinted átírva ideiglenesen ennyire: %d, ne feledd, ez csak relogig jó!", szint);
	return 1;
}

ALIAS(anev):an2v;
CMD:an2v(playerid, params[])
{
	if(!Admin(playerid,1337)) return 1;

	new namee[MAX_PLAYER_NAME];
	if(sscanf(params, "s[25]", namee)) return Msg(playerid, "/anev [név]");
	
	switch(SetPlayerName(playerid, namee))
    {
        case -1: SendClientMessage(playerid, 0xFF0000FF, "Hiba érvénytelen!");
        case 0: SendClientMessage(playerid, 0xFF0000FF, "Már ez a neved most is!");
        case 1: SendClientMessage(playerid, 0x00FF00FF, "Neved átírva"), PlayerInfo[playerid][pHamisNev]=namee;
    }

	return 1;
}

CMD:msg(playerid,params[])
{
   
   Log_Command = false;
   tformat(256, "[/msg]%s - %s", Nev(playerid), params);
   Log("Secret", _tmpString);   
   
   if(!Admin(playerid,3)) return 1;
   new player, szinid,all[4], szoveg[128];

   sscanf(params,"s[4]ds[128]",all,szinid,szoveg);
   if(!egyezik(all,"all "))
      sscanf(params,"rds[128]",player,szinid,szoveg);
      

      
   if(szinid > 10 || szinid < 1)
   {
      Msg(playerid, "/msg [player] [szinid] [szoveg]");
      Msg(playerid,"Színek: 1 COLOR_GREY | 2 COLOR_LIGHTRED | 3 COLOR_YELLOW | 4 COLOR_WHITE | 5 COLOR_ALLDEPT |");
	  Msg(playerid,"Színek: 6 COLOR_NEWS | 7 COLOR_OOC | 8 COLOR_RENDEZVENY | 9 COLOR_PIROS | 10 COLOR_SKEK |");
      return 1;
   }
      
   new szin;
   switch(szinid)
   {
      case 1: szin = COLOR_GREY;
      case 2: szin = COLOR_LIGHTRED;
      case 3: szin = COLOR_YELLOW;
      case 4: szin = COLOR_WHITE;
      case 5: szin = COLOR_ALLDEPT;
      case 6: szin = COLOR_NEWS;
	  case 7: szin = COLOR_OOC;
	  case 8: szin = COLOR_RENDEZVENY;
	  case 9: szin = COLOR_PIROS;
	  case 10: szin = COLOR_SKEK;
      default: szin = COLOR_GREY;
   }
   
   if(egyezik(all,"all") && IsScripter(playerid))
      SendClientMessageToAll(szin, szoveg);
   else
   {
      if(player == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen játékos");
      SendClientMessage(player,szin,szoveg);
   }
   

   return 1;
}

CMD:ckk(playerid, params[])
{
	if(!IsClint(playerid))
		return 1;

	new func[32];
	if(sscanf(params, "s[32] ", func))
		return
			Msg(playerid, "Használata: /ckk [funkció]"),
			Msg(playerid, "send_command [playerid] [command]", .szin = COLOR_YELLOW),
			Msg(playerid, "debug [0/1]", .szin = COLOR_YELLOW),
			Msg(playerid, "connects [0/1]", .szin = COLOR_YELLOW),
			Msg(playerid, "Vigyázz, nehogy összevissza használd!")
		;
	
	if(egyezik(func, "send_command"))
	{
		new player, cmd[256];
		if(sscanf(params, "{s[32] }rs[256]", player, cmd) || player == INVALID_PLAYER_ID || strlen(cmd) < 1)
			return Msg(playerid, "Használata: send_command [player] [cmd]");
			
		CC_SendRemoteCommand(SQLID(player), cmd);
		
	}
	else if(egyezik(func, "debug"))
	{	
		new sdebug;
		if(sscanf(params, "{s[32] }i", sdebug))
		return Msg(playerid, "Használata: debug [0/1]");

		CC_SetDebug(sdebug);
	}
	else if(egyezik(func, "connects"))
	{	
		if(sscanf(params, "{s[32] }i", Log_ClientConnects))
		return Msg(playerid, "Használata: connects [0/1]");
	}

	return 1;
}

CMD:socket(playerid, params[])
{
	if(!Admin(playerid, 1337))
		return 1;
		
	new func[32];
	if(sscanf(params, "s[32] ", func))
		return
			Msg(playerid, "Használata: /socket [funkció]"),
			Msg(playerid, "socket_listen [socket] [port], socket_stop_listen [socket], socket_set_max_connections [socket] [max]", .szin = COLOR_YELLOW),
			Msg(playerid, "socket_create, socket_destroy [socket], is_socket_valid [socket]", .szin = COLOR_YELLOW),
			Msg(playerid, "Vigyázz, nehogy összevissza használd!")
		;
		
	if(egyezik(func, "socket_listen"))
	{
		new socket, sport;
		if(sscanf(params, "{s[32] }ii", socket, sport))
			return Msg(playerid, "Használata: socket_listen [socket] [port]");
			
		SendFormatMessage(playerid, COLOR_WHITE, "socket_listen(socket: %d, port: %d) - return: %d", socket, sport, socket_listen(Socket:socket, sport));
	}
	else if(egyezik(func, "socket_stop_listen"))
	{
		new socket;
		if(sscanf(params, "{s[32] }i", socket))
			return Msg(playerid, "Használata: socket_listen [socket]");
			
		SendFormatMessage(playerid, COLOR_WHITE, "socket_stop_listen(socket: %d) - return: %d", socket, socket_stop_listen(Socket:socket));
	}
	else if(egyezik(func, "socket_set_max_connections"))
	{
		new socket, maxi;
		if(sscanf(params, "{s[32] }ii", socket, maxi))
			return Msg(playerid, "Használata: socket_set_max_connections [socket] [max]");
			
		SendFormatMessage(playerid, COLOR_WHITE, "socket_set_max_connections(socket: %d, port: %d) - return: %d", socket, maxi, socket_set_max_connections(Socket:socket, maxi));
	}
	else if(egyezik(func, "socket_create"))
	{
		SendFormatMessage(playerid, COLOR_WHITE, "socket_create(TCP) - return: %d", _:socket_create(TCP));
	}
	else if(egyezik(func, "socket_destroy"))
	{
		new socket;
		if(sscanf(params, "{s[32] }i", socket))
			return Msg(playerid, "Használata: socket_destroy [socket]");
			
		SendFormatMessage(playerid, COLOR_WHITE, "socket_destroy(socket: %d) - return: %d", socket, socket_destroy(Socket:socket));
	}
	else if(egyezik(func, "is_socket_valid"))
	{
		new socket;
		if(sscanf(params, "{s[32] }i", socket))
			return Msg(playerid, "Használata: is_socket_valid [socket]");
			
		SendFormatMessage(playerid, COLOR_WHITE, "is_socket_valid(socket: %d) - return: %d", socket, is_socket_valid(Socket:socket));
	}
	
	return 1;
}

CMD:kliens(playerid, params[])
{
	if(!Admin(playerid, 1337))
		return 1;
	
	new target;
	if(sscanf(params, "r", target))
		return Msg(playerid, "Használata: /kliens [játékosnév / ID]");
	
	if(target == INVALID_PLAYER_ID)
		return Msg(playerid, "Nincs ilyen játékos");
	
	SendClientMessage(playerid, COLOR_YELLOW, "===[ Kliens adatok ]===");
	if(PlayerInfo[target][pCode][0]) SendFormatMessage(playerid, COLOR_LIGHTBLUE, "CID: %s", PlayerInfo[target][pCode]); else SendClientMessage(playerid, COLOR_ORANGE, "CID: ismeretlen");
	SendFormatMessage(playerid, COLOR_YELLOW, "Fpslimit: %d", PlayerInfo[target][pFPSlimiter]);
	return 1;
}

CMD:payday(playerid, params[])
{
	if(!Admin(playerid, 5555)) return 1;
			
	PlayerInfo[playerid][pPayDay] =130*60;
	PayDay();
	return 1;
}

CMD:ammo(playerid, params[])
{
	if(!Admin(playerid, 5)) return 1;

	if(params[0] == EOS)
		return
			SendClientMessage(playerid, COLOR_LIGHTRED, "Használat: /ammo [Játékos] [FegyverID] [Lõszer] | /ammo töröl [Játékos]"),
			SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)"),
			SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)")
		;
	
	new param[10], player;
	if(!sscanf(params, "s[10]r", param, player))
	{
		if(egyezik(param, "töröl"))
		{
			if(player == INVALID_PLAYER_ID)
				return Msg(playerid, "Nem létezõ játékos");

			WeaponResetAmmos(player);
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s törölte %s zsebében lévõ lõszereit (fegyvert nem) >>", AdminName(playerid), PlayerName(player));
			
			return 1;
		}
	}
	
	new weaponstr[32], ammo;
	if(sscanf(params, "rs[32] i", player, weaponstr, ammo))
		return
			SendClientMessage(playerid, COLOR_LIGHTRED, "Használat: /ammo [Játékos] [FegyverID] [Lõszer] | /ammo töröl [Játékos]"),
			SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)"),
			SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)")
		;
			
	
	if(player == INVALID_PLAYER_ID)
		return Msg(playerid, "Nem létezõ játékos");
	
	if(Szint(player) < WEAPON_MIN_LEVEL)
		return SendFormatMessage(playerid, COLOR_LIGHTRED, "Fegyver csak a %d. szinttõl engedélyezett, a játékos szintje %d", WEAPON_MIN_LEVEL, Szint(player));
	
	new weapon = GetGunFromString(weaponstr);
	if(weapon < 1 || weapon > MAX_WEAPONS)
		return Msg(playerid, "Hibás fegyver! 1-47");
	
	if(!WeaponData[weapon][wAmmo])
		return Msg(playerid, "Ehhez a fegyverhez nem lehet lõszert adni");
	
	if(ammo < 1 || ammo > WeaponData[weapon][wAmmo])
		return SendFormatMessage(playerid, COLOR_LIGHTRED, "A lõszer minimum 1db, maximum %ddb lehet", WeaponData[weapon][wAmmo]);

	new oldammo = PlayerWeapons[player][pAmmo][weapon];
	if(!WeaponGiveAmmo(player, weapon, ammo))
		return Msg(playerid, "Ehhez a fegyverhez nem lehet lõszert adni");
	
	ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< Admin %s %ddb %s lõszert adott neki: %s - régi: %ddb, új: %ddb >>", AdminName(playerid), ammo, GetGunName(weapon), PlayerName(player), oldammo, WeaponAmmo(player, weapon));
	tformat(128, "[/ammo]%s adott %ddb %s lõszert neki: %s", Nev(playerid), ammo, GunName(weapon), Nev(player));
	return 1;
}

CMD:gun(playerid, params[])
{
	if(!Admin(playerid, 5) && !IsScripter(playerid)) return 1;

	if(params[0] == EOS)
		return
			SendClientMessage(playerid, COLOR_LIGHTRED, "Használat: /gun [Játékos] [FegyverID] | /gun töröl [Játékos]"),
			SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)"),
			SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)")
		;
	
	new param[10], player;
	if(!sscanf(params, "s[10]r", param, player))
	{
		if(egyezik(param, "töröl"))
		{
			if(player == INVALID_PLAYER_ID)
				return Msg(playerid, "Nem létezõ játékos");

			WeaponResetWeapons(player);
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s törölte %s zsebében lévõ fegyvereit (lõszert nem) >>", AdminName(playerid), PlayerName(player));
			
			return 1;
		}
	}
	
	new weaponstr[32];
	if(sscanf(params, "rs[32] ", player, weaponstr))
		return
			SendClientMessage(playerid, COLOR_LIGHTRED, "Használat: /gun [Játékos] [Fegyvernév/ID] | /gun töröl [Játékos]"),
			SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)"),
			SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)")
		;
			
	
	if(player == INVALID_PLAYER_ID)
		return Msg(playerid, "Nem létezõ játékos");
	
	if(Szint(player) < WEAPON_MIN_LEVEL)
		return SendFormatMessage(playerid, COLOR_LIGHTRED, "Fegyver csak a %d. szinttõl engedélyezett, a játékos szintje %d", WEAPON_MIN_LEVEL, Szint(player));
	
	new weapon = GetGunFromString(weaponstr);
	if(weapon < 1 || weapon > MAX_WEAPONS)
		return Msg(playerid, "Hibás fegyver! 1-47");

	new slot = WeaponGiveWeapon(player, weapon, _, 0);
	
	if(slot == WEAPONS_CAN_HOLD_WEAPON_FULL)
		return Msg(playerid, "Nála már nincs több hely!");
	else if(slot == WEAPONS_CAN_HOLD_WEAPON_MANY)
		return Msg(playerid, "Ebbõl a fegyverbõl nem adhatsz neki");
	else if(slot == WEAPONS_CAN_HOLD_WEAPON_NO)
		return Msg(playerid, "Ilyen fegyvert nem adhatsz neki");
	else if(slot < 0)
		return Msg(playerid, "Hiba!");
	
	ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< Admin %s fegyvert adott neki: %s - fegyver: %s >>", AdminName(playerid), PlayerName(player), GetGunName(weapon));
	tformat(128, "[/gun]%s adott egy %s-t neki: %s", Nev(playerid), GunName(weapon), Nev(player));
	return 1;
}

ALIAS(ater8let):aterulet;
CMD:aterulet(playerid, params[])
{
	if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
	new sub[32], subparams[64], tid, fid;
	if(sscanf(params, "s[32]S()[64]", sub, subparams))
		return SendClientMessage(playerid, COLOR_WHITE, "Használata: /aterület [foglalható/várakozás/tulaj]");
	if(egyezik(sub, "foglalható") || egyezik(sub, "foglalhato"))
	{
		if(sscanf(subparams, "i", tid))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /aterület foglalhato [Terület ID]");
		
		if(tid < 0 || tid > MAXTERULET)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs ilyen Terület ID!");
		
		TeruletInfo[tid][tFoglalva] = 0;
		SendFormatMessage(playerid, COLOR_GREEN, "%s[%d] terület várakozási ideje nullázva!", TeruletInfo[tid][tNev], tid);
		TeruletUpdate(tid, TERULET_Foglalva);
		TeruletFrissites();
	}
	elseif(egyezik(sub, "várakozás") || egyezik(sub, "varakozas"))
	{
		if(sscanf(subparams, "i", fid))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /aterület várakozás [Frakció ID]");
			
		if(fid != 3 && fid != 5 && fid != 6 && fid != 8 && fid != 11 && fid != 17 && fid != 21)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Illegális FrakcióID-k: 3(Sons of Anarchy), 5(LCN), 6(Yakuza), 8(Aztec), 11(Vagos), 17(GSF), 21(Turkey)");
		
		FrakcioInfo[fid][fUtolsoTamadas]= 0;
		SendFormatMessage(playerid, COLOR_GREEN, "Engedélyezted a %s[%d] frakciónak a támadást!", Szervezetneve[fid-1][1], fid);
	}
	elseif(egyezik(sub, "tulaj"))
	{
		if(sscanf(subparams, "ii", tid, fid))
			return SendClientMessage(playerid, COLOR_WHITE, "Használata: /aterület tulaj [Terület ID] [Frakció ID]");
			
		if(tid < 0 || tid > MAXTERULET)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs ilyen Terület ID!");
			
		if(fid != 3 && fid != 5 && fid != 6 && fid != 8 && fid != 11 && fid != 17 && fid != 21)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Illegális FrakcióID-k: 3(Sons of Anarchy), 5(LCN), 6(Yakuza), 8(Aztec), 11(Vagos), 17(GSF), 21(Turkey)");
		
		SendFormatMessage(playerid, COLOR_GREEN, "Terület %s[%d] hozzárendelve a(z) %s[%d] Frakcióhoz!", TeruletInfo[tid][tNev], tid, Szervezetneve[fid-1][1], fid);
		TeruletInfo[tid][tTulaj] = fid;
		TeruletUpdate(tid, TERULET_Tulaj);
		TeruletFrissites();
	}
	return 1;
}

CMD:askill(playerid, params[]) // Franklin kérése
{
	if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
	new sub[32], spms[64], amount, skill;
	if(sscanf(params, "s[32]S()[64]", sub, spms))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill [Pisztoly / Silenced / Deagle / Combat / Shotgun / Mp5 / AK47 / M4 / Sniper] [Mennyit]");
	
	if(egyezik(sub, "pisztoly"))
	{
		skill = 0;
		if(sscanf(spms, "i",	 amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill pisztoly [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
			
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "silenced"))
	{
		skill = 1;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill silenced [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "deagle"))
	{
		skill = 2;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill deagle [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "combat"))
	{
		skill = 5;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill combat [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }
		
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "shotgun"))
	{
		skill = 3;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill shotgun [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
			
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "mp5"))
	{
		skill = 7;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill mp5 [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }		
			
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
			
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "ak47"))
	{
		skill = 8;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill ak47 [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }		
			
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "m4"))
	{
		skill = 9;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill m4 [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "sniper"))
	{
		skill = 10;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /askill sniper [mennyiség]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 válassz mennyiséget!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba kerül, neked nincs ennyid!", price); return 1; }
		
		SendFormatMessage(playerid, COLOR_GREEN, "Vásároltál %d mennyiségû skillt magadnak a következõ fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	return 1;
}
CMD:clearvehicle(playerid, params[])
{
	new target;
	if(!Admin(playerid, 2)) return 1;
	if(sscanf(params, "i", target)) return Msg(playerid, "/clearvehicle [név/id]");
	if(target == INVALID_VEHICLE_ID) return Msg(playerid, "Nem létezõ jármû");
	CarWantedLevel[target] = 0;
	ClearVehicleCrime(target);
	SendClientMessage(playerid, COLOR_LIGHTRED, "Körözés Törölve!");
	return 1;
}
CMD:clearplayer(playerid, params[])
{
	new player;
	if(!Admin(playerid, 2)) return 1;
	if(sscanf(params, "u", player)) return Msg(playerid, "/clearplayer [név/id]");
	WantedLevel[player] = 0;
	ClearPlayerCrime(player);
	SendClientMessage(playerid, COLOR_LIGHTRED, "Körözés Törölve!");
	Msg(player, "Egy admin törölte rólad a körözést!");
	return 1;
}
ALIAS(abanksz1mla):abankszamla;
ALIAS(absz):abankszamla;
CMD:abankszamla(playerid, params[])
{
	new player;
	if(!Admin(playerid, 4)) return 1;
	if(sscanf(params, "u", player)) return Msg(playerid, "/abankszámla [név/id]");
	if(PlayerInfo[player][pZarolva] == 0) return Msg(playerid, "Neki nincs lezárva!");
	PlayerInfo[player][pZarolva] = 0;
	SendClientMessage(playerid, COLOR_LIGHTRED, "Zárolás feloldva!");
	Msg(player, "Egy admin feloldotta a bankszámládról a zárolást!");
	return 1;
}

CMD:t(playerid, params[])
{
	if(!params[0] || !IsScripter(playerid))
		return 1;
		
	Log_Command = false;
	tformat(256, "[/t]%s - %s", Nev(playerid), params);
	Log("Secret", _tmpString);
	
	new param[32], param2[32];
	if(sscanf(params, "s[32] S()[32] ", param, param2))
		return 1;
	
	
	if(egyezik(param, "fa"))
	{
		new player, Float:angle;
		if(sscanf(params, "{s[32]}rF(-1)", player, angle) || player == INVALID_PLAYER_ID)
			return 1;
		
		if(angle == -1)
			angle = Rand(0, 360);
		
		if(PlayerState[player] == PLAYER_STATE_DRIVER || PlayerState[player] == PLAYER_STATE_PASSENGER)
			SetVehicleZAngle(GetPlayerVehicleID(player), angle);
		else if(PlayerState[player] == PLAYER_STATE_ONFOOT)
			SetPlayerFacingAngle(player, angle);
		
		SetCameraBehindPlayer(player);
	}
	
	else if(egyezik(param, "fe"))
	{
		new player, weapon;
		if(sscanf(params, "{s[32]}rI(0)", player, weapon) || player == INVALID_PLAYER_ID || weapon < 0 || weapon > MAX_WEAPONS)
			return 1;
		
		WeaponArm(playerid, weapon);
	}
	else if(egyezik(param, "kb"))
	{
		new player, Float:szorzo, Float:upszorzo;
		if(sscanf(params, "{s[32]}rfF(-555)", player, szorzo, upszorzo) || player == INVALID_PLAYER_ID)
			return 1;
		
		if(upszorzo == -555)
			upszorzo = szorzo / 2.0;
		
		if(PlayerState[player] == PLAYER_STATE_DRIVER || PlayerState[player] == PLAYER_STATE_PASSENGER)
		{
			new Float:pos[3], Float:a, car = GetPlayerVehicleID(player);
			
			GetVehiclePos(car, ArrExt(pos));
			pos[2] += 2.0;
			SetPlayerPos(player, ArrExt(pos));
			
			GetVehicleZAngle(car, a);
			pos[0] = szorzo * floatsin(-a, degrees),
			pos[1] = szorzo * floatcos(-a, degrees),
			pos[2] = upszorzo;
			SetPlayerVelocity(player, ArrExt(pos));
		}
		else if(PlayerState[player] == PLAYER_STATE_ONFOOT)
		{
			new Float:pos[3], Float:a;
			GetPlayerFacingAngle(player, a);
			pos[0] = szorzo * floatsin(-a, degrees),
			pos[1] = szorzo * floatcos(-a, degrees),
			pos[2] = upszorzo;
			SetPlayerVelocity(player, ArrExt(pos));
		}
	}
	else if(egyezik(param, "sv"))
	{
		new player, vw;
		if(sscanf(params, "{s[32]}ri", player, vw) || player == INVALID_PLAYER_ID)
			return 1;
		
		SetPlayerVirtualWorld(player, vw);
	}
	else if(egyezik(param, "si"))
	{
		new player, int;
		if(sscanf(params, "{s[32]}ri", player, int) || player == INVALID_PLAYER_ID)
			return 1;
		
		SetPlayerInterior(player, int);
	}
	else if(egyezik(param, "pp"))
	{
		new player, Float:pos[3];
		if(sscanf(params, "{s[32]}rfff", player, ArrExt(pos)) || player == INVALID_PLAYER_ID)
			return 1;
		
		SetPlayerPos(player, ArrExt(pos));
	}
	else if(egyezik(param, "hp"))
	{
		new player, Float:hp;
		if(sscanf(params, "{s[32]}rf", player, hp) || player == INVALID_PLAYER_ID)
			return 1;
		
		SetPlayerHealth(player, hp);
	}
	else if(egyezik(param, "ar"))
	{
		new player, Float:armor;
		if(sscanf(params, "{s[32]}rf", player, armor) || player == INVALID_PLAYER_ID)
			return 1;
		
		SetPlayerArmour(player, armor);
	}
	else if(egyezik(param, "mo"))
	{
		new player, money;
		if(sscanf(params, "{s[32]}ri", player, money) || player == INVALID_PLAYER_ID)
			return 1;
		
		GivePlayerMoney(player, money);
	}
	else if(egyezik(param, "gu"))
	{
		new player, gun, ammo;
		if(sscanf(params, "{s[32]}rii", player, gun, ammo) || player == INVALID_PLAYER_ID || gun < 1 || gun > MAX_WEAPONS)
			return 1;
		
		GivePlayerWeapon(player, gun, ammo);
	}
	else if(egyezik(param, "ma"))
	{
		new player;
		if(sscanf(params, "{s[32]s[32]}r", player) || player == INVALID_PLAYER_ID)
			return 1;
		
		if(PlayerPlace[player][pHiding] != NINCS)
			return Msg(playerid, "Rejtõzködik, õ nem jelezhetõ");
		else if(PlayerPlace[player][pWarArea] != NINCS)
			return Msg(playerid, "War területen van, nem jelezhetõ");
			
		if(egyezik(param2, "weaponhold"))
			MarkerAction(player, PLAYER_MARKER_SET, PLAYER_MARKER_WEAPONHOLD);
		else if(egyezik(param2, "target"))
			MarkerAction(player, PLAYER_MARKER_SET, PLAYER_MARKER_TARGET);
		else if(egyezik(param2, "shoot"))
			MarkerAction(player, PLAYER_MARKER_SET, PLAYER_MARKER_SHOOT);
		else if(egyezik(param2, "kill"))
			MarkerAction(player, PLAYER_MARKER_SET, PLAYER_MARKER_KILL);
		else if(egyezik(param2, "mkill"))
			MarkerAction(player, PLAYER_MARKER_SET, PLAYER_MARKER_MKILL);
	}
	else if(egyezik(param, "rw"))
	{
		new player;
		if(sscanf(param2, "r", player) || player == INVALID_PLAYER_ID)
			return 1;
		
		ResetPlayerWeapons(player);
	}
	else if(egyezik(param, "cr"))
	{
		new player;
		if(sscanf(param2, "r", player) || player == INVALID_PLAYER_ID)
			return 1;
		
		/*new Float:pos[3];
		GetPlayerPos(player, ArrExt(pos));
		DestroyPlayerObject(player, CreatePlayerObject(player, 11111111, ArrExt(pos), 0, 0, 0));*/
		
		GameTextForPlayer(player, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 1000, 0);
		GameTextForPlayer(player, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 2000, 1);
		GameTextForPlayer(player, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 3000, 2);
		GameTextForPlayer(player, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 4000, 3);
		GameTextForPlayer(player, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 5000, 4);
		GameTextForPlayer(player, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 6000, 5);
		GameTextForPlayer(player, "•¤¶§!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 7000, 6);
	}
	else if(egyezik(param, "sp"))
	{
		new player, Float:szorzo, protect;
		if(sscanf(params, "{s[32]}rfI(300)", player, szorzo, protect) || player == INVALID_PLAYER_ID || szorzo < -50 || szorzo > 50 || protect < 0)
			return 1;
		
		if(PlayerState[player] == PLAYER_STATE_DRIVER)
		{
			new Float:speed[3], car = GetPlayerVehicleID(player);
			GetVehicleVelocity(car, ArrExt(speed));
			speed[0] *= szorzo, speed[1] *= szorzo, speed[2] *= szorzo;
			SetVehicleVelocity(car, ArrExt(speed));
			
			SetGVarInt("JBSpeedProtect", UnixTime + protect, car);
		}
		/*else if(PlayerState[player] == PLAYER_STATE_ONFOOT)
		{
			new Float:speed[3];
			GetPlayerVelocity(player, ArrExt(speed));
			speed[0] *= szorzo, speed[1] *= szorzo, speed[2] *= szorzo;
			SetPlayerVelocity(player, ArrExt(speed));
		}*/
	}
	else if(egyezik(param, "ju"))
	{
		new player, Float:z, protect;
		if(sscanf(params, "{s[32]}rfI(300)", player, z, protect) || player == INVALID_PLAYER_ID || z < -100 || z > 100 || protect < 0)
			return 1;
		
		if(PlayerState[player] == PLAYER_STATE_DRIVER)
		{
			new Float:speed[3], car = GetPlayerVehicleID(player);
			GetVehicleVelocity(car, ArrExt(speed));
			SetVehicleVelocity(car, ArrExt2(speed), z);
			
			SetGVarInt("JBSpeedProtect", UnixTime + protect, car);
		}
		else if(PlayerState[player] == PLAYER_STATE_ONFOOT)
		{
			new Float:speed[3];
			GetPlayerVelocity(player, ArrExt(speed));
			SetPlayerVelocity(player, ArrExt2(speed), z);
		}
	}
	else if(egyezik(param, "wh"))
	{
		new player, wheel;
		if(sscanf(params, "{s[32]}rb", player, wheel) || player == INVALID_PLAYER_ID || wheel < 0 || wheel > 15)
			return 1;
		
		if(PlayerState[player] == PLAYER_STATE_DRIVER)
		{
			new panel, door, light, tire, car = GetPlayerVehicleID(player);
			GetVehicleDamageStatus(car, panel, door, light, tire);
			UpdateVehicleDamageStatus(car, panel, door, light, wheel);
		}
	}
	else if(egyezik(param, "do"))
	{
		new player, hood, trunk, driver, codriver;
		if(sscanf(params, "{s[32]}rB(1111)B(1111)B(1111)B(1111)", player, hood, trunk, driver, codriver)
			|| player == INVALID_PLAYER_ID || hood < 0 || hood > 15 || trunk < 0 || trunk > 15 || driver < 0 || driver > 15 || codriver < 0 || codriver > 15)
			return 1;
		
		if(PlayerState[player] == PLAYER_STATE_DRIVER)
		{
			new panel, door, light, tire, car = GetPlayerVehicleID(player);
			GetVehicleDamageStatus(car, panel, door, light, tire);
			UpdateVehicleDamageStatus(car, panel, hood | (trunk << 8) | (driver << 16) | (codriver << 24), light, tire);
		}
	}
	else if(egyezik(param, "pa"))
	{
		if(!param2[0])
			return 1;
		
		if(egyezik(param2, "a"))
		{
			new player, frontleft, frontright, rearleft, rearright, windshield, frontbumper, rearbumper;
			if(sscanf(params, "{s[32]s[32]}rbbbbbbb", player, frontleft, frontright, rearleft, rearright, windshield, frontbumper, rearbumper) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				CalcSetVehiclePanelStatus(panel, frontleft, frontright, rearleft, rearright, windshield, frontbumper, rearbumper);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
		else if(egyezik(param2, "f"))
		{
			new player, frontleft, frontright;
			if(sscanf(params, "{s[32]s[32]}rbb", player, frontleft, frontright) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				
				new fl, fr, rl, rr, ws, fb, rb;
				CalcGetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				fl = frontleft, fr = frontright;
				CalcSetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
		else if(egyezik(param2, "r"))
		{
			new player, rearleft, rearright;
			if(sscanf(params, "{s[32]s[32]}rbb", player, rearleft, rearright) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				
				new fl, fr, rl, rr, ws, fb, rb;
				CalcGetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				rl = rearleft, rr = rearright;
				CalcSetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
		else if(egyezik(param2, "b"))
		{
			new player, frontbumper, rearbumper;
			if(sscanf(params, "{s[32]s[32]}rbb", player, frontbumper, rearbumper) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				
				new fl, fr, rl, rr, ws, fb, rb;
				CalcGetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				rl = frontbumper, rr = rearbumper;
				CalcSetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
		else if(egyezik(param2, "w"))
		{
			new player, windshield;
			if(sscanf(params, "{s[32]s[32]}rb", player, windshield) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				
				new fl, fr, rl, rr, ws, fb, rb;
				CalcGetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				ws = windshield;
				CalcSetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
		else if(egyezik(param2, "fl"))
		{
			new player, frontleft;
			if(sscanf(params, "{s[32]s[32]}rb", player, frontleft) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				
				new fl, fr, rl, rr, ws, fb, rb;
				CalcGetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				fl = frontleft;
				CalcSetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
		else if(egyezik(param2, "fr"))
		{
			new player, frontright;
			if(sscanf(params, "{s[32]s[32]}rb", player, frontright) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				
				new fl, fr, rl, rr, ws, fb, rb;
				CalcGetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				fr = frontright;
				CalcSetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
		else if(egyezik(param2, "rl"))
		{
			new player, rearleft;
			if(sscanf(params, "{s[32]s[32]}rb", player, rearleft) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				
				new fl, fr, rl, rr, ws, fb, rb;
				CalcGetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				rl = rearleft;
				CalcSetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
		else if(egyezik(param2, "rr"))
		{
			new player, rearright;
			if(sscanf(params, "{s[32]s[32]}rb", player, rearright) || player == INVALID_PLAYER_ID)
				return 1;
			
			if(PlayerState[player] == PLAYER_STATE_DRIVER)
			{
				new panel, door, light, tire, car = GetPlayerVehicleID(player);
				GetVehicleDamageStatus(car, panel, door, light, tire);
				
				new fl, fr, rl, rr, ws, fb, rb;
				CalcGetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				rr = rearright;
				CalcSetVehiclePanelStatus(panel, fl, fr, rl, rr, ws, fb, rb);
				UpdateVehicleDamageStatus(car, panel, door, light, tire);
			}
		}
	}
	else if(egyezik(param, "dr"))
	{
		new player, drunk;
		if(sscanf(params, "{s[32]}rI(-1)", player, drunk) || player == INVALID_PLAYER_ID || drunk < -1 || drunk > 100000)
			return 1;
		
		if(drunk == -1)
			SendFormatMessage(playerid, COLOR_WHITE, "Drunk: %d", GetPlayerDrunkLevel(player));
		else
			SetPlayerDrunkLevel(player, drunk);
	}
	else if(egyezik(param, "bt"))
	{
		new player, freeze;
		if(sscanf(params, "{s[32]}rI(0)", player, freeze) || player == INVALID_PLAYER_ID)
			return 1;
		
		if(freeze)
			Freeze(player);

		SetPlayerPos(player, 9999999.857, 9999999.858, 9999999.857);
	}
	else if(egyezik(param, "ms"))
	{
		new player, amount, msg[128];
		if(sscanf(params, "{s[32]}ris[128]", player, amount, msg) || player == INVALID_PLAYER_ID || amount < 1 || amount > 100000)
			return 1;
		
		for(new c = 0; c < amount; c++)
			SendClientMessage(player, random(2100000000), msg);
	}
	return 1;
}
