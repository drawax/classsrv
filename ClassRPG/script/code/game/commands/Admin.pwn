#if defined __game_commands_Admin
	#endinput
#endif
#define __game_commands_Admin

/****************************
 *           cmdk           *
 *    �: 1   �: 4   �: 7    *
 *    �: 2   �: 5   �: 8    *
 *    �: 3   �: 6   �: 9    *  
 ****************************/
 
CMD:adminfelirat(playerid, params[])//feliratot rak a fejed f�l�s by Amos
{
	if(!IsSuper(playerid)) return 1;
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0) return Msg(playerid, "Most nem besz�lhetsz!");
	if(Leutve[playerid]) return Msg(playerid,"Le�tve nem cselekedhetsz semmit!");
	new result[100], string[140];
	if(sscanf(params, "s[100]", result))
	{
		Msg(playerid, "Haszn�lat: /adminfelirat [le�r�s]");
		Msg(playerid, "A kikapcsol�s�hoz: /adminfelirat ki");
		return 1;
	}
	if(strlen(result) >3) return Msg(playerid, "A le�r�snak hosszabbnak kell lennie, mint 3 karakter.");
	if(strcmp(result, "ki", true) == 0)
	{
		if(adminszoveg[playerid] == 0) return Msg(playerid, "Most m�r nincsen felirat a fejed f�l�tt.");
		DestroyDynamic3DTextLabel(adminfelirat[playerid]);
		Msg(playerid, "/adminfelirat t�r�lve.");
		acselekves[playerid] = 0;
		return 1;
	}
	if(adminszoveg[playerid] == 0)
	{
		format(string, sizeof(string), "* %s *", playerid);
		adminfelirat[playerid] = CreateDynamic3DTextLabel(string, COLOR_RED, 0.0, 0.0, 0.0, 40.0, playerid);
		format(string, sizeof(string), "FELIRAT: %s", string);
		Msg(playerid, "/fme kirakva a fejed f�l�.");
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

ALIAS(b5k2s):poke;//B�K�S
ALIAS(b5k):poke;
CMD:poke(playerid, params[])
{
		if(!Admin(playerid, 1))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[Hiba]: Ezt a parancsot nem haszn�lhatod!");
			
        new jatekos, oka[64];
        if(sscanf(params, "us[64]", jatekos, oka))
            return SendClientMessage(playerid, COLOR_WHITE, "Haszn�lata: /poke [J�t�kos] [Oka]");
			
		if(jatekos == INVALID_PLAYER_ID || IsPlayerNPC(jatekos))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "[Hiba]: Nincs ilyen j�t�kos!");
			
		SendFormatMessage(playerid, COLOR_LIGHTRED, "Megb�kted %s-t, Oka: %s", PlayerName(jatekos), oka);
		SendFormatMessage(jatekos, COLOR_LIGHTRED, "[B�k�s] %s megb�k�tt | Oka: %s", PlayerName(playerid), oka);
			

		return 1;
}

ALIAS(adafk):adminafk;//ADMINAFK
CMD:adminafk(playerid, params[])
{
	if(!Admin(playerid, 2) && !IsScripter(playerid)) return Msg(playerid, "Nem-nem");
	if(AdminDuty[playerid]) return Msg(playerid, "Adminszoliba elrejt�zni? Neh�z lesz.. :D");
	{
		if(GetPlayerColor(playerid) == COLOR_INVISIBLE)
		{
			SetPlayerColor(playerid, COLOR_BLACK);
			Msg(playerid, "Bekapcsolva!");
			Msg(playerid, "CSAK MEGFIGYEL�SRE HASZN�LHAT�!! Ha m�sra haszn�lod, vagy kiadod m�snak, akkor S�LYOS b�ntet�sre sz�m�ts!!!", false, COLOR_YELLOW);
		}
		else
		{
			SetPlayerColor(playerid, COLOR_INVISIBLE);
			Msg(playerid, "Kikapcsolva!");
		}
	}
	return 1;
}

 
ALIAS(5l2sid6):olesido;//�L�SID�
CMD:olesido(playerid, params[])
{
	SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: A k�vetkez� k�rh�z %d m�sodperccel t�bb id� lesz az �l�seid sz�ma miatt.", PlayerInfo[playerid][pOlesIdo]);
	new p1[32], p2, p3;
	if(Admin(playerid, 4))
	{
		if(sscanf(params, "s[16]ud", p1, p2, p3)) return Msg(playerid, "/�l�sid� [give/set] [j�t�kos] [mennyis�g (m�sodpercben!)]");
		if(egyezik(p1, "give"))
		{
			if(p2 == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(PlayerInfo[p2][pOlesIdo] < -p3) return Msg(playerid, "M�nuszba nem rakhatod az �sszes k�rh�zidej�t!");
			PlayerInfo[p2][pOlesIdo] += p3;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Hozz�adt�l %s k�rh�zidej�hez ennyit: %d | �j k�rh�zideje: %d", PlayerName(p2), p3, PlayerInfo[p2][pOlesIdo]);
			format(_tmpString,sizeof(_tmpString),"<< %s hozz�adott %s k�rh�zidej�hez %d m�sodpercet | �j k�rh�zideje: %d", AdminName(playerid), PlayerName(p2), p3, PlayerInfo[p2][pOlesIdo]);
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
		}
		elseif(egyezik(p1, "set"))
		{
			if(p2 == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			new olesideje = PlayerInfo[p2][pOlesIdo];
			if(p3 < 0) return Msg(playerid, "M�nuszba nem rakhatod az �sszes k�rh�zidej�t!");
			PlayerInfo[p2][pOlesIdo] = p3;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Be�ll�tottad %s k�rh�zidej�t ennyire: %d | R�gi k�rh�zideje: %d", PlayerName(p2), p3, olesideje);
			format(_tmpString,sizeof(_tmpString),"<< %s be�ll�totta %s k�rh�zidej�t %d m�sodpercre | R�gi k�rh�zideje: %d", AdminName(playerid), PlayerName(p2), p3, olesideje);
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
		Msg(playerid,"/carresiset [id� / db / info]");
		Msg(playerid,"id� = -1 kikapcsol, ezek a be�l�t�sok szerver restartig maradnak!");
		return 1;
	}
	if(egyezik(param,"id�") || egyezik(param,"ido"))
	{
		if(sscanf(func, "d",ResiCounter)) return Msg(playerid,"/carresiset id� (3600 == 1 �ra)");
	
		if(ResiCounter < NINCS) ResiCounter=NINCS;
		CarRespawnSzamlalo = NINCS;
		ResiCounterFIX = ResiCounter;
		SendFormatMessage(playerid,COLOR_YELLOW,"Az id� �t�rva: %d sec",ResiCounter);
		
	}
	if(egyezik(param,"db"))
	{
	
		if(sscanf(func, "d",CarresiDB)) return Msg(playerid,"/carresiset db (3600 == 1 �ra)");
	
		if(CarresiDB < 1) CarresiDB=10;
		SendFormatMessage(playerid,COLOR_YELLOW,"A DB �t�rva: %d -re",CarresiDB);

	
	}
	if(egyezik(param,"info"))
	{
		
		SendFormatMessage(playerid,COLOR_YELLOW,"[INFO] %d DB, %d sec id�, %d Szamlalo ",CarresiDB, ResiCounter, CarRespawnSzamlalo);
	
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
		Msg(playerid, "/object [funkci�]");
		Msg(playerid, "Funkci�k: [Go | uj | mod| �res | t�r�l | k�zel | objecttorles]");
		Msg(playerid, "mod= m�d�s�t");
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
		
		if(atmid < 0 || atmid > MAX_OBJECTSZ) return Msg(playerid, "Hib�s object ID.");
		SetPlayerPos(playerid, OBJECT[atmid][sPosX], OBJECT[atmid][sPosY], OBJECT[atmid][sPosZ]+1.5);
		SendFormatMessage(playerid,  COLOR_LIGHTGREEN, "* Teleport�lt�l az object-hez. (ID: %d - Koord�n�ta: X: %f | Y: %f | Z: %f) ", atmid, OBJECT[atmid][sPosX], OBJECT[atmid][sPosY], OBJECT[atmid][sPosZ]);
	}
	if(egyezik(param, "uj"))
	{
		new tipus;
		if(sscanf(func, "d", tipus))
		{
			Msg(playerid, "/object uj [t�pus]");
			Msg(playerid, "Hotdog: 1340, | Italautomata: 1775 | Csokiautomata: 1776 | Szerencseg�p: 2754 | Telefon: 1216");
			Msg(playerid, "Ha nem �rsz id-t automata �resra rakja.");
			
			if(IsSuper(playerid))
			{
				Msg(playerid,"19808-19999 (19901 kiv�tel�vel)");
				Msg(playerid,"Sebes�g korl�tok: 30: 19878 50: 19880 90: 19884 130:19888 �vezet30: 19893 / 19895");
				Msg(playerid,"Bukkan�: 19915 Villamos: 19936 Vas�t:19937 Busz: 19946 Aut�p�lya:19808/19809 Magass�g: 19867");
				Msg(playerid,"k�telez� halad�si ir�ny el�lre: 19818 el�lre-jobbra: 19819 el�lre-balra: 19820 balra: 19821 jobbra:19822");
				Msg(playerid, "1225 robban�");
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
		
		
		
		
		if(id < 0 || id >= MAX_OBJECTSZ) return Msg(playerid, "Nincs �res hely!");

		new Float:X, Float:Y, Float:Z, Float:A;
		GetPlayerPos(playerid, X, Y, Z);
		GetPlayerFacingAngle(playerid, A);
		
		id=UresObject();
		if(id == NINCS) return Msg(playerid, "Nincs �res hely");

	
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

		SendFormatMessage(playerid,  COLOR_LIGHTGREEN, "* OBJECT lerakva. (ID: %d - T�pus: %d Koord�n�ta: X: %.2f | Y: %.2f | Z: %.2f | A: %.2f | VW: %d | INT: %d) ", id, tipus, OBJECT[id][sPosX], OBJECT[id][sPosY], OBJECT[id][sPosZ], OBJECT[id][sPosA], OBJECT[id][sVw],OBJECT[id][sInt]);
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
	if(egyezik(param, "t�r�l"))
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
		
		if(id < 0 || id >= MAX_OBJECTSZ) return Msg(playerid, "Hib�s SORSZ�M ID.");
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
		SendFormatMessage(playerid,  COLOR_LIGHTGREEN, "T�r�lve Object: %d",id);
		
		INI_Save(INI_TYPE_OBJECT, id);
		//SaveOBJECT();
	}
	if(egyezik(param, "�res"))
	{
		new szamlalo;
		for(new a = 0; a < MAX_OBJECTSZ; a++)
		{
			if(OBJECT[a][sTipus] == 0)
			{
				SendFormatMessage(playerid,  COLOR_LIGHTGREEN, "*�res Object: ID: %d ",a);
				szamlalo++;
				if(szamlalo > 6) return 1;
			}
		}
	}
	if(egyezik(param, "k�zel"))
	{
		SendClientMessage(playerid, COLOR_WHITE, "====[ Legk�zelebbi object ]=====");
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

		if(legkozelebb == 5000.0) return Msg(playerid, "Nincs tal�lat");

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
		Msg(playerid, "Frakci�n k�v�li karakterskin be�ll�tva - bekapcsolva");
	}
	else
	{
		AdminDutySkin[playerid] = 0;
		if(PlayerInfo[playerid][pChar] > 0 && OnDuty[playerid] || PlayerInfo[playerid][pChar] > 0 && !LegalisSzervezetTagja(playerid) && !Civil(playerid))
			SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
		else
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
		Msg(playerid, "Frakci�s karakterskin be�ll�tva - kikapcsolva");
	}
	return 1;
}

/*ALIAS(mulat1s):mulatas;
CMD:mulatas(playerid, params[])
{
	if(SQLID(playerid) == 1 || SQLID(playerid) == 5637 || SQLID(playerid) == 8172424 || IsTerno(playerid))
	{
		if(MulatasTime > UnixTime) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Pihenj kicsit, m�g nem mulathatsz! Legk�zelebb %d m�sodperc m�lva kezdhetsz el mulatozni", MulatasTime-UnixTime);
		MulatasTime = UnixTime+3600;
		ABroadCastFormat(Pink, 1, "<< %s mulat�s cs�sz�r jelen van - mulat�s elkezdve! >>", AdminName(playerid));
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
	if(sscanf(params, "u", who)) return Msg(playerid, "/tilt�sok [N�v/ID]");
	SendFormatMessage(playerid, COLOR_ADD, "==========[ %s tilt�sai ]==========", PlayerName(who));
	if(PlayerInfo[who][pFrakcioTiltIdo] >0) SendFormatMessage(playerid,COLOR_YELLOW,"El van tiltva a frakci�kt�l %d �r�ra! Oka: %s",PlayerInfo[who][pFrakcioTiltIdo],PlayerInfo[who][pFrakcioTiltOk]), count++;
	if(PlayerInfo[who][pJogsiTiltIdo] >0 && !egyezik(PlayerInfo[who][pJogsiTiltOk],"NINCS")) SendFormatMessage(playerid,COLOR_YELLOW,"El van tiltva a vizsg�ztat�st�l %d �r�ra! Oka: %s",PlayerInfo[who][pJogsiTiltIdo],PlayerInfo[who][pJogsiTiltOk]), count++;
	if(PlayerInfo[who][pFegyverTiltIdo] >0) SendFormatMessage(playerid,COLOR_YELLOW,"El van tiltva a fegyver haszn�latt�l %d �r�ra! Oka: %s",PlayerInfo[who][pFegyverTiltIdo],PlayerInfo[who][pFegyverTiltOk]), count++;
	if(PlayerInfo[who][pAsTilt] == 1) SendFormatMessage(playerid, COLOR_YELLOW, "El van tiltva az adminseg�dt�l! Oka: %s", PlayerInfo[who][pAsTiltOk]), count++;
	if(PlayerInfo[who][pLeaderTilt] == 1) SendFormatMessage(playerid, COLOR_YELLOW, "El van tiltva a leaders�gt�l! Oka: %s", PlayerInfo[who][pLeaderoka]), count++;
	if(PlayerInfo[who][pReportTilt] == 1) SendFormatMessage(playerid, COLOR_YELLOW, "El van tiltva a reportol�st�l! Oka: %s", PlayerInfo[who][pReportTiltOk]), count++;
	if(count == 0) SendFormatMessage(playerid, COLOR_WHITE, "%s-nak/nek nincs egyetlen tilt�sa sem.", PlayerName(who));
	else SendFormatMessage(playerid, COLOR_ADD, "==========[ %s tilt�sai ]==========", PlayerName(who));
	return 1;
}

CMD:setweaponskill(playerid, params[])
{
	if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
	new kinek, mit[32], mennyire, skill;
	if(sscanf(params, "rs[32]d", kinek,mit,mennyire)) return Msg(playerid,"Haszn�lata: /setweaponskill [J�t�kos/ID] [Pisztoly/Silenced/Deagle/Shotgun/Combat/Mp5/AK47/M4/Sniper] [�rt�k]");
	if(!IsPlayerConnected(kinek) || kinek == INVALID_PLAYER_ID) return Msg(playerid,"Nincs ilyen j�t�kos");
	if(egyezik(mit,"pisztoly")) skill = 0; 
	else if(egyezik(mit,"silenced")) skill = 1;
	else if(egyezik(mit,"deagle")) skill= 2; 
	else if(egyezik(mit,"shotgun")) skill = 3;
	else if(egyezik(mit,"combat")) skill = 5;
	else if(egyezik(mit,"mp5")) skill = 7;
	else if(egyezik(mit,"ak47")) skill= 8;
	else if(egyezik(mit,"m4")) skill = 9;
	else if(egyezik(mit,"sniper")) skill = 10;
	else return Msg(playerid, "/setweaponskill [J�t�kos/ID] [Pisztoly/Silenced/Deagle/Shotgun/Combat/Mp5/AK47/M4/Sniper] [�rt�k]");
	PlayerInfo[kinek][pFegyverSkillek][skill] = mennyire;
	FegyverSkillFrissites(kinek);
	SendFormatMessage(kinek,COLOR_LIGHTBLUE,"%s �t�rta a fegyver tapasztalatod! Fegyver: %s - Be�ll�tott �rt�k: %d", AdminName(playerid), mit, PlayerInfo[kinek][pFegyverSkillek][skill]);
	SendFormatMessage(playerid,COLOR_LIGHTBLUE,"�t�rtad %s fegyver tapasztalat�t! Fegyver: %s - Be�ll�tott �rt�k: %d", PlayerName(kinek), mit, PlayerInfo[kinek][pFegyverSkillek][skill]);
	
	format(_tmpString,sizeof(_tmpString),"<< %s �t�rta %s fegyverskillj�t - Fegyver: %s - Be�ll�tott �rt�k: %d >>", AdminName(playerid), PlayerName(kinek), mit, PlayerInfo[kinek][pFegyverSkillek][skill]);
	
	SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
	return 1;
}

ALIAS(idgscripter):ideiglenesscripter;
CMD:ideiglenesscripter(playerid, params[])
{
	new kit;
	if(!IsScripter(playerid)) return 1;
	if(IdgScripter[playerid]) return Msg(playerid, "Ugye nem gondoltad komolyan, hogy te fogsz m�sokat kinevezni?");
	if(sscanf(params, "u", kit)) return Msg(playerid, "/ideiglenesscripter [N�v/ID] - Ezt a jogot csak relogig kapja meg!");
	if(kit == INVALID_PLAYER_ID) return Msg(playerid, "Hib�s n�v/id");
	if(IsScripter(kit) && !IdgScripter[kit]) return Msg(playerid, "� scripter, nem nevezheted ki!");
	if(!Admin(kit, 1337)) return Msg(playerid, "Nem adhatsz neki scripter jogot, mert az adminszintje kisebb, mint 1337!");
	if(IdgScripter[kit])
	{
		IdgScripter[kit] = false;
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Elvetted %st�l az ideiglenes scripter jogosults�got", PlayerName(kit));
		SendFormatMessage(kit, COLOR_LIGHTRED, "ClassRPG: %s elvette t�led az ideiglenes scripter jogosults�got", PlayerName(playerid));
	}
	else
	{
		IdgScripter[kit] = true;
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Kinevezted %st ideiglenes scripternek - ez a jogosults�got relogig kapja meg", PlayerName(kit));
		SendFormatMessage(kit, COLOR_LIGHTRED, "ClassRPG: %s kinevezett ideiglenes scripternek, �gy haszn�lhatod a scripter jogait", PlayerName(playerid));
		SendClientMessage(kit, COLOR_LIGHTRED, "ClassRPG: Ezt a jogosults�got csak relogig haszn�lhatod, vagy am�g el nem veszi t�led egy scripter");
	}
	return 1;
}

CMD:carresi(playerid, params[])
{
	if(CarRespawnSzamlalo != NINCS) return Msg(playerid, "�pp folyamatban van egy carresi!");
	SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Legk�zelebb %d mp m�lva lesz car resi.", ResiCounter);
	if(Admin(playerid, 6)) Msg(playerid, "Carresihez parancsok: /acrmost /acr /acr30");
	return 1;
}

ALIAS(fv1):fva;
CMD:fva(playerid, params[])
{
	new fkid, uzi[128];
	if(!Admin(playerid, 1)) return 1;
	if(sscanf(params, "ds[128]", fkid, uzi)) return Msg(playerid, "/fv� [frakci�id] [�zenet]");
	if(fkid < 0 || fkid > 22) return Msg(playerid, "Hib�s frakci�id");
	Format(_tmpString, "%s �rt a(z) %s frakci�nak | �zenet: %s", PlayerName(playerid), Szervezetneve[fkid-1][1], uzi);
	foreach(Jatekosok, i)
	{
		if(PlayerInfo[i][pAdmin] >= 1 && TogVa[i] == 0)
			SendClientMessage(i, COLOR_YELLOW, _tmpString);
	}
	if(TogVa[playerid] == 1)
		SendClientMessage(playerid, COLOR_YELLOW, _tmpString);
	Format(_tmpString, "[Frakci�] %s %s �zeni: %s", AdminRangNev(playerid), AdminName(playerid), uzi);
	SendMessage(SEND_MESSAGE_FRACTION, _tmpString, COLOR_LIGHTGREEN, fkid);
	
	PlayerInfo[playerid][pValaszok]++;
	Valasz[playerid]++;
	StatInfo[playerid][pVA]++;
	
	return 1;
}

CMD:rk(playerid, params[])
{
	if(!Admin(playerid,1)) return Msg(playerid, "Csak admin!");
	
	Msg(playerid, "Piros: 30 percn�l kevesebb | S�rga 30 percn�l r�gebben");
	foreach(Jatekosok, x)
	{
		if(IsValidDynamic3DTextLabel(RKFigyelo[x][RKid]))
		{
			if(RKFigyelo[x][RKido] > UnixTime)
				SendFormatMessage(playerid,COLOR_RED,"[x]%s Hal�lt�l eltelt id�: %d sec Meg�lte: %s Ezzel: %s Hal�l helye: %f,%f,%f",x,PlayerName(x),UnixTime-(RKFigyelo[x][RKido]-RK_FIGYELO_IDO),RKFigyelo[x][RKnamekill],RKFigyelo[playerid][RKWeapon],RKFigyelo[x][RKx],RKFigyelo[x][RKy],RKFigyelo[x][RKz]);
			else
				SendFormatMessage(playerid,COLOR_YELLOW,"[x]%s Hal�lt�l eltelt id�: %d sec Meg�lte: %s Ezzel: %s Hal�l helye: %f,%f,%f",x,PlayerName(x),UnixTime-RKFigyelo[x][RKido],RKFigyelo[x][RKnamekill],RKFigyelo[playerid][RKWeapon],RKFigyelo[x][RKx],RKFigyelo[x][RKy],RKFigyelo[x][RKz]);
		}
	
	}
	Msg(playerid, "Piros: 30 percn�l kevesebb | S�rga 30 percn�l r�gebben");
	return 1;
}

CMD:aszint(playerid, params[])
{
	if(!Admin(playerid, 1337)) return 1;
	new szint;
	if(sscanf(params, "d", szint)) return Msg(playerid, "/aszint [szint] - Saj�t szint megv�ltoztat�sa IDEIGLENESEN!!");
	
	SetPlayerScore(playerid, szint);
	ASzint[playerid] = szint;
	SendFormatMessage(playerid, COLOR_LIGHTRED, "Szinted �t�rva ideiglenesen ennyire: %d, ne feledd, ez csak relogig j�!", szint);
	return 1;
}

ALIAS(anev):an2v;
CMD:an2v(playerid, params[])
{
	if(!Admin(playerid,1337)) return 1;

	new namee[MAX_PLAYER_NAME];
	if(sscanf(params, "s[25]", namee)) return Msg(playerid, "/anev [n�v]");
	
	switch(SetPlayerName(playerid, namee))
    {
        case -1: SendClientMessage(playerid, 0xFF0000FF, "Hiba �rv�nytelen!");
        case 0: SendClientMessage(playerid, 0xFF0000FF, "M�r ez a neved most is!");
        case 1: SendClientMessage(playerid, 0x00FF00FF, "Neved �t�rva"), PlayerInfo[playerid][pHamisNev]=namee;
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
      Msg(playerid,"Sz�nek: 1 COLOR_GREY | 2 COLOR_LIGHTRED | 3 COLOR_YELLOW | 4 COLOR_WHITE | 5 COLOR_ALLDEPT |");
	  Msg(playerid,"Sz�nek: 6 COLOR_NEWS | 7 COLOR_OOC | 8 COLOR_RENDEZVENY | 9 COLOR_PIROS | 10 COLOR_SKEK |");
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
      if(player == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen j�t�kos");
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
			Msg(playerid, "Haszn�lata: /ckk [funkci�]"),
			Msg(playerid, "send_command [playerid] [command]", .szin = COLOR_YELLOW),
			Msg(playerid, "debug [0/1]", .szin = COLOR_YELLOW),
			Msg(playerid, "connects [0/1]", .szin = COLOR_YELLOW),
			Msg(playerid, "Vigy�zz, nehogy �sszevissza haszn�ld!")
		;
	
	if(egyezik(func, "send_command"))
	{
		new player, cmd[256];
		if(sscanf(params, "{s[32] }rs[256]", player, cmd) || player == INVALID_PLAYER_ID || strlen(cmd) < 1)
			return Msg(playerid, "Haszn�lata: send_command [player] [cmd]");
			
		CC_SendRemoteCommand(SQLID(player), cmd);
		
	}
	else if(egyezik(func, "debug"))
	{	
		new sdebug;
		if(sscanf(params, "{s[32] }i", sdebug))
		return Msg(playerid, "Haszn�lata: debug [0/1]");

		CC_SetDebug(sdebug);
	}
	else if(egyezik(func, "connects"))
	{	
		if(sscanf(params, "{s[32] }i", Log_ClientConnects))
		return Msg(playerid, "Haszn�lata: connects [0/1]");
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
			Msg(playerid, "Haszn�lata: /socket [funkci�]"),
			Msg(playerid, "socket_listen [socket] [port], socket_stop_listen [socket], socket_set_max_connections [socket] [max]", .szin = COLOR_YELLOW),
			Msg(playerid, "socket_create, socket_destroy [socket], is_socket_valid [socket]", .szin = COLOR_YELLOW),
			Msg(playerid, "Vigy�zz, nehogy �sszevissza haszn�ld!")
		;
		
	if(egyezik(func, "socket_listen"))
	{
		new socket, sport;
		if(sscanf(params, "{s[32] }ii", socket, sport))
			return Msg(playerid, "Haszn�lata: socket_listen [socket] [port]");
			
		SendFormatMessage(playerid, COLOR_WHITE, "socket_listen(socket: %d, port: %d) - return: %d", socket, sport, socket_listen(Socket:socket, sport));
	}
	else if(egyezik(func, "socket_stop_listen"))
	{
		new socket;
		if(sscanf(params, "{s[32] }i", socket))
			return Msg(playerid, "Haszn�lata: socket_listen [socket]");
			
		SendFormatMessage(playerid, COLOR_WHITE, "socket_stop_listen(socket: %d) - return: %d", socket, socket_stop_listen(Socket:socket));
	}
	else if(egyezik(func, "socket_set_max_connections"))
	{
		new socket, maxi;
		if(sscanf(params, "{s[32] }ii", socket, maxi))
			return Msg(playerid, "Haszn�lata: socket_set_max_connections [socket] [max]");
			
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
			return Msg(playerid, "Haszn�lata: socket_destroy [socket]");
			
		SendFormatMessage(playerid, COLOR_WHITE, "socket_destroy(socket: %d) - return: %d", socket, socket_destroy(Socket:socket));
	}
	else if(egyezik(func, "is_socket_valid"))
	{
		new socket;
		if(sscanf(params, "{s[32] }i", socket))
			return Msg(playerid, "Haszn�lata: is_socket_valid [socket]");
			
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
		return Msg(playerid, "Haszn�lata: /kliens [j�t�kosn�v / ID]");
	
	if(target == INVALID_PLAYER_ID)
		return Msg(playerid, "Nincs ilyen j�t�kos");
	
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
			SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lat: /ammo [J�t�kos] [FegyverID] [L�szer] | /ammo t�r�l [J�t�kos]"),
			SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)"),
			SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)")
		;
	
	new param[10], player;
	if(!sscanf(params, "s[10]r", param, player))
	{
		if(egyezik(param, "t�r�l"))
		{
			if(player == INVALID_PLAYER_ID)
				return Msg(playerid, "Nem l�tez� j�t�kos");

			WeaponResetAmmos(player);
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s t�r�lte %s zseb�ben l�v� l�szereit (fegyvert nem) >>", AdminName(playerid), PlayerName(player));
			
			return 1;
		}
	}
	
	new weaponstr[32], ammo;
	if(sscanf(params, "rs[32] i", player, weaponstr, ammo))
		return
			SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lat: /ammo [J�t�kos] [FegyverID] [L�szer] | /ammo t�r�l [J�t�kos]"),
			SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)"),
			SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)")
		;
			
	
	if(player == INVALID_PLAYER_ID)
		return Msg(playerid, "Nem l�tez� j�t�kos");
	
	if(Szint(player) < WEAPON_MIN_LEVEL)
		return SendFormatMessage(playerid, COLOR_LIGHTRED, "Fegyver csak a %d. szintt�l enged�lyezett, a j�t�kos szintje %d", WEAPON_MIN_LEVEL, Szint(player));
	
	new weapon = GetGunFromString(weaponstr);
	if(weapon < 1 || weapon > MAX_WEAPONS)
		return Msg(playerid, "Hib�s fegyver! 1-47");
	
	if(!WeaponData[weapon][wAmmo])
		return Msg(playerid, "Ehhez a fegyverhez nem lehet l�szert adni");
	
	if(ammo < 1 || ammo > WeaponData[weapon][wAmmo])
		return SendFormatMessage(playerid, COLOR_LIGHTRED, "A l�szer minimum 1db, maximum %ddb lehet", WeaponData[weapon][wAmmo]);

	new oldammo = PlayerWeapons[player][pAmmo][weapon];
	if(!WeaponGiveAmmo(player, weapon, ammo))
		return Msg(playerid, "Ehhez a fegyverhez nem lehet l�szert adni");
	
	ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< Admin %s %ddb %s l�szert adott neki: %s - r�gi: %ddb, �j: %ddb >>", AdminName(playerid), ammo, GetGunName(weapon), PlayerName(player), oldammo, WeaponAmmo(player, weapon));
	tformat(128, "[/ammo]%s adott %ddb %s l�szert neki: %s", Nev(playerid), ammo, GunName(weapon), Nev(player));
	return 1;
}

CMD:gun(playerid, params[])
{
	if(!Admin(playerid, 5) && !IsScripter(playerid)) return 1;

	if(params[0] == EOS)
		return
			SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lat: /gun [J�t�kos] [FegyverID] | /gun t�r�l [J�t�kos]"),
			SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)"),
			SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)")
		;
	
	new param[10], player;
	if(!sscanf(params, "s[10]r", param, player))
	{
		if(egyezik(param, "t�r�l"))
		{
			if(player == INVALID_PLAYER_ID)
				return Msg(playerid, "Nem l�tez� j�t�kos");

			WeaponResetWeapons(player);
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s t�r�lte %s zseb�ben l�v� fegyvereit (l�szert nem) >>", AdminName(playerid), PlayerName(player));
			
			return 1;
		}
	}
	
	new weaponstr[32];
	if(sscanf(params, "rs[32] ", player, weaponstr))
		return
			SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lat: /gun [J�t�kos] [Fegyvern�v/ID] | /gun t�r�l [J�t�kos]"),
			SendClientMessage(playerid, COLOR_GRAD4, "3(Club) 4(knife) 5(bat) 6(Shovel) 7(Cue) 8(Katana) 10-13(Dildo) 14(Flowers) 16(Grenades) 18(Molotovs) 22(Pistol) 23(SPistol)"),
			SendClientMessage(playerid, COLOR_GRAD3, "24(Eagle) 25(shotgun) 29(MP5) 30(AK47) 31(M4) 33(Rifle) 34(Sniper) 37(Flamethrower) 41(spray) 42(exting) 43(Camera) 46(Parachute)")
		;
			
	
	if(player == INVALID_PLAYER_ID)
		return Msg(playerid, "Nem l�tez� j�t�kos");
	
	if(Szint(player) < WEAPON_MIN_LEVEL)
		return SendFormatMessage(playerid, COLOR_LIGHTRED, "Fegyver csak a %d. szintt�l enged�lyezett, a j�t�kos szintje %d", WEAPON_MIN_LEVEL, Szint(player));
	
	new weapon = GetGunFromString(weaponstr);
	if(weapon < 1 || weapon > MAX_WEAPONS)
		return Msg(playerid, "Hib�s fegyver! 1-47");

	new slot = WeaponGiveWeapon(player, weapon, _, 0);
	
	if(slot == WEAPONS_CAN_HOLD_WEAPON_FULL)
		return Msg(playerid, "N�la m�r nincs t�bb hely!");
	else if(slot == WEAPONS_CAN_HOLD_WEAPON_MANY)
		return Msg(playerid, "Ebb�l a fegyverb�l nem adhatsz neki");
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
		return SendClientMessage(playerid, COLOR_WHITE, "Haszn�lata: /ater�let [foglalhat�/v�rakoz�s/tulaj]");
	if(egyezik(sub, "foglalhat�") || egyezik(sub, "foglalhato"))
	{
		if(sscanf(subparams, "i", tid))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /ater�let foglalhato [Ter�let ID]");
		
		if(tid < 0 || tid > MAXTERULET)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs ilyen Ter�let ID!");
		
		TeruletInfo[tid][tFoglalva] = 0;
		SendFormatMessage(playerid, COLOR_GREEN, "%s[%d] ter�let v�rakoz�si ideje null�zva!", TeruletInfo[tid][tNev], tid);
		TeruletUpdate(tid, TERULET_Foglalva);
		TeruletFrissites();
	}
	elseif(egyezik(sub, "v�rakoz�s") || egyezik(sub, "varakozas"))
	{
		if(sscanf(subparams, "i", fid))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /ater�let v�rakoz�s [Frakci� ID]");
			
		if(fid != 3 && fid != 5 && fid != 6 && fid != 8 && fid != 11 && fid != 17 && fid != 21)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Illeg�lis Frakci�ID-k: 3(Sons of Anarchy), 5(LCN), 6(Yakuza), 8(Aztec), 11(Vagos), 17(GSF), 21(Turkey)");
		
		FrakcioInfo[fid][fUtolsoTamadas]= 0;
		SendFormatMessage(playerid, COLOR_GREEN, "Enged�lyezted a %s[%d] frakci�nak a t�mad�st!", Szervezetneve[fid-1][1], fid);
	}
	elseif(egyezik(sub, "tulaj"))
	{
		if(sscanf(subparams, "ii", tid, fid))
			return SendClientMessage(playerid, COLOR_WHITE, "Haszn�lata: /ater�let tulaj [Ter�let ID] [Frakci� ID]");
			
		if(tid < 0 || tid > MAXTERULET)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs ilyen Ter�let ID!");
			
		if(fid != 3 && fid != 5 && fid != 6 && fid != 8 && fid != 11 && fid != 17 && fid != 21)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Illeg�lis Frakci�ID-k: 3(Sons of Anarchy), 5(LCN), 6(Yakuza), 8(Aztec), 11(Vagos), 17(GSF), 21(Turkey)");
		
		SendFormatMessage(playerid, COLOR_GREEN, "Ter�let %s[%d] hozz�rendelve a(z) %s[%d] Frakci�hoz!", TeruletInfo[tid][tNev], tid, Szervezetneve[fid-1][1], fid);
		TeruletInfo[tid][tTulaj] = fid;
		TeruletUpdate(tid, TERULET_Tulaj);
		TeruletFrissites();
	}
	return 1;
}

CMD:askill(playerid, params[]) // Franklin k�r�se
{
	if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
	new sub[32], spms[64], amount, skill;
	if(sscanf(params, "s[32]S()[64]", sub, spms))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill [Pisztoly / Silenced / Deagle / Combat / Shotgun / Mp5 / AK47 / M4 / Sniper] [Mennyit]");
	
	if(egyezik(sub, "pisztoly"))
	{
		skill = 0;
		if(sscanf(spms, "i",	 amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill pisztoly [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
			
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "silenced"))
	{
		skill = 1;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill silenced [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "deagle"))
	{
		skill = 2;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill deagle [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "combat"))
	{
		skill = 5;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill combat [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }
		
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "shotgun"))
	{
		skill = 3;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill shotgun [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
			
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "mp5"))
	{
		skill = 7;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill mp5 [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }		
			
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
			
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "ak47"))
	{
		skill = 8;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill ak47 [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }		
			
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "m4"))
	{
		skill = 9;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill m4 [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }
			
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
		PlayerInfo[playerid][pFegyverSkillek][skill] += amount;
		
		if(PlayerInfo[playerid][pFegyverSkillek][skill] >= MAX_SKILLFEGYVER)
			PlayerInfo[playerid][pFegyverSkillek][skill] = MAX_SKILLFEGYVER;
		
		FegyverSkillFrissites(playerid);
	}
	elseif(egyezik(sub, "sniper"))
	{
		skill = 10;
		if(sscanf(spms, "i", amount))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /askill sniper [mennyis�g]");
		
		if(amount < 1 || amount > 1600)
			return SendClientMessage(playerid, COLOR_RED, "1-1600 v�lassz mennyis�get!");
		
		new price = amount * 3125;			
		if(!BankkartyaFizet(playerid, price)){ SendFormatMessage(playerid, COLOR_LIGHTRED, "%d forintba ker�l, neked nincs ennyid!", price); return 1; }
		
		SendFormatMessage(playerid, COLOR_GREEN, "V�s�rolt�l %d mennyis�g� skillt magadnak a k�vetkez� fegyverre: %s", amount, sub);
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
	if(sscanf(params, "i", target)) return Msg(playerid, "/clearvehicle [n�v/id]");
	if(target == INVALID_VEHICLE_ID) return Msg(playerid, "Nem l�tez� j�rm�");
	CarWantedLevel[target] = 0;
	ClearVehicleCrime(target);
	SendClientMessage(playerid, COLOR_LIGHTRED, "K�r�z�s T�r�lve!");
	return 1;
}
CMD:clearplayer(playerid, params[])
{
	new player;
	if(!Admin(playerid, 2)) return 1;
	if(sscanf(params, "u", player)) return Msg(playerid, "/clearplayer [n�v/id]");
	WantedLevel[player] = 0;
	ClearPlayerCrime(player);
	SendClientMessage(playerid, COLOR_LIGHTRED, "K�r�z�s T�r�lve!");
	Msg(player, "Egy admin t�r�lte r�lad a k�r�z�st!");
	return 1;
}
ALIAS(abanksz1mla):abankszamla;
ALIAS(absz):abankszamla;
CMD:abankszamla(playerid, params[])
{
	new player;
	if(!Admin(playerid, 4)) return 1;
	if(sscanf(params, "u", player)) return Msg(playerid, "/abanksz�mla [n�v/id]");
	if(PlayerInfo[player][pZarolva] == 0) return Msg(playerid, "Neki nincs lez�rva!");
	PlayerInfo[player][pZarolva] = 0;
	SendClientMessage(playerid, COLOR_LIGHTRED, "Z�rol�s feloldva!");
	Msg(player, "Egy admin feloldotta a banksz�ml�dr�l a z�rol�st!");
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
			return Msg(playerid, "Rejt�zk�dik, � nem jelezhet�");
		else if(PlayerPlace[player][pWarArea] != NINCS)
			return Msg(playerid, "War ter�leten van, nem jelezhet�");
			
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
		
		GameTextForPlayer(player, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 1000, 0);
		GameTextForPlayer(player, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 2000, 1);
		GameTextForPlayer(player, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 3000, 2);
		GameTextForPlayer(player, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 4000, 3);
		GameTextForPlayer(player, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 5000, 4);
		GameTextForPlayer(player, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 6000, 5);
		GameTextForPlayer(player, "����!$$%&'()*+,-./01~!@#$^&*()_-+={[}]:;'<,>.?/", 7000, 6);
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
