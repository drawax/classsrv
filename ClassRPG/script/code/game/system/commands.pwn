#if defined __game_system_commands
	#endinput
#endif
#define __game_system_commands

/****************************
 *           cmdk           *
 *    �: 1   �: 4   �: 7    *
 *    �: 2   �: 5   �: 8    *
 *    �: 3   �: 6   �: 9    *  
 ****************************/

CMD:adminfelirat(playerid, params[])//feliratot rak a fejed f�l�s by Amos
{
	if(IsSuper(playerid))
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

ALIAS(fecs):fme;
ALIAS(fejcselekv2s):fme; //feje f�l� �rja a cselekv�st by Amos
CMD:fme(playerid, params[])
{
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0) return Msg(playerid, "Most nem besz�lhetsz!");
	if(Leutve[playerid]) return Msg(playerid,"Le�tve nem cselekedhetsz semmit!");
	new result[100], string[140];
	if(sscanf(params, "s[100]", result))
	{
		Msg(playerid, "Haszn�lat: /fme [le�r�s]");
		Msg(playerid, "A kikapcsol�s�hoz: /fme ki");
		return 1;
	}
	if(strlen(result) >30) return Msg(playerid, "A le�r�snak hosszabbnak kell lennie, mint 30 karakter.");
	if(strcmp(result, "ki", true) == 0)
	{
		if(acselekves[playerid] == 0) return Msg(playerid, "Most m�r nincsen felirat a fejed f�l�tt.");
		DestroyDynamic3DTextLabel(cselekvesfelirat[playerid]);
		Msg(playerid, "/fme t�r�lve.");
		acselekves[playerid] = 0;
		return 1;
	}
	if(acselekves[playerid] == 0)
	{
		format(string, sizeof(string), "*[%d] %s *", playerid);
		cselekvesfelirat[playerid] = CreateDynamic3DTextLabel(string, COLOR_PURPLE, 0.0, 0.0, 0.0, 40.0, playerid);
		format(string, sizeof(string), "Cselekv�s: %s", string);
		Msg(playerid, "/fme kirakva a fejed f�l�.");
		SendClientMessage(playerid, COLOR_PURPLE, string);
		acselekves[playerid] = 1;
	}
	else
	{
		format(string, sizeof(string), "*[%d] %s *", playerid);
		UpdateDynamic3DTextLabelText(cselekvesfelirat[playerid], COLOR_PURPLE, string);
		format(string, sizeof(string), "Cselekv�s: %s", string);
		SendClientMessage(playerid, COLOR_PURPLE, string);
		return 1;
	}
	return 1;
}
CMD:fdo(playerid, params[])// Feje f�l� �rja a t�rt�n�st by Amos 
{
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0) return Msg(playerid, "Most nem besz�lhetsz!");
	new result[100], string[140];
	if(sscanf(params, "s[100]", result))
	{
		Msg(playerid, "Haszn�lat: /fdo [le�r�s]");
		Msg(playerid, "A kikapcsol�s�hoz: /fdo ki");
		return 1;
	}
	if(strlen(result) >30) return Msg(playerid, "A le�r�snak hosszabbnak kell lennie, mint 30 karakter.");
	if(strcmp(result, "ki", true) == 0)
	{
		if(atortenet[playerid] == 0) return Msg(playerid, "Most m�r nincsen felirat a fejed f�l�tt.");
		DestroyDynamic3DTextLabel(tortenesfelirat[playerid]);
		Msg(playerid, "/fdo t�r�lve.");
		atortenet[playerid] = 0;
		return 1;
	}
	if(acselekves[playerid] == 0)
	{
		format(string, sizeof(string), "*[%d] %s *", playerid);
		tortenesfelirat[playerid] = CreateDynamic3DTextLabel(string, COLOR_BLUE, 0.0, 0.0, 0.0, 40.0, playerid);
		format(string, sizeof(string), "T�rt�n�s: %s", string);
		Msg(playerid, "/fdo kirakva a fejed f�l�.");
		SendClientMessage(playerid, COLOR_BLUE, string);
		atortenet[playerid] = 1;
	}
	else
	{
		format(string, sizeof(string), "*[%d] %s *", playerid);
		UpdateDynamic3DTextLabelText(tortenesfelirat[playerid], COLOR_BLUE, string);
		format(string, sizeof(string), "T�rt�n�s: %s", string);
		SendClientMessage(playerid, COLOR_BLUE, string);
		return 1;
	}
	return 1;
}

CMD:fnv(playerid, params[])// Feje f�l� �rja a cselekv�st n�v n�lk�l by Amos 
{
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0) return Msg(playerid, "Most nem besz�lhetsz!");
	new result[100], string[140];
	if(sscanf(params, "s[100]", result))
	{
		Msg(playerid, "Haszn�lat: /fnv [le�r�s]");
		Msg(playerid, "A kikapcsol�s�hoz: /fnv ki");
		return 1;
	}
	if(strlen(result) >100) return Msg(playerid, "A le�r�snak hosszabbnak kell lennie, mint 100 karakter.");
	if(strcmp(result, "ki", true) == 0)
	{
		if(vacselekves[playerid] == 0) return Msg(playerid, "Most m�r nincsen felirat a fejed f�l�tt.");
		DestroyDynamic3DTextLabel(valakifelirat[playerid]);
		Msg(playerid, "/fnv t�r�lve.");
		vacselekves[playerid] = 0;
		return 1;
	}
	if(acselekves[playerid] == 0)
	{
		format(string, sizeof(string), "*[%d] %s *", PlayerInfo[playerid][pBID]);
		valakifelirat[playerid] = CreateDynamic3DTextLabel(string, COLOR_BLUE, 0.0, 0.0, 0.0, 40.0, playerid);
		format(string, sizeof(string), "Cselekv�s: %s", string);
		Msg(playerid, "/fnv kirakva a fejed f�l�.");
		SendClientMessage(playerid, COLOR_BLUE, string);
		vacselekves[playerid] = 1;
	}
	else
	{
		format(string, sizeof(string), "*[%d] %s *", PlayerInfo[playerid][pBID]);
		UpdateDynamic3DTextLabelText(valakifelirat[playerid], COLOR_BLUE, string);
		format(string, sizeof(string), "Cselekv�s: %s", string);
		SendClientMessage(playerid, COLOR_BLUE, string);
		return 1;
	}
	return 1;
}
ALIAS(b5k2s):poke;
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
ALIAS(adafk):adminafk;
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


ALIAS(gy4gyszereim):gyogyszereim;
CMD:gyogyszereim(playerid, params[])
{
	Cselekves(playerid, "megn�zte a gy�gyszert�sk�j�t.");
	ShowGyogyszerTaska(playerid, playerid);
	return 1;
}

ALIAS(sokkolo):tazer;
ALIAS(sokkol4):tazer;
CMD:tazer(playerid, params[])
{
	if(!IsACop(playerid)) return Msg(playerid, "Nem vagy rend�r!");
	if(!OnDuty[playerid]) return Msg(playerid, "Nem vagy szolg�latban!");
	if(IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "J�rm�ben nem haszn�lhatod.");
	if(WeaponArmed(playerid) != WEAPON_DEAGLE && WeaponArmed(playerid) != WEAPON_SILENCED) return Msg(playerid, "Erre a fegyverre nem szerelheted fel a sokkol�t.");
	if(!Tazer[playerid]) Tazer[playerid] = true, SendClientMessage(playerid, COLOR_LIGHTGREEN, "Sokkol� bekapcsolva.");
	else Tazer[playerid] = false, SendClientMessage(playerid, COLOR_LIGHTGREEN, "Sokkol� kikapcsolva.");
	return 1;
} 
 
ALIAS(5l2sid6):olesido;
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

ALIAS(segitseg):help;
ALIAS(seg3ts2g):help;
CMD:help(playerid, params[])
{
	new type[32];
	if(sscanf(params, "s[16]", type)) return Msg(playerid, "/help [alap/munka/h�z/j�rm�/biznisz/leader/hal/s�t�s/irc/egy�b]");
	if(egyezik(type, "alap"))
	{
		Msg(playerid, "Felhaszn�l�i parancsok: /login /stats /zsebem /jelszovaltas", false, COLOR_YELLOW);
		Msg(playerid, "Adminisztr�tori seg�ts�gk�r�s: /report join [0-3] /� | Priv�t �zenet k�ld�s: /pm", false, COLOR_YELLOW);
		Msg(playerid, "Cselekv�sek kifejez�i: /me /fme /fnv /va /megpr�b�l(ja) | T�rt�n�sek kifejez�i: /do /fdo", false, COLOR_YELLOW);
		Msg(playerid, "Kommunik�ci�: /o /s /c /l /b | Frakci� R�di�: /r /rb /togradio", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "munka"))
	{
		if(AMT(playerid, MUNKA_DETEKTIV))
			Msg(playerid,"Detekt�v: /find /adat", false, COLOR_YELLOW);
	    if(AMT(playerid, MUNKA_UGYVED))
			Msg(playerid,"�gyv�d: /free", false, COLOR_YELLOW);
		if(PlayerInfo[playerid][pSzerelo]>0)
		{
			Msg(playerid,"Aut�szerel�: /szerel�s /szerel�duty", false, COLOR_YELLOW);
			Msg(playerid,"Megjegyz�s: Az alap kocsik feljav�t�s��rt az �nkorm�nyzat fizet. PL.: Kamion, �ttiszt�t� stb...", false, COLOR_YELLOW);
		}
	    if(AMT(playerid, MUNKA_TESTOR))
			Msg(playerid,"Test�r: /guard", false, COLOR_YELLOW);
		if(PlayerInfo[playerid][pAutoker]>0)
			Msg(playerid,"Aut�keresked�: (/k)eresked� | Import�l�s: /call 12345 | /autoker | /ar", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_PIZZAS))
			Msg(playerid,"Pizzafut�r: /pizza", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_PENZ))
			Msg(playerid,"P�nzsz�ll�t�: /psz vagy /p�nzsz�ll�t�", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_POSTAS))
			Msg(playerid,"Post�s: /felt�lt /post�s", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_PILOTA))
			Msg(playerid,"Pil�ta: /utassz�ll�t�s", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_UTTISZTITO))
			Msg(playerid,"�ttiszt�t�: /�ttiszt�t�s", false, COLOR_YELLOW);
		if(!IsACop(playerid))
			Msg(playerid,"Prostitu�lt: /sex", false, COLOR_YELLOW);
		if(IsBanda(playerid))
			Msg(playerid,"Drogkeresked�: /szed /k�sz�t", false, COLOR_YELLOW);
	    if(!IsACop(playerid))
			Msg(playerid,"Aut�tolvaj: /car /ellop", false, COLOR_YELLOW);
		if(IsMaffia(playerid))
			Msg(playerid,"Fegyverkeresked�: /felvesz /k�sz�t", false, COLOR_YELLOW);
        if(!IsACop(playerid))
			Msg(playerid,"Hacker: /hack", false, COLOR_YELLOW);
		if(!IsACop(playerid))
			Msg(playerid,"P�nc�lk�sz�t�: /k�sz�t", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_KAMIONOS))
			Msg(playerid,"Kamionos: /kamion /kr(kamionr�di�)", false, COLOR_YELLOW);
        if(AMT(playerid, MUNKA_FARMER))
			Msg(playerid,"Farmer: /farmerked�s /alma /vetes", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_FUNYIRO))
			Msg(playerid,"F�ny�r�: /f�ny�r�s", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_EPITESZ))
			Msg(playerid,"�p�t�sz: /fel�j�t�s", false, COLOR_YELLOW);
		//if(AMT(playerid, MUNKA_KUKAS))
			//Msg(playerid,"Kuk�s: /kuka", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_VADASZ))
			Msg(playerid,"Vad�sz: /vad�sz", false, COLOR_YELLOW);
		if(LMT(playerid, FRAKCIO_MENTO) || LMT(playerid, FRAKCIO_SFMENTO))
			Msg(playerid, "OMSZ: /r, /rb, /d, /heal, /duty, /mk, /segit, /lista, /accept medic, /nyit, /zar, /fizetesek, /mvisz", false, COLOR_YELLOW);
		if(IsHitman(playerid))
		    Msg(playerid,"Hitman: /portable /(h)itman(r)�di� /m�reg /hitmansms /lehallgat /getskin2 /laptop ((Fontos: �l�s el�tt laptopba l�pj munk�ba))", false, COLOR_YELLOW);
   		if(IsDirector(playerid))
       		Msg(playerid, "Hitman Director: /hitman /hitmann�v", false, COLOR_YELLOW);
		if(IsOnkentes(playerid))
			Msg(playerid, "�nk�ntes Ment�s: /�r /�rb /�nk�ntesek /�nk�ntesduty /segit /heal /lista /accept medic /mvisz", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "h�z"))
		Msg(playerid, "/enter /exit /open /home /heal /houseupgrade (/hu)", false, COLOR_YELLOW);
	elseif(egyezik(type, "j�rm�") || egyezik(type, "jarmu"))
	{
		Msg(playerid, "/motor /fill /fillcar /kanna", false, COLOR_YELLOW);
		Msg(playerid, "/v /�r�ktuning /tuning /kocsi", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "biznisz") || egyezik(type, "business"))
		Msg(playerid, "/biznisz /bizutal�s", false, COLOR_YELLOW);
	elseif(egyezik(type, "leader"))
	{
		Msg(playerid,"/invite /uninvite /giverank /sz�f /rakt�r /quitfaction", false, COLOR_YELLOW);
		if(PlayerInfo[playerid][pLeader] == 7)
			Msg(playerid,"/givetax", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "fish") || egyezik(type, "hal"))
	{
		Msg(playerid,"/fish (Megpr�b�lsz halat fogni) /fishes (Megmutatja a kifogott halakat)", false, COLOR_YELLOW);
		Msg(playerid,"/throwback (Elengeded a legut�bbi kifogott halat) /throwbackall(Minden halat visszadobsz)", false, COLOR_YELLOW);
		Msg(playerid,"/releasefish (Elengeded az egyik halat)", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "s�t�s") || egyezik(type, "sutes") || egyezik(type, "cook"))
	{
		Msg(playerid,"/f�z�s (Ki�rja a lehet�s�geket) /megf�zve (Ki�rja miket f�zt�l meg)", false, COLOR_YELLOW);
		Msg(playerid,"/enni (Megeszed a f�zt�d)", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "irc"))
	{
		Msg(playerid,"/irc join /irc leave /irc password", false, COLOR_YELLOW);
		Msg(playerid,"/irc password /irc needpass /irc lock", false, COLOR_YELLOW);
		Msg(playerid,"/irc admins /irc motd /irc status /i", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "egy�b") || egyezik(type, "egyeb"))
	{
		Msg(playerid,"/�tad /f /eldob /accept /cancel /pay /pays /nyit /zar /enter /exit /carresi /zenec�m", false, COLOR_YELLOW);
		Msg(playerid,"/zuhanok /r /rb /b�rsz�f /banksz�mla /laptopom /menu /buy /service /�l�sid�", false, COLOR_YELLOW);
	}
	return 1;
}
ALIAS(specjogsi):jspecial; // /jspecial m�r megy /specjogsira is by Amos
CMD:jspecial(playerid, params[])
{
	if(!Munkarang(playerid, 4)) return Msg(playerid, "Minimum 4-es rang kell hogy haszn�lhasd!");
	if(!LMT(playerid,FRAKCIO_OKTATO)) return Msg(playerid, "Csak oktat�!");
	
	new player, km, jogsinev[128];
	if(sscanf(params, "rds[128]", player,km,jogsinev)) return Msg(playerid,"/jspecial [id] [KM] [jogsineve]");

	
	if(player == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen j�t�kos");
			
	if(GetDistanceBetweenPlayers(playerid, player) > 2) return Msg(playerid, "Nincs a k�zeledben!");
	
	format(PlayerInfo[player][pSpecialJogsiNev],128,"%s",jogsinev);
	PlayerInfo[player][pSpecialJogsiKm] = float(km)*1000.0;
	SendFormatMessage(playerid,COLOR_YELLOW,"[SPECI�LIS JOGOS�TV�NYT ADT�L] Megnevez�s: %s, KM: %.3f",PlayerInfo[player][pSpecialJogsiNev],PlayerInfo[player][pSpecialJogsiKm]/1000.0);
	SendFormatMessage(player,COLOR_YELLOW,"[SPECI�LIS JOGOS�TV�NY KAPT�L] Megnevez�s: %s, KM: %.3f",PlayerInfo[player][pSpecialJogsiNev],PlayerInfo[player][pSpecialJogsiKm]/1000.0);
	return 1;
}
CMD:kikerdez(playerid, params[])
{
	if(GetPlayerVirtualWorld(playerid)!=1555) return Msg(playerid, "A.A");
	if(FloodCheck(playerid,10)) return 1;
	if(!PlayerToPoint(3, playerid, 1913.67269229, -2415.88067467, 13.9656142578)) return Msg(playerid, "Nincs a k�zeledben!");
	new result[128];
	if(!IsACop(playerid))
	{
		format(result, 128, "P�nzt�ros: Csak rend�r�knek besz�lek!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	elseif(Rob < 2500) 
	{
		format(result, 128, "P�nzt�ros: Nem tudok semmi �rdekeset mondani �n�knek!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	else
	{
		
		format(result, 128, "P�nzt�ros: K�rem bej�ttek ide cirka %d f�, �s r�mfogt�k a fegyvert!",LSBankRablok);
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		
		format(result, 128, "P�nzt�ros: Azt a szem�lyt biztos felismerem aki r�m fogta a fegyvert �s �rd�tott!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		Msg(playerid,"/felismeri ID");
		return 1;
	}

}
CMD:felismeri(playerid, params[])
{
	if(GetPlayerVirtualWorld(playerid)!=1555) return Msg(playerid, "A.A");
	if(!PlayerToPoint(3, playerid, 1913.67269229, -2415.88067467, 13.9656142578)) return Msg(playerid, "Nincs a k�zeledben!");
	new rablo;
	new result[128];
	if(sscanf(params, "r", rablo)) return Msg(playerid,"id?");

	if(!PlayerToPoint(3, rablo, 1913.67269229, -2415.88067467, 13.9656142578)) return Msg(playerid, "Nincs a k�zelben a megjel�lt szem�ly!");
	if(!IsACop(playerid))
	{
		format(result, 128, "P�nzt�ros: Csak rend�r�knek besz�lek!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	elseif(Rob < 2500) 
	{
		format(result, 128, "P�nzt�ros: Nem tudok semmi �rdekeset mondani �n�knek!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	elseif(RabloID == rablo)
	{
		format(result, 128, "P�nzt�ros:Felismerem �t � volt az!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	else
	{
		format(result, 128, "P�nzt�ros: Nem ismerem �gy fel, nem � �rd�tott r�m, de lehet hogy itt volt, nem tudom.");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	
	}
}

ALIAS(ment6st1ska):mentostaska;
CMD:mentostaska(playerid, params[])
{
	if(LMT(playerid, FRAKCIO_MENTO)){
		OMSZTaskaInfo(playerid);
		Cselekves(playerid, "megn�zte a Ment�s t�sk�ja tartalm�t");}
	return 1;
}

CMD:zuhanok(playerid, params[])
{
	if(AfterLoginTime[playerid] < UnixTime) return Msg(playerid, "Nem haszn�lhatod ezt a parancsot, mert t�bb, mint 15 m�sodperce l�pt�l be!");
	new Float:pos[3];
	GetPlayerPos(playerid, ArrExt(pos));
	SetPlayerPosFindZ(playerid, ArrExt(pos));
	Msg(playerid, "Teleport�lva");
	ABroadCastFormat(COLOR_LIGHTRED, 1, "<< %s alkalmazta a /zuhanok parancsot, �gy a legk�zelebbi szil�rd helyre ker�lt >>", PlayerName(playerid));
	AfterLoginTime[playerid] = 0;
	return 1;
}

ALIAS(korhaz):k4rh1z;
CMD:k4rh1z(playerid, params[])
{
	if(!PlayerToPoint(20,playerid,1944.6885,-2458.5464,13.5703) || GetPlayerVirtualWorld(playerid) != 104) return Msg(playerid, "Nem vagy k�rh�zban!");
	
	if(KorhazIdo[playerid] > 0)  return Msg(playerid,"Szeretn�d mi?!");
	
	if(MentoOnline() > 3) return Msg(playerid, "Van fent b�ven ment�s, keresd ink�bb �ket!");
	new Float:elet;
	if(GetPlayerHealth(playerid,elet) > 100.0) return Msg(playerid, "T�j j�l vagy a k�rh�zi ell�t�shoz!");
		
	
	new ido = floatround(150.0 - elet);
	
	if(!BankkartyaFizet(playerid,ido*1000)) return SendFormatMessage(playerid,COLOR_YELLOW,"A k�rh�zi d�j: %s Ft",FormatInt(ido*1000));
	
	FrakcioSzef(FRAKCIO_MENTO,ido*1000);
	
	SendFormatMessage(playerid,COLOR_YELLOW,"Befek�dt�l a k�rh�zba ell�t�sra. Fell�p�l�si id�d: %d",ido);
	Jail(playerid,"+",ido,"korhaz","K�rh�z fell�p�l�s");
	
	SetPlayerHealth(playerid, 150.0);
	return 1;
}
CMD:carresiset(playerid, params[])
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
ALIAS(gyogyszer):gy4gyszer;
CMD:gy4gyszer(playerid, params[])
{
	new param[32];
	
	if(GyogyszerTime[playerid] > 0) return SendFormatMessage(playerid,COLOR_LIGHTRED,"A-A ez t�l s�r�! %d sec",GyogyszerTime[playerid]);
	
	if(sscanf(params, "s[32]", param)) 
	{
		Msg(playerid,"/gy�gyszer [aspirin / cataflan / info]");
		
		return 1;
	}
	if(egyezik(param, "info"))
	{
		Msg(playerid, "Hogy ne lehessen haszn�lni �ket l�v�ld�z�s k�zben, akit megl�ttek nem tudja haszn�lni a term�keket!");
		Msg(playerid,"Aspirin: 10 hp-t t�lt /db-ja. Kiz�r�lag akkor haszn�lhat� ha a HP-d t�bb mint 70!");
		Msg(playerid,"Cataflan: 15 HP-t t�lt /db-ja. Kiz�r�lag akkor haszn�lhat� ha a HP-d 50 - 80 k�z�tt van!");
		return 1;
	}
	if(PlayerInfo[playerid][pLoves] > UnixTime)	return SendFormatMessage(playerid,COLOR_LIGHTRED,"Nem haszn�lhatod nem r�g megl�ttek: %d sec",PlayerInfo[playerid][pLoves]-UnixTime);
	if(egyezik(param, "aspirin"))
	{
		if(PlayerInfo[playerid][pAspirin] < 1) return Msg(playerid, "Nincs aspirined!");
		new Float:hp;
		GetPlayerHealth(playerid,hp);
		if(hp < 70.0) return Msg(playerid, "Ez a gy�gyszer m�r kev�s!");
		
		Cselekves(playerid,"bevett egy gy�gyszert!");
		
		GyogyszerTime[playerid] = 60;
		
		hp +=10.0;
		PlayerInfo[playerid][pAspirin]--;
		SetPlayerHealth(playerid,hp);
		return 1;
	}
	if(egyezik(param,"cataflan"))
	{
		if(PlayerInfo[playerid][pCataflan] < 1) return Msg(playerid, "Nincs cataflan-od!");
		new Float:hp;
		GetPlayerHealth(playerid,hp);
		if(hp < 50.0) return Msg(playerid, "Ez a gy�gyszer m�r kev�s!");
		if(hp > 80.0) return Msg(playerid, "Ez a gy�szer m�r er�s, ehhez t�l j�l vagy!");
		
		Cselekves(playerid,"bevett egy gy�gyszert!");
		
		GyogyszerTime[playerid] = 120;
		
		hp +=20.0;
		PlayerInfo[playerid][pCataflan]--;
		SetPlayerHealth(playerid,hp);
		return 1;
	
	
	}
	return 1;
}

CMD:taxi(playerid, params[])
{
	if(!LMT(playerid,FRAKCIO_TAXI)) return Msg(playerid, "Csak taxisok!");
	new param[32];
	new func[256];
	if(sscanf(params, "s[32]S()[256]", param, func)) 
	{
		Msg(playerid,"/taxi [lista / fogad / lemond / d�j / duty]");
		return 1;
	}
	if(egyezik(param, "duty"))
	{
		
		if(!PlayerToPoint(FrakcioInfo[FRAKCIO_TAXI][fDPosR], playerid, FrakcioInfo[FRAKCIO_TAXI][fDPosX],FrakcioInfo[FRAKCIO_TAXI][fDPosY],FrakcioInfo[FRAKCIO_TAXI][fDPosZ],FrakcioInfo[FRAKCIO_TAXI][fDVW],FrakcioInfo[FRAKCIO_TAXI][fDINT])) return Msg(playerid, "Nem vagy duty helyen!");
		
		if(Taxi[playerid][tDuty])
		{
			Taxi[playerid][tDuty] = false;
			OnDuty[playerid] = false;
			Munkaruha(playerid, 0);
			Cselekves(playerid, "vissza�lt�z�tt!");
			return 1;
		}
		else
		{
			Taxi[playerid][tDuty] = true;
			OnDuty[playerid] = true;
			
			Taxi[playerid][tFizetes] = 0;
			new string[128];
			format(string, sizeof(string), "Taxi Sof�r %s szolg�latban van, viteld�j: %dFt/Km", ICPlayerName(playerid), FrakcioInfo[FRAKCIO_TAXI][fDij]);
			SendClientMessageToAll(TEAM_GROVE_COLOR,string);
			Msg(playerid, "/taxi lista");
			
			Cselekves(playerid, "�t�lt�z�tt a munkaruh�j�ba", 0);
			
			Munkaruha(playerid, 1);
			Taxi[playerid][tDuty] = true;
			return 1;
		}
		
	}
	if(egyezik(param, "lista"))
	{
		

		SendClientMessage(playerid, COLOR_WHITE, "======= [H�v�slista] =======");
		foreach(Jatekosok, x)
			if(TaxiHivas[x] == 1) SendFormatMessage(playerid, COLOR_GREY, "[%d][%s]", x, ICPlayerName(x));
		SendClientMessage(playerid, COLOR_WHITE, "======= [H�v�slista] =======");
		
		return 1;
	}
	if(egyezik(param, "fogad"))
	{
	
		if(Taxi[playerid][tHivas]) return Msg(playerid, "M�r fogadt�l h�v�st! Vond vissza ha nem kell! /taxi lemond");
		if(!Taxi[playerid][tDuty]) return Msg(playerid, "Nem  vagy szolg�latban!");
		
		new jatekos;
		foreach(Jatekosok, x)
			if(TaxiHivas[x] == 1) jatekos = x;

		if(TaxiHivas[jatekos] != 1) return Msg(playerid, "Nem h�vott taxit!");
		TaxiHivas[jatekos] = 2;
		foreach(Jatekosok, x)
		{
			if(AdminDuty[x] == 0 && ScripterDuty[x] == 0)
				SetPlayerMarkerForPlayer(playerid, x, COLOR_INVISIBLE);
		}
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Fogadtad %s h�v�s�t!", ICPlayerName(jatekos));
		SendFormatMessage(jatekos, COLOR_LIGHTGREEN, "%s fogadta a h�v�sod!", ICPlayerName(playerid));
		SendFormatMessageToAll(COLOR_GREEN, "Taxi sof�r %s fogadta %s h�v�s�t", ICPlayerName(playerid), ICPlayerName(jatekos));
		SetPlayerMarkerForPlayer(playerid, jatekos, COLOR_YELLOW);
		SetPlayerMarkerForPlayer(jatekos, playerid, COLOR_YELLOW);
		
		TaxiHivasJelzes[playerid] = jatekos;
		Taxi[playerid][tHivas] = true;
		
		new taxiszoveg[64];
		format(taxiszoveg, 64, "Taxisof�r H�V�SRA MEGY\nViteld�j: %d Ft / KM",FrakcioInfo[FRAKCIO_TAXI][fDij]);
		
		new vehicleid = GetPlayerVehicleID(playerid);
		if(IsValidDynamic3DTextLabel(TAXITEXT[vehicleid])) DestroyDynamic3DTextLabel(TAXITEXT[vehicleid]), TAXITEXT[vehicleid]=INVALID_3D_TEXT_ID;
		TAXITEXT[vehicleid] = CreateDynamic3DTextLabel(taxiszoveg, COLOR_YELLOW_TAXI, 0.0, 0.0, 2.0, 20.0, INVALID_PLAYER_ID, vehicleid, 1);
		
		return 1;
	
	}
	if(egyezik(param, "lemond"))
	{
		if(!Taxi[playerid][tHivas]) return Msg(playerid, "Nincs mit lemondani!");
		
		Taxi[playerid][tHivas] = false;
		SendFormatMessage(TaxiHivasJelzes[playerid], COLOR_LIGHTGREEN, "Taxisof�r %s lemondta a sz�ll�t�st, nem megy �rted!",ICPlayerName(playerid));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Lemondtad %s h�v�s�t!",ICPlayerName(TaxiHivasJelzes[playerid]));
		TaxiHivasJelzes[playerid] = NINCS;
		
		SetPlayerMarkerForPlayer(playerid, TaxiHivasJelzes[playerid], COLOR_INVISIBLE);
		SetPlayerMarkerForPlayer(TaxiHivasJelzes[playerid], playerid, COLOR_INVISIBLE);
		return 1;
	}
	if(egyezik(param, "d�j") || egyezik(param,"dij"))
	{
		if(!PlayerInfo[playerid][pLeader]) return Msg(playerid, "Csak leader!");
		if(sscanf(func, "d", FrakcioInfo[FRAKCIO_TAXI][fDij])) return Msg(playerid, "/taxi d�j [�ra]");
	
		SendFormatMessage(playerid,COLOR_YELLOW,"Egys�ges d�j �t�rva: %s Ft",FormatInt(FrakcioInfo[FRAKCIO_TAXI][fDij]));
		
		foreach(Jatekosok,x)
		{
			if(Taxi[x][tDuty])
				Taxi[x][tFizetes]=FrakcioInfo[FRAKCIO_TAXI][fDij];
		}
		
		return 1;
	}
	return 1;
}
CMD:object(playerid, params[])
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
ALIAS(5r5kkulcs):orokkulcs;
CMD:orokkulcs(playerid, params[])
{
	new pm[32], pid, kid, spm[32], jarmu;
	if(PlayerInfo[playerid][pPcarkey] == NINCS && PlayerInfo[playerid][pPcarkey2] == NINCS && PlayerInfo[playerid][pPcarkey3] == NINCS) return Msg(playerid, "Nincs j�rm�ved.");
	if(sscanf(params, "s[32]S()[32]", pm, spm)) { Msg(playerid, "/�r�kkulcs [ad/elvesz]"); if(Admin(playerid, 1337)) Msg(playerid, "/�r�kkulcs t�r�l"); return true; }
	if(egyezik(pm, "ad"))
	{
		if(sscanf(spm, "ri", pid, kid)) return Msg(playerid, "/�r�kkulcs ad [n�v/id] [1/2/3]");
		if(pid == INVALID_PLAYER_ID || pid == playerid) return Msg(playerid, "Nem l�tez� j�t�kos");
		if(GetDistanceBetweenPlayers(playerid, pid) > 3.0) return Msg(playerid, "Nincs a k�zeledben a j�t�kos.");
		if(kid == 1)
		{
			if(PlayerInfo[playerid][pPcarkey] == NINCS) return true;
			jarmu = PlayerInfo[playerid][pPcarkey];
		}
		elseif(kid == 2)
		{
			if(PlayerInfo[playerid][pPcarkey2] == NINCS) return true;
			jarmu = PlayerInfo[playerid][pPcarkey2];
		}
		elseif(kid == 3)
		{
			if(PlayerInfo[playerid][pPcarkey3] == NINCS) return true;
			jarmu = PlayerInfo[playerid][pPcarkey3];
		}
		else return Msg(playerid, "�gy tudom csak 3 j�rm�ved lehet.. nem? :)");
		
		if(CarInfo[jarmu][cKulcsok][0] != NINCS && CarInfo[jarmu][cKulcsok][1] != NINCS) return Msg(playerid,"Csak k�t p�tkulcs van hozz�, amiket m�r �tadt�l valakinek!");
		if(PlayerInfo[pid][pKulcsok][0] != NINCS && PlayerInfo[pid][pKulcsok][1] != NINCS && PlayerInfo[pid][pKulcsok][2] != NINCS) return Msg(playerid,"N�la m�r t�bb mint 3 kulcs van");
		
		if(PlayerInfo[pid][pKulcsok][0] == NINCS)
			PlayerInfo[pid][pKulcsok][0] = CarInfo[jarmu][cId];
		elseif(PlayerInfo[pid][pKulcsok][1] == NINCS)
			PlayerInfo[pid][pKulcsok][1] = CarInfo[jarmu][cId];
		elseif(PlayerInfo[pid][pKulcsok][2] == NINCS)
			PlayerInfo[pid][pKulcsok][2] = CarInfo[jarmu][cId];
		
		if(CarInfo[jarmu][cKulcsok][0] == NINCS)
			CarInfo[jarmu][cKulcsok][0] = PlayerInfo[pid][pID], CarUpdate(jarmu, CAR_Kulcsok1);
		else
			CarInfo[jarmu][cKulcsok][1] = PlayerInfo[pid][pID], CarUpdate(jarmu, CAR_Kulcsok2);
		
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "�tadtad a j�rm�ved egyik p�tkulcs�t neki: %s | V-s Rendsz�m: %d | J�rm�ID: %d", ICPlayerName(pid), jarmu, CarInfo[jarmu][cId]);
		SendFormatMessage(pid, COLOR_LIGHTGREEN, "* %s odaadta a j�rm�ve egyik p�tkulcs�t neked | V-s Rendsz�m: %d | J�rm�ID: %d", ICPlayerName(playerid), jarmu, CarInfo[jarmu][cId]);
	}
	elseif(egyezik(pm, "elvesz"))
	{
		if(sscanf(spm, "ri", pid, kid)) return Msg(playerid, "/�r�kkulcs elvesz [n�v/id] [1/2/3]");
		if(pid == INVALID_PLAYER_ID || pid == playerid) return Msg(playerid, "Nem l�tez� j�t�kos");
		if(GetDistanceBetweenPlayers(playerid, pid) > 3.0) return Msg(playerid, "Nincs a k�zeledben a j�t�kos.");
		if(kid == 1)
		{
			if(PlayerInfo[playerid][pPcarkey] == NINCS) return true;
			jarmu = PlayerInfo[playerid][pPcarkey];
		}
		elseif(kid == 2)
		{
			if(PlayerInfo[playerid][pPcarkey2] == NINCS) return true;
			jarmu = PlayerInfo[playerid][pPcarkey2];
		}
		elseif(kid == 3)
		{
			if(PlayerInfo[playerid][pPcarkey3] == NINCS) return true;
			jarmu = PlayerInfo[playerid][pPcarkey3];
		}
		else return Msg(playerid, "�gy tudom csak 3 j�rm�ved lehet.. nem? :)");
		
		if(CarInfo[jarmu][cKulcsok][0] != PlayerInfo[pid][pID] && CarInfo[jarmu][cKulcsok][1] != PlayerInfo[pid][pID]) return Msg(playerid, "Ehhez a j�rm�h�z neki nincsen p�tkulcsa!");
		if(PlayerInfo[pid][pKulcsok][0] != CarInfo[jarmu][cId] && PlayerInfo[pid][pKulcsok][1] != CarInfo[jarmu][cId] && PlayerInfo[pid][pKulcsok][2] != CarInfo[jarmu][cId]) return Msg(playerid,"Ehhez a j�rm�h�z neki nincsen p�tkulcsa!");
		
		if(PlayerInfo[pid][pKulcsok][0] == CarInfo[jarmu][cId])
			PlayerInfo[pid][pKulcsok][0] = NINCS;
		if(PlayerInfo[pid][pKulcsok][1] == CarInfo[jarmu][cId])
			PlayerInfo[pid][pKulcsok][1] = NINCS;
		if(PlayerInfo[pid][pKulcsok][2] == CarInfo[jarmu][cId])
			PlayerInfo[pid][pKulcsok][2] = NINCS;
		
		if(CarInfo[jarmu][cKulcsok][0] == PlayerInfo[pid][pID])
			CarInfo[jarmu][cKulcsok][0] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
		else
			CarInfo[jarmu][cKulcsok][1] = NINCS, CarUpdate(jarmu, CAR_Kulcsok2);
			
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Elvetted a j�rm�ved p�tkulcs�t t�le: %s | V-s Rendsz�m: %d | J�rm�ID: %d", ICPlayerName(pid), jarmu, CarInfo[jarmu][cId]);
		SendFormatMessage(pid, COLOR_LIGHTGREEN, "* %s elvette a j�rm�ve p�tkulcs�t t�led | V-s Rendsz�m: %d | J�rm�ID: %d", ICPlayerName(playerid), jarmu, CarInfo[jarmu][cId]);
	}
	elseif(egyezik(pm, "t�r�l") || egyezik(pm, "torol"))
	{
		if(!Admin(playerid, 1337)) return 1;
		new type;
		if(sscanf(spm, "ri", pid, type)) return Msg(playerid, "/�r�kkulcs t�r�l [n�v/id] [1/2/3]");
		if(pid == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
		switch(type)
		{
			case 1:
			{
				if(CarInfo[PlayerInfo[pid][pKulcsok][0]][cKulcsok][0] == PlayerInfo[pid][pID])
					CarInfo[PlayerInfo[pid][pKulcsok][0]][cKulcsok][0] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
				else
					CarInfo[PlayerInfo[pid][pKulcsok][0]][cKulcsok][1] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
					
				PlayerInfo[pid][pKulcsok][0] = NINCS;
				
				SendFormatMessage(pid, COLOR_LIGHTRED, "ClassRPG: %s %s elvette az 1. p�tkulcsodat", AdminRangNev(playerid), AdminName(playerid));
				SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Elvetted %s 1. p�tkulcs�t", PlayerName(pid));
				format(_tmpString,sizeof(_tmpString),"<< %s %s elvette %s 1. p�tkulcs�t >>", AdminRangNev(playerid), AdminName(playerid), PlayerName(pid));
				SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			}
			case 2:
			{
				if(CarInfo[PlayerInfo[pid][pKulcsok][1]][cKulcsok][0] == PlayerInfo[pid][pID])
					CarInfo[PlayerInfo[pid][pKulcsok][1]][cKulcsok][0] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
				else
					CarInfo[PlayerInfo[pid][pKulcsok][1]][cKulcsok][1] = NINCS, CarUpdate(jarmu, CAR_Kulcsok2);
					
				PlayerInfo[pid][pKulcsok][1] = NINCS;
				
				SendFormatMessage(pid, COLOR_LIGHTRED, "ClassRPG: %s %s elvette az 2. p�tkulcsodat", AdminRangNev(playerid), AdminName(playerid));
				SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Elvetted %s 2. p�tkulcs�t", PlayerName(pid));
				
				format(_tmpString,sizeof(_tmpString),"<< %s %s elvette %s 2. p�tkulcs�t >>", AdminRangNev(playerid), AdminName(playerid), PlayerName(pid));
				
				SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			}
			case 3:
			{
				if(CarInfo[PlayerInfo[pid][pKulcsok][2]][cKulcsok][0] == PlayerInfo[pid][pID])
					CarInfo[PlayerInfo[pid][pKulcsok][2]][cKulcsok][0] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
				else
					CarInfo[PlayerInfo[pid][pKulcsok][2]][cKulcsok][1] = NINCS, CarUpdate(jarmu, CAR_Kulcsok2);
					
				PlayerInfo[pid][pKulcsok][2] = NINCS;
				
				SendFormatMessage(pid, COLOR_LIGHTRED, "ClassRPG: %s %s elvette az 3. p�tkulcsodat", AdminRangNev(playerid), AdminName(playerid));
				SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Elvetted %s 3. p�tkulcs�t", PlayerName(pid));
			
				
				format(_tmpString,sizeof(_tmpString),"<< %s %s elvette %s 3. p�tkulcs�t >>", AdminRangNev(playerid), AdminName(playerid), PlayerName(pid));
				SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			}
			default: Msg(playerid, "1/2/3");
		}
	}
	return 1;
}

ALIAS(vad1szenged2ly):vadaszengedely;
CMD:vadaszengedely(playerid, params[])
{
	new a[64], b[64];
	if(sscanf(params, "s[32]S()[32]", a, b)) return Msg(playerid, "/vad�szenged�ly [kiv�lt/megn�z]");
	if(egyezik(a, "kiv�lt") || egyezik(a, "kivalt"))
	{
		if(!PlayerToPoint(2, playerid, 362.3623,209.2845,1008.3828)) return Msg(playerid, "V�rosh�z�n els� iroda jobra! 300,000Ft; 24 h�napig �rv�nyes ((�ra))");
		if(PlayerInfo[playerid][pVadaszEngedely] > 0) return Msg(playerid,"Neked van enged�lyed!");
		if(!BankkartyaFizet(playerid, 300000)){ Msg(playerid, "A vad�szenged�ly �ra: 300,000Ft"); return 1; }
		PlayerInfo[playerid][pVadaszEngedely] = 24;
		Cselekves(playerid, "kiv�ltott egy vad�szenged�lyt.");
		Msg(playerid, "Kiv�ltottad az enged�lyt, mostm�r mehetsz vad�szni!");
	}
	elseif(egyezik(a, "megn�z") || egyezik(a, "megnez"))
	{
		if(PlayerInfo[playerid][pVadaszEngedely] < 1) return Msg(playerid, "Nincs enged�lyed!");

		SendClientMessage(playerid, COLOR_GREEN, "====== Vad�sz Enged�ly ======");
		SendFormatMessage(playerid, COLOR_GRAD6, "N�v: %s", ICPlayerName(playerid));
		SendFormatMessage(playerid, COLOR_GRAD5, "�rv�nyes: %d h�napig ((�r�ig))", PlayerInfo[playerid][pVadaszEngedely]);
		Cselekves(playerid, "el�vette az egyik irat�t, �s megn�zte.", 0);
	}
	return 1;
}


ALIAS(vad1sz):vadasz;
CMD:vadasz(playerid, params[])
{
	new a[64];
	if(!AMT(playerid, MUNKA_VADASZ)) return Msg(playerid, "Nem vagy vad�sz!");
	if(OnDuty[playerid]) return Msg(playerid, "D�ntsd el�bb el mit dolgozol! ((frakci� dutyba nem!))");
	if(sscanf(params, "s[32]", a)) return Msg(playerid, "/vad�sz [munka/ell�t/felpakol/elsz�mol/seg�ts�g]");
	if(egyezik(a, "munka"))
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
			if(!PlayerToPoint(5.0, playerid, -1633.1276, -2238.6843, 31.4766))
			{
				SetPlayerCheckpoint(playerid, -1633.1276, -2238.6843, 31.4766, 5.0);
				Msg(playerid, "Nem vagy a vad�sztelepen!");
				return 1;
			}
			if(Munkaban[playerid] != MUNKA_VADASZ)
			{
				if(PlayerInfo[playerid][pVadaszEngedely] == 0) return Msg(playerid, "Nincs vad�szenged�lyed!");
				if(PlayerInfo[playerid][pPayCheck] > 700000) return Msg(playerid, "T�l sok vadat l�tt�l m�r ki, nem adhatsz le t�bbet!");
				
				Munkaban[playerid] = MUNKA_VADASZ;
				if(PlayerInfo[playerid][pSex] == 2) SetPlayerSkin(playerid, 201);
				else SetPlayerSkin(playerid, 161);
				Msg(playerid, "Felvetted a ruh�dat, �gy munk�ba �llt�l. A munka v�gz�s�hez seg�ts�g: /vad�sz seg�ts�g");
				if(HuntInfo[dAmount] < MAX_DEER && HuntInfo[dLastJoiner] != PlayerInfo[playerid][pID])
					CreateDeer();
				HuntInfo[dLastJoiner] = PlayerInfo[playerid][pID];
			}
			else
			{
				if(LegalisSzervezetTagja(playerid) && Civil(playerid))
				{
					SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				}
				else
				{
					SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
				}
				Munkaban[playerid] = NINCS;
				Msg(playerid, "Visszavetted a civil ruh�dat, �gy m�r nem dolgozol.");
			}
		}
		else Msg(playerid, "J�rm�ben NEM!");
		return 1;
	}
	elseif(egyezik(a, "segitseg") || egyezik(a, "seg�ts�g"))
	{
		SendClientMessage(playerid, COLOR_GREEN, "=====[ Vad�szat munka haszn�lati �tmutat� ]=====");
		SendClientMessage(playerid, COLOR_WHITE, "A munk�t elkezdeni a /vad�sz munka paranccsal tudod.");
		SendClientMessage(playerid, COLOR_WHITE, "A munk�hoz fegyvert neked kell v�s�rolnod, ami rifle vagy shotgun lehet.");
		SendClientMessage(playerid, COLOR_GRAD6, "A munk�hoz vad�szenged�ly sz�ks�ges, amit az Oktat�kt�l tudsz kiv�ltani 48 j�tszott �r�ra 150.000 Ft-�rt, vagy 300.000 Ft-�rt 24 j�tszott �r�ra a v�rosh�z�n.");
		SendClientMessage(playerid, COLOR_GRAD6, "Egyszerre 25db �z tal�lhat� az erd�ben.");
		SendClientMessage(playerid, COLOR_GRAD5, "�j �z akkor ker�l el�, ha egy �j vad�sz �ll munk�ba; automatikusan 10 percenk�nt spawnol egy �z.");
		SendClientMessage(playerid, COLOR_GRAD5, "Miut�n elejtett�k az �zt, 5 perc �ll rendelkez�sre, hogy a tal�lt goly�t elt�vol�tsuk bel�le.");
		SendClientMessage(playerid, COLOR_GRAD4, "Miut�n elt�vol�tottuk a l�ved�ket, az �llatot lehet�s�g�nk van felpakolni egy Yosemite-ra (/vad�sz felpakol), amire egyszerre 5 �llat f�r.");
		SendClientMessage(playerid, COLOR_GRAD4, "Az �llat elsz�ll�t�s�ra korl�tlan id� �ll rendelkez�sre, de tov�bbra is csak maximum 25 �z lesz megtal�lhat�.");
		SendClientMessage(playerid, COLOR_GRAD3, "Az �llatokat ezut�n egy megadott GPS pontra kell elvinni, ahol az erd�szeten �tveszik az �llatokat.");
		SendClientMessage(playerid, COLOR_GRAD3, "A fizet�s az �llat s�r�l�si �llapot�t�l, �s a fegyver l�ved�k�nek fajt�j�t�l f�gg, �s a l�v�s t�vols�g�t�l.");
		SendClientMessage(playerid, COLOR_GRAD2, "Vigy�zz! Ha t�l k�zel m�sz egy �llathoz, akkor az elszalad!");
		SendClientMessage(playerid, COLOR_GRAD2, "Vigy�zz! Az elejtett �zeket b�rki el tudja sz�ll�tani saj�t profitj�ra!");
	}
	elseif(egyezik(a, "ell�t") || egyezik(a, "ellat"))
	{
		new b = GetClosestDeer(playerid);
		
		if(PlayerInfo[playerid][pPayCheck] > 700000) return Msg(playerid, "T�l sok vadat l�tt�l m�r ki, nem adhatsz le t�bbet!");
		
		if(Munkaban[playerid] != MUNKA_VADASZ) return Msg(playerid, "Nem vagy vad�sz szolg�latban!");
		if(WeaponArmed(playerid) != 4) return Msg(playerid, "Egy k�s kell ahhoz, hogy a goly�t el tudd t�vol�tani az �z test�b�l!");
		if(GetDistanceToDeer(playerid, b) > 2.0) return Msg(playerid, "T�l messzi vagy az �zt�l!");
		if(DeerInfo[b][dSupplied]) return Msg(playerid, "Ez az �z m�r el van l�tva!");
		if(!DeerInfo[b][dKilled]) return Msg(playerid, "Ez az �z nincs meg�lve!");
		if(DeerInfo[b][dHealth] < 5) return Msg(playerid, "Ezt az �zet m�r hi�ba l�tod el, t�ls�gosan elfert�z�d�tt a seb, nem kapn�l �rte fizet�st!");
		if(MunkaFolyamatban[playerid] == 1) return Msg(playerid, "�pp v�gzel valamit, nem tudod ell�tni az �z s�r�l�s�t!");
		SetTimerEx("Munkavege", (101-DeerInfo[b][dHealth])*1000, false, "ddd", playerid, M_OZELLATAS, b);
		SendClientMessage(playerid, COLOR_GREEN, "Elkezdted ell�tni az �z s�r�l�s�t a k�sed seg�ts�g�vel.");
		MunkaFolyamatban[playerid] = 1;
		Freeze(playerid);
		ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
	}
	elseif(egyezik(a, "elszamol") || egyezik(a, "elsz�mol"))
	{
		new kocsi = GetPlayerVehicleID(playerid);
		if(!PlayerToPoint(10.0, playerid, -1945.2025,-1084.0623,30.7779)) return SetPlayerCheckpoint(playerid, -1945.2025,-1084.0623,30.7779, 10.0);
		if(Munkaban[playerid] != MUNKA_VADASZ) return Msg(playerid, "Ez nem vad�szfelszerel�s, vedd fel el�sz�r azt!");
		if(!IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Nem vagy j�rm�ben!");
		if(GetVehicleModel(kocsi) != 554) return Msg(playerid, "Ez nem egy Yosemite!");
		if(VehicleAdatok[kocsi][_DEER_NUM_] == 0) return Msg(playerid, "Ennek a Yosemitenak a h�tulj�n nincsen egy elejtett �llat sem!");
		
		if(PlayerInfo[playerid][pPayCheck] > 700000) return Msg(playerid, "T�l sok vadat l�tt�l m�r ki, nem adhatsz le t�bbet!");
		
		SendClientMessage(playerid, COLOR_GREEN, "Erd�szet szakigazgat�: "COL_FEHER"Munk�saim elkezdt�k a l�tt vadak lepakol�s�t, kivizsg�l�s�t feldolgoz�s�t! K�rem v�rjon t�relemmel!");
		Freeze(playerid, 25000);
		
		/* **************************************************************** */
		new fizu, hpszorzo;
		
		//ezzel vissza lehet venni a nagy bev�telt
		new vadaszok;
		foreach(Jatekosok, i)
		{
			if(Munkaban[i] == MUNKA_VADASZ)
				vadaszok++;
		}
		new fizetesszorzo=3;
		new fizetesosszeg = 8000;
		
		switch(vadaszok)
		{
			case 0..2: fizetesszorzo=2,fizetesosszeg=1000;
			case 3..5: fizetesszorzo=2,fizetesosszeg=3000;
			case 6..8: fizetesszorzo=2,fizetesosszeg=4000;
			case 9..10: fizetesszorzo=3,fizetesosszeg=7000;
			case 11..400: fizetesszorzo=3,fizetesosszeg=8000;
			default: fizetesszorzo=3,fizetesosszeg=7000;
		}
		
		if(VehicleAdatok[kocsi][_DEER_NUM_] > 4)
		{
			if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_5_]))DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_5_]),VehicleAdatok[kocsi][_OBJECT_DEER_5_]=INVALID_OBJECT_ID;
			if(VehicleAdatok[kocsi][_DEER_HEALTH_5_] >= 6 && VehicleAdatok[kocsi][_DEER_HEALTH_5_] <= 25) hpszorzo = 1;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_5_] >= 26 && VehicleAdatok[kocsi][_DEER_HEALTH_5_] <= 50) hpszorzo = 2;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_5_] >= 51 && VehicleAdatok[kocsi][_DEER_HEALTH_5_] <= 75) hpszorzo = 3;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_5_] >= 76) hpszorzo = 4;
			fizu = fizetesosszeg+(floatround(VehicleAdatok[kocsi][_DEER_DISTANCE_5_])*fizetesszorzo)*hpszorzo*VehicleAdatok[kocsi][_DEER_GUN_5_];
			PlayerInfo[playerid][pPayCheck] += fizu;
			SendFormatMessage(playerid, COLOR_GREEN, "Erd�szeti szakigazgat�: "COL_FEHER"Az �llatot rendben tal�ltuk. Ez�rt a l�tt vad�rt %s forintot �rtunk a fizet�si csekk�re!", FormatInt(fizu));
			VehicleAdatok[kocsi][_DEER_HEALTH_5_] = 0;
			VehicleAdatok[kocsi][_DEER_DISTANCE_5_] = 0.0;
			VehicleAdatok[kocsi][_DEER_GUN_5_] = 0;
			VehicleAdatok[kocsi][_DEER_NUM_] = 4;
		}
		if(VehicleAdatok[kocsi][_DEER_NUM_] > 3)
		{
			if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_4_]))DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_4_]),VehicleAdatok[kocsi][_OBJECT_DEER_4_]=INVALID_OBJECT_ID;
			if(VehicleAdatok[kocsi][_DEER_HEALTH_4_] >= 6 && VehicleAdatok[kocsi][_DEER_HEALTH_4_] <= 25) hpszorzo = 1;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_4_] >= 26 && VehicleAdatok[kocsi][_DEER_HEALTH_4_] <= 50) hpszorzo = 2;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_4_] >= 51 && VehicleAdatok[kocsi][_DEER_HEALTH_4_] <= 75) hpszorzo = 3;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_4_] >= 76) hpszorzo = 4;
			fizu = fizetesosszeg+(floatround(VehicleAdatok[kocsi][_DEER_DISTANCE_4_])*fizetesszorzo)*hpszorzo*VehicleAdatok[kocsi][_DEER_GUN_4_];
			PlayerInfo[playerid][pPayCheck] += fizu;
			SendFormatMessage(playerid, COLOR_GREEN, "Erd�szeti szakigazgat�: "COL_FEHER"Az �llatot rendben tal�ltuk. Ez�rt a l�tt vad�rt %s forintot �rtunk a fizet�si csekk�re!", FormatInt(fizu));
			VehicleAdatok[kocsi][_DEER_HEALTH_4_] = 0;
			VehicleAdatok[kocsi][_DEER_DISTANCE_4_] = 0.0;
			VehicleAdatok[kocsi][_DEER_GUN_4_] = 0;
			VehicleAdatok[kocsi][_DEER_NUM_] = 3;
		}
		if(VehicleAdatok[kocsi][_DEER_NUM_] > 2)
		{
			if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_3_]))DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_3_]),VehicleAdatok[kocsi][_OBJECT_DEER_3_]=INVALID_OBJECT_ID;
			if(VehicleAdatok[kocsi][_DEER_HEALTH_3_] >= 6 && VehicleAdatok[kocsi][_DEER_HEALTH_3_] <= 25) hpszorzo = 1;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_3_] >= 26 && VehicleAdatok[kocsi][_DEER_HEALTH_3_] <= 50) hpszorzo = 2;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_3_] >= 51 && VehicleAdatok[kocsi][_DEER_HEALTH_3_] <= 75) hpszorzo = 3;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_3_] >= 76) hpszorzo = 4;
			fizu = fizetesosszeg+(floatround(VehicleAdatok[kocsi][_DEER_DISTANCE_3_])*fizetesszorzo)*hpszorzo*VehicleAdatok[kocsi][_DEER_GUN_3_];
			PlayerInfo[playerid][pPayCheck] += fizu;
			SendFormatMessage(playerid, COLOR_GREEN, "Erd�szeti szakigazgat�: "COL_FEHER"Az �llatot rendben tal�ltuk. Ez�rt a l�tt vad�rt %s forintot �rtunk a fizet�si csekk�re!", FormatInt(fizu));
			VehicleAdatok[kocsi][_DEER_HEALTH_3_] = 0;
			VehicleAdatok[kocsi][_DEER_DISTANCE_3_] = 0.0;
			VehicleAdatok[kocsi][_DEER_GUN_3_] = 0;
			VehicleAdatok[kocsi][_DEER_NUM_] = 2;
		}
		if(VehicleAdatok[kocsi][_DEER_NUM_] > 1)
		{
			if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_2_]))DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_2_]),VehicleAdatok[kocsi][_OBJECT_DEER_2_]=INVALID_OBJECT_ID;
			if(VehicleAdatok[kocsi][_DEER_HEALTH_2_] >= 6 && VehicleAdatok[kocsi][_DEER_HEALTH_2_] <= 25) hpszorzo = 1;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_2_] >= 26 && VehicleAdatok[kocsi][_DEER_HEALTH_2_] <= 50) hpszorzo = 2;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_2_] >= 51 && VehicleAdatok[kocsi][_DEER_HEALTH_2_] <= 75) hpszorzo = 3;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_2_] >= 76) hpszorzo = 4;
			fizu = fizetesosszeg+(floatround(VehicleAdatok[kocsi][_DEER_DISTANCE_2_])*fizetesszorzo)*hpszorzo*VehicleAdatok[kocsi][_DEER_GUN_2_];
			PlayerInfo[playerid][pPayCheck] += fizu;
			SendFormatMessage(playerid, COLOR_GREEN, "Erd�szeti szakigazgat�: "COL_FEHER"Az �llatot rendben tal�ltuk. Ez�rt a l�tt vad�rt %s forintot �rtunk a fizet�si csekk�re!", FormatInt(fizu));
			VehicleAdatok[kocsi][_DEER_HEALTH_2_] = 0;
			VehicleAdatok[kocsi][_DEER_DISTANCE_2_] = 0.0;
			VehicleAdatok[kocsi][_DEER_GUN_2_] = 0;
			VehicleAdatok[kocsi][_DEER_NUM_] = 1;
		}
		if(VehicleAdatok[kocsi][_DEER_NUM_] > 0)
		{
			if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_1_]))DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_1_]),VehicleAdatok[kocsi][_OBJECT_DEER_1_]=INVALID_OBJECT_ID;
			if(VehicleAdatok[kocsi][_DEER_HEALTH_1_] >= 6 && VehicleAdatok[kocsi][_DEER_HEALTH_1_] <= 25) hpszorzo = 1;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_1_] >= 26 && VehicleAdatok[kocsi][_DEER_HEALTH_1_] <= 50) hpszorzo = 2;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_1_] >= 51 && VehicleAdatok[kocsi][_DEER_HEALTH_1_] <= 75) hpszorzo = 3;
			elseif(VehicleAdatok[kocsi][_DEER_HEALTH_1_] >= 76) hpszorzo = 4;
			fizu = fizetesosszeg+(floatround(VehicleAdatok[kocsi][_DEER_DISTANCE_1_])*fizetesszorzo)*hpszorzo*VehicleAdatok[kocsi][_DEER_GUN_1_];
			PlayerInfo[playerid][pPayCheck] += fizu;
			SendFormatMessage(playerid, COLOR_GREEN, "Erd�szeti szakigazgat�: "COL_FEHER"Az �llatot rendben tal�ltuk. Ez�rt a l�tt vad�rt %s forintot �rtunk a fizet�si csekk�re!", FormatInt(fizu));
			VehicleAdatok[kocsi][_DEER_HEALTH_1_] = 0;
			VehicleAdatok[kocsi][_DEER_DISTANCE_1_] = 0.0;
			VehicleAdatok[kocsi][_DEER_GUN_1_] = 0;
			VehicleAdatok[kocsi][_DEER_NUM_] = 0;
		}
		return Msg(playerid, "Ennek a Yosemitenak a h�tulj�n nincsen egy elejtett �llat sem!");
	}
	elseif(egyezik(a, "felpakol"))
	{
		new oz = GetClosestDeer(playerid), kocsi = GetClosestVehicle(playerid);
		
		if((GetDistanceToDeer(playerid, oz) > 5.0))
			return Msg(playerid, "Nincs �z a k�zeledben!");
		if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 5.0)
			return Msg(playerid, "Nincs j�rm� a k�zeledben!");
		if(IsPlayerInAnyVehicle(playerid))
			return Msg(playerid, "J�rm�ben hogy akarod?");
		if(GetVehicleModel(kocsi) != 554)
			return Msg(playerid, "Ezzel a j�rm�vel nem tudod elsz�ll�tani az �z(eke)t!");
		if(!DeerInfo[oz][dSupplied])
			return Msg(playerid, "Ez az �z nincs ell�tva!");
		
		if(VehicleAdatok[kocsi][_DEER_NUM_] != 5)
			VehicleAdatok[kocsi][_DEER_NUM_]++;
		else
			return Msg(playerid, "Erre a j�rm�re m�r nem tudsz t�bb vadat pakolni!");

		switch(VehicleAdatok[kocsi][_DEER_NUM_])
		{
			case 1:
			{
				if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_1_]))  DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_1_]),VehicleAdatok[kocsi][_OBJECT_DEER_1_] = INVALID_OBJECT_ID; 
				VehicleAdatok[kocsi][_OBJECT_DEER_1_] = CreateDynamicObject(19315, -0.54010, -2.26840, 0.17500,   -50.00000, 0.00000, 90.00000);
				AttachDynamicObjectToVehicle(VehicleAdatok[kocsi][_OBJECT_DEER_1_], kocsi, -0.54010, -2.26840, 0.17500,   -50.00000, 0.00000, 90.00000);
				VehicleAdatok[kocsi][_DEER_DISTANCE_1_] = DeerInfo[oz][dDistance];
				VehicleAdatok[kocsi][_DEER_HEALTH_1_] = DeerInfo[oz][dHealth];
				if(DeerInfo[oz][dWeaponType] == 25) VehicleAdatok[kocsi][_DEER_GUN_1_] = 1;
				else VehicleAdatok[kocsi][_DEER_GUN_1_] = 2;
			}
			case 2:
			{
				if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_2_]))  DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_2_]),VehicleAdatok[kocsi][_OBJECT_DEER_2_] = INVALID_OBJECT_ID; 
				VehicleAdatok[kocsi][_OBJECT_DEER_2_] = CreateDynamicObject(19315, -0.51425, -1.43365, 0.17500,   -50.00000, 0.00000, 90.00000);
				AttachDynamicObjectToVehicle(VehicleAdatok[kocsi][_OBJECT_DEER_2_], kocsi, -0.51425, -1.43365, 0.17500,   -50.00000, 0.00000, 90.00000);
				VehicleAdatok[kocsi][_DEER_DISTANCE_2_] = DeerInfo[oz][dDistance];
				VehicleAdatok[kocsi][_DEER_HEALTH_2_] = DeerInfo[oz][dHealth];
				if(DeerInfo[oz][dWeaponType] == 25) VehicleAdatok[kocsi][_DEER_GUN_2_] = 1;
				else VehicleAdatok[kocsi][_DEER_GUN_2_] = 2;
			}
			case 3:
			{
				if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_3_]))  DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_3_]),VehicleAdatok[kocsi][_OBJECT_DEER_3_] = INVALID_OBJECT_ID; 
				VehicleAdatok[kocsi][_OBJECT_DEER_3_] = CreateDynamicObject(19315, 0.38580, -2.24810, 0.17500,   -90.00000, 0.00000, 90.00000);
				AttachDynamicObjectToVehicle(VehicleAdatok[kocsi][_OBJECT_DEER_3_], kocsi, 0.38580, -2.24810, 0.17500,   -90.00000, 0.00000, 90.00000);
				VehicleAdatok[kocsi][_DEER_DISTANCE_3_] = DeerInfo[oz][dDistance];
				VehicleAdatok[kocsi][_DEER_HEALTH_3_] = DeerInfo[oz][dHealth];
				if(DeerInfo[oz][dWeaponType] == 25) VehicleAdatok[kocsi][_DEER_GUN_3_] = 1;
				else VehicleAdatok[kocsi][_DEER_GUN_3_] = 2;
			}
			case 4:
			{
				if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_4_]))  DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_4_]),VehicleAdatok[kocsi][_OBJECT_DEER_4_] = INVALID_OBJECT_ID; 
				VehicleAdatok[kocsi][_OBJECT_DEER_4_] = CreateDynamicObject(19315, 0.43840, -1.48990, 0.17500,   -90.00000, 0.00000, 90.00000);
				AttachDynamicObjectToVehicle(VehicleAdatok[kocsi][_OBJECT_DEER_4_], kocsi, 0.43840, -1.48990, 0.17500,   -90.00000, 0.00000, 90.00000);
				VehicleAdatok[kocsi][_DEER_DISTANCE_4_] = DeerInfo[oz][dDistance];
				VehicleAdatok[kocsi][_DEER_HEALTH_4_] = DeerInfo[oz][dHealth];
				if(DeerInfo[oz][dWeaponType] == 25) VehicleAdatok[kocsi][_DEER_GUN_4_] = 1;
				else VehicleAdatok[kocsi][_DEER_GUN_4_] = 2;
			}
			case 5:
			{
				if(IsValidDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_5_])) DestroyDynamicObject(VehicleAdatok[kocsi][_OBJECT_DEER_5_]),VehicleAdatok[kocsi][_OBJECT_DEER_5_] = INVALID_OBJECT_ID; 
				VehicleAdatok[kocsi][_OBJECT_DEER_5_] = CreateDynamicObject(19315, -0.48040, -0.86470, 0.17500,   -29.00000, 0.00000, 0.00000);
				AttachDynamicObjectToVehicle(VehicleAdatok[kocsi][_OBJECT_DEER_5_], kocsi, -0.48040, -0.86470, 0.17500,   -29.00000, 0.00000, 0.00000);
                SendClientMessage(playerid, COLOR_GREEN, "A j�rm�re m�r nem tudsz t�bb �zt pakolni! Vidd el az erd�szetre �ket!");
				SetPlayerCheckpoint(playerid, -1945.2025,-1084.0623,30.7779, 10.0);
				VehicleAdatok[kocsi][_DEER_DISTANCE_5_] = DeerInfo[oz][dDistance];
				VehicleAdatok[kocsi][_DEER_HEALTH_5_] = DeerInfo[oz][dHealth];
				if(DeerInfo[oz][dWeaponType] == 25) VehicleAdatok[kocsi][_DEER_GUN_5_] = 1;
				else VehicleAdatok[kocsi][_DEER_GUN_5_] = 2;
			}
		}
		Streamer_Update(playerid);
		SendClientMessage(playerid, COLOR_GREEN, "Az �z(ek) sikeresen felpakolva a plat�ra!");
		RemoveDeer(oz);
	}
	elseif(egyezik(a, "go"))
	{
		if(!IsScripter(playerid)) return 1;
		new kac_kac_kukac = GetClosestDeer(playerid);
		SetPlayerPos(playerid, ArrExt(DeerInfo[kac_kac_kukac][dPos]));
		SendFormatMessage(playerid, -1, "Teleport�lva a(z) #%d sz�m� �zh�z (te lusta diszn�! :P)", kac_kac_kukac);
	}
	elseif(egyezik(a, "create"))
	{
		if(!IsScripter(playerid)) return 1;
		CreateDeer();
		SendClientMessage(playerid, -1, "K�sz");
	}
	return 1;
}

CMD:ondutyskin(playerid, params[])
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

ALIAS(korm1ny):kormany;
CMD:kormany(playerid, params[])
{
	new func[10];
	new func2[60];

	if(sscanf(params, "s[12]S()[60]", func,func2)) return Msg(playerid,"/korm�ny [stat / frakci�ad� / akit�ntet�s / rendezv�ny / settax / givetax]");

	if(!LMT(playerid, FRAKCIO_ONKORMANYZAT) && !Admin(playerid, 1337) && IsScripter(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Nem vagy (Al)Eln�k!");
			
			
		
	if(egyezik(func,"stat"))
	{
		if(!Munkarang(playerid,10)) return Msg(playerid, "A-A");
		//FrakcioAdoStat();
		
		SendClientMessage(playerid,COLOR_WHITE,"============= Frakci� ad� bev�telek =================");
		new heti,havi,ossz;
		for(new yx; yx < MAX_ADO_FRAKCIO; yx++)
		{
			new id=AdozoFrakciok[yx];
			SendFormatMessage(playerid, COLOR_YELLOW, "[%d]%s Heti: %s Ft, Havi %s Ft, �sszes: %s Ft",id,Szervezetneve[id-1][0], FormatInt(FrakcioInfo[id][fHeti]),FormatInt(FrakcioInfo[id][fHavi]),FormatInt(FrakcioInfo[id][fOsszes]));
			heti +=FrakcioInfo[id][fHeti];
			havi +=FrakcioInfo[id][fHavi];
			ossz +=FrakcioInfo[id][fOsszes];
		}
		SendFormatMessage(playerid, COLOR_YELLOW, "�sszesen: Heti %s Ft, Havi %s Ft, �sszesen: %s Ft",FormatInt(heti),FormatInt(havi),FormatInt(ossz));
		SendClientMessage(playerid,COLOR_WHITE,"Heti: Vas�rnap 23:44 - 59-k�z�tt, Havi: Minden h� utols� nap 23:44 -59 -k�z�tt => null�z�dik");
	}
	if(egyezik(func,"givetax"))
    {
		new string[128];
		if(PlayerInfo[playerid][pLeader] != FRAKCIO_ONKORMANYZAT) return SendClientMessage(playerid, COLOR_GREY, "Nem vagy az Eln�k!");

		if(FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] < 1) return SendClientMessage(playerid, COLOR_GREY, "A kassz�ban nincs p�nz!");

		new penz,frakcio;
		if(sscanf(func2, "dd", frakcio,penz))
		{
			
			for(new yx; yx < MAX_ADO_FRAKCIO; yx++)
			{
				new id=AdozoFrakciok[yx];
				
				format(string, sizeof(string),"%s %s[%d],", string, Szervezetneve[id-1][0],id);
			
			}	
			SendClientMessage(playerid, COLOR_GREY, "Haszn�lata: /korm�ny givetax [frakci�ID] [p�nz]");
			SendFormatMessage(playerid, COLOR_GREY, "%s",string);
			SendClientMessage(playerid, COLOR_GREY, "Speci�lis: Civil[30], SWAT[31], Kisebbs�g[32]");
			SendFormatMessage(playerid, COLOR_GREY, "Kassza: %s Ft", FormatNumber( FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] , 0, ',' ));
			return 1;
		}
	
		if(penz > FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz])
		{
			SendFormatMessage(playerid, COLOR_GREY, "A kassz�ban nincs % sFt, csak %s Ft!", FormatNumber( penz , 0, ',' ), FormatNumber( FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz], 0, ',' ));
			return 1;
		}
		new adozo = false;
		for(new yx; yx < MAX_ADO_FRAKCIO; yx++)
		{
			new id=AdozoFrakciok[yx];
			if(id == frakcio)
				adozo = true;
		}
		if(adozo)
		{
			
			foreach(Jatekosok, i)
			{
				if(LMT(i, frakcio))
				{
					format(string, sizeof(string), "* A nagylelk� (al)eln�k �tutalta az ad�k egy r�sz�t a %s sz�m�ra! %s Ft ker�lt a sz�fbe!", Szervezetneve[frakcio-1][0],FormatInt(penz));
					SendClientMessage(i, COLOR_LIGHTBLUE, string);
				}
			}

			FrakcioInfo[frakcio][fPenz] += penz;
			
			FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] -= penz;
			SendFormatMessage(playerid, COLOR_GREY, " �tutalt�l %s Ft-ot a %s sz�m�ra.", FormatInt(penz),Szervezetneve[frakcio-1][0]);

		}
		else if(frakcio == 32)
		{
			new Tagok = 0;
			foreach(Jatekosok, i)
			{
				if(LMT(i, FRAKCIO_SONSOFANARCHY) || LMT(i, FRAKCIO_COSANOSTRA) || LMT(i, FRAKCIO_YAKUZA) || LMT(i, FRAKCIO_VAGOS) || LMT(i, FRAKCIO_AZTEC) || LMT(i, FRAKCIO_GSF))
					Tagok += 1;
			}


			if(Tagok >= 1)
			{
				new price = floatround(penz / Tagok);
				foreach(Jatekosok, i)
				{
					if(IsPlayerConnected(i))
					{

						if(LMT(i, FRAKCIO_SONSOFANARCHY) || LMT(i, FRAKCIO_COSANOSTRA) || LMT(i, FRAKCIO_YAKUZA) || LMT(i, FRAKCIO_VAGOS) || LMT(i, FRAKCIO_AZTEC) || LMT(i, FRAKCIO_GSF))
						{
							format(string, sizeof(string), "* A nagylelk� (al)eln�k seg�lyt k�ld�tt a kisebbs�g sz�m�ra. A r�szed: %d",price);
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
							GiveMoney(i, price);
							FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] -= price;
						}
					}
				}
				SendFormatMessage(playerid, COLOR_GREY, " �tutalt�l %dFt-t a kisebbs�g sz�m�ra. %d kisebbs�gi van, fejenk�nt %dFt-t kaptak!", penz, Tagok, price);
				//SaveStuff();
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Nincs fennt Band�s/Mafi�s!");
				return 1;
			}
		}
		else if(frakcio == 31)
		{
			new Tagok = 0;
			for(new i = 0; i < MAX_PLAYERS; i++)
			{
				if(IsPlayerConnected(i))
				{
					if(PlayerInfo[i][pSwattag] == 1)
					{
						Tagok += 1;
					}
				}
			}

			if(Tagok >= 1)
			{
				new price = floatround(penz / Tagok);
				for(new i = 0; i < MAX_PLAYERS; i++)
				{
					if(IsPlayerConnected(i))
					{
						if(PlayerInfo[i][pSwattag] == 1)
						{
							format(string, sizeof(string), "* A nagylelk� (al)eln�k �tutalta az ad�k egy r�sz�t a SWAT sz�m�ra. A r�szed: %d",price);
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
							GiveMoney(i, price);
							FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] -= price;
						}
					}
				}
				SendFormatMessage(playerid, COLOR_GREY, " �tutalt�l %dFt-t a SWAT sz�m�ra. %d  SWAT-os van, fejenk�nt %dFt-t kaptak!", penz, Tagok, price);
				//SaveStuff();
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Nincs fennt SWAT-os!");
				return 1;
			}
		}
		else if(frakcio == 30)
		{
			new Tagok;
			foreach(Jatekosok, i)
			{
				if(!PlayerInfo[i][pMember] && !PlayerInfo[i][pLeader])
					Tagok += 1;
			}

			if(Tagok >= 1)
			{
				new price = floatround(penz / Tagok);
				foreach(Jatekosok, i)
				{
					if(!PlayerInfo[i][pMember] && !PlayerInfo[i][pLeader])
					{
						format(string, sizeof(string), "* A nagylelk� (al)eln�k �tutalta az ad�k egy r�sz�t a civilek sz�m�ra. A r�szed: %d",price);
						SendClientMessage(i, COLOR_LIGHTBLUE, string);
						GiveMoney(i, price);
						FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] -= price;
					}
				}
				SendFormatMessage(playerid, COLOR_GREY, " �tutalt�l %dFt-t a civilek sz�m�ra. %d civil van, fejenk�nt %dFt-t kaptak!", penz, Tagok, price);
				//SaveStuff();
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Nincs fennt civil!");
				return 1;
			}
		}
		else Msg(playerid,"Hib�s ID!");
		
		return 1;
	}
	if(egyezik(func, "settax"))
    {
		if(!Admin(playerid, 5555)) return Msg(playerid,"S�lyos vissza  �l�sek miatt tiltva");
		//if(!LMT(playerid, FRAKCIO_ONKORMANYZAT) && !Admin(playerid, 1337))
		//	return SendClientMessage(playerid, COLOR_GREY, "Nem vagy (Al)Eln�k!");

		//if(!Munkarang(playerid, 5))
		//	return SendClientMessage(playerid, COLOR_GREY, "Minimum Aleln�ki rang sz�ks�ges!");

		new ado;
		if(sscanf(func2, "d", ado))
			return SendFormatMessage(playerid, COLOR_LIGHTRED, "Haszn�lat: /korm�ny settax [ad� (50 = norm�l, 100 = k�tszeres, stb...] - Jelenlegi ad�: %d", TaxValue), 1;

		//if(ado < 0 || ado > 100)
		//	return Msg(playerid, "Min. 0, max 100 - A norm�l ad� az 50, a 100 az ad� k�tszerese, 0 eset�n nincs ad�");

		if(ado < ADO_MIN || ado > ADO_MAX)
		{
			SendFormatMessage(playerid, COLOR_LIGHTRED, "%s: Minimum %d, maximum %d - A norm�l ad� 50, a k�tszerese 100, m�sf�lszerese 75, stb.", SERVER_NEV, ADO_MIN, ADO_MAX);
			return 1;
		}

		if(ado >= 100 && !IsClint(playerid))
			return Msg(playerid, "Csak 75ig �ll�thatod - ha enn�l nagyobbra szeretn�d, sz�lj Clintnek");

		SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Az �j ad� mostm�r %d! (A r�gi %d volt)", ado, TaxValue);
		TaxValue = ado;
	    return 1;
	}
	if(egyezik(func, "rendezv�ny"))
	{
		if(FloodCheck(playerid)) return 1;
		new result[128];
		new string[128];
		if(sscanf(func2, "s[128]", result))
			return SendClientMessage(playerid, COLOR_WHITE, "Haszn�lat: /korm�ny rendezv�ny [Sz�veg]");

		if(SzovegEllenorzes(playerid, result, "/rendezv�ny", ELLENORZES_MINDKETTO))
			return 1;

		if(LMT(playerid, FRAKCIO_ONKORMANYZAT) || IsAdmin(playerid))
		{
			format(string, sizeof(string), "[%d] **Rendezv�ny** %s", playerid, result);
			SendMessage(SEND_MESSAGE_OOCOFF, string, COLOR_RENDEZVENY);
			printf("%s\n", string);
		}
		
		return 1;
	}
	if(egyezik(func, "akituntetes") || egyezik(func, "akit�ntet�s"))
	{
	    new player;
		new szam;
		new string[128];
		if(sscanf(func2, "rd", player, szam))
		{
			Msg(playerid,"Haszn�lata: /korm�ny akit�ntet�s [N�v / ID] [1-6]");
			Msg(playerid,"Kit�ntet�sek: 1. Tiszteletbeli polg�r | 2. D�szpolg�r | 3. Veter�n �rdemrend | 4. V�r�s csillag");
			Msg(playerid,"Kit�ntet�sek: 5. Konszolid�ci�s �rdemrend | 6. V�r�s Csillag �rdemrend");
			return 1;
		}	
		
		if(player == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen j�t�kos.");
		if(player == playerid) return Msg(playerid, "Nana..");
		if(GetDistanceBetweenPlayers(playerid,player) > 3) return Msg(playerid, "� nincs a k�zeledben!");
		
		if(!LMT(player, FRAKCIO_ONKORMANYZAT)) return Msg(playerid, "� nem tag!");
		if(szam > 6 || szam < 1) return Msg(playerid,"A kit�ntet�s sz�ma 1 �s 6 k�z�tt lehet!");
		SendFormatMessage(player, COLOR_LIGHTBLUE, "Kit�net�st kapt�l t�le: %s", ICPlayerName(playerid));
		SendFormatMessage(player, COLOR_LIGHTBLUE, "Kit�ntet�sed: %s", KormanyKituntetes[szam]);
		format(string, sizeof(string), "R�di�: %s kit�ntette %s -t | Kit�ntet�se: %s **", ICPlayerName(playerid), ICPlayerName(player), KormanyKituntetes[szam]);
		SendMessage(SEND_MESSAGE_RADIO, string, COLOR_RED, FRAKCIO_ONKORMANYZAT);
		PlayerInfo[player][pKormanyKituntetes] = szam;
		
		return 1;
	}
	if(egyezik(func,"frakci�ad�") || egyezik(func,"frakcioado"))
	{
		if(!Munkarang(playerid, 5))
			return SendClientMessage(playerid, COLOR_GREY, "Minimum Aleln�ki rang sz�ks�ges!");
			
		new ado;
		new szam;
		if(sscanf(func2, "dd", szam, ado))
		{
			Msg(playerid, "Haszn�lat: /frakci�ad� [frakci� sz�ma] [szorz�]");
			
			SendClientMessage(playerid, COLOR_LIGHTRED,"=================Frakci�k ad�i=================");
			for(new yx; yx < MAX_ADO_FRAKCIO; yx++)
			{
				new id=AdozoFrakciok[yx];
				new string[128];
				format(string,sizeof(string),"[%d] %s || Jelenlegi ad�ja: %d %% || Sz�f %s Ft",id,Szervezetneve[id-1][0], FrakcioInfo[id][fAdo],FormatInt(FrakcioInfo[id][fPenz]));
				SendFormatMessage(playerid, COLOR_LIGHTRED, "%s", string);
			
			}	
			SendClientMessage(playerid, COLOR_LIGHTRED,"=================Frakci�k ad�i=================");
			return 1;
		}

		new bool:ellen;
		for(new x; x < MAX_ADO_FRAKCIO; x++)
		{	
			if(AdozoFrakciok[x] == szam) 
				ellen=true;
		}
		if(!ellen) return Msg(playerid, "Ez a frakci� nem ad�zik!");
		
		if(ado < 0 || ado > 25)
		{
			Msg(playerid,"Az ad�nak 0-25% k�z�tt kell lenni-e!");
			return 1;
		}
		
			
		SendFormatMessage(playerid, COLOR_LIGHTBLUE, "A(z) %s ad�ja %d ", Szervezetneve[szam-1][0], ado);
		FrakcioInfo[szam][fAdo] = ado;
		return 1;
	}

	return 1;
}
ALIAS(pil4taradar):pilotaradar;
CMD:pilotaradar(playerid, params[])
{
	new veh = GetPlayerVehicleID(playerid), pilotak = 0;
	if(!AMT(playerid, MUNKA_PILOTA)) return Msg(playerid, "Nem vagy pil�ta!");
	if(!IsAPRepulo(veh)) return Msg(playerid, "Nem utassz�ll�t� g�pben �lsz!");
	if(Repul[playerid] == 0) return Msg(playerid, "Nincs leszerz�dtetett sz�ll�t�sod, �gy nem k�rheted le a t�bbi pil�ta helyzet�t!");
	if(!PilotaRadar[playerid])
	{
		foreach(Jatekosok, p)
		{
			new allveh = GetPlayerVehicleID(p);
			if(AMT(p, MUNKA_PILOTA) && IsAPRepulo(allveh) && Repul[p] == 1)
				SetPlayerMarkerForPlayer(playerid, p, 0xFFFFFF44), pilotak++;
		}
		PilotaRadar[playerid] = 1;
		SendFormatMessage(playerid, COLOR_GREEN, "Pil�taradar bekapcsolva, �sszesen %d pil�ta van a l�gt�rben!", pilotak);
	}
	else
	{
		foreach(Jatekosok, p)
		{
			new allveh = GetPlayerVehicleID(p);
			if(AMT(p, MUNKA_PILOTA) && IsAPRepulo(allveh) && Repul[p] == 1)
				SetPlayerMarkerForPlayer(playerid, p, COLOR_INVISIBLE);
		}
		PilotaRadar[playerid] = 0;
		SendClientMessage(playerid, COLOR_GREEN, "Pil�taradar kikapcsolva");
	}
	return 1;
}
ALIAS(derbi):roncsderbi;
CMD:roncsderbi(playerid, params[])
{
	if(RoncsDerbi[rInditva]) return Msg(playerid, "Jelenleg foglalt a p�lya!");
	
	if(!PlayerToPoint(5,playerid,-2110.9934,-444.3106,38.7344,0,0)) return Msg(playerid, "Nem vagy San Fiero stadion bej�rat�n�l! ((az i bet�n�l))");
	
	if(RoncsDerbi[rIndit]) return Msg(playerid, "V�rj egy kicsit m�g, most ind�t valaki!");
	
	if(!RoncsDerbi[rFutam])
	{
		if(!BankkartyaFizet(playerid,DERBI_ARA,false)) return SendFormatMessage(playerid, COLOR_YELLOW,"A verseny �ra %s Ft!",FormatInt(DERBI_ARA));
		RoncsDerbi[rIndit] = true;
		ShowPlayerDialog(playerid, DIALOG_DERBI_KOCSIVALASZT, DIALOG_STYLE_LIST, "Roncsderbi, szabad a kocsi v�laszt�s?!", "IGEN - a csatlakoz� j�t�kos adja meg milyen kocsival lesz.\nNEM - Te adod meg milyen kocsival legyenek a j�t�kosok.", "Tov�bb","M�gse");
	}
	else
	{
		if(RoncsDerbi[rJatekos] >= 20) return Msg(playerid, "A versenyen maximum 20-an lehetnek, betelt a p�lya!");
		if(RoncsDerbi[rModel] == NINCS)
		{
			if(!BankkartyaFizet(playerid,DERBI_ARA,false)) return SendFormatMessage(playerid, COLOR_YELLOW,"A verseny �ra %s Ft!",FormatInt(DERBI_ARA));
			ShowPlayerDialog(playerid, DIALOG_DERBI_KOCSIMODEL, DIALOG_STYLE_INPUT, "Roncsderbi", "Milyen j�rm�vel akarsz indulni? ((model ID vagy N�V))", "Tov�bb", "M�gse");

		}
		else
		{
			if(!BankkartyaFizet(playerid,DERBI_ARA,false)) return SendFormatMessage(playerid, COLOR_YELLOW,"A verseny �ra %s Ft!",FormatInt(DERBI_ARA));
			
			new string[256];
			format(string,sizeof(string),"RoncsDerbi futam inform�ci�k / szab�lyok\nMindenki azonos t�pus� kocsival indul\nKocsib�l kisz�lni tilos!\nSzerencs�s futamot!");
			ShowPlayerDialog(playerid, DIALOG_DERBI_BELEPES, DIALOG_STYLE_MSGBOX, "DERBI INF�", string, "Kezd�s", "");
			
		
		}
	}

	return 1;
}

ALIAS(alv1s):alvas;
CMD:alvas(playerid, params[])
{
	new ownhouse = HazabanVan(playerid), house = IsAt(playerid, IsAt_Haz);
	
	if(PlayerCuffed[playerid] || Leutve[playerid] || PlayerTied[playerid]) return Msg(playerid, "???");
	if(Alszik[playerid] == 0)
	{
		if(Almossag[playerid] <= 25.0) return Msg(playerid, "Nem vagy �lmos");
		if(ownhouse != NINCS)
		{
			Alszik[playerid] = 1;
			Cselekves(playerid,"lefek�dt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(house != NINCS)
		{
			Alszik[playerid] = 2;
			Cselekves(playerid,"lefek�dt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(PlayerInfo[playerid][pJailed] == 7)
		{
			Alszik[playerid] = 3;
			Cselekves(playerid,"lefek�dt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(GetPlayerVirtualWorld(playerid) != 0 || GetPlayerInterior(playerid) != 0)
		{
			Alszik[playerid] = 4;
			Cselekves(playerid,"lefek�dt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(PlayerToPoint(2.0, playerid, 2513.154, -1729.182, 778.637) && GetPlayerInterior(playerid) == 1)
		{
			Alszik[playerid] = 5;
			Cselekves(playerid,"lefek�dt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(IsATruck(GetPlayerVehicleID(playerid)))
		{
			Alszik[playerid] = 6;
			Cselekves(playerid,"lefek�dt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		else
		{
			Alszik[playerid] = 7;
			Cselekves(playerid,"lefek�dt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
	}
	else
	{
		if(Almossag[playerid] >= 75.0) return Msg(playerid, "T�l f�radt vagy ahhoz, hogy felkelj!");
		if(Alszik[playerid] < 7)
			ProxDetector(B_Cselekves, playerid, "* �breszt� cs�rg�se", COLOR_BLUE,COLOR_BLUE,COLOR_BLUE,COLOR_BLUE,COLOR_BLUE);
		Cselekves(playerid,"fel�bredt");
		Alszik[playerid] = 0;
		UnFreeze(playerid);
		ClearAnimations(playerid);
		Feketeseg(playerid, false);
		SetPlayerDrunkLevel(playerid, 0);
		return 1;
	}
}

ALIAS(mulat1s):mulatas;
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
}

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

ALIAS(pb):paintball; 
CMD:paintball(playerid, params[])
{
	new bool:viszbe=false;
	foreach(Jatekosok, id)
	{
		if(Visz[id] == playerid)
			viszbe = true;
	
	}
	
	if(PlayerCuffed[playerid] == 2 || viszbe)
		return SeeBan(playerid, 0, NINCS, "Cuffolva vagy viszbe Paintballba men�s!" );
	new pm[32], subpm[32], teremid, jatekido, ido;
	if(!PlayerToPoint(15, playerid, BizzInfo[BIZ_PB][bEntranceX], BizzInfo[BIZ_PB][bEntranceY], BizzInfo[BIZ_PB][bEntranceZ])) return Msg(playerid,"Nem vagy Paintball Terem el�tt!");
	if(BizzInfo[BIZ_PB][bLocked]) return Msg(playerid,"A paintball z�rva van, gyere vissza k�s�bb!");
	if(sscanf(params, "s[32]S()[32]", pm,subpm)) return Msg(playerid, "/paintball [ind�t�s/nevez�s/termek/ind�t�sok/fegyverek]");
	if(PlayerInfo[playerid][pPaintballKitiltva] == 1) return Msg(playerid, "Te el vagy tiltva a paintballoz�st�l!");
	if(egyezik(pm,"ind�t�s") || egyezik(pm,"inditas"))
	{
		if(BizzInfo[BIZ_PB][bLocked]) return Msg(playerid,"A paintball z�rva van, gyere vissza k�s�bb!");
		if(sscanf(subpm, "ddd", teremid,ido,jatekido)) return Msg(playerid,"Haszn�lata: /pb ind�t�s [Terem ID] [Nevez�si Id�(percben)] [J�t�kid�(percben)]");
		if(teremid < 1 || teremid > 4) return Msg(playerid, "A teremid minimum 1-es idj�, maximum 4-es idj�!");
		if(PaintballInfo[teremid][pbMerkozesIdo] >= UnixTime && PaintballInfo[teremid][pbHasznalva]) return Msg(playerid, "Ez a terem foglalt!");
		if(PaintballInfo[teremid][pbNevezesIdo] > 0) return Msg(playerid,"M�r van nevez�s folyamatban erre a teremre!");
		if(PaintballInfo[1][pbNevezesIdo] > 0 || PaintballInfo[2][pbNevezesIdo] > 0 || PaintballInfo[3][pbNevezesIdo] > 0 || PaintballInfo[4][pbNevezesIdo] > 0) return Msg(playerid,"Sajn�lom! Egyszerre csak 1 termet tudunk �zemeltetni!");
		if(ido < 1 || ido > 5) return Msg(playerid,"A nevez�si id�, legal�bb 1 perc �s maximum 5 perc!");
		if(jatekido < 1 || jatekido > 30) return Msg(playerid, "A j�t�kid� minimum 1 perc, maximum 30 perc!");
		if(!BankkartyaFizet(playerid, BizzInfo[BIZ_PB][bEntranceCost], false)) return Msg(playerid,"Nemtudod kifizetni a m�rk�z�s �r�t");
		PaintballInfo[teremid][pbNevezesek] = 1;
		PaintballInfo[teremid][pbNevezesIdo] = ido*60;
		PaintballInfo[teremid][pbMerkozesIdo][1] = jatekido;
		Paintballnevezve[playerid] = true;
		PBTerem[playerid] = teremid;
		
		SendClientMessage(playerid,COLOR_LIGHTRED,"Paintball: Glob�lis nevez�st ind�tott�l! Ha elt�volodsz a bej�ratt�l, akkor a nevez�sed megsz�nik!");
		foreach(Jatekosok, p)
		{
			SendClientMessage(p,COLOR_DYELLOW,"=====[ Paintball ]=====");
			SendClientMessage(p,COLOR_WHITE,"Hamarosan paintball m�rk�z�s indul, r�szletek a terem bej�rata el�tt!");
			SendFormatMessage(p,COLOR_WHITE,"TeremID: %d | Nevez�si d�j: %s Ft | J�t�kid�: %d perc | Nevezettek sz�ma: %d db | Nevezni lehet m�g: %d m�sodpercig", teremid, FormatInt(BizzInfo[BIZ_PB][bEntranceCost]*PaintballInfo[teremid][pbMerkozesIdo][1]), jatekido, PaintballInfo[teremid][pbNevezesek],PaintballInfo[teremid][pbNevezesIdo]);
		}
	}
	elseif(egyezik(pm,"nevez�s") || egyezik(pm,"nevezes"))	
	{
		if(sscanf(subpm, "d", teremid)) return Msg(playerid,"Haszn�lata /pb nevez�s [teremid]");
		if(teremid < 1 || teremid > 4) return Msg(playerid, "A teremid minimum 1-es idj�, maximum 4-es idj�!");
		if(PaintballInfo[teremid][pbNevezesek] == 0) return Msg(playerid,"Jelenleg nincs nevez�s folyamatban!");
		if(Paintballnevezve[playerid] || PBTerem[playerid] != 0) return Msg(playerid, "Te m�r nevezve vagy!");
		if(!BankkartyaFizet(playerid, BizzInfo[BIZ_PB][bEntranceCost], false)) return Msg(playerid,"Nemtudod kifezetni a m�rk�z�s �r�t");
		PaintballInfo[teremid][pbNevezesek]++;
		Paintballnevezve[playerid] = true;
		PBTerem[playerid] = teremid;
		SendFormatMessage(playerid,COLOR_LIGHTRED,"Paintball: Nevezt�l a m�rk�z�sre, jelenleg %d ember van benevezve. Ha elt�volodsz a bej�ratt�l, akkor a nevez�sed megsz�nik!",PaintballInfo[teremid][pbNevezesek]);
		foreach(Jatekosok, p)
		{
			if(Paintballnevezve[p])
				SendFormatMessage(p,COLOR_LIGHTRED,"Paintball: Egy ember nevezett a m�rk�z�sre, jelenleg %d ember van benevezve.",PaintballInfo[teremid][pbNevezesek]);
		}
		
		
	}
	elseif(egyezik(pm, "termek"))
	{
		SendClientMessage(playerid, COLOR_DYELLOW, "=====[ Paintball Termek ]=====");
		SendFormatMessage(playerid, COLOR_WHITE, "1: Hagyom�nyos, RC Battlefieldes terem (%s"COL_FEHER")", (PaintballInfo[1][pbHasznalva]) ? (""COL_PIROS"Foglalt") : (""COL_VZOLD"Szabad"));
		SendFormatMessage(playerid, COLOR_WHITE, "2: Sivatagi, elhagyatott, kis falu (%s"COL_FEHER")", (PaintballInfo[2][pbHasznalva]) ? (""COL_PIROS"Foglalt") : (""COL_VZOLD"Szabad"));
		SendFormatMessage(playerid, COLOR_WHITE, "3: Sivatagi, nagy m�ret� terem (%s"COL_FEHER")", (PaintballInfo[3][pbHasznalva]) ? (""COL_PIROS"Foglalt") : (""COL_VZOLD"Szabad"));
		SendFormatMessage(playerid, COLOR_WHITE, "4: Elhagyatott Area51-es terem (%s"COL_FEHER")", (PaintballInfo[4][pbHasznalva]) ? (""COL_PIROS"Foglalt") : (""COL_VZOLD"Szabad"));
	}
	elseif(egyezik(pm, "ind�t�sok"))
	{
		SendClientMessage(playerid, COLOR_DYELLOW, "=====[ Paintball termek, ahov� lehet nevezni ]=====");
		for(new teremidk = 1; teremidk < sizeof(PaintballInfo); teremidk++)
		{
			if(PaintballInfo[teremidk][pbNevezesek] > 0)
				SendFormatMessage(playerid, COLOR_WHITE, "TeremID: %d | Nevez�si d�j: %s Ft | J�t�kid�: %d perc | Nevezettek sz�ma: %d db | Nevezni lehet m�g: %d m�sodpercig", teremidk, FormatInt(BizzInfo[BIZ_PB][bEntranceCost]*PaintballInfo[teremidk][pbMerkozesIdo][1]), jatekido, PaintballInfo[teremidk][pbNevezesek],PaintballInfo[teremidk][pbNevezesIdo]);
			else continue;
		}
	}
	/*elseif(egyezik(pm, "fegyverek"))
	{
		Msg(playerid, "�ll�tsd be, hogy milyen fegyverekkel szeretn�l j�tszani!", true, COLOR_DYELLOW);
		tformat(256, "Pisztoly (Jelenleg: "COL_CITROM"%s"COL_FEHER")\nK�nny� l�fegyver (Jelenleg: "COL_CITROM"%s"COL_FEHER")\nS�r�tes puska (Jelenleg: "COL_CITROM"%s"COL_FEHER")\nNeh�z l�fegyver (Jelenleg: "COL_CITROM"%s"COL_FEHER")", GunName(PlayerInfo[playerid][pPBFegyver][0]), GunName(PlayerInfo[playerid][pPBFegyver][1]), GunName(PlayerInfo[playerid][pPBFegyver][2]), GunName(PlayerInfo[playerid][pPBFegyver][3]));
		ShowPlayerDialog(playerid, DIALOG_PAINTBALL_FEGYVEREK, DIALOG_STYLE_LIST, "Paintball", _tmpString, "Kiv�laszt", "M�gse");
		Freeze(playerid);
	}*/
	elseif(egyezik(pm, "kitilt") && (PlayerInfo[playerid][pPbiskey] == BIZ_PB || PlayerInfo[playerid][pBizniszKulcs] == BIZ_PB))
	{
		new jatekos, ok[128];
		if(sscanf(subpm, "rs[128]", jatekos, ok)) return Msg(playerid, "/paintball kitilt [N�v/ID] [Oka]");
		if(jatekos == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� n�v/id");
		if(PlayerInfo[playerid][pPaintballKitiltva] == 0)
		{
			PlayerInfo[playerid][pPaintballKitiltva] = 1;
			SendFormatMessage(playerid, COLOR_LIGHTRED, "%s eltiltva a paintballoz�st�l!", ICPlayerName(jatekos));
			SendFormatMessage(jatekos, COLOR_LIGHTRED, "%s eltiltott a paintballoz�st�l, oka: %s", ICPlayerName(playerid), ok);
		}
		else
		{
			PlayerInfo[playerid][pPaintballKitiltva] = 0;
			SendFormatMessage(playerid, COLOR_LIGHTRED, "%s tilt�sa feloldva, �jra paintballozhat!", ICPlayerName(jatekos));
			SendFormatMessage(jatekos, COLOR_LIGHTRED, "%s feloldotta a tilt�st, ism�t paintballozhatsz! Oka: %s", ICPlayerName(playerid), ok);
		}
	}
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

ALIAS(k5zmunk1sok):kozmunkasok;
CMD:kozmunkasok(playerid, params[])
{
	if(!IsACop(playerid) && !Admin(playerid, 1)) return Msg(playerid, "Nem vagy rend�r!");
	new c = 0;
	SendClientMessage(playerid, COLOR_ADD, "=====[ K�zmunk�n l�v� emberek ]=====");
	foreach(Jatekosok, x)
	{
		if(PlayerInfo[x][pKozmunka] != 0)
		{
			if(PlayerInfo[x][pKozmunkaIdo] != 0)
				SendFormatMessage(playerid, COLOR_GREEN, "[%d]%s | H�tral�v� j�tszott �r�k: %d | H�tral�v� let�ltend� b�ntet�s: %d m�sodperc", x, ICPlayerName(x), PlayerInfo[x][pKozmunkaIdo], PlayerInfo[x][pJailTime]);
			else
			{
				SendFormatMessage(playerid, COLOR_RED, "[%d]%s | Elhalasztotta a k�zmunk�t | K�r�z�s kiadva", x, ICPlayerName(x));
				if(!egyezik(PlayerCrime[x][pVad], "K�zmunka elhalaszt�sa")) SetPlayerCriminal(x, 255, "K�zmunka elhalaszt�sa");
			}
			c++;
		}
	}
	if(c == 0) SendClientMessage(playerid, COLOR_WHITE, "Jelenleg nincs k�zmunk�n l�v� ember.");
	return 1;
}

CMD:carresi(playerid, params[])
{
	if(CarRespawnSzamlalo != NINCS) return Msg(playerid, "�pp folyamatban van egy carresi!");
	SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Legk�zelebb %d mp m�lva lesz car resi.", ResiCounter);
	if(Admin(playerid, 6)) Msg(playerid, "Carresihez parancsok: /acrmost /acr /acr30");
	return 1;
}

ALIAS(l6szerek):loszerek;
CMD:loszerek(playerid, params[])
{
	if(!MunkaLeader(playerid, FRAKCIO_SCPD) && !MunkaLeader(playerid, FRAKCIO_FBI) && !MunkaLeader(playerid, FRAKCIO_KATONASAG) && !MunkaLeader(playerid, FRAKCIO_NAV) && !Admin(playerid, 1)) return 1;
	
	new frakcio;
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "================================ L�SZEREK ================================");
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_SCPD || Admin(playerid, 1)) frakcio=FRAKCIO_SCPD;
	SendFormatMessage(playerid, COLOR_WHITE, "[Rend�rs�g] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][1], FrakcioInfo[frakcio][fSilenced][1], FrakcioInfo[frakcio][fMp5][1], FrakcioInfo[frakcio][fM4][1], FrakcioInfo[frakcio][fShotgun][1]);
	SendFormatMessage(playerid, COLOR_WHITE, "[Rend�rs�g] Sniper: %d | Combat: %d | Rifle: %d | Ejt�erny�: %d",FrakcioInfo[frakcio][fSniper][1], FrakcioInfo[frakcio][fCombat][1],FrakcioInfo[frakcio][fRifle][1],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_FBI || Admin(playerid, 1)) frakcio=FRAKCIO_FBI;
	SendFormatMessage(playerid, COLOR_WHITE, "[FBI] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][1], FrakcioInfo[frakcio][fSilenced][1], FrakcioInfo[frakcio][fMp5][1], FrakcioInfo[frakcio][fM4][1], FrakcioInfo[frakcio][fShotgun][1]);
	SendFormatMessage(playerid, COLOR_WHITE, "[FBI] Sniper: %d | Combat: %d | Rifle: %d | Ejt�erny�: %d",FrakcioInfo[frakcio][fSniper][1], FrakcioInfo[frakcio][fCombat][1],FrakcioInfo[frakcio][fRifle][1],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_NAV || Admin(playerid, 1)) frakcio=FRAKCIO_NAV;
	SendFormatMessage(playerid, COLOR_WHITE, "[SASD] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][1], FrakcioInfo[frakcio][fSilenced][1], FrakcioInfo[frakcio][fMp5][1], FrakcioInfo[frakcio][fM4][1], FrakcioInfo[frakcio][fShotgun][1]);
	SendFormatMessage(playerid, COLOR_WHITE, "[SASD] Sniper: %d | Combat: %d | Rifle: %d | Ejt�erny�: %d",FrakcioInfo[frakcio][fSniper][1], FrakcioInfo[frakcio][fCombat][1],FrakcioInfo[frakcio][fRifle][1],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_KATONASAG || Admin(playerid, 1)) frakcio=FRAKCIO_KATONASAG;
	SendFormatMessage(playerid, COLOR_WHITE, "[CCMF] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][1], FrakcioInfo[frakcio][fSilenced][1], FrakcioInfo[frakcio][fMp5][1], FrakcioInfo[frakcio][fM4][1], FrakcioInfo[frakcio][fShotgun][1]);
	SendFormatMessage(playerid, COLOR_WHITE, "[CCMF] Sniper: %d | Combat: %d | Rifle: %d | Ejt�erny�: %d",FrakcioInfo[frakcio][fSniper][1], FrakcioInfo[frakcio][fCombat][1],FrakcioInfo[frakcio][fRifle][1],FrakcioInfo[frakcio][fParachute]);
	SendClientMessage(playerid, COLOR_LIGHTGREEN,"================================ L�SZEREK ================================");
	return 1;
}

CMD:fegyverek(playerid, params[])
{
	if(!MunkaLeader(playerid, FRAKCIO_SCPD) && !MunkaLeader(playerid, FRAKCIO_FBI) && !MunkaLeader(playerid, FRAKCIO_KATONASAG) && !MunkaLeader(playerid, FRAKCIO_NAV) && !Admin(playerid, 1)) return 1;
	
	new frakcio;
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "================================ FEGYVEREK ================================");
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_SCPD || Admin(playerid, 1)) frakcio=FRAKCIO_SCPD;
	SendFormatMessage(playerid, COLOR_WHITE, "[LSPD] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][0], FrakcioInfo[frakcio][fSilenced][0], FrakcioInfo[frakcio][fMp5][0], FrakcioInfo[frakcio][fM4][0], FrakcioInfo[frakcio][fShotgun][0]);
	SendFormatMessage(playerid, COLOR_WHITE, "[LSPD] Sniper: %d | Combat: %d | Rifle: %d | Ejt�erny�: %d",FrakcioInfo[frakcio][fSniper][0], FrakcioInfo[frakcio][fCombat][0],FrakcioInfo[frakcio][fRifle][0],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_FBI || Admin(playerid, 1)) frakcio=FRAKCIO_FBI;
	SendFormatMessage(playerid, COLOR_WHITE, "[FBI] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][0], FrakcioInfo[frakcio][fSilenced][0], FrakcioInfo[frakcio][fMp5][0], FrakcioInfo[frakcio][fM4][0], FrakcioInfo[frakcio][fShotgun][0]);
	SendFormatMessage(playerid, COLOR_WHITE, "[FBI] Sniper: %d | Combat: %d | Rifle: %d | Ejt�erny�: %d",FrakcioInfo[frakcio][fSniper][0], FrakcioInfo[frakcio][fCombat][0],FrakcioInfo[frakcio][fRifle][0],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_NAV || Admin(playerid, 1)) frakcio=FRAKCIO_NAV;
	SendFormatMessage(playerid, COLOR_WHITE, "[SASD] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][0], FrakcioInfo[frakcio][fSilenced][0], FrakcioInfo[frakcio][fMp5][0], FrakcioInfo[frakcio][fM4][0], FrakcioInfo[frakcio][fShotgun][0]);
	SendFormatMessage(playerid, COLOR_WHITE, "[SASD] Sniper: %d | Combat: %d | Rifle: %d | Ejt�erny�: %d",FrakcioInfo[frakcio][fSniper][0], FrakcioInfo[frakcio][fCombat][0],FrakcioInfo[frakcio][fRifle][0],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_KATONASAG || Admin(playerid, 1)) frakcio=FRAKCIO_KATONASAG;
	SendFormatMessage(playerid, COLOR_WHITE, "[CCMF] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][0], FrakcioInfo[frakcio][fSilenced][0], FrakcioInfo[frakcio][fMp5][0], FrakcioInfo[frakcio][fM4][0], FrakcioInfo[frakcio][fShotgun][0]);
	SendFormatMessage(playerid, COLOR_WHITE, "[CCMF] Sniper: %d | Combat: %d | Rifle: %d | Ejt�erny�: %d",FrakcioInfo[frakcio][fSniper][0], FrakcioInfo[frakcio][fCombat][0],FrakcioInfo[frakcio][fRifle][0],FrakcioInfo[frakcio][fParachute]);
	SendClientMessage(playerid, COLOR_LIGHTGREEN,"================================ FEGYVEREK ================================");
	return 1;
}

ALIAS(rakt1r):raktar;
CMD:raktar(playerid, params[])
{
	new pm[32], subpm[64], subby[64], mit[32], mennyit, melo = PlayerInfo[playerid][pMember], fkid, szeflog[256];
	if(FloodCheck(playerid)) return 1;
	if(Civil(playerid) && !IsScripter(playerid)) return Msg(playerid, "Nem tartozol frakci�hoz.");
	if(sscanf(params, "s[32]S()[64]", pm, subpm))
	{
		if(!Admin(playerid, 1337) && !IsScripter(playerid)) return Msg(playerid, "/rakt�r [Megn�z/Berak/Kivesz/Minrang(leadernek)]");
		Msg(playerid, "/rakt�r [Megn�z/Berak/Kivesz/Minrang/�rt�k/Null�z/Amegn�z]");
		return 1;
	}
	if(egyezik(pm, "megn�z") || egyezik(pm, "megnez"))
	{
		if(!PlayerToPoint(3, playerid, FrakcioInfo[melo][fPosX], FrakcioInfo[melo][fPosY], FrakcioInfo[melo][fPosZ])) return Msg(playerid, "Nem vagy a sz�f k�zel�ben.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "===========[ Rakt�r Tartalma ]===========");
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kaja: %ddb - Alma: %ddb", FrakcioInfo[melo][fKaja], FrakcioInfo[melo][fAlma]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Material: %sdb - Heroin: %sg", FormatNumber( FrakcioInfo[melo][fMati], 0, ',' ), FormatNumber( FrakcioInfo[melo][fHeroin], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kokain: %sg - Marihuana: %sg", FormatNumber( FrakcioInfo[melo][fKokain], 0, ',' ), FormatNumber( FrakcioInfo[melo][fMarihuana], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "C4: %ddb", FrakcioInfo[melo][fC4]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(1-10): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][0],FrakcioInfo[melo][fRuha][1],FrakcioInfo[melo][fRuha][2],FrakcioInfo[melo][fRuha][3],FrakcioInfo[melo][fRuha][4],FrakcioInfo[melo][fRuha][5],FrakcioInfo[melo][fRuha][6],FrakcioInfo[melo][fRuha][7],FrakcioInfo[melo][fRuha][8],FrakcioInfo[melo][fRuha][9]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(11-20): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][10],FrakcioInfo[melo][fRuha][11],FrakcioInfo[melo][fRuha][12],FrakcioInfo[melo][fRuha][13],FrakcioInfo[melo][fRuha][14],FrakcioInfo[melo][fRuha][15],FrakcioInfo[melo][fRuha][16],FrakcioInfo[melo][fRuha][17],FrakcioInfo[melo][fRuha][18],FrakcioInfo[melo][fRuha][19]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(21-30): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][20],FrakcioInfo[melo][fRuha][21],FrakcioInfo[melo][fRuha][22],FrakcioInfo[melo][fRuha][23],FrakcioInfo[melo][fRuha][24],FrakcioInfo[melo][fRuha][25],FrakcioInfo[melo][fRuha][26],FrakcioInfo[melo][fRuha][27],FrakcioInfo[melo][fRuha][28],FrakcioInfo[melo][fRuha][29]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(31-40): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][30],FrakcioInfo[melo][fRuha][31],FrakcioInfo[melo][fRuha][32],FrakcioInfo[melo][fRuha][33],FrakcioInfo[melo][fRuha][34],FrakcioInfo[melo][fRuha][35],FrakcioInfo[melo][fRuha][36],FrakcioInfo[melo][fRuha][37],FrakcioInfo[melo][fRuha][38],FrakcioInfo[melo][fRuha][39]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(41-50): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][40],FrakcioInfo[melo][fRuha][41],FrakcioInfo[melo][fRuha][42],FrakcioInfo[melo][fRuha][43],FrakcioInfo[melo][fRuha][44],FrakcioInfo[melo][fRuha][45],FrakcioInfo[melo][fRuha][46],FrakcioInfo[melo][fRuha][47],FrakcioInfo[melo][fRuha][48],FrakcioInfo[melo][fRuha][49]);
		Cselekves(playerid, "megn�zte a rakt�rat...", 1);
	}
	elseif(egyezik(pm, "amegn�z") || egyezik(pm, "amegnez"))
	{
		if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
		if(sscanf(subpm, "d", fkid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ClassRPG: /rakt�r amegn�z [Frakci�ID]");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "===========[ Rakt�r Tartalma ]===========");
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kaja: %ddb - Alma: %ddb", FrakcioInfo[fkid][fKaja], FrakcioInfo[fkid][fAlma]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Material: %sdb - Heroin: %sg", FormatNumber( FrakcioInfo[fkid][fMati], 0, ',' ), FormatNumber( FrakcioInfo[fkid][fHeroin], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kokain: %sg - Marihuana: %sg", FormatNumber( FrakcioInfo[fkid][fKokain], 0, ',' ), FormatNumber( FrakcioInfo[fkid][fMarihuana], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "C4: %ddb", FrakcioInfo[fkid][fC4]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(1-10): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][0],FrakcioInfo[fkid][fRuha][1],FrakcioInfo[fkid][fRuha][2],FrakcioInfo[fkid][fRuha][3],FrakcioInfo[fkid][fRuha][4],FrakcioInfo[fkid][fRuha][5],FrakcioInfo[fkid][fRuha][6],FrakcioInfo[fkid][fRuha][7],FrakcioInfo[fkid][fRuha][8],FrakcioInfo[fkid][fRuha][9]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(11-20): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][10],FrakcioInfo[fkid][fRuha][11],FrakcioInfo[fkid][fRuha][12],FrakcioInfo[fkid][fRuha][13],FrakcioInfo[fkid][fRuha][14],FrakcioInfo[fkid][fRuha][15],FrakcioInfo[fkid][fRuha][16],FrakcioInfo[fkid][fRuha][17],FrakcioInfo[fkid][fRuha][18],FrakcioInfo[fkid][fRuha][19]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(21-30): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][20],FrakcioInfo[fkid][fRuha][21],FrakcioInfo[fkid][fRuha][22],FrakcioInfo[fkid][fRuha][23],FrakcioInfo[fkid][fRuha][24],FrakcioInfo[fkid][fRuha][25],FrakcioInfo[fkid][fRuha][26],FrakcioInfo[fkid][fRuha][27],FrakcioInfo[fkid][fRuha][28],FrakcioInfo[fkid][fRuha][29]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(31-40): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][30],FrakcioInfo[fkid][fRuha][31],FrakcioInfo[fkid][fRuha][32],FrakcioInfo[fkid][fRuha][33],FrakcioInfo[fkid][fRuha][34],FrakcioInfo[fkid][fRuha][35],FrakcioInfo[fkid][fRuha][36],FrakcioInfo[fkid][fRuha][37],FrakcioInfo[fkid][fRuha][38],FrakcioInfo[fkid][fRuha][39]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhat�r(41-50): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][40],FrakcioInfo[fkid][fRuha][41],FrakcioInfo[fkid][fRuha][42],FrakcioInfo[fkid][fRuha][43],FrakcioInfo[fkid][fRuha][44],FrakcioInfo[fkid][fRuha][45],FrakcioInfo[fkid][fRuha][46],FrakcioInfo[fkid][fRuha][47],FrakcioInfo[fkid][fRuha][48],FrakcioInfo[fkid][fRuha][49]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Frakci�: %d | Neve: %s", fkid, Szervezetneve[fkid-1][1]);
	}
	elseif(egyezik(pm, "berak"))
	{
		if(!PlayerToPoint(3, playerid, FrakcioInfo[melo][fPosX], FrakcioInfo[melo][fPosY], FrakcioInfo[melo][fPosZ])) return Msg(playerid, "Nem vagy a sz�f k�zel�ben.");
		if(sscanf(subpm, "s[32]S()[64]", mit, subby)) return Msg(playerid, "/rakt�r berak [Kaja/Alma/Mati/Heroin/Marihuana/Kokain/Ruha/C4] [Mennyit/Rakt�rID]");
		new mati = PlayerInfo[playerid][pMats];
		new heroin = PlayerInfo[playerid][pHeroin];
		new kokain = PlayerInfo[playerid][pKokain];
		new marihuana = PlayerInfo[playerid][pMarihuana];
		new kaja = PlayerInfo[playerid][pKaja];
		new alma = PlayerInfo[playerid][pAlma];
		if(egyezik(mit, "kaja"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r berak kaja [mennyit]");
			if(kaja < mennyit) return Msg(playerid, "Nincs el�g kaj�d.");
			PlayerInfo[playerid][pKaja] -= mennyit;
			FrakcioInfo[melo][fKaja] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Berakt�l %ddb kaj�t a rakt�rba.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s berakott a rakt�rba %d db kaj�t",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "alma"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r berak alma [mennyit]");
			if(alma < mennyit) return Msg(playerid, "Nincs el�g alm�d.");
			PlayerInfo[playerid][pAlma] -= mennyit;
			FrakcioInfo[melo][fAlma] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Berakt�l %ddb alm�t a rakt�rba.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s berakott a rakt�rba %d db alm�t",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "mati") || egyezik(mit, "material"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r berak mati [mennyit]");
			if(mati < mennyit) return Msg(playerid, "Nincs el�g matid.");
			PlayerInfo[playerid][pMats] -= mennyit;
			FrakcioInfo[melo][fMati] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Berakt�l %ddb matit a rakt�rba.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s berakott a rakt�rba %d db matit",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "heroin"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r berak heroin [mennyit]");
			if(heroin < mennyit) return Msg(playerid, "Nincs el�g heroinod.");
			PlayerInfo[playerid][pHeroin] -= mennyit;
			FrakcioInfo[melo][fHeroin] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Berakt�l %dg heroint a rakt�rba.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s berakott a rakt�rba %d db heroint",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "kokain"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r berak kokain [mennyit]");
			if(kokain < mennyit) return Msg(playerid, "Nincs el�g kokainod.");
			PlayerInfo[playerid][pKokain] -= mennyit;
			FrakcioInfo[melo][fKokain] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Berakt�l %dg kokaint a rakt�rba.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s berakott a rakt�rba %d db kokaint",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "marihuana"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r berak marihuana [mennyit]");
			if(marihuana < mennyit) return Msg(playerid, "Nincs el�g marihuan�d.");
			PlayerInfo[playerid][pMarihuana] -= mennyit;
			FrakcioInfo[melo][fMarihuana] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Berakt�l %dg marihuan�t a rakt�rba.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s berakott a rakt�rba %d db marihuan�t",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "ruha"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r berak ruha [slot]");
			if(GetPlayerSkin(playerid) == 252) return Msg(playerid, "M�g az als�gaty�dat is a rakt�rba akarod rakni?..");
			if(mennyit < 0 || mennyit > 49) return Msg(playerid, "0-49");
			if(FrakcioInfo[melo][fRuha][mennyit] != 252 && FrakcioInfo[melo][fRuha][mennyit] != 0) return Msg(playerid, "Ezen a sloton m�r van valami!");
			FrakcioInfo[melo][fRuha][mennyit] = GetPlayerSkin(playerid);
			SetPlayerSkin(playerid, 252);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktad a ruh�dat a rakt�rba (slot: %d).", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s berakott a rakt�rba a %d skint, a %d slotra", melo, Szervezetneve[melo - 1][2],PlayerName(playerid), FrakcioInfo[melo][fRuha][mennyit], mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "C4"))
		{
			if(PlayerInfo[playerid][pC4] == 0) return Msg(playerid, "Nincs C4 n�lad.");
			PlayerInfo[playerid][pC4] --;
			FrakcioInfo[melo][fC4] ++;
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "* Berakt�l 1 darab C4 robban�szert a rakt�rba.");
			format(szeflog, 256, "[%d. frakci� (%s)]%s berakott a rakt�rba 1db C4-t", melo, Szervezetneve[melo - 1][2],PlayerName(playerid)); Log("Szef", szeflog);
		}
		INI_Save(INI_TYPE_FRAKCIO, melo);
	}
	elseif(egyezik(pm, "kivesz"))
	{
		if(!PlayerToPoint(3, playerid, FrakcioInfo[melo][fPosX], FrakcioInfo[melo][fPosY], FrakcioInfo[melo][fPosZ])) return Msg(playerid, "Nem vagy a sz�f k�zel�ben.");
		if(PlayerInfo[playerid][pRank] < FrakcioInfo[melo][fRaktarRang]) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Nem el�g nagy a rangod, minimum rang: %d", FrakcioInfo[melo][fRaktarRang]);
		if(sscanf(subpm, "s[32]S()[64]", mit, subby)) return Msg(playerid, "/rakt�r kivesz [Kaja/Alma/Mati/Heroin/Marihuana/Kokain/Ruha/C4] [Mennyit/Rakt�rID]");
		new mati = FrakcioInfo[melo][fMati];
		new heroin = FrakcioInfo[melo][fHeroin];
		new kokain = FrakcioInfo[melo][fKokain];
		new marihuana = FrakcioInfo[melo][fMarihuana];
		new kaja = FrakcioInfo[melo][fKaja];
		new alma = FrakcioInfo[melo][fAlma];
		new c4 = FrakcioInfo[melo][fC4];
		if(egyezik(mit, "kaja"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r kivesz kaja [mennyit]");
			if(kaja < mennyit) return Msg(playerid, "Nincs el�g kaja a sz�fben.");
			if((PlayerInfo[playerid][pKaja] + mennyit) > MAXKAJA) return Msg(playerid, "Ennyi nem f�r el n�lad.");
			PlayerInfo[playerid][pKaja] += mennyit;
			FrakcioInfo[melo][fKaja] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivett�l %ddb kaj�t a rakt�rb�l.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s kivett a rakt�rb�l %d db kaj�t",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "alma"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r kivesz alma [mennyit]");
			if(alma < mennyit) return Msg(playerid, "Nincs el�g alma a sz�fben.");
			if((PlayerInfo[playerid][pAlma] + mennyit) > MAXALMA) return Msg(playerid, "Ennyi nem f�r el n�lad.");
			PlayerInfo[playerid][pAlma] += mennyit;
			FrakcioInfo[melo][fAlma] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivett�l %ddb alm�t a rakt�rb�l.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s kivett a rakt�rb�l %d db alm�t",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "mati") || egyezik(mit, "material"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r kivesz mati [mennyit]");
			if(mati < mennyit) return Msg(playerid, "Nincs el�g mati a sz�fben.");
			if((PlayerInfo[playerid][pMats] + mennyit) > MAXMATI) return Msg(playerid, "Ennyi nem f�r el n�lad.");
			PlayerInfo[playerid][pMats] += mennyit;
			FrakcioInfo[melo][fMati] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivett�l %ddb matit a rakt�rb�l.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s kivett a rakt�rb�l %d db matit",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "heroin"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r kivesz heroin [mennyit]");
			if(heroin < mennyit) return Msg(playerid, "Nincs el�g heroin a sz�fben.");
			if((PlayerInfo[playerid][pHeroin] + mennyit) > MAXHEROIN) return Msg(playerid, "Ennyi nem f�r el n�lad.");
			PlayerInfo[playerid][pHeroin] += mennyit;
			FrakcioInfo[melo][fHeroin] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivett�l %dg heroint a rakt�rb�l.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s kivett a rakt�rb�l %d db heroint",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "kokain"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r kivesz kokain [mennyit]");
			if(kokain < mennyit) return Msg(playerid, "Nincs el�g kokain a sz�fben.");
			if((PlayerInfo[playerid][pKokain] + mennyit) > MAXKOKAIN) return Msg(playerid, "Ennyi nem f�r el n�lad.");
			PlayerInfo[playerid][pKokain] += mennyit;
			FrakcioInfo[melo][fKokain] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivett�l %ddb kokaint a rakt�rb�l.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s kivett a rakt�rb�l %d db kokaint",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "marihuana"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r kivesz marihuana [mennyit]");
			if(marihuana < mennyit) return Msg(playerid, "Nincs el�g marihuana a sz�fben.");
			if((PlayerInfo[playerid][pMarihuana] + mennyit) > MAXMARIHUANA) return Msg(playerid, "Ennyi nem f�r el n�lad.");
			PlayerInfo[playerid][pMarihuana] += mennyit;
			FrakcioInfo[melo][fMarihuana] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivett�l %ddb marihuan�t a rakt�rb�l.", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s kivett a rakt�rb�l %d db marihuanat",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "ruha"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/rakt�r kivesz ruha [slot]");
			if(GetPlayerSkin(playerid) != 252) return Msg(playerid, "M�r fel vagy �lt�zve!");
			if(mennyit < 0 || mennyit > 49) return Msg(playerid, "0-50");
			if(FrakcioInfo[melo][fRuha][mennyit] == 252) return Msg(playerid, "Ezen a slot �res!");
			SetPlayerSkin(playerid, FrakcioInfo[melo][fRuha][mennyit]);
			FrakcioInfo[melo][fRuha][mennyit] = 252;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktad a ruh�dat a rakt�rb�l (slot: %d).", mennyit);
			format(szeflog, 256, "[%d. frakci� (%s)]%s kivett a rakt�rb�l a %d skint, a %d slotr�l", melo, Szervezetneve[melo - 1][2],PlayerName(playerid), FrakcioInfo[melo][fRuha][mennyit], mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "C4"))
		{
			if(c4 < 1) return Msg(playerid, "Nincs C4 a sz�fben!");
			if(PlayerInfo[playerid][pC4] == 1) return Msg(playerid, "M�r van n�lad C4!");
			PlayerInfo[playerid][pC4] = 1;
			FrakcioInfo[melo][fC4]--;
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "* Kivett�l 1db C4 robban�szert a rakt�rb�l.");
			format(szeflog, 256, "[%d. frakci� (%s)]%s kivett a rakt�rb�l 1db C4-et", melo, Szervezetneve[melo - 1][2],PlayerName(playerid)); Log("Szef", szeflog);
		}
		Log("Szef", szeflog);
		INI_Save(INI_TYPE_FRAKCIO, melo);
	}
	elseif(egyezik(pm, "minrang"))
	{
		if(PlayerInfo[playerid][pLeader] == 0) return Msg(playerid, "Kiz�r�lag Leadernek!");
		if(sscanf(subpm, "d", mennyit))
		{
			SendFormatMessage(playerid, COLOR_LIGHTRED, "/rakt�r minrang [0-%d]", OsszRang[PlayerInfo[playerid][pLeader]]);
			SendFormatMessage(playerid, COLOR_LIGHTRED, "Jelenlegi sz�ks�ges rang: %d", FrakcioInfo[melo][fRaktarRang]);
			return 1;
		}
		if(mennyit < 0 || mennyit > OsszRang[PlayerInfo[playerid][pLeader]]) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: 0-%d", OsszRang[PlayerInfo[playerid][pLeader]]);
		format(szeflog, 256, "[%d. frakci� (%s) - info]%s �t�rta a rakt�rnak min. rangj�t err�l: %d, erre: %d", melo, Szervezetneve[melo - 1][2],PlayerName(playerid), FrakcioInfo[melo][fRaktarRang], mennyit); Log("Szef", szeflog);

		FrakcioInfo[melo][fRaktarRang] = mennyit;
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* A rakt�rb�l mostant�l %d rangt�l lehet kivenni.", mennyit);
		INI_Save(INI_TYPE_FRAKCIO, melo);
	}
	elseif(egyezik(pm, "�rt�k") || egyezik(pm, "ertek"))
	{
		if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
		if(sscanf(subpm, "ds[32]d", fkid, mit, mennyit))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "/rakt�r �rt�k [Frakci�ID] [Mit] [Mennyire]");
			SendClientMessage(playerid, COLOR_LIGHTRED, "Param�terek: Kaja, Alma, Mati, Heroin, Marihuana, Kokain, C4");
			return 1;
		}
		if(mennyit < 0) return Msg(playerid, "M�nuszt?");
		new mati = FrakcioInfo[fkid][fMati];
		new heroin = FrakcioInfo[fkid][fHeroin];
		new kokain = FrakcioInfo[fkid][fKokain];
		new marihuana = FrakcioInfo[fkid][fMarihuana];
		new kaja = FrakcioInfo[fkid][fKaja];
		new alma = FrakcioInfo[fkid][fAlma];
		new c4 = FrakcioInfo[fkid][fC4];
		if(egyezik(mit, "material") || egyezik(mit, "mati"))
		{
			
			format(_tmpString,sizeof(_tmpString),"<< %s be�ll�totta a(z) (%d)%s frakci� sz�f�nek tartalm�t! Adat: Mati | �j: %s | R�gi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( mati, 0, ',' ));
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Sz�f tartalma be�ll�tva: %sdb Mati | R�gi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber(mati, 0, ','));
			format(szeflog, 256, "%s be�ll�totta a %d. frakci� (%s) rakt�r�nak materialtartalm�t err�l: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], mati, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fMati] = mennyit;
		}
		elseif(egyezik(mit, "heroin"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s be�ll�totta a(z) (%d)%s frakci� sz�f�nek tartalm�t! Adat: Heroin | �j: %s | R�gi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( heroin, 0, ',' ));
			
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Sz�f tartalma be�ll�tva: %sg Heroin | R�gi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( heroin, 0, ',' ));
			format(szeflog, 256, "%s be�ll�totta a %d. frakci� (%s) rakt�r�nak herointartalm�t err�l: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], heroin, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fHeroin] = mennyit;
		}
		elseif(egyezik(mit, "kokain"))
		{
			
			format(_tmpString,sizeof(_tmpString),"<< %s be�ll�totta a(z) (%d)%s frakci� sz�f�nek tartalm�t! Adat: Kokain | �j: %s | R�gi: %s  >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( kokain, 0, ',' ));
			
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Sz�f tartalma be�ll�tva: %sg Kokain | R�gi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( kokain, 0, ',' ));
			format(szeflog, 256, "%s be�ll�totta a %d. frakci� (%s) rakt�r�nak kokaintartalm�t err�l: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], kokain, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fKokain] = mennyit;
		}
		elseif(egyezik(mit, "marihuana"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s be�ll�totta a(z) (%d)%s frakci� sz�f�nek tartalm�t! Adat: Marihuana | �j: %s | R�gi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( marihuana, 0, ','));
		
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Sz�f tartalma be�ll�tva: %sg Marihuana | R�gi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( marihuana, 0, ',' ));
			format(szeflog, 256, "%s be�ll�totta a %d. frakci� (%s) rakt�r�nak marihuanatartalm�t err�l: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], marihuana, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fMarihuana] = mennyit;
		}
		elseif(egyezik(mit, "kaja"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s be�ll�totta a(z) (%d)%s frakci� sz�f�nek tartalm�t! Adat: Kaja | �j: %s | R�gi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( kaja, 0, ',' ));
			
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Sz�f tartalma be�ll�tva: %sdb Kaja | R�gi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( mennyit, 0, ',' ), FormatNumber( kaja, 0, ',' ));
			format(szeflog, 256, "%s be�ll�totta a %d. frakci� (%s) rakt�r�nak kajatartalm�t err�l: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], kaja, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fKaja] = mennyit;
		}
		elseif(egyezik(mit, "alma"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s be�ll�totta a(z) (%d)%s frakci� sz�f�nek tartalm�t! Adat: Alma | �j: %s | R�gi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ),  FormatNumber( alma, 0, ',' ));
	
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Sz�f tartalma be�ll�tva: %sdb Alma | R�gi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( alma, 0, ',' ));
			format(szeflog, 256, "%s be�ll�totta a %d. frakci� (%s) rakt�r�nak almatartalm�t err�l: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], alma, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fAlma] = mennyit;
		}
		elseif(egyezik(mit, "C4"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s be�ll�totta a(z) (%d)%s frakci� sz�f�nek tartalm�t! Adat: C4 | �j: %s | R�gi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ),  FormatNumber( c4, 0, ',' ));
			
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Sz�f tartalma be�ll�tva: %sdb C4 | R�gi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( c4, 0, ',' ));
			format(szeflog, 256, "%s be�ll�totta a %d. frakci� (%s) rakt�r�nak C4 tartalm�t err�l: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], c4, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fC4] = mennyit;
		}
		INI_Save(INI_TYPE_FRAKCIO, fkid);
	}
	elseif(egyezik(pm, "null�z") || egyezik(pm, "nullaz"))
	{
		if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
		if(sscanf(subpm, "ds[32]", mit))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "/rakt�r null�z [Frakci�ID] [Mit]");
			SendClientMessage(playerid, COLOR_LIGHTRED, "Param�terek: Kaja, Alma, Mati, Heroin, Marihuana, Kokain, C4");
			return 1;
		}
		if(mennyit < 0) return Msg(playerid, "M�nuszt?");
		new mati = FrakcioInfo[fkid][fMati];
		new heroin = FrakcioInfo[fkid][fHeroin];
		new kokain = FrakcioInfo[fkid][fKokain];
		new marihuana = FrakcioInfo[fkid][fMarihuana];
		new kaja = FrakcioInfo[fkid][fKaja];
		new alma = FrakcioInfo[fkid][fAlma];
		new c4 = FrakcioInfo[fkid][fC4];
		if(egyezik(mit, "material") || egyezik(mit, "mati"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s null�zta a(z) (%d)%s frakci� rakt�r�nak tartalm�t! Adat: Mati | R�gi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mati, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Rakt�r tartalma (Material) null�zva | R�gi: %s", FormatNumber( mati, 0, ',' ));
			format(szeflog, 256, "%s null�zta a %d. frakci� (%s) rakt�r�nak materialtartalm�t - eredeti mennyis�g: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], mati), Log("Szef", szeflog);
			FrakcioInfo[fkid][fMati] = 0;
		}
		elseif(egyezik(mit, "heroin"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s null�zta a(z) (%d)%s frakci� rakt�r�nak tartalm�t! Adat: Heroin | R�gi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( heroin, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Rakt�r tartalma (Heroin) null�zva | R�gi: %s", FormatNumber( heroin, 0, ',' ));
			format(szeflog, 256, "%s null�zta a %d. frakci� (%s) rakt�r�nak herointartalm�t - eredeti mennyis�g: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], heroin), Log("Szef", szeflog);
			FrakcioInfo[fkid][fHeroin] = 0;
		}
		elseif(egyezik(mit, "kokain"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s null�zta a(z) (%d)%s frakci� rakt�r�nak tartalm�t! Adat: Kokain | R�gi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( kokain, 0, ',' ));
			
			
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Rakt�r tartalma (Kokain) null�zva | R�gi: %s", FormatNumber( kokain, 0, ',' ));
			format(szeflog, 256, "%s null�zta a %d. frakci� (%s) rakt�r�nak kokaintartalm�t - eredeti mennyis�g: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], kokain), Log("Szef", szeflog);
			FrakcioInfo[fkid][fKokain] = 0;
		}
		elseif(egyezik(mit, "marihuana"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s null�zta a(z) (%d)%s frakci� rakt�r�nak tartalm�t! Adat: Marihuana | R�gi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( marihuana, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Rakt�r tartalma (Marihuana) null�zva | R�gi: %s", FormatNumber( marihuana, 0, ',' ));
			format(szeflog, 256, "%s null�zta a %d. frakci� (%s) rakt�r�nak marihuanatartalm�t - eredeti mennyis�g: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], marihuana), Log("Szef", szeflog);
			FrakcioInfo[fkid][fMarihuana] = 0;
		}
		elseif(egyezik(mit, "kaja"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s null�zta a(z) (%d)%s frakci� rakt�r�nak tartalm�t! Adat: Kaja | R�gi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( kaja, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Rakt�r tartalma (Kaja) null�zva | R�gi: %s", FormatNumber( kaja, 0, ',' ));
			format(szeflog, 256, "%s null�zta a %d. frakci� (%s) rakt�r�nak kajatartalm�t - eredeti mennyis�g: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], kaja), Log("Szef", szeflog);
			FrakcioInfo[fkid][fKaja] = 0;
		}
		elseif(egyezik(mit, "alma"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s null�zta a(z) (%d)%s frakci� rakt�r�nak tartalm�t! Adat: Alma | R�gi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( alma, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Rakt�r tartalma (Alma) null�zva | R�gi: %s", FormatNumber( alma, 0, ',' ));
			format(szeflog, 256, "%s null�zta a %d. frakci� (%s) rakt�r�nak materialtartalm�t - eredeti mennyis�g: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], alma), Log("Szef", szeflog);
			FrakcioInfo[fkid][fAlma] = 0;
		}
		elseif(egyezik(mit, "ruha"))
		{
			for(new s = 0; s < 49; s++) if(FrakcioInfo[fkid][fRuha][s] != 0) FrakcioInfo[fkid][fRuha][s] = 0;
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s null�zta a(z) (%d)%s frakci� rakt�r�nak tartalm�t! Adat: Ruha >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1]);
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "* Rakt�r tartalma (Ruha) null�zva");
			format(szeflog, 256, "%s null�zta a %d. frakci� (%s) rakt�r�nak ruhatartalm�t", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2]), Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "c4"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s null�zta a(z) (%d)%s frakci� rakt�r�nak tartalm�t! Adat: C4 | R�gi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( c4, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Rakt�r tartalma (C4) null�zva | R�gi: %s", FormatNumber( c4, 0, ',' ));
			format(szeflog, 256, "%s null�zta a %d. frakci� (%s) rakt�r�nak materialtartalm�t - eredeti mennyis�g: %d", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], c4), Log("Szef", szeflog);
			FrakcioInfo[fkid][fC4] = 0;
		}
		INI_Save(INI_TYPE_FRAKCIO, fkid);
	}
	return 1;
}

ALIAS(k5zmunka):kozmunka;
CMD:kozmunka(playerid, params[])
{
	if(PInfo(playerid,Jailed) != 7) return Msg(playerid, "Nem a fegyenctelepen vagy elhelyezve, ez�rt nem k�rhetsz k�zmunk�s enyh�t�st!");
	if(JailTime[playerid] >= 1200) return Msg(playerid, "Nem k�rhetsz k�zmunk�t, mivel 20 �vet ((percet)) vagy ann�l t�bbet kell le�ln�d!");
	if(PInfo(playerid,JailTime) > 900) return Msg(playerid, "A b�ntet�sed m�g t�bb, mint 15 �v ((perc))!");
	if(PInfo(playerid,Kozmunka) != 0) return Msg(playerid, "Te m�r k�rv�nyezt�l valamilyen k�zmunk�t!");
	new munka[32];
	if(sscanf(params, "s[32]", munka)) return Msg(playerid, "/k�zmunka [F�ny�r�s/�ttiszt�t�s]");
	new Float:yay[3];
	if(egyezik(munka, "f�ny�r�s") || egyezik(munka, "funyiras"))
	{
		CopMsgFormat(COLOR_ALLDEPT, "[Fegyenctelep] Figyelem: %s k�zmunk�s enyh�t�st k�rt", ICPlayerName(playerid));
		CopMsgFormat(COLOR_ALLDEPT, "[Fegyenctelep] ezt a v�dat enyh�ti: %s - ezzel enyh�ti a v�dat: f�ny�r�s", PlayerInfo[playerid][pJailOK]);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Menj egy f�ny�r� traktorhoz, �lj r�, �s a /f�ny�r�s paranccsal kezdd el ledolgozni az id�det.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Figyelem: A k�zmunka let�lt�s�re 3 j�tszott �ra lehet�s�ged van.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ez id� alatt nem vehetsz el� fegyvert, �s nem warozhatsz.");
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0, "unjail7_kozmunkafunyiras");
		SetPlayerWorldBounds(playerid,20000.0000,-20000.0000,20000.0000,-20000.0000);
	 	SetPlayerPos(playerid, 2029.5023, -1404.1078, 17.2503);
		PlayerInfo[playerid][pJailed] = 0;
		PlayerInfo[playerid][pKozmunka] = MUNKA_FUNYIRO;
		PlayerInfo[playerid][pKozmunkaIdo] = 3;
		GetPlayerPos(playerid, ArrExt(yay));
		KozmunkasFelirat[playerid] = CreateDynamic3DTextLabel("K�zmunk�s\nF�ny�r�s", 0x640000FF, 0.0, 0.0, 0.15, 25.0, playerid, INVALID_VEHICLE_ID);
		BortonInfo[CellaID[playerid]][bRabok]--;
	}
	elseif(egyezik(munka, "�ttiszt�t�s") || egyezik(munka, "uttisztitas"))
	{
		CopMsgFormat(COLOR_ALLDEPT, "[Fegyenctelep] Figyelem: %s k�zmunk�s enyh�t�st k�rt", ICPlayerName(playerid));
		CopMsgFormat(COLOR_ALLDEPT, "[Fegyenctelep] ezt a v�dat enyh�ti: %s - ezzel enyh�ti a v�dat: �ttiszt�t�s", PlayerInfo[playerid][pJailOK]);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Menj egy �ttiszt�t�s kocsihoz, �lj bele, �s a /�ttiszt�t�s paranccsal kezdd el ledolgozni az id�det.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Figyelem: A k�zmunka let�lt�s�re 3 j�tszott �ra lehet�s�ged van.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ez id� alatt nem vehetsz el� fegyvert, �s nem warozhatsz.");
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0, "unjail7_kozmunkauttisztitas");
		SetPlayerWorldBounds(playerid,20000.0000,-20000.0000,20000.0000,-20000.0000);
	 	SetPlayerPos(playerid, 2029.5023, -1404.1078, 17.2503);
		PlayerInfo[playerid][pJailed] = 0;
		PlayerInfo[playerid][pKozmunka] = MUNKA_UTTISZTITO;
		PlayerInfo[playerid][pKozmunkaIdo] = 3;
		GetPlayerPos(playerid, ArrExt(yay));
		KozmunkasFelirat[playerid] = CreateDynamic3DTextLabel("K�zmunk�s\n�ttiszt�t�", 0x640000FF, 0.0, 0.0, 0.15, 25.0);
		BortonInfo[CellaID[playerid]][bRabok]--;
	}
	return 1;
}
ALIAS(menza):koszt; // /koszt m�r megy /menza parancsra is by Amos
CMD:koszt(playerid, params[])
{
   if(FloodCheck(playerid)) return 1;
   if(IsACop(playerid)) return Msg(playerid, "Meg�hezt�l? :-D");
   if(Evett[playerid] > UnixTime) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: M�g nem k�rhetsz kosztot! Legk�zelebb %d m�sodperc m�lva k�rhetsz", Evett[playerid]-UnixTime);
   //if(PInfo(playerid,Jailed) != 7) return Msg(playerid, "Nem a fegyenctelepen vagy elhelyezve, �gy nem k�rhetsz kosztot!");
   if(!PInfo(playerid,Jailed)) return Msg(playerid, "Nem vagy b�rt�nben");
   new kaja[32];
   if(sscanf(params, "s[32]", kaja)) return Msg(playerid, "/koszt [bableves/toj�sleves/sert�sp�rk�lt/r�ntotth�s/bors�f�zel�k/krumplif�zel�k/t�kf�zel�k/t�kleves/hagym�sleves]");
   if(egyezik(kaja, "bableves"))
      Szukseglet(playerid, -7.5, -2.5),Cselekves(playerid, "k�rt egy adag bablevest.");
   elseif(egyezik(kaja, "toj�sleves") || egyezik(kaja, "tojasleves"))
      Szukseglet(playerid, -2.5, -5.0),Cselekves(playerid, "k�rt egy adag toj�slevest.");
   elseif(egyezik(kaja, "sert�sp�rk�lt") || egyezik(kaja, "sertesporkolt") || egyezik(kaja, "p�rk�lt") || egyezik(kaja, "porkolt"))
      Szukseglet(playerid, -10.0),Cselekves(playerid, "k�rt egy adag sert�sp�rk�ltet.");
   elseif(egyezik(kaja, "r�ntotth�s") || egyezik(kaja, "rantotthus"))
      Szukseglet(playerid, -9.0, -1.0),Cselekves(playerid, "k�rt egy adag r�ntotth�st.");
   elseif(egyezik(kaja, "bors�f�zel�k") || egyezik(kaja, "borsofozelek"))
      Szukseglet(playerid, -8.5, -1.5),Cselekves(playerid, "k�rt egy adag bors�f�zel�ket.");
   elseif(egyezik(kaja, "krumplif�zel�k") || egyezik(kaja, "krumplifozelek"))
      Szukseglet(playerid, -4.5, -5.5),Cselekves(playerid, "k�rt egy adag krumplif�zel�ket.");
   elseif(egyezik(kaja, "t�kf�zel�k") || egyezik(kaja, "tokfozelek"))
      Szukseglet(playerid, -5.5, -4.5),Cselekves(playerid, "k�rt egy adag t�kf�zel�k.");
   else return Msg(playerid,"Nincs ilyen koszt.");
   
   Evett[playerid] = UnixTime+300;
   ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
   SendClientMessage(playerid, COLOR_GREEN, "K�rt�l egy men�t, nem kell sietned, �t percenk�nt szolg�lnak ki �jra! J� �tv�gyat!");
   return 1;
}


ALIAS(b5rt5ncella):bortoncella;
CMD:bortoncella(playerid, params[])
{
	if(!IsACop(playerid) && !Admin(playerid, 5)) return Msg(playerid, "Ez a parancs nem el�rhet� sz�modra!");
	if(!PlayerToPoint(3.0, playerid, 1354.1110, 1356.7679, 10.9698)) return Msg(playerid, "Nem vagy a rabokat ir�ny�t� sz�m�t�g�pn�l!");
	for(new k = 0; k < MAX_KAPU; k++)
	{
		if(Kapu[k][nyit] == 2)
		{
			if(!Fegyenckapuknyitva)
			{
				if(Kapu[k][kMozgo])
					MoveDynamicObject(Kapu[k][kOID], ArrExt(Kapu[k][kNPos]), Kapu[k][kSpeed]);
				else
				{
					SetDynamicObjectPos(Kapu[k][kOID], ArrExt(Kapu[k][kNPos]));
					SetDynamicObjectRot(Kapu[k][kOID], ArrExt(Kapu[k][kNRPos]));
				}
			}
			else
			{
				if(Kapu[k][kMozgo])
					MoveDynamicObject(Kapu[k][kOID], ArrExt(Kapu[k][kZPos]), Kapu[k][kSpeed]);
				else
				{
					SetDynamicObjectPos(Kapu[k][kOID], ArrExt(Kapu[k][kZPos]));
					SetDynamicObjectRot(Kapu[k][kOID], ArrExt(Kapu[k][kZRPos]));
				}
			}
		}
	}
	if(!Fegyenckapuknyitva)
	{
		Fegyenckapuknyitva = true;
		CopMsgFormat(TEAM_BLUE_COLOR, "[Fegyenctelep] Figyelmeztet�s: %s kinyitotta a fegyenctelep �sszes cell�j�nak ajtaj�t", ICPlayerName(playerid));
		Msg(playerid, "Az �sszes cella ajtaja kinyitva! Figyelem, a sz�k�s vesz�lye fenn �llhat!", false);
	}
	else
	{
		Fegyenckapuknyitva = false;
		CopMsgFormat(TEAM_BLUE_COLOR, "[Fegyenctelep] Figyelmeztet�s: %s bez�rta a fegyenctelep �sszes cell�j�nak ajtaj�t", ICPlayerName(playerid));
		Msg(playerid, "Az �sszes cella ajtaja bez�rva!", false);
	}
	return 1;
}

CMD:adatforgalom(playerid, params[])
{
	new ertek;
	if(PlayerInfo[playerid][pPbiskey] != BIZ_TELEFON && !Admin(playerid, 1337)) return Msg(playerid, "Ez a parancs csak a telefonszolg�ltat� tulajdonos�nak �rhet� el!");
	if(AdatforgalomValtoztatas > UnixTime) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Nem m�dos�thatod az adatforgalmat, egy h�ten csak egyszer szabad! Legk�zelebb %d nap m�lva lehet", (AdatforgalomValtoztatas-UnixTime)/3600);
	if(sscanf(params, "d", ertek)) return Msg(playerid, "/adatforgalom [�r]");
	if(ertek < 0 || ertek > 100) return Msg(playerid, "0-100 k�z�tti �rt�ket adj meg!");
	AdatforgalomAr = ertek;
	AdatforgalomValtoztatas = UnixTime+604800;
	SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Adatforgalom �r �t�rva ennyire: %d Ft - Ez 1 kb adatforgalom �ra!", ertek);
	return 1;
}

CMD:mobilnet(playerid, params[])
{
	new wp[32];
	if(PlayerInfo[playerid][pMobilnet] == NINCS) return Msg(playerid, "Nincs mobilnet szerz�d�sed!");
	if(sscanf(params, "s[32]", wp)) return Msg(playerid, "/mobilnet [Adatforgalmam/Lemond/�r]");
	if(egyezik(wp, "adatforgalmam"))
		SendFormatMessage(playerid, COLOR_DARKYELLOW, "[ClassTel] �nnek jelenleg %d kb elhaszn�lt adatforgalma van.", PlayerInfo[playerid][pMobilnet]);
	elseif(egyezik(wp, "lemond"))
	{
		new ar = PlayerInfo[playerid][pMobilnet]*AdatforgalomAr;
		if(PlayerInfo[playerid][pMobilnet] != 0)
		{	
			BizPenz(BIZ_TELEFON, ar/2+20000);
			if(PlayerInfo[playerid][pBankSzamla] > 0)
				PlayerInfo[playerid][pAccount] -= ar+20000;
			else
				GiveMoney(playerid, -ar+20000);
			SendFormatMessage(playerid, COLOR_DARKYELLOW, "[ClassTel] �n sikeresen lemondta mobilnet szerz�d�s�t, a szerz�d�sbont�s miatt %d forintot fizetett (20000 Ft + elhaszn�lt adatforgalom)!", ar+20000);
		}
		else
		{
			BizPenz(BIZ_TELEFON, 20000);
			if(PlayerInfo[playerid][pBankSzamla] > 0)
				PlayerInfo[playerid][pAccount] -= 20000;
			else
				GiveMoney(playerid, -20000);
			SendClientMessage(playerid, COLOR_DARKYELLOW, "[ClassTel] �n sikeresen lemondta mobilnet szerz�d�s�t, a szerz�d�sbont�s miatt 20000 Forintot fizetett!");
		}
		PlayerInfo[playerid][pMobilnet] = NINCS;
	}
	elseif(egyezik(wp, "�r") || egyezik(wp, "ar"))
		SendFormatMessage(playerid, COLOR_DARKYELLOW, "[ClassTel] A jelenlegi adatforgalom �r: %d Ft/kb", AdatforgalomAr);
	return 1;
}

CMD:wifi(playerid, params[])
{
	new param[32], sparam[32];
	if(FloodCheck(playerid)) return 1;
	if(PlayerInfo[playerid][pLaptop] == 0) return Msg(playerid, "Nincs laptopod!");
	if(sscanf(params, "s[32]S()[32]", param, sparam)) return Msg(playerid, "Haszn�lata: /wifi [csatlakoz�s/lecsatlakoz�s/k�zel/pontok]");
	if(egyezik(param, "csatlakoz�s") || egyezik(param, "csatlakozas") || egyezik(param, "connect"))
	{
		new wifipont = GetClosestWifiPoint(playerid), wifierosseg = GetWifiSignal(playerid, wifipont);
		if(wifierosseg < 10) return Msg(playerid, "Nincs k�zeledben wifi pont!");
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "... Csatlakoz�s ehhez a hotspothoz: {FFFFFF}%s {9ACD32}...", WifiPont[wifipont][wNev]);
		MunkaFolyamatban[playerid] = 1;
		SetTimerEx("Munkavege", 5000, false, "ddd", playerid, M_WIFICONNECT, wifipont);
	}
	elseif(egyezik(param, "k�zel") || egyezik(param, "kozel"))
	{
		new Float:tavolsag, Float:s[3], wifipont = 0;
		GetPlayerPos(playerid, ArrExt(s));
		SendClientMessage(playerid, COLOR_DARKYELLOW, "===[ K�zelben tal�lhat� Wifi Hotspot(ok) ]===");
		for(new a = 0; a < sizeof(WifiPont); a++)
		{
			tavolsag = GetDistanceBetweenPoints(ArrExt(s), ArrExt(WifiPont[a][wPos]));
			if(tavolsag <= 100.0 && GetPlayerVirtualWorld(playerid) == WifiPont[a][wVw] && GetPlayerInterior(playerid) == WifiPont[a][wInt])
			{
				new wifi = GetWifiSignal(playerid, a);
				wifipont++;
				SendFormatMessage(playerid, COLOR_WHITE, "%s - Jeler�ss�g: %d sz�zal�k - HotSpot ID: %d", WifiPont[a][wNev], wifi, WifiPont[a][wID]);
			}
		}
		if(wifipont < 1) return Msg(playerid, "A k�zelben nincs egyetlen wifi hotspot sem!");
	}
	elseif(egyezik(param, "lecsatlakoz�s") || egyezik(param, "lecsatlakozas") || egyezik(param, "disconnect"))
	{
		if(!LaptopConnected[playerid]) return Msg(playerid, "Nem csatlakozt�l hotspothoz!");
		
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "... Lecsatlakozva err�l a hotspotr�l: {FFFFFF}%s {9ACD32}...", WifiPont[LaptopIP[playerid]][wNev]);
		LaptopIP[playerid] = NINCS;
		LaptopConnected[playerid] = false;
	}
	elseif(egyezik(param, "pontok"))
	{
		new wifipont = 0;
		SendClientMessage(playerid, COLOR_DARKYELLOW, "===[ Wifi Hotspotok list�ja ]===");
		for(new a = 0; a < sizeof(WifiPont); a++)
		{
			if(WifiPont[a][wPos][0] == 0.0) continue;
			SendFormatMessage(playerid, COLOR_WHITE, "%s - HotSpot ID: %d (Interior: %d | VW: %d)", WifiPont[a][wNev], WifiPont[a][wID], WifiPont[a][wInt], WifiPont[a][wVw]);
			wifipont++;
		}
		if(wifipont < 1) return Msg(playerid, "Nincs egyetlen wifi hotspot sem!");
	}
	elseif(egyezik(param, "lerak"))
	{
		if(!Admin(playerid, 1337)) return 1;
		new nev[32];
		if(sscanf(sparam, "s[32]", nev)) return Msg(playerid, "/wifi lerak [Wifipont neve - ClassHotSpot_n�v]");
		new Float:p[3], int = GetPlayerInterior(playerid), vw = GetPlayerVirtualWorld(playerid);
		GetPlayerPos(playerid, ArrExt(p));
		CreateWifi(ArrExt(p), vw, int, nev);
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Wifi hotspot lerakva, neve: ClassHotSpot_%s", nev);
		Format(_tmpString, "%s lerakott egy wifi hotspotot, n�v: ClassHotSpot_%s", nev);
		Log("Scripter", _tmpString);
	}
	return 1;
}

ALIAS(tdsz3n):textdrawszin;
ALIAS(tdszin):textdrawszin;
ALIAS(textdrawsz3n):textdrawszin;
CMD:textdrawszin(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_TEXTDRAW_COLOR, DIALOG_STYLE_LIST, "Textdrawh�tt�r sz�n v�laszt�sa", "{505055}Fekete\n{FFFFFF}Feh�r\n{22AAFF}K�k\n{111133}S�t�tk�k\n{00D900}Vil�gosz�ld\n{33AA33}S�t�tz�ld\n{AA0000}Piros\n{FFFF00}S�rga\n{FF1493}Pink\n�tl�tsz�", "Kiv�laszt", "M�gse");
	SendClientMessage(playerid, COLOR_SPEC, "V�laszd ki azt a sz�nt, amelyet textdraw h�tt�rk�nt szeretn�l haszn�lni!");
	return 1;
}

CMD:arany(playerid, params[])
{
	new pm[32], spm[32];
	if(FloodCheck(playerid)) return 1;
	if(!IsAt(playerid, IsAt_Bank)) return Msg(playerid, "Csak bankban haszn�lhat�!");
	if(sscanf(params, "s[32]S()[32]", pm, spm)) return Msg(playerid, "Haszn�lata: /arany [v�tel/berak/kivesz/elad/inform�ci�]");
	/*if(egyezik(pm, "v�tel") || egyezik(pm,"vetel") || egyezik(pm, "vesz"))
	{
		new db;
		if(sscanf(spm, "d", db)) return Msg(playerid, "Haszn�lata: /arany v�tel [darab]");
		if(db < 1 || db > 5) return Msg(playerid, "Egyszerre maximum 5 darabot tudunk el��ll�tani! A minim�lis v�s�rl�si mennyis�g: 1 db");
		if(!BankkartyaFizet(playerid, db*50000000)) return SendFormatMessage(playerid, COLOR_LIGHTRED, "%d darab arany %s Forintba ker�l, ennyit nem b�r kifizetni!", db, FormatInt(db*50000000));
		if(Biztos[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
			SendClientMessage(playerid, COLOR_WHITE, "K�rem gondolja �t alaposan, hogy befekteti-e p�nz�t aranyba!");
			SendFormatMessage(playerid, COLOR_WHITE, "%d darab arany megv�s�rl�sa ut�n %s Ft marad egyenleg�n!", db, FormatInt(PlayerInfo[playerid][pAccount] - 50000000*db));
			SendClientMessage(playerid, COLOR_WHITE, "A m�velet nem visszavonhat�, �gy ha t�nylegesen meg szeretn� v�laszolni, �rja be m�gegyszer a parancsot!");
			Biztos[playerid] = 1;
		}
		else
		{
			PlayerInfo[playerid][pArany] += db;
			BankSzef += db*10000000;
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
			SendFormatMessage(playerid, COLOR_WHITE, "Sikeres v�s�rl�s! Egyenleg�r�l levontunk %s Ft-t, �gy maradt %s Ft!", FormatInt(50000000*db), FormatInt(PlayerInfo[playerid][pAccount]));
			SendClientMessage(playerid, COLOR_WHITE, "K�sz�nj�k, hogy minket v�lasztott! Aranyait berakhatja bankba, mellyel aranyai ut�n "#ARANY_KAMAT"%%-os kamathoz juthat!");
			Biztos[playerid] = 0;
		}
	}
	else*/
	if(egyezik(pm, "berak") || egyezik(pm, "befektet"))
	{
		new db;
		if(PlayerInfo[playerid][pArany] == 0) return Msg(playerid, "Nincs arany �nn�l!");
		if(sscanf(spm, "d", db)) return Msg(playerid, "Haszn�lata: /arany befektet [darab]");
		if(db < 1) return Msg(playerid, "Persze..");
		if(PlayerInfo[playerid][pArany] < db) return Msg(playerid, "Nincs ennyi arany �nn�l!");
		if(Biztos[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
			SendClientMessage(playerid, COLOR_WHITE, "K�rem gondolja �t alaposan, hogy befekteti-e az aranyait!");
			SendFormatMessage(playerid, COLOR_WHITE, "%d darab arany befektet�se ut�n %.3f sz�zal�k kamatot kap!", db, db*ARANY_KAMAT);
			SendClientMessage(playerid, COLOR_WHITE, "Amennyiben t�nyleg ezt szeretn�, �rja be m�gegyszer a parancsot!");
			Biztos[playerid] = 1;
		}
		else
		{
			PlayerInfo[playerid][pArany] -= db;
			PlayerInfo[playerid][pAranyBank] += db;
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
			SendFormatMessage(playerid, COLOR_WHITE, "Sikeres befektet�s! %d darab aranyt fektetett be bankunkba, mely ut�n %.3f%% kamatot kap!", db, db*ARANY_KAMAT);
			SendClientMessage(playerid, COLOR_WHITE, "K�sz�nj�k, hogy minket v�lasztott! ClassBank Zrt.");
			Biztos[playerid] = 0;
		}
	}
	else if(egyezik(pm, "kivesz"))
	{
		new db;
		if(PlayerInfo[playerid][pAranyBank] == 0) return Msg(playerid, "�n m�g nem fektetett be aranyat a bankba!");
		if(sscanf(spm, "d", db)) return Msg(playerid, "Haszn�lata: /arany kivesz [darab]");
		if(db < 1) return Msg(playerid, "Persze..");
		if(PlayerInfo[playerid][pAranyBank] < db) return Msg(playerid, "Nincs ennyi aranya a bankban!");
		if(Biztos[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
			SendClientMessage(playerid, COLOR_WHITE, "K�rem gondolja �t alaposan, hogy megsz�nteti-e befektet�s�t!");
			SendFormatMessage(playerid, COLOR_WHITE, "%d darab arany kiv�tele ut�n %.3f%% kamatt�l esik el!", db, db*ARANY_KAMAT);
			SendClientMessage(playerid, COLOR_WHITE, "Amennyiben t�nyleg ezt szeretn�, �rja be m�gegyszer a parancsot!");
			Biztos[playerid] = 1;
		}
		else
		{
			PlayerInfo[playerid][pArany] += db;
			PlayerInfo[playerid][pAranyBank] -= db;
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
			SendFormatMessage(playerid, COLOR_WHITE, "Sikeres kiv�tel! %d darab aranyt vett ki bankunkb�l, �gy %.3f%% kamatt�l esett el!", db, db*ARANY_KAMAT);
			SendClientMessage(playerid, COLOR_WHITE, "K�sz�nj�k, hogy minket v�lasztott! ClassBank Zrt.");
			Biztos[playerid] = 0;
		}
	}
	else if(egyezik(pm, "info") || egyezik(pm, "inf�") || egyezik(pm, "inform�ci�") || egyezik(pm, "informacio"))
	{
		SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
		SendFormatMessage(playerid, COLOR_WHITE, "Jelenleg %ddb aranya van, mely ut�n %.3f%% kamatot kap.", PlayerInfo[playerid][pAranyBank], PlayerInfo[playerid][pAranyBank] * ARANY_KAMAT);
		SendClientMessage(playerid, COLOR_WHITE, "Jelenleg egy darab aranyr�d �ra: 50,000,000 Ft.");
		SendClientMessage(playerid, COLOR_WHITE, "Banki befektet�s eset�n a befektetett aranyak sz�ma ut�n "#ARANY_KAMAT"%% kamatot kap aranyrudank�nt.");
		SendClientMessage(playerid, COLOR_WHITE, "Az arany haszn�lhat� fizet�eszk�zk�nt, illetve befektet�sk�nt is.");
	}
	else if(egyezik(pm, "elad"))
	{
		if(UnixTime > 1391990399)
			return Msg(playerid, "M�r nincs lehet�s�g arany elad�s�ra");
			
		new db;
		if(PlayerInfo[playerid][pAranyBank] == 0) return Msg(playerid, "�n m�g nem fektetett be aranyat a bankba!");
		if(sscanf(spm, "d", db)) return Msg(playerid, "Haszn�lata: /arany elad [darab]");
		if(db < 1) return Msg(playerid, "Persze..");
		if(PlayerInfo[playerid][pAranyBank] < db) return Msg(playerid, "Nincs ennyi aranya a bankban!");
		if(Biztos[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
			SendClientMessage(playerid, COLOR_WHITE, "K�rem gondolja �t alaposan, hogy eladja-e aranyait a banknak!");
			SendClientMessage(playerid, COLOR_WHITE, "Egy aranyrudat 49 milli� forint�rt v�s�rol vissza a bank!");
			SendFormatMessage(playerid, COLOR_WHITE, "%d darab arany elad�s��rt %d forintot fog �rte kapni!", db, db*49000000);
			SendClientMessage(playerid, COLOR_WHITE, "Amennyiben t�nyleg ezt szeretn�, �rja be m�gegyszer a parancsot!");
			Biztos[playerid] = 1;
		}
		else
		{
			PlayerInfo[playerid][pAranyBank] -= db;
			PlayerInfo[playerid][pAccount] += 49000000*db;
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki �zenet ]=====");
			SendFormatMessage(playerid, COLOR_WHITE, "Sikeres kiv�tel! %d darab aranyt adott el, mely ut�n %s Ft-t kapott!", db, FormatInt(49000000*db));
			SendClientMessage(playerid, COLOR_WHITE, "K�sz�nj�k, hogy minket v�lasztott! ClassBank Zrt.");
			Biztos[playerid] = 0;
		}
	}
	else if(egyezik(pm, "set"))
	{
		new uid, type[32], amount, zseb = PlayerInfo[uid][pArany], bank = PlayerInfo[uid][pAranyBank];
		if(!IsScripter(playerid)) return 1;
		if(IdgScripter[playerid]) return Msg(playerid, "Csak a rendes scripterek haszn�lhatj�k!");
		if(sscanf(spm, "rs[32]d", uid, type, amount)) return Msg(playerid, "Haszn�lata: /arany set [N�v/ID] [Zseb/Bank] [Mennyis�g]");
		if(uid == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
		if(amount < 0) return Msg(playerid, "A minimum �rt�k 0!");
		if(egyezik(type, "zseb"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s be�ll�totta %s zseb�ben l�v� arany�nak mennyis�g�t! �j: %s | R�gi: %s >>",AdminRangNev(playerid), PlayerName(playerid), PlayerName(uid), FormatNumber( amount, 0, ',' ), FormatNumber( zseb, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* %s zsebe be�ll�tva: %sdb Arany | R�gi: %s", PlayerName(uid), FormatNumber( amount, 0, ',' ), FormatNumber( zseb, 0, ',' ));
			PlayerInfo[uid][pArany] = amount;
		}
		elseif(egyezik(type, "bank"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s be�ll�totta %s bankban l�v� arany�nak mennyis�g�t! �j: %s (%.3f%%) | R�gi: %s (%.3f%%) >>",AdminRangNev(playerid), PlayerName(playerid), PlayerName(uid), FormatNumber( amount, 0, ',' ), amount*ARANY_KAMAT, FormatNumber( bank, 0, ',' ), zseb*ARANY_KAMAT);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* %s zsebe be�ll�tva: %sdb (%.3f%%) Arany | R�gi: %s (%.3f%%)", PlayerName(uid), FormatNumber( amount, 0, ',' ), amount*ARANY_KAMAT, FormatNumber( bank, 0, ',' ), bank*ARANY_KAMAT);
			PlayerInfo[uid][pAranyBank] = amount;
		}
	}
	return 1;
}

CMD:havazas(playerid, params[])
{
	if(Havazas[playerid])
	{
		Havazas[playerid]=false;
		if(IdoJaras[iMost] == NINCS)
		{
			for(new o = 0; o < MAX_HO_OBJECT; o++)
				DestroyDynamicObject(HoObject[playerid][o]), HoObject[playerid][o] = INVALID_OBJECT_ID;
		}
		Msg(playerid, "KIkapcsoltad a havaz�st!");
		return 1;
	}
	else
	{
	
		if(IdoJaras[iMost] == NINCS)
			IdojarasValt(playerid, NINCS);
		
		Havazas[playerid]=true;		
		Msg(playerid, "BEkapcsoltad a havaz�st! A k�vetkez� havaz�sn�l havazni fog!");
	}
	
	return 1;
}
/*CMD:gos(playerid, params[])
{
	if(!IsScripter(playerid)) return 1;
	new id;
	if(sscanf(params, "d", id)) return Msg(playerid, "/gos [id]");

	Tele(playerid,Gift[id][gxPos],Gift[id][gyPos],Gift[id][gzPos]);
	return 1;
}*/
CMD:kupon(playerid, params[])
{
	new player; new func[10]; new func2[33];
	new log[256];
	
	if(sscanf(params, "s[9]S()[32]", func,func2)) return Msg(playerid,"/kupon [megn�z / t�r�l / saj�t / megmutat]");
	
	if(egyezik(func,"megn�z") || egyezik(func,"saj�t") || egyezik(func,"megmutat"))
	{
		if(egyezik(func,"megn�z"))
		{
			if(!Admin(playerid,1337)) return Msg(playerid, "Csak f�admin!");
			if(sscanf(func2, "u", player)) return Msg(playerid,"/kupon megn�z [id]");
			if(player == INVALID_PLAYER_ID) return Msg(playerid,"Nincs ilyen j�t�kos!");
			SendFormatMessage(playerid,COLOR_LIGHTRED,"==== %s kuponja====",PlayerName(player));
		}
		else if(egyezik(func,"megmutat"))
		{
			if(player == INVALID_PLAYER_ID) return Msg(playerid,"Nincs ilyen j�t�kos!");
			if(GetDistanceBetweenPlayers(playerid, player) > 3) return Msg(playerid, "Nincs a k�zeledben!");
			if(sscanf(func2, "u", player)) return Msg(playerid,"/kupon megmutat [id]");
			Msg(playerid, "Megmutattad a kuponodat!");
			Cselekves(playerid, "megmutatta a kuponj�t!");
			SendFormatMessage(player,COLOR_LIGHTRED,"==== %s kuponja====",PlayerName(playerid));
			
			switch(PlayerInfo[playerid][pAjandek])
			{
				case 1: Msg(player,"Neked/neki egy ingyen kocs alak�t�sa van. ((/alakit))");
				case 2: Msg(player,"Neked/neki egy ingyen h�z �thelyez�se van.");
				case 3: Msg(player,"Neked/neki egy ingyen h�z bels� alak�t�sa van.");
				case 4: Msg(player,"Neked/neki egy ingyen �r�ktuningod van!");
				default: Msg(player,"Neked/neki nincs kuponod!");
			}
			return 1;
		}
		else
			player=playerid;
			
		switch(PlayerInfo[player][pAjandek])
		{
			case 1: Msg(playerid,"Neked/neki egy ingyen kocs alak�t�sa van. ((/alakit))");
			case 2: Msg(playerid,"Neked/neki egy ingyen h�z �thelyez�se van.");
			case 3: Msg(playerid,"Neked/neki egy ingyen h�z bels� alak�t�sa van.");
			case 4: Msg(playerid,"Neked/neki egy ingyen �r�ktuningod van!");
			default: Msg(playerid,"Neked/neki nincs kupond!");
		}
		return 1;
	}
	if(egyezik(func,"t�r�l"))
	{
		
		if(!Admin(playerid,1337)) return Msg(playerid, "Csak f�admin!");
		if(sscanf(func2, "u",player)) return Msg(playerid,"/kupon t�r�l [id]");
		if(player == INVALID_PLAYER_ID) return Msg(playerid,"Nincs ilyen j�t�kos!");
		if(PlayerInfo[player][pAjandek] == NINCS) return Msg(playerid, "nincs neki kuponja");
		SendFormatMessage(playerid,COLOR_YELLOW,"T�r�lted a kuponj�t %s",PlayerName(player));
		Msg(player,"T�r�lt�k a kuponodat!");
		PlayerInfo[player][pAjandek] = NINCS;
		format(log,sizeof(log),"[ajandek]%s t�r�lte %s kuponj�t",PlayerName(playerid),PlayerName(player));
		Log("Egyeb",log);
		return 1;
	
	}
	

	return 1;
}
/*ALIAS(aj1nd2k):ajandek;
CMD:ajandek(playerid, params[])
{
	
	if(PlayerInfo[playerid][pAjandekUnixtime] > 1) return Msg(playerid, "M�r kapt�l aj�nd�kot!");
	
	if(PlayerInfo[playerid][pBID] > 8187279) return Msg(playerid, "Csak a kar�csonyig l�trehozott karakterek kapnak aj�nd�kot!");
	
	new id=NINCS;
	
	for(new a=0; a < MAX_GIFTS; a++)
	{
		if(Gift[a][gTulajUid] == PlayerInfo[playerid][pBID])
		{
			if(PlayerToPoint(2,playerid,Gift[a][gxPos],Gift[a][gyPos],Gift[a][gzPos]))
			{
				id=a;
				break;
			}
		}
	}
	if(id == NINCS) return Msg(playerid, "Ez nem a te csomagod pr�b�lj m�sikat!");
	
	
	
	PlayerInfo[playerid][pAjandekUnixtime]=UnixTime;
	Gift[id][gTulajUid] = NINCS;
	
	new Float:penz=OsszesPenz(playerid, 1000.0);

	
	new bool:kocsi=false; new bool:haz=false;
	
	if(PlayerInfo[playerid][pPcarkey] != NINCS || PlayerInfo[playerid][pPcarkey2] != NINCS || PlayerInfo[playerid][pPcarkey3] != NINCS)
		kocsi=true;
	if(PlayerInfo[playerid][pPhousekey] != NINCS || PlayerInfo[playerid][pPhousekey2] != NINCS || PlayerInfo[playerid][pPhousekey3] != NINCS)
		haz=true;
		
	new log[256];
	if(penz < 100.0 && !kocsi && !haz || Szint(playerid) < WEAPON_MIN_LEVEL)
	{
		
		Msg(playerid, "Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1.000.000 Ft volt! Boldog kar�csonyt k�v�nunk!");
		GiveMoney(playerid,1000000);
		format(log,sizeof(log),"[ajandek] %s kapott 1.000.000 Ft-ott!",PlayerName(playerid));
		Log("Egyeb",log);
		
		return 1;
	}
	
	
	if(IsACop(playerid) || LMT(playerid,FRAKCIO_MENTO) || LMT(playerid,FRAKCIO_OKTATO) || LMT(playerid,FRAKCIO_ONKORMANYZAT)|| LMT(playerid,FRAKCIO_RIPORTER) || LMT(playerid,FRAKCIO_TUZOLTO))
	{
		if(kocsi && haz)
		{
			switch(random(4))
			{
				case 0:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen kocsi alak�t�s egy olyan modelre aminek UCP �ra nem �ri el a 80.000.000 FT-ott");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott model, menj lecser�lni! ((/alakit))");
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen kocsi alak�t�st!",PlayerName(playerid));
						Log("Egyeb",log);
						PlayerInfo[playerid][pAjandek] = 1;
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen h�z�thelyez�s!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott helysz�n, keres fel egy f�admint!");
						PlayerInfo[playerid][pAjandek] = 2;
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen h�t�thelyez�st!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen bels� csere!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott bels�, keres fel egy f�admint!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen bels� alak�t�st!",PlayerName(playerid));
						Log("Egyeb",log);
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						PlayerInfo[playerid][pAjandek] = 3;
						return 1;
					
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen �r�k tuning!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott �r�k tuning, menj keres fel egy gar�zst �s rakd fel a v�lasztottad!");
						PlayerInfo[playerid][pAjandek] = 4;
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen �r�ktuningot!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;

					}
			}
		}
		else if(kocsi)
		{
		
			switch(random(2))
			{
				case 0:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen kocsi alak�t�s egy olyan modelre aminek UCP �ra nem �ri el a 80.000.000 FT-ott");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott model, menj lecser�lni! ((/alakit))");
						PlayerInfo[playerid][pAjandek] = 1;
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen kocsi alak�t�st!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen �r�k tuning!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott �r�k tuning, menj keres fel egy gar�zst �s rakd fel a v�lasztottad!");
						PlayerInfo[playerid][pAjandek] = 4;
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						format(log,sizeof(log),"[ajandek] %s egy ingyen �r�k tuningot",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;

					}
			}
		}
		else if(haz)
		{
			switch(random(2))
			{
				case 0:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen h�z�thelyez�s!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott helysz�n, keres fel egy f�admint!");
						PlayerInfo[playerid][pAjandek] = 2;
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen h�z�thelyez�st",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen bels� csere!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott bels�, keres fel egy f�admint!");
						PlayerInfo[playerid][pAjandek] = 3;
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen bels� cser�t!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					
					}
			}
		}
		else
		{
		
			switch(random(2))
			{
				case 0:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy aranyr�d!");
						PlayerInfo[playerid][pArany] = 1;
						format(log,sizeof(log),"[ajandek] %s kapott egy aranyrudat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						if(PlayerInfo[playerid][pLaptop] == 0)
						{
						
							Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy laptop!");
							PlayerInfo[playerid][pLaptop] = 1;
							format(log,sizeof(log),"[ajandek] %s kapott egy laptopot",PlayerName(playerid));
							Log("Egyeb",log);
							return 1;
						
						}
						else
						{
							Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy aranyr�d!");
							PlayerInfo[playerid][pArany] = 1;
							format(log,sizeof(log),"[ajandek] %s kapott egy aranyrudat",PlayerName(playerid));
							Log("Egyeb",log);
							return 1;
						}
					
					}
			}
		
		
		
		
		}
		
	
	}
	else
	{
		if(kocsi && haz)
		{
			switch(random(10))
			{
				case 0:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen kocsi alak�t�s egy olyan modelre aminek UCP �ra nem �ri el a 80.000.000 FT-ott");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott model, menj lecser�lni! ((/alakit))");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen kocsi alak�t�st!",PlayerName(playerid));
						Log("Egyeb",log);
						PlayerInfo[playerid][pAjandek] = 1;
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						return 1;
						
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen h�z�thelyez�s!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott helysz�n, keres fel egy f�admint!");
						PlayerInfo[playerid][pAjandek] = 2;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen h�t�thelyez�st!",PlayerName(playerid));
						Log("Egyeb",log);
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						return 1;
					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen bels� csere!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott bels�, keres fel egy f�admint!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen bels� alak�t�st!",PlayerName(playerid));
						Log("Egyeb",log);
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						PlayerInfo[playerid][pAjandek] = 3;
						return 1;
					
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen �r�k tuning!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott �r�k tuning, menj keres fel egy gar�zst �s rakd fel a v�lasztottad!");
						PlayerInfo[playerid][pAjandek] = 4;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen �r�ktuningot!",PlayerName(playerid));
						Log("Egyeb",log);
						Msg(playerid, "A kuponok nem �tv�lthat�ak P�NZRE adminok �ltal!!!");
						return 1;

					}
				case 4:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1500g heroin!");
						PlayerInfo[playerid][pHeroin] +=1500;
						format(log,sizeof(log),"[ajandek] %s kapott 1500g heroint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 5:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 2000g Kokain!");
						PlayerInfo[playerid][pKokain] +=2000;
						format(log,sizeof(log),"[ajandek] %s kapott 2000g kokaint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 6:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 30.000db material!");
						PlayerInfo[playerid][pMats] +=30000;
						format(log,sizeof(log),"[ajandek] %s kapott 30.000db materialt",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 7:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1000g Marihuana!");
						PlayerInfo[playerid][pMarihuana] +=1000;
						format(log,sizeof(log),"[ajandek] %s kapott 1000g marihuanat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 8:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy Sniper �s 100 l�szer hozz�!");
						WeaponGiveWeapon(playerid, WEAPON_SNIPER, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_SNIPER, 100);
						format(log,sizeof(log),"[ajandek] %s kapott egy Sniper-t 1000 l�szerrel!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 9:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy M4-es 500 l�szerrel!");
						WeaponGiveWeapon(playerid, WEAPON_M4, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_M4, 500);
						format(log,sizeof(log),"[ajandek] %s kapott egy M4-et 500 l�szerrel",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
			}
		}
		else if(kocsi)
		{
		
			switch(random(8))
			{
				case 0:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen kocsi alak�t�s egy olyan modelre aminek UCP �ra nem �ri el a 80.000.000 FT-ott");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott model, menj lecser�lni! ((/alakit))");
						PlayerInfo[playerid][pAjandek] = 1;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen kocsi alak�t�st!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen �r�k tuning!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott �r�k tuning, menj keres fel egy gar�zst �s rakd fel a v�lasztottad!");
						PlayerInfo[playerid][pAjandek] = 4;
						format(log,sizeof(log),"[ajandek] %s egy ingyen �r�k tuningot",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;

					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1500g heroin!");
						PlayerInfo[playerid][pHeroin] +=1500;
						format(log,sizeof(log),"[ajandek] %s kapott 1500g heroint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 2000g Kokain!");
						PlayerInfo[playerid][pKokain] +=2000;
						format(log,sizeof(log),"[ajandek] %s kapott 2000g kokaint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 4:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 30.000db material!");
						PlayerInfo[playerid][pMats] +=30000;
						format(log,sizeof(log),"[ajandek] %s kapott 30.000db materialt",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 5:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1000g Marihuana!");
						PlayerInfo[playerid][pMarihuana] +=1000;
						format(log,sizeof(log),"[ajandek] %s kapott 1000g marihuanat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 6:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy Sniper �s 100 l�szer hozz�!");
						WeaponGiveWeapon(playerid, WEAPON_SNIPER, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_SNIPER, 100);
						format(log,sizeof(log),"[ajandek] %s kapott egy Sniper-t 1000 l�szerrel!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 7:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy M4-es 500 l�szerrel!");
						WeaponGiveWeapon(playerid, WEAPON_M4, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_M4, 500);
						format(log,sizeof(log),"[ajandek] %s kapott egy M4-et 500 l�szerrel",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
			}
		}
		else if(haz)
		{
			switch(random(8))
			{
				case 0:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen h�z�thelyez�s!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott helysz�n, keres fel egy f�admint!");
						PlayerInfo[playerid][pAjandek] = 2;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen h�z�thelyez�st",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy ingyen bels� csere!");
						Msg(playerid,"Ezt az aj�nd�kot oda is adhatod m�snak a /�tad aj�nd�k parancsal!");
						Msg(playerid, "Ha meg van a v�lasztott bels�, keres fel egy f�admint!");
						PlayerInfo[playerid][pAjandek] = 3;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen bels� cser�t!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					
					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1500g heroin!");
						PlayerInfo[playerid][pHeroin] +=1500;
						format(log,sizeof(log),"[ajandek] %s kapott 1500g heroint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 2000g Kokain!");
						PlayerInfo[playerid][pKokain] +=2000;
						format(log,sizeof(log),"[ajandek] %s kapott 2000g kokaint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 4:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 30.000db material!");
						PlayerInfo[playerid][pMats] +=30000;
						format(log,sizeof(log),"[ajandek] %s kapott 30.000db materialt",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 5:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1000g Marihuana!");
						PlayerInfo[playerid][pMarihuana] +=1000;
						format(log,sizeof(log),"[ajandek] %s kapott 1000g marihuanat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 6:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy Sniper �s 100 l�szer hozz�!");
						WeaponGiveWeapon(playerid, WEAPON_SNIPER, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_SNIPER, 100);
						format(log,sizeof(log),"[ajandek] %s kapott egy Sniper-t 1000 l�szerrel!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 7:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy M4-es 500 l�szerrel!");
						WeaponGiveWeapon(playerid, WEAPON_M4, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_M4, 500);
						format(log,sizeof(log),"[ajandek] %s kapott egy M4-et 500 l�szerrel",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
			}
		}
		else
		{
			switch(random(6))
			{
				
				case 0:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1500g heroin!");
						PlayerInfo[playerid][pHeroin] +=1500;
						format(log,sizeof(log),"[ajandek] %s kapott 1500g heroint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 2000g Kokain!");
						PlayerInfo[playerid][pKokain] +=2000;
						format(log,sizeof(log),"[ajandek] %s kapott 2000g kokaint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 30.000db material!");
						PlayerInfo[playerid][pMats] +=30000;
						format(log,sizeof(log),"[ajandek] %s kapott 30.000db materialt",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod 1000g Marihuana!");
						PlayerInfo[playerid][pMarihuana] +=1000;
						format(log,sizeof(log),"[ajandek] %s kapott 1000g marihuanat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 4:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy Sniper �s 100 l�szer hozz�!");
						WeaponGiveWeapon(playerid, WEAPON_SNIPER, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_SNIPER, 100);
						format(log,sizeof(log),"[ajandek] %s kapott egy Sniper-t 1000 l�szerrel!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 5:
					{
						Msg(playerid,"Kinyitottad az aj�nd�kodat! Az aj�nd�kod egy M4-es 500 l�szerrel!");
						WeaponGiveWeapon(playerid, WEAPON_M4, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_M4, 500);
						format(log,sizeof(log),"[ajandek] %s kapott egy M4-et 500 l�szerrel",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
			}
		}
	}
	
	format(log,sizeof(log),"[ajandek] %s Nem kapott semmit!",PlayerName(playerid));
	PlayerInfo[playerid][pAjandekUnixtime] = NINCS;
	Log("Egyeb",log);
	return 1;
}*/

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

ALIAS(bel2p2sek):belepesek;
CMD:belepesek(playerid, params[])
{
	if(Belepesek[playerid])
	{
		Belepesek[playerid] = false;
		Msg(playerid, "Most m�r nem l�tod, hogy kik l�pnek be a k�zeledben.");
	}
	else
	{
		Belepesek[playerid] = true;
		Msg(playerid, "Most m�r l�tod, hogy kik l�pnek be a k�zeledben.");
	}
	return 1;
}

CMD:detektor(playerid, params[])
{
	new v = GetPlayerVehicleID(playerid), vs = IsAVsKocsi(v), m[32];
	if(!IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Csak j�rm�ben haszn�lhat�!");
	if(vs == NINCS) return Msg(playerid, "Ebben a j�rm�ben nincs detektor! (vs)");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return Msg(playerid, "Sof�rk�nt kell vezetned!");
	if(CarInfo[vs][cDetektor] == 0) return Msg(playerid, "Ebben a j�rm�ben nincs detektor!");
	if(sscanf(params, "s[32]", m))
	{
		if(Detektor[v])
		{
			Detektor[v] = false;
			Msg(playerid, "Detektor kikapcsolva, vigy�zz, ism�t elkaphat a traffipax!");
			Cselekves(playerid, "babr�l valamit az �l�se alatt...", 1);
		}
		else
		{
			Detektor[v] = true;
			Msg(playerid, "Detektor bekapcsolva, vigy�zz, ha a rend�r �szreveszi, lecsukhat �rte!");
			Cselekves(playerid, "babr�l valamit az �l�se alatt...", 1);
		}
	}
	else if(!sscanf(params, "s[32]", m)) SendFormatMessage(playerid, COLOR_ADD, "Ebben a j�rm�ben %d-as szint� detektor van", CarInfo[vs][cDetektor]);
	return 1;
}
CMD:emp(playerid, params[])
{
	new v = GetPlayerVehicleID(playerid), vs = IsAVsKocsi(v), m[32];
	if(!IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Csak j�rm�ben haszn�lhat�!");
	if(vs == NINCS) return Msg(playerid, "Ebben a j�rm�ben nincs EMP! (vs)");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return Msg(playerid, "Sof�rk�nt kell vezetned!");
	if(CarInfo[vs][cEMP] == 0) return Msg(playerid, "Ebben a j�rm�ben nincs EMP v�delem!");
	if(sscanf(params, "s[32]", m))
	{
		if(EMPKE[v])
		{
			EMPKE[v] = false;
			Msg(playerid, "EMP kikapcsolva, vigy�zz, ism�t lesokkolhatj�k a j�rm�ved!");
			Cselekves(playerid, "babr�l valamit az �l�se alatt...", 1);
		}
		else
		{
			EMPKE[v] = true;
			Msg(playerid, "EMP bekapcsolva, vigy�zz, ha a rend�r �szreveszi, lecsukhat �rte!");
			Cselekves(playerid, "babr�l valamit az �l�se alatt...", 1);
		}
	}
	else if(!sscanf(params, "s[32]", m)) SendFormatMessage(playerid, COLOR_ADD, "Ebben a j�rm�ben %d-as szint� EMP van", CarInfo[vs][cEMP]);
	return 1;
}

/*ALIAS(szem2t):szemet;
CMD:szemet(playerid, params[])
{
	new mitakarvele[32];
	if(sscanf(params, "s[32]", mitakarvele)) return Msg(playerid, "/szem�t [felvesz/lerak]");
	if(egyezik(mitakarvele, "felvesz"))
	{
		if(VanSzemetNala[playerid]) return Msg(playerid, "N�lad m�r van szem�t, el�bb azt rakd le!");
		new kuka = NINCS;
		for(new k = 0; k < sizeof(TrashInfo); k++)
		{
			if(PlayerToPoint(1.0, playerid, ArrExt(TrashInfo[k][tSzemetPos])) && TrashInfo[k][tSzemet])
			{
				kuka = k;
				break;
			}
		}
		if(kuka == NINCS) return Msg(playerid, "Nem vagy szem�t k�zel�ben!");
		
		VanSzemetNala[playerid] = true;
		SetPlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS, 1265, 6, 0.189000, -0.236000, 0.011999, -55.500057, 0.000000, 110.500022);
		TrashInfo[kuka][tSzemet] = false;
		if(IsValidDynamicPickup(TrashInfo[kuka][tSzemetPickup])) DestroyDynamicPickup(TrashInfo[kuka][tSzemetPickup]);
		if(IsValidDynamic3DTextLabel(TrashInfo[kuka][tSzemetLabel])) DestroyDynamic3DTextLabel(TrashInfo[kuka][tSzemetLabel]), TrashInfo[kuka][tSzemetLabel] = INVALID_3D_TEXT_ID;
		Streamer_Update(playerid);
		Msg(playerid, "Szem�t felv�ve");
	}
	if(egyezik(mitakarvele, "lerak"))
	{
		if(!VanSzemetNala[playerid]) return Msg(playerid, "Nincs n�lad szem�t!");
		new Float:pozicio[3], kuka = NINCS, vw = GetPlayerVirtualWorld(playerid), int = GetPlayerInterior(playerid);
		GetPlayerPos(playerid, ArrExt(pozicio));
		if(vw != 0 || int != 0) return Msg(playerid, "Csak a szabadban helyezheted el a szemetet! (0-s vw �s 0-s interior)");
		
		for(new k = 0; k < sizeof(TrashInfo); k++)
		{
			if(!TrashInfo[k][tSzemet])
			{
				kuka = k;
				break;
			}
		}
		if(kuka == NINCS) { SzemetDebug[playerid] = true; Msg(playerid, "Hiba, nincs hely lerakni a szemetet, �rj a scripterek topikj�ba! Most �rd be: /szem�t debug"); return 1; }
		
		TrashInfo[kuka][tSzemetPos][0] = pozicio[0];
		TrashInfo[kuka][tSzemetPos][1] = pozicio[1];
		TrashInfo[kuka][tSzemetPos][2] = pozicio[2];
		TrashInfo[kuka][tSzemet] = true;
		VanSzemetNala[playerid] = false;
		if(!IsValidDynamicPickup(TrashInfo[kuka][tSzemetPickup])) TrashInfo[kuka][tSzemetPickup] = UjPickup(1265, 23, ArrExt(TrashInfo[kuka][tSzemetPos]), 0, 0);
		tformat(64, "Szem�t\nLerakta:%s", ICPlayerName(playerid));
		if(!IsValidDynamic3DTextLabel(TrashInfo[kuka][tSzemetLabel])) TrashInfo[kuka][tSzemetLabel] = CreateDynamic3DTextLabel(_tmpString, 0xFFC801AA, ArrExt(TrashInfo[kuka][tSzemetPos]), 25.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);
		RemovePlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS);
		Streamer_Update(playerid);
		Msg(playerid, "Szem�t lerakva");
	}
	if(egyezik(mitakarvele, "debug"))
	{
		if(!SzemetDebug[playerid]) return 1;
		VanSzemetNala[playerid] = false;
		SzemetDebug[playerid] = false;
		RemovePlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS);
		Streamer_Update(playerid);
		Msg(playerid, "Szem�t debugolva");
	}
	return 1;
}*/

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

CMD:taxisok(playerid, params[])
{
	if(TaxiOnline() < 1) return Msg(playerid, "Nincs taxis");
	foreach(Jatekosok,id)
	{
		new Float:x,Float:y,Float:z,Float:xx,Float:yy,Float:zz;
		GetPlayerPos(playerid, x,y,z);
		
		if(Taxi[id][tDuty])
		{
			if(Taxi[id][tHivas])
			{
				SendFormatMessage(playerid,COLOR_YELLOW,"[H�v�sra megy][%d]%s D�jszab�s:%d FT [Sz�ll�t�sok: %d, Km: %.3f]",id,ICPlayerName(id),FrakcioInfo[FRAKCIO_TAXI][fDij],Taxi[id][tHivasok], Taxi[id][tOKm]/1000.0);
			}
			elseif(Taxi[id][tUtas] == NINCS)
			{
				GetPlayerPos(id, xx,yy,zz);
				new Float:tavolsag = GetDistanceBetweenPoints(x, y, z, xx, yy, zz);
				SendFormatMessage(playerid,COLOR_GREEN,"[Szabad][%d]%s D�jszab�s:%d FT t�vols�g: %.3f [Sz�ll�t�sok: %d, Km: %.3f]",id,ICPlayerName(id),FrakcioInfo[FRAKCIO_TAXI][fDij],tavolsag,Taxi[id][tHivasok], Taxi[id][tOKm]/1000.0);
			}
			else
				SendFormatMessage(playerid,COLOR_LIGHTRED,"[Foglalt][%d]%s D�jszab�s:%d FT [Sz�ll�t�sok: %d, Km: %.3f]",id,ICPlayerName(id),FrakcioInfo[FRAKCIO_TAXI][fDij],Taxi[id][tHivasok], Taxi[id][tOKm]/1000.0);
		
		
		}
	}
	Msg(playerid, "/service taxi [id]");
	return 1;
}

/*ALIAS(kukas):kuka;
ALIAS(kuk1s):kuka;
CMD:kuka(playerid, params[])
{
	if(OnDuty[playerid]) return Msg(playerid, "D�ntsd el�bb el mit dolgozol! ((frakci� dutyba nem!))");
	new parameter[64];
	if(!AMT(playerid, MUNKA_KUKAS)) return Msg(playerid, "Nem vagy kuk�s!");
	if(sscanf(params, "s[64]", parameter)) return Msg(playerid, "/kuka [munka/hely/seg�ts�g]");
	if(egyezik(parameter, "munka") || egyezik(parameter, "szolgalat") || egyezik(parameter, "szolg�lat"))
	{
		if(!PlayerToPoint(2.5, playerid, -586.7446,-1501.2863,10.3250))
		{
			SetPlayerCheckpoint(playerid, -586.7446,-1501.2863,10.3250, 2.5);
			Msg(playerid, "Nem vagy a szem�ttelepen!");
			return 1;
		}
		if(Munkaban[playerid] != MUNKA_KUKAS)
		{
			Munkaban[playerid] = MUNKA_KUKAS;
			if(PlayerInfo[playerid][pSex] == 2) SetPlayerSkin(playerid, 157);
			else SetPlayerSkin(playerid, 8);
			Msg(playerid, "Felvetted a ruh�dat, �gy munk�ba �llt�l. A munka v�gz�s�hez seg�ts�g: /kuka seg�ts�g");
			
		}
		else if(Munkaban[playerid] == MUNKA_KUKAS)
		{
			Munkaban[playerid] = NINCS;
			if(!LegalisSzervezetTagja(playerid) && !Civil(playerid))
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
			else
				SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				
			Msg(playerid, "Visszavetted a civil ruh�dat, �gy m�r nem dolgozol.");
		}
	}
	else if(egyezik(parameter, "hely"))
	{
		if(Munkaban[playerid] != MUNKA_KUKAS) return Msg(playerid, "Nem kuk�sk�nt dolgozol!");
		new kukac, Float:ppos[3], Float:tav, Float:legkozelebb = 5000.0;
		GetPlayerPos(playerid, ArrExt(ppos));
		for(new k = 0; k < sizeof(TrashInfo); k++)
		{
			if(!TrashInfo[k][tSzemet]) continue;
			tav = GetDistanceBetweenPoints(ArrExt(ppos), ArrExt(TrashInfo[k][tSzemetPos]));
			if(tav < legkozelebb)
			{
				legkozelebb = tav;
				kukac = k;
			}
		}
		if(legkozelebb == 5000.0) return Msg(playerid, "Jelenleg nincs elsz�ll�t�sra v�r� kuka.");
		SetPlayerCheckpoint(playerid, ArrExt(TrashInfo[kukac][tSzemetPos]), 2.0);
		Msg(playerid, "Az ir�ny�t� �gyn�ks�g megjel�lte a sz�modra legk�zelebbi elsz�ll�tatlan szemetet.");
	}
	else if(egyezik(parameter, "seg�ts�g") || egyezik(parameter, "segitseg") || egyezik(parameter, "help"))
	{
		SendClientMessage(playerid, COLOR_GREEN, "=====[ Kuk�s munka haszn�lati �tmutat� ]=====");
		SendClientMessage(playerid, COLOR_WHITE, "A munk�t elkezdeni a /kuka munka paranccsal tudod.");
		SendClientMessage(playerid, COLOR_GRAD6, "Miut�n bele�lt�l egy kuk�skocsiba, egy h�zhoz kell menned, ahol fel kell venned a szemetet.");
		SendClientMessage(playerid, COLOR_GRAD5, "Ezt a kuk�skocsihoz �llva bele kell tenned a szem�tmegsemmis�t�be a BAL EG�RGOMB megnyom�s�val.");
		SendClientMessage(playerid, COLOR_GRAD4, "Egy kuk�skocsiba maximum 20 szem�t f�r, �gy ha ez megtelik, el kell vinni a szem�ttelepre.");
		SendClientMessage(playerid, COLOR_GRAD3, "Ott a szem�tlerak� sz�l�hez kell �llni, ahol a BAL EG�RGOMB megnyom�sa ut�n egy kis id� eltelt�vel ki�r�l a tart�ly.");
		SendClientMessage(playerid, COLOR_GRAD2, "Ekkor j�v��r�dik a fizet�sedhez a szemetek�rt kapott p�nz, majd folytathatod a munk�t, vagy befejezheted.");
		SendClientMessage(playerid, COLOR_GRAD1, "A j�t�kosok h�zai el�tt a szemetek a j�t�kosok fizet�seikor �jra lerak�dnak.");
	}
	return 1;
}*/
ALIAS(h3rek):news;
CMD:news(playerid, params[])
{
	new szoveg[128], jarmu = GetPlayerVehicleID(playerid);
	if(FloodCheck(playerid)) return 1;
	if(!LMT(playerid, FRAKCIO_RIPORTER)) return Msg(playerid, "Ez a parancs nem el�rhet� sz�modra");
	if(IsFrakcioKocsi(jarmu) != 9 && !PlayerToPoint(2, playerid, -1821.3152,323.6341,-41.7493) && !PlayerToPoint(6, playerid, 1429.8469,-2448.7258,13.5629)) return Msg(playerid, "Riporter j�rm�ben kell lenned vagy a st�di�ban!");
	if(!Munkarang(playerid, 1)) return Msg(playerid, "Ez a parancs nem el�rhet� sz�modra");
	if(sscanf(params, "s[128]", szoveg)) return Msg(playerid, "/m�sorn�v [M�sor neve]");
	if(strlen(szoveg) > 100) return Msg(playerid, "Maximum 100 karakter!");
	if(SzovegEllenorzes(playerid, szoveg, "/news", ELLENORZES_HIRDETES)) return 1;
	
	if(strcmp(RadioMusorNev,"NINCS") == 0)
		format(_tmpString, sizeof(_tmpString), "R�di�s %s: %s", ICPlayerName(playerid), szoveg);
	else
		format(_tmpString, sizeof(_tmpString), "%s - %s: %s", RadioMusorNev, ICPlayerName(playerid), szoveg);
	SendMessage(SEND_MESSAGE_OOCNEWS, _tmpString, COLOR_NEWS);
	PlayerInfo[playerid][pNewsSkill] ++;
	return 1;
}

ALIAS(m9sorn2v):musornev;
CMD:musornev(playerid, params[])
{
	new musorcime[64], jarmu = GetPlayerVehicleID(playerid);
	if(!LMT(playerid, FRAKCIO_RIPORTER)) return Msg(playerid, "Ez a parancs nem el�rhet� sz�modra");
	if(IsFrakcioKocsi(jarmu) != 9 && !PlayerToPoint(2, playerid, -1821.3152,323.6341,-41.7493) && !PlayerToPoint(6, playerid, 1429.8469,-2448.7258,13.5629)) return Msg(playerid, "Riporter j�rm�ben kell lenned vagy a st�di�ban!");
	if(!Munkarang(playerid, 1)) return Msg(playerid, "Ez a parancs nem el�rhet� sz�modra");
	if(PlayerInfo[playerid][pNewsSkill] < 101) return Msg(playerid, "A parancs haszn�lat�hoz minimum 3-as ripoter skill sz�ks�ges");
	if(sscanf(params, "s[64]", musorcime)) return Msg(playerid, "/m�sorn�v [M�sor neve]");
	if(strlen(musorcime) > 32) return Msg(playerid, "Maximum 32 karakteres lehet a m�sor c�me!");
	if(SzovegEllenorzes(playerid, musorcime, "/musornev", ELLENORZES_HIRDETES)) return 1;
	if(egyezik(musorcime, "ki") || egyezik(musorcime, "NINCS"))
	{
		RadioMusorNev = "NINCS";
		Msg(playerid, "R�di� m�sorn�v kikapcsolva!");
		RadioAktivsag = UnixTime+300;
		PlayerInfo[playerid][pNewsSkill] ++;
		if(PlayerInfo[playerid][pNewsSkill] == 200)
			SendClientMessage(playerid, COLOR_YELLOW, "* A riporter skilled el�rte a 4es szintet! Mostm�r tudsz rep�lni a riporter helikopterrel!");
		else if(PlayerInfo[playerid][pNewsSkill] == 400)
			SendClientMessage(playerid, COLOR_YELLOW, "* A riporter skilled el�rte az 5�s szintet! Mostm�r tudsz felk�rni m�sokat, hogy �l� ad�sban szerepeljen, illetve tudsz zen�t ind�tani!");
		format(_tmpString, 128, "<< %s kikapcsolta a m�sornevek haszn�lat�t >>", PlayerName(playerid), musorcime);
		SendMessage(SEND_MESSAGE_FRACTION, _tmpString, COLOR_LIGHTRED, 9);
		EgyebLog(_tmpString);
		return 1;
	}
	RadioMusorNev = musorcime;
	SendFormatMessage(playerid, COLOR_GREEN, "Az �j m�sorn�v: %s, kikapcsol�shoz: /m�sorn�v ki", musorcime);
	RadioAktivsag = UnixTime+300;
	PlayerInfo[playerid][pNewsSkill] ++;
	if(PlayerInfo[playerid][pNewsSkill] == 200)
		SendClientMessage(playerid, COLOR_YELLOW, "* A riporter skilled el�rte a 4es szintet! Mostm�r tudsz rep�lni a riporter helikopterrel!");
	else if(PlayerInfo[playerid][pNewsSkill] == 400)
		SendClientMessage(playerid, COLOR_YELLOW, "* A riporter skilled el�rte a 5�s szintet! Mostm�r tudsz felk�rni m�sokat, hogy �l� ad�sban szerepeljen, illetve tudsz zen�t ind�tani!");
	format(_tmpString, 128, "<< %s megv�ltoztatta a m�sornevet erre: %s >>", PlayerName(playerid), musorcime);
	SendMessage(SEND_MESSAGE_FRACTION, _tmpString, COLOR_LIGHTRED, 9);
	EgyebLog(_tmpString);
	return 1;
}

CMD:megad(playerid, params[])
{
	if(FloodCheck(playerid)) return 1;
	if(NemMozoghat(playerid)) return Msg(playerid, "M�r k�s�, nem gondolod?");
	if(!PlayerInfo[playerid][pMegad])
	{
		PlayerInfo[playerid][pMegad] = true;
		Cselekves(playerid, "megadta mag�t");
		Msg(playerid, "Megadtad magadat. Kikapcsol�shoz �rd be ism�t a parancsot: /megad");
		
		ApplyAnimation(playerid, "ROB_BANK","SHP_HandsUp_Scr", 4.0, 0, 0, 0, 0, 1);
	}
	else
	{
		PlayerInfo[playerid][pMegad] = false;
		Msg(playerid, "M�r nem adod meg magadat. Bekapcsol�shoz �rd be ism�t a parancsot: /megad");
		ClearAnim(playerid);
		
	}
	return 1;
}

CMD:uninvite(playerid, params[])
{
	new target, reason[128], str[128];
	if(!PlayerInfo[playerid][pLeader]) return Msg(playerid, "Nem vagy leader");
	if(sscanf(params, "us[128]", target, reason)) return Msg(playerid, "/uninvite [N�v/ID] [Oka]");
	if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
	if(PlayerInfo[playerid][pMember] != PlayerInfo[target][pMember]) return Msg(playerid, "� nem a te tagod");
	if(PlayerInfo[target][pLeader] > 0) return Msg(playerid, "Nem r�ghatod ki, mivel leader");
	if(FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fUtolsoTagFelvetel] > (UnixTime - 300)) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Csak 5percenk�nt lehet tagot felvenni / kir�gni, m�g %dmp van h�tra", FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fUtolsoTagFelvetel] - (UnixTime - 300));
	
	FrakcioInfo[PlayerInfo[playerid][pLeader]][fUtolsoTagFelvetel] = UnixTime;
	FrakcioInfo[PlayerInfo[playerid][pLeader]][fTagokSzama]--;
	SendFormatMessage(playerid, COLOR_GREEN, "ClassRPG: Kir�gtad %s-t a frakci�b�l, oka: %s", PlayerName(target), reason);
	SendFormatMessage(target, COLOR_GREEN, "ClassRPG: %s kir�gott a frakci�b�l, oka: %s", PlayerName(playerid), reason);
	format(str, 128, "<< ClassRPG: %s kir�gta %s-t a frakci�b�l - Oka: %s >>", PlayerName(playerid), PlayerName(target), reason);
	PlayerInfo[target][pMember] = 0;
	PlayerInfo[target][pRank] = 0;
	PlayerInfo[target][pChar] = 0;
	PlayerInfo[target][pSwattag] = 0;
	PlayerInfo[target][pSwatRang] = 0;
	SetSpawnInfo(target, SPAWNID, PlayerInfo[playerid][pModel],0.0,0.0,0.0,0,0,0,0,0,0,0);
	SpawnPlayer(target);
	foreach(Jatekosok, p)
	{
		if(LMT(p, PlayerInfo[playerid][pMember]))
			SendClientMessage(p, COLOR_LIGHTRED, str);
	}
	
	format(_tmpString, 128, "UPDATE %s SET Member='%d' WHERE ID='%d'", SQL_DB_Player, PlayerInfo[playerid][pLeader], SQLID(target));
	doQuery( _tmpString );
	
	return 1;
}

CMD:invite(playerid, params[])
{
	new target, str[128];
	if(!PlayerInfo[playerid][pLeader]) return Msg(playerid, "Nem vagy leader");
	if(sscanf(params, "u", target)) return Msg(playerid, "/invite [N�v/ID]");
	if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
	if(PlayerInfo[target][pMember] > 0) return Msg(playerid, "� m�r tag valahol");
	if(PlayerInfo[target][pLeader] > 0) return Msg(playerid, "� m�r leader valahol");
	if(PlayerInfo[target][pFrakcioTiltIdo]) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: � el van tiltva a frakci�kt�l, oka: %s, m�g %d �r�ig", PlayerInfo[target][pFrakcioTiltOk], PlayerInfo[target][pFrakcioTiltIdo]);
	if(PlayerInfo[playerid][pLeader] < 1 || PlayerInfo[playerid][pLeader] > sizeof(Szervezetneve)) return 1;
	if(FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fUtolsoTagFelvetel] > (UnixTime - 300)) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Csak 5percenk�nt lehet tagot felvenni / kir�gni, m�g %dmp van h�tra", FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fUtolsoTagFelvetel] - (UnixTime - 300));
	if(FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fTagokSzama] >= SzervezetLimit[ PlayerInfo[playerid][pLeader] - 1 ]) return Msg(playerid, "A frakci� tele van");
	if(Invitejog[target]) return Msg(playerid, "� m�r meg van h�vva valahova, �gy nem tudsz megh�v�st k�ldeni neki");
	
	Invitejog[target] = PlayerInfo[playerid][pMember];
	SendFormatMessage(playerid, COLOR_GREEN, "ClassRPG: Megh�vtad %s-t, hogy csatlakozzon hozz�tok, ha elfogadja, tagg� v�lik", PlayerName(target));
	SendFormatMessage(target, COLOR_LIGHTBLUE, "ClassRPG: %s megh�vott t�ged, hogy csatlakozz a(z) %s frakci�hoz.", PlayerName(playerid), Szervezetneve[PlayerInfo[playerid][pLeader] - 1][1]);
	SendClientMessage(target, COLOR_LIGHTBLUE, "ClassRPG: Elfogad�shoz haszn�ld a /accept invite parancsot, elutas�t�shoz pedig a /cancel invite parancsot.");
	format(str, 128, "<< ClassRPG: %s megh�vta %s-t a frakci�ba, ha elfogadja, tagg� v�lik >>", PlayerName(playerid), PlayerName(target));
	foreach(Jatekosok, p)
	{
		if(LMT(p, PlayerInfo[playerid][pMember]))
			SendClientMessage(p, COLOR_LIGHTRED, str);
	}
	return 1;
}

CMD:tvisz(playerid, params[])
{
	new jatekos = jatekos = GetClosestPlayer(playerid);
	if(!LMT(playerid, FRAKCIO_TUZOLTO)) 
		return Msg(playerid, "Nem vagy t�zolt�!");
	if(Visz[playerid] != NINCS)
	{
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Elengedted");
		Visz[playerid] = NINCS;
		return 1;
	}
		
	if(!IsPlayerConnected(jatekos)) 
		return 1;
	
	if(GetDistanceBetweenPlayers(playerid, jatekos) > 3)
		return Msg(playerid, "Nincs a k�zeledben!");
	
	for(new t = 0; t < TUZ_MAX; t++)
	{
		if(!Tuz[t][tuzAktiv])
			continue;
		
		if(!PlayerToPoint(TUZ_SERULES_TAV, jatekos, ArrExt( Tuz[t][tPoz] )))
			return Msg(playerid, "� nincs a t�zben!");
			
		Visz[playerid] = jatekos;
		Msg(playerid, "Megfogtad �s elkezdted h�zni �t, siess, nehogy komolyabb baja essen!", false, COLOR_LIGHTBLUE);
		Cselekves(playerid, "elkezdett valakit kih�zni a l�ngok k�z�l");
	}
	
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

ALIAS(mobiledatacomputer):mdc;
CMD:mdc(playerid, params[])
{
	new type[16], subtype[32];
	if(!IsACop(playerid)) return Msg(playerid, "Nem vagy rend�r!");
	if(OnDuty[playerid] != 1 && AdminDuty[playerid] != 1) return Msg(playerid, "Nem vagy szolg�latban!");
	if(sscanf(params, "s[16]S()[32]", type, subtype)) return Msg(playerid, "/mdc [j�t�kos/j�rm�]");
	if(egyezik(type, "j�t�kos") || egyezik(type, "jatekos") || egyezik(type, "player"))
	{
		new target;
		if(sscanf(subtype, "u", target)) return Msg(playerid, "/mdc j�t�kos [N�v/ID]");
		if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen j�t�kos!");
		SendClientMessage(playerid, TEAM_BLUE_COLOR, "==========[ MOBILE DATA COMPUTER ]==========");
		SendFormatMessage(playerid, COLOR_WHITE, "N�v: %s", ICPlayerName(target));
		SendFormatMessage(playerid, COLOR_WHITE, "B�n: %s", PlayerCrime[target][pVad]);
		SendFormatMessage(playerid, COLOR_WHITE, "Jelent�: %s", PlayerCrime[target][pJelento]);
		SendClientMessage(playerid, TEAM_BLUE_COLOR,"==========[ MOBILE DATA COMPUTER ]==========");
	}
	else if(egyezik(type, "j�rm�") || egyezik(type, "jarmu") || egyezik(type, "vehicle"))
	{
		new target;
		if(sscanf(subtype, "i", target)) return Msg(playerid, "/mdc j�rm� [Rendsz�m]");
		if(target == INVALID_VEHICLE_ID) return Msg(playerid, "Nincs ilyen j�rm�");
		SendClientMessage(playerid, TEAM_BLUE_COLOR, "==========[ MOBILE DATA COMPUTER ]==========");
		SendFormatMessage(playerid, COLOR_WHITE, "Rendsz�m: CLS-%d", target);
		SendFormatMessage(playerid, COLOR_WHITE, "J�rm� t�pus: %s", GetVehicleModelName(GetVehicleModel(target)-400));
		SendFormatMessage(playerid, COLOR_WHITE, "B�n: %s", VehicleCrime[target][vVad]);
		SendFormatMessage(playerid, COLOR_WHITE, "Jelent�: %s", VehicleCrime[target][vJelento]);
		SendClientMessage(playerid, TEAM_BLUE_COLOR,"==========[ MOBILE DATA COMPUTER ]==========");
	}
	return 1;
}

ALIAS(su):suspect;
CMD:suspect(playerid, params[])
{
	new type[16], subtype[32];
	if(!IsACop(playerid)) return Msg(playerid, "Nem vagy rend�r!");
	if(OnDuty[playerid] != 1) return Msg(playerid, "Nem vagy szolg�latban!");
	if(sscanf(params, "s[16]S()[32]", type, subtype)) return Msg(playerid, "/suspect [j�t�kos/j�rm�]");
	if(egyezik(type, "j�t�kos") || egyezik(type, "jatekos") || egyezik(type, "player"))
	{
		new target, crime[128];
		if(sscanf(subtype, "us[128]", target, crime)) return Msg(playerid, "/suspect j�t�kos [N�v/ID] [B�ntett]");
		if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen j�t�kos!");
		if(IsACop(target)) return Msg(playerid, "Rend�rt nem lehet feljelenteni!");
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Sikeresen feljelentetted %s-t!", ICPlayerName(target));
		SetPlayerCriminal(target, playerid, crime);
	}
	if(egyezik(type, "j�rm�") || egyezik(type, "jarmu") || egyezik(type, "vehicle"))
	{
		new target, crime[128];
		if(sscanf(subtype, "is[128]", target, crime)) return Msg(playerid, "/suspect j�rm� [Rendsz�m] [B�ntett]");
		if(target == INVALID_VEHICLE_ID) return Msg(playerid, "Nincs ilyen j�rm�");
		if(IsACopCar(target)) return Msg(playerid, "Rend�rkocsit nem lehet feljelenteni!");
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Sikeresen feljelentetted a CLS-%d rendsz�m� j�rm�vet!", target);
		SetVehicleCriminal(target, playerid, crime);
	}
	return 1;
}

ALIAS(szerv3zk5nyv):szervizkonyv;
ALIAS(szervizk5nyv):szervizkonyv;
CMD:szervizkonyv(playerid, params[])
{
	new target, car = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "A szervizk�nyv a kocsiban van");
	if(sscanf(params, "u", target)) return Msg(playerid, "/szervizk�nyv [N�v/ID]");
	if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen j�t�kos");
	if(GetDistanceBetweenPlayers(playerid, target) > 4.0) return Msg(playerid, "Nincs a k�zeledben");
	if(IsABicikli(car)) return Msg(playerid, "Ennek nincs szervizk�nyve");
	new tulaj = IsAVsKocsi(car);
	new frakcio;
	new id = NINCS;
	for(new k = 0; k < MAX_FRAKCIOKOCSI; k++)
	{
		for(new kk = 0; kk  <MAX_FRAKCIO; kk++)
		{
			if(!FrakcioKocsi[kk][k][fVan]) continue;
			
			if(FrakcioKocsi[kk][k][fVan] && FrakcioKocsi[kk][k][fID] == car)
			{
				frakcio=kk;
				id = k;
				break;
			}
		}
	}
	new legutoljara = (UnixTime - CarPart[car][cSzervizdatum]) / 3600;
	
	
	
	new Float:serules = (1000.0 - KocsiElete[car]) / 6.5;
	if(serules < 0.0)
		serules = 0.0;
	else if(serules > 100.0)
		serules = 100.0;
			
	SendFormatMessage(target, COLOR_GREEN, "=====[ CLS-%d j�rm� szervizk�nyve ]=====", car);
	if(tulaj != NINCS)
		SendFormatMessage(target, COLOR_LIGHTGREEN, "J�rm� tulajdonosa: %s", CarInfo[tulaj][cOwner]);
	else
		SendClientMessage(target, COLOR_LIGHTGREEN, "J�rm� tulajdonosa: C�ges tulajdon");
	SendFormatMessage(target, COLOR_LIGHTGREEN, "J�rm� t�pusa: %s", GetVehicleModelName(GetVehicleModel(car)-400));
	if(tulaj != NINCS)
		SendFormatMessage(target,COLOR_WHITE,"J�rm� sz�nk�dja: %d & %d",CarInfo[tulaj][cColorOne], CarInfo[tulaj][cColorTwo]);
	else if(id != NINCS)
		SendFormatMessage(target,COLOR_WHITE,"J�rm� sz�nk�dja: %d & %d",FrakcioKocsi[frakcio][id][fSzin][0], FrakcioKocsi[frakcio][id][fSzin][1]);
	else	
		SendClientMessage(target,COLOR_WHITE,"J�rm� sz�nk�dja: Nincs bejegyezve");
	SendFormatMessage(target, COLOR_WHITE, "Futott kilom�ter: %.2f km", KmSzamol[car]/1000);
	SendFormatMessage(target, COLOR_WHITE, "Kerekek: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cKerekek]);
	SendFormatMessage(target, COLOR_WHITE, "Motorolaj: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cMotorolaj]);
	SendFormatMessage(target, COLOR_WHITE, "Akkumul�tor t�lt�tts�ge: %.2f sz�zal�k", CarPart[car][cAkkumulator]);
	SendFormatMessage(target, COLOR_WHITE, "Motor: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cMotor]/5); // Val�s �rt�ket mutasson, ne azt h pl. 300%-ban elhaszn�l�dott
	SendFormatMessage(target, COLOR_WHITE, "F�k: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cFek]);
	SendFormatMessage(target, COLOR_WHITE, "Elektronika: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cElektronika]);
	SendFormatMessage(target, COLOR_WHITE, "Karossz�ria: %d alkalommal volt cser�lve", CarPart[car][cKarosszeria]);
	SendFormatMessage(target, COLOR_WHITE, "Karossz�ria: %.0f sz�zal�kban k�rosodott", serules);
	if(legutoljara > 250)
		SendClientMessage(target, COLOR_LIGHTGREEN, "A j�rm� m�g nem volt szervizben");
	else
		SendFormatMessage(target, COLOR_LIGHTGREEN, "A j�rm� legutolj�ra szervizben volt: %d napja", legutoljara);
		
	if(target == playerid)
		Cselekves(playerid, "el�vette az aut� szervizk�nyv�t, �s megn�zte.");
	else
		Cselekves(playerid, "el�vette az aut� szervizk�nyv�t, �s megmutatta valakinek.");
	
	return 1;
}

ALIAS(repair):szereles;
ALIAS(szerel2s):szereles;
CMD:szereles(playerid, params[])
{
	new target, mit[32], sub[64], mennyiert, car = GetClosestVehicle(playerid);
	if(PlayerInfo[playerid][pSzerelo] < 1) return Msg(playerid, "Nem vagy szerel�");
	if(OnDuty[playerid]) return Msg(playerid, "D�ntsd el�bb el mit dolgozol! ((frakci� dutyba nem!))");
	
	if(IsPlayerInAnyVehicle(playerid)) return Msg(playerid,"Kocsiban nem tudsz szerelni");
	if(GetPlayerDistanceFromVehicle(playerid, car) > 10) return Msg(playerid, "Nincs a k�zeledben j�rm�");
	
	if((IsAPRepulo(car) || IsAMotor(car) || IsARepulo(car) || IsAPlane(car)) && !IsAt(playerid, IsAt_Szerelohely))
	{
		new szkocsi=GetClosestVehicle(playerid, false, 525);
		if(GetPlayerDistanceFromVehicle(playerid, szkocsi) > 10) return Msg(playerid, "Nincs a k�zeledben szerel� kocsi!");
	}
	else
		if(!IsAt(playerid, IsAt_Szerelohely)) return Msg(playerid, "Itt nem tudsz jav�tani");
		
	if(sscanf(params, "s[32]S()[64]", mit, sub))
	{
		Msg(playerid, "/szerel�s [Kerekek/Motorolaj/Akkumul�tor/Motor/Elektronika/F�k/Karossz�ria] [N�v/ID] [�r]");
		Msg(playerid, "J�rm� �llapotfelm�r�se: /szerel�s �llapot");
		return 1;
	}
	if(IsABicikli(car)) return Msg(playerid, "Ezt nem lehet megjav�tani");
	if(egyezik(mit, "Kerekek"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerel�s kerekek [N�v/ID] [�ra]");
		if(target == playerid)
		{
			new panels, doors, lights, tires;
			if(!BankkartyaFizet(playerid, 150000)) return Msg(playerid, "ClassRPG: Nincs el�g p�nzed, a garnit�ra gumi �ra: 150,000Ft!");
			Cselekves(playerid,"kicser�lte a j�rm�v�n az abroncsokat.",0);
			GetVehicleDamageStatus(car, panels, doors, lights, tires);
			UpdateVehicleDamageStatus(car, panels, doors, lights, 0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicser�lted a gumikat, a gumi �ra: 150,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 150000);
			CarPart[car][cKerekek] = 0.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(GumitCserel[target]) return Msg(playerid, "M�r fel lett aj�nlva neki!");
			if(mennyiert < 150000 || mennyiert > 300000) return Msg(playerid, "Az �ra minimum 150 000 Ft, max 300 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a k�zeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem �l j�rm�ben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felaj�nlottad %s-nak, hogy kicser�led a gumikat %dFT-�rt", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Aut�szerel� %s felaj�nlotta, hogy kicser�li a gumikat %dFT-�rt. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			GumitCserel[target] = true;
			AlkatreszAr[target] += 150000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Motorolaj"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerel�s motorolaj [N�v/ID] [�ra]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 25000)) return Msg(playerid, "Nincs el�g p�nzed, az olaj �ra: 25,000Ft!");
			Cselekves(playerid,"kicser�lte a j�rm�v�ben az olajat.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicser�lted az olajat, az �ra: 25,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 25000);
			CarPart[car][cMotorolaj] = 0.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(OlajatCserel[target]) return Msg(playerid, "M�r fel lett aj�nlva neki!");
			if(mennyiert < 25000 || mennyiert > 50000) return Msg(playerid, "Az �ra minimum 25 000 Ft, max 50 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a k�zeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem �l j�rm�ben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felaj�nlottad %s-nak, hogy kicser�led az olajat %dFT-�rt", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Aut�szerel� %s felaj�nlotta, hogy kicser�li az olajat %dFT-�rt. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			OlajatCserel[target] = true;
			AlkatreszAr[target] += 25000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Akkumul�tor") || egyezik(mit, "Akkumulator") || egyezik(mit, "Akku"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerel�s akkumul�tor [N�v/ID] [�ra]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 25000)) return Msg(playerid, "ClassRPG: Nincs el�g p�nzed, az akku �ra: 25,000Ft!");
			Cselekves(playerid,"kicser�lte a j�rm�v�ben az akkumul�tort.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicser�lted az akkut, az �ra: 25,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 25000);
			CarPart[car][cAkkumulator] = 100.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(AkkutCserel[target]) return Msg(playerid, "M�r fel lett aj�nlva neki!");
			if(mennyiert < 25000 || mennyiert > 55000) return Msg(playerid, "Az �ra minimum 25 000 Ft, max 55 000 Ft lehet!");
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a k�zeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem �l j�rm�ben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felaj�nlottad %s-nak, hogy kicser�led az akkut %dFT-�rt", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Aut�szerel� %s felaj�nlotta, hogy kicser�li az akkumul�tort %dFT-�rt. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			AkkutCserel[target] = true;
			AlkatreszAr[target] += 25000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Motor"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerel�s motor [N�v/ID] [�ra]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 300000)) return Msg(playerid, "ClassRPG: Nincs el�g p�nzed, a motor �ra: 300,000Ft!");
			Cselekves(playerid,"kicser�lte a j�rm�v�ben a motort.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicser�lted a motort, az �ra: 300,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 300000);
			CarPart[car][cMotor] = 0.0;
			SetVehicleHealth(car, 1000);
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(MotortCserel[target]) return Msg(playerid, "M�r fel lett aj�nlva neki!");
			if(mennyiert < 300000 || mennyiert > 600000) return Msg(playerid, "Az �ra minimum 300 000 Ft, max 600 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a k�zeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem �l j�rm�ben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felaj�nlottad %s-nak, hogy kicser�led a motort %dFT-�rt", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Aut�szerel� %s felaj�nlotta, hogy kicser�li a motort %dFT-�rt. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			MotortCserel[target] = true;
			AlkatreszAr[target] += 300000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Elektronika"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerel�s elektronika [N�v/ID] [�ra]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 70000)) return Msg(playerid, "ClassRPG: Nincs el�g p�nzed, az elektronika �ra: 70,000Ft!");
			Cselekves(playerid,"kicser�lte a j�rm�v�ben az elektronik�t.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicser�lted az elektronik�t, az �ra: 70,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 70000);
			CarPart[car][cElektronika] = 0.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(ElektronikatCserel[target]) return Msg(playerid, "M�r fel lett aj�nlva neki!");
			if(mennyiert < 70000 || mennyiert > 140000) return Msg(playerid, "Az �ra minimum 70 000 Ft, max 140 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a k�zeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem �l j�rm�ben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felaj�nlottad %s-nak, hogy kicser�led az elektronik�t %dFT-�rt", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Aut�szerel� %s felaj�nlotta, hogy kicser�li az elektronik�t %dFT-�rt. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			ElektronikatCserel[target] = true;
			AlkatreszAr[target] += 70000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "F�k") || egyezik(mit, "Fek"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerel�s f�k [N�v/ID] [�ra]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 40000)) return Msg(playerid, "ClassRPG: Nincs el�g p�nzed, a f�kbet�t �ra: 40,000Ft!");
			Cselekves(playerid,"kicser�lte a j�rm�v�ben a f�kbet�tet.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicser�lted a f�ket, az �ra: 40,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 40000);
			CarPart[car][cFek] = 0.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(FeketCserel[target]) return Msg(playerid, "M�r fel lett aj�nlva neki!");
			if(mennyiert < 40000 || mennyiert > 100000) return Msg(playerid, "Az �ra minimum 40 000 Ft, max 100 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a k�zeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem �l j�rm�ben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felaj�nlottad %s-nak, hogy kicser�led a f�ket %dFT-�rt", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Aut�szerel� %s felaj�nlotta, hogy kicser�li a f�kbet�tet %dFT-�rt. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			FeketCserel[target] = true;
			AlkatreszAr[target] += 40000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Karossz�ria") || egyezik(mit, "Karosszeria"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerel�s karosszeria [N�v/ID] [�ra]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 10000)) return Msg(playerid, "ClassRPG: Nincs el�g p�nzed, a karossz�riacsere �ra: 10,000Ft!");
			Cselekves(playerid,"kicser�lte a j�rm�v�n a karossz�ri�t.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicser�lted a karossz�ri�t, az �ra: 10,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 10000);
			new panels, doors, lights, tires;	
			GetVehicleDamageStatus(car, panels, doors, lights, tires);
			UpdateVehicleDamageStatus(car, 0, 00000000, 0, tires);
			CarPart[car][cKarosszeria] += 1;
			if(IsAPancelozottKocsi(car))
				SetVehicleHealth(car, 100000);
			else
				SetVehicleHealth(car, 1000);
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
			if(KarosszeriatCserel[target]) return Msg(playerid, "M�r fel lett aj�nlva neki!");
			if(mennyiert < 10000 || mennyiert > 100000) return Msg(playerid, "Az �ra minimum 10 000 Ft, max 100 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a k�zeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem �l j�rm�ben!");
			new veh = GetVehicleModel(car)-400;
			new ertek = JarmuAra[veh][jAra]; new serules;
			if(ertek < 20000000) serules = Rand(10000, 40000);
			elseif(ertek >= 20000000 || ertek < 40000000) serules = Rand(20000, 60000);
			elseif(ertek >= 40000000 || ertek < 60000000) serules = Rand(30000, 80000);
			elseif(ertek >= 60000000 || ertek < 80000000) serules = Rand(40000, 100000);
			elseif(ertek >= 80000000 || ertek < 100000000) serules = Rand(50000, 150000);
			else serules = Rand(100000, 300000);
			JavitasAra[target] += mennyiert;
			KarosszeriatCserel[target] = true;
			AlkatreszAr[target] += 10000+serules;
			NekiSzerel[target] = playerid;
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felaj�nlottad %s-nak, hogy kicser�led a karossz�ri�t %dFT-�rt. Alkatr�szek �ra: %s Ft", ICPlayerName(target), mennyiert, FormatInt(AlkatreszAr[target]));
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Aut�szerel� %s felaj�nlotta, hogy kicser�li a karossz�ri�t %dFT-�rt. Az alkatr�szek �ra: %s Ft Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert, FormatInt(AlkatreszAr[target]));
		}
	}
	if(egyezik(mit, "�llapot") || egyezik(mit, "allapot"))
	{
		if(sscanf(sub, "u", target)) return Msg(playerid, "/szerel�s �llapot [N�v/ID]");
		if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem l�tez� j�t�kos");
		if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a k�zeledben!");
		new Float:serules = (1000.0 - KocsiElete[car]) / 6.5;
		if(serules < 0.0)
			serules = 0.0;
		else if(serules > 100.0)
			serules = 100.0;
		SendFormatMessage(target, COLOR_GREEN, "=====[ CLS-%d j�rm� �llapoti felm�r�se ]=====", car);
		SendFormatMessage(target, COLOR_WHITE, "Kerekek: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cKerekek]);
		SendFormatMessage(target, COLOR_WHITE, "Motorolaj: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cMotorolaj]);
		SendFormatMessage(target, COLOR_WHITE, "Akkumul�tor t�lt�tts�ge: %.2f sz�zal�k", CarPart[car][cAkkumulator]);
		SendFormatMessage(target, COLOR_WHITE, "Motor: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cMotor]/5);
		SendFormatMessage(target, COLOR_WHITE, "Elektronika: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cElektronika]);
		SendFormatMessage(target, COLOR_WHITE, "F�k: %.2f sz�zal�kban elhaszn�l�dott", CarPart[car][cFek]);
		SendFormatMessage(target, COLOR_WHITE, "Karossz�ria: %d alkalommal volt cser�lve", CarPart[car][cKarosszeria]);
		SendFormatMessage(target, COLOR_WHITE, "Karossz�ria: %.0f sz�zal�kban k�rosodott", serules);
		if(target == playerid)
			Cselekves(playerid, "megvizsg�lta a j�rm� �llapot�t.");
		else
			Cselekves(playerid, "felv�zolta valakinek a j�rm� �llapot�t.");
	}
	return 1;
}
CMD:motorolaj(playerid, params[])
{
	new mitakar[16];
	if(sscanf(params, "s[16]", mitakar)) return Msg(playerid, "/motorolaj [megn�z/csere]");
	if(IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Nem �rtelek, j�rm�ben m�gis hogy?");
	new jarmu = GetClosestVehicle(playerid);
	if(GetPlayerDistanceFromVehicle(playerid, jarmu) > 3.0) return Msg(playerid, "Nincs a k�zeledben j�rm�!");
	if(IsABicikli(jarmu)) return Msg(playerid, "Ebbe nincs olaj!");
	if(egyezik(mitakar, "megn�z") || egyezik(mitakar, "megnez"))
	{
		new Float:level = CarPart[jarmu][cMotorolaj];
		if(level >= 0.0 && level <= 10.0) 
		{ 
			SendClientMessage(playerid, COLOR_WHITE, "A k�zeledben l�v� j�rm� olaj elhaszn�l�dotts�ga:"); 
			SendClientMessage(playerid, COLOR_GREEN, "Kis m�rt�k�"); 
		}
		else if(level >= 10.1 && level <= 40.0) 
		{ 
			SendClientMessage(playerid, COLOR_WHITE, "A k�zeledben l�v� j�rm� olaj elhaszn�l�dotts�ga:"); 
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "K�zepes m�rt�k�"); 
		}
		else if(level >= 40.1 && level <= 70.0) 
		{ 
			SendClientMessage(playerid, COLOR_WHITE, "A k�zeledben l�v� j�rm� olaj elhaszn�l�dotts�ga:");  
			SendClientMessage(playerid, COLOR_YELLOW, "K�zepes m�rt�k�"); 
		}
		else if(level >= 70.1 && level <= 100.0) 
		{ 
			SendClientMessage(playerid, COLOR_WHITE, "A k�zeledben l�v� j�rm� olaj elhaszn�l�dotts�ga:"); 
			SendClientMessage(playerid, COLOR_RED, "Nagy m�rt�k�");
		}
	}
	if(egyezik(mitakar, "csere"))
	{
		if(PlayerInfo[playerid][pMotorolaj] == 0) return Msg(playerid, "Nincs motorolajad. Vehetsz az aut�sboltban!");
		Msg(playerid, "Elkezdted kicser�lni az olajat.");
		Cselekves(playerid, "elkezdte kicser�lni a motorolajat...", 1);
		PlayerInfo[playerid][pMotorolaj] = 0;
		Freeze(playerid, 45000);
		ApplyAnimation(playerid, "SCRATCHING", "scmid_l", 4.0, 1, 1, 1, 1, -1);
		SetTimerEx("Munkavege", 45000, false, "ddd", playerid, M_OLAJCSERE, jarmu);
	}
	return 1;
}

ALIAS(l2gt2rben):legterben;
CMD:legterben(playerid, params[])
{
	new count = 0, kozlony[128];
	if(!LMT(playerid, FRAKCIO_KATONASAG) && !Admin(playerid, 1337)) return Msg(playerid, "Nem vagy katona!");
	Msg(playerid, "=====[ L�gt�rben k�zleked� j�rm�vek ]=====", false, COLOR_GREEN);
	foreach(Jatekosok, x)
	{
		new playerstate = GetPlayerState(x), repcsi = GetPlayerVehicleID(x);
		if(playerstate == PLAYER_STATE_DRIVER && IsARepulo(repcsi))
		{
			if(RepulesEngedely[repcsi] > 0)
				format(kozlony, sizeof(kozlony), "[Leg�lisan k�zleked�] CLS-%d | Enged�ly m�g %d m�sodpercig", repcsi, UnixTime-RepulesEngedely[repcsi]);
			else if(LMT(x, FRAKCIO_KATONASAG) && IsAKatonaCar(repcsi))
				format(kozlony, sizeof(kozlony), "[Katona] CLS-%d", repcsi);
			else if(IsACop(x) && IsACopCar(repcsi) && !LMT(x, FRAKCIO_KATONASAG))
				format(kozlony, sizeof(kozlony), "[Rendv�delem] CLS-%d", repcsi);
			else if(AdminDuty[x])
				format(kozlony, sizeof(kozlony), "[AdminSzolg�lat] CLS-%d", repcsi);
			else
				format(kozlony, sizeof(kozlony), "[Illeg�lisan k�zleked�] CLS-%d | Enged�lye nincs, vagy m�r lej�rt", repcsi);
			count++;
			SendClientMessage(playerid, COLOR_WHITE, kozlony);
		}
	}
	if(count == 0) return Msg(playerid, "Nincsen l�gt�rben k�zleked� j�rm�.", false, COLOR_WHITE);
	return 1;
} 
 
ALIAS(psz):p2nzsz1ll3t4;
CMD:p2nzsz1ll3t4(playerid, params[])
{

	if(!AMT(playerid, MUNKA_PENZ)) return SendClientMessage(playerid, COLOR_GREY, "Nem vagy p�nzsz�ll�t�!");
	if(OnDuty[playerid]) return Msg(playerid, "D�ntsd el�bb el mit dolgozol! ((frakci� dutyba nem!))");
	new func[20];
	if(sscanf(params,"s[20]",func))
	{
		Msg(playerid, "/p�nzsz�ll�t� [duty/felvesz/felt�lt/berak]");
		Msg(playerid, "duty: munk�ba �ll�s");
		Msg(playerid, "felvesz: Felveszed a t�sk�t a bankba, vagy a p�nzsz�ll�t�b�l!");
		Msg(playerid, "felt�lt: Felt�lt�d az ATM-et, ha nem vagy atm-n�l add egy ATM pozt!");
		Msg(playerid, "berak: Berakod a p�nzsz�ll�t�ba a t�sk�t!");
		return 1;
	}
	if(egyezik(func, "duty"))
	{
		if(GetPlayerVirtualWorld(playerid) != 0 || GetPlayerInterior(playerid) != 0) return 1;
		if(!PlayerToPoint(3, playerid,-1716.9442,1018.0319,17.5859)) return Msg(playerid, "Nem vagy a duty helyn�l!"),SetPlayerCheckpoint(playerid, -1716.9442,1018.0319,17.5859,3);
		if(PenzSzallitoDuty[playerid])
		{
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			PenzSzallitoDuty[playerid]=false;
			Cselekves(playerid,"�t�lt�z�tt");
			Msg(playerid, "Kil�pt�l a munka szolg�latb�l!");
		}
		else
		{
			SetPlayerSkin(playerid,71);
			PenzSzallitoDuty[playerid]=true;
			Cselekves(playerid,"�t�lt�z�tt �lt�z�t");
			Msg(playerid,"Szolg�latba �lt�l, menj San Fiero Bankba �s vedd fel a p�nz csomagokat.",false,COLOR_YELLOW);
		}
		
	}
	if(egyezik(func, "info"))
	{
		new kocsi = GetClosestVehicle(playerid);
		if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 6.0) return Msg(playerid, "Nincs j�rm� a k�zeledben!");
		SendFormatMessage(playerid, COLOR_YELLOW,"[info]%d DB van a kocsiban 10-b�l! %s Ft",PenzszallitoPenz[kocsi]/MAXTASKAPENZ, FormatInt(PenzszallitoPenz[kocsi]));
	
		return 1;
	
	}
	if(egyezik(func, "felvesz"))
	{
		if(GetPlayerVirtualWorld(playerid) == 0)
		{
			if(!PenzSzallitoDuty[playerid]) return Msg(playerid, "Nem vagy szolg�latban!");
			new kocsi = GetClosestVehicle(playerid);
			if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 6.0) return Msg(playerid, "Nincs j�rm� a k�zeledben!");
			if(GetVehicleModel(kocsi) != 428) return Msg(playerid, "Ez nem p�nzsz�ll�t�!");
			if(IsMunkaKocsi(kocsi) != MUNKA_PENZ) return Msg(playerid, "Ez nem munka kocsi!");
		
			if(PenzszallitoPenz[kocsi] < MAXTASKAPENZ)
			{
				Msg(playerid, "Nincs benne t�bb t�ska! Menj San Fierro bankba!");
				SetPlayerCheckpoint(playerid,-1979.5792,442.3809,26.9659,5);
				return 1;
			}
			if(SzallitPenz[playerid] != NINCS) return Msg(playerid, "Van m�r n�lad t�ska!");
			
			SzallitPenz[playerid] = MAXTASKAPENZ;
			PenzszallitoPenz[kocsi] -= MAXTASKAPENZ;
			
			Cselekves(playerid, "kivett egy p�nz kazetta t�sk�t a p�nzsz�ll�t�b�l");
			SendFormatMessage(playerid, COLOR_YELLOW,"[info]%d DB van a kocsiban 10-b�l!",PenzszallitoPenz[kocsi]/MAXTASKAPENZ);
			SetPlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS, 1210, 5, 0.2949, 0.1309, 0.0409, 139.2000, -70.6999, 157.9999, 0.9739, 1.0000, 1.0000, 0, 0);
			Freeze(playerid, 1500); ApplyAnimation(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
		}
		else
		{
			
			if(GetPlayerVirtualWorld(playerid) != 1555) return Msg(playerid, "Szerintem nem j� helyen vagy!");
			if(GetDistanceBetweenPlayers(playerid, BankSFNPC) > 2) return Msg(playerid, "Nincs a k�zeledbe a p�nzt�ros!");
			if(!PenzSzallitoDuty[playerid]) return Msg(playerid, "Nem vagy szolg�latban!");
			if(SzallitPenz[playerid] != NINCS) return Msg(playerid, "Van m�r n�lad t�ska!");
			PenzSzallitimer[playerid] = 10;
			Freeze(playerid, 5500); 
			if(MegyPenzTimer) return Msg(playerid, "Egyszerre csak egy embert tud kiszolg�lni!");
			MegyPenzTimer=true;
		}
		
	}
	if(!PenzSzallitoDuty[playerid]) return Msg(playerid, "Nem vagy szolg�latban!");
	if(egyezik(func, "berak"))
	{
		if(!IsPlayerAttachedObjectSlotUsed(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS) || SzallitPenz[playerid] != MAXTASKAPENZ)
			return Msg(playerid, "Nincs n�lad a t�ska!");
		
		
		new kocsi = GetClosestVehicle(playerid);
		if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 6.0) return Msg(playerid, "Nincs j�rm� a k�zeledben!");
		if(GetVehicleModel(kocsi) != 428) return Msg(playerid, "Ez nem p�nzsz�ll�t�!");
		if(IsMunkaKocsi(kocsi) != MUNKA_PENZ) return Msg(playerid, "Ez nem munka kocsi!");
		
		if((PenzszallitoPenz[kocsi] +  SzallitPenz[playerid]) <= MAXTASKAPENZ*10)
		{
			PenzszallitoPenz[kocsi] += SzallitPenz[playerid];
			SzallitPenz[playerid] = NINCS;
			Cselekves(playerid, "bepakolt egy p�nzzel teli t�sk�t a p�nzsz�ll�t�ba");
			RemovePlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS);
			Freeze(playerid, 1500); ApplyAnimation(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
			SendFormatMessage(playerid, COLOR_YELLOW,"[info]%d DB van a kocsiban 10-b�l!",PenzszallitoPenz[kocsi]/MAXTASKAPENZ);
		}
		else
			Msg(playerid, "Teli van a kocsi nem f�r bele t�bb! Menj �s t�ltsd fel az ATM-eket!");
	
	}
	if(egyezik(func, "felt�lt"))
	{
	
		new atmid=AtmKozel(playerid);
		
		if(atmid == NINCS)
		{
			new penz=MAXATMPENZ-MAXTASKAPENZ;
			for(new a=0; a < MAX_ATM; a++)
			{
				if(ATM[a][aObjectID] != NINCS && ATM[a][aPosX] != 0.0)
					if(penz > ATM[a][aPenz])
						atmid=a, penz=ATM[a][aPenz];
			}
			if(ATM[atmid][aVw] > 0 || ATM[atmid][aInt] > 0)
			{
			
				new Float:legkozelebb = 5000.0, Float:tav, ajto;
	
				new Interior = ATM[atmid][aInt];
				new VW = ATM[atmid][aVw];
				for(new a = 0; a < sizeof(Ajtok); a++)
				{
					if(Ajtok[a][Van] != 1 || VW != Ajtok[a][KiVW] || Interior != Ajtok[a][KiInt]) continue;
					tav = GetDistanceBetweenPoints(ATM[atmid][aPosX],ATM[atmid][aPosY],ATM[atmid][aPosZ], Ajtok[a][KiX], Ajtok[a][KiY], Ajtok[a][KiZ]);
					if(tav < legkozelebb &&  0 == Ajtok[a][BeVW])
					{
						legkozelebb = tav;
						ajto = a;
					}
				}
				if(legkozelebb != 5000.0)
					SetPlayerCheckpoint(playerid, Ajtok[ajto][BeX], Ajtok[ajto][BeY], Ajtok[ajto][BeZ],4),Msg(playerid, "Az ATM egy h�zban van. Megjel�lve a bej�rat!");
			}
			if(atmid == NINCS) return Msg(playerid, "Minden ATM teli van!");
			
			if(ATM[atmid][aVw] == GetPlayerVirtualWorld(playerid) && ATM[atmid][aInt] == GetPlayerInterior(playerid))
				SetPlayerCheckpoint(playerid,ATM[atmid][aPosX],ATM[atmid][aPosY],ATM[atmid][aPosZ],4),Msg(playerid, "Megjel�lve a GPS-en egy ATM amit fel kell t�lteni!");
				
			if(IsTerno(playerid))
				SendFormatMessage(playerid, COLOR_YELLOW,"ATM id:%d",atmid);
			return 1;
		}
		
		
		if(IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "J�rm�b�l akarod felt�lteni az ATM-et?");
				
			
		if(! IsPlayerAttachedObjectSlotUsed(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS) || SzallitPenz[playerid] != MAXTASKAPENZ)
			return Msg(playerid, "Nincs n�lad a t�ska! Vedd ki a kocsib�l!");	
			
		if(ATM[atmid][aPenz]+SzallitPenz[playerid] > MAXATMPENZ) return Msg(playerid, "Nincs �res kazetta az ATM-be!");
		
		ATM[atmid][aPenz] += SzallitPenz[playerid];
		SzallitPenz[playerid] = NINCS;
		Cselekves(playerid, "felt�lt�tte az ATM-et p�nzzel!");
		Freeze(playerid, 1500); ApplyAnimation(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
		RemovePlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS);
		SendFormatMessage(playerid, COLOR_YELLOW, "Felt�lt�tted az ATM-et 1 kazett�val. Ne feledd 1 kazetta %s Ft-ott tartalmaz �s csak �reset cser�lhetsz.",FormatInt(MAXTASKAPENZ));
		SendFormatMessage(playerid, COLOR_YELLOW, "ATM inf�: %s Ft tartalom. Maximum %s Ft",FormatInt(ATM[atmid][aPenz]),FormatInt(MAXATMPENZ));
		PlayerInfo[playerid][pPayCheck] +=10000;
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
      

      
   if(szinid > 6 || szinid < 1)
   {
      Msg(playerid, "/msg [player] [szinid] [szoveg]");
      Msg(playerid,"Sz�nek: 1 COLOR_GREY | 2 COLOR_LIGHTRED | 3 COLOR_YELLOW | 4 COLOR_WHITE | 5 COLOR_ALLDEPT | 6 COLOR_NEWS");//[ADMINOKNAK] 5-�s �s 6-�s sz�nnel kieg�sz�tve (riporter �s s�rg�ss�gi sz�n) by Amos 
   
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
CMD:bicikli(playerid, params[])
{
	new func[20], subfunc[20];
	if(!params[0] || sscanf(params, "s[20] S()[20] ", func, subfunc))
		return Msg(playerid, "Haszn�lat: /bicikli [vesz / el�vesz / elrak]");

	if(egyezik(func, "vesz"))
	{
		if(0 < PlayerInfo[playerid][pBicikli] <= 3)
			return Msg(playerid, "M�r van biciklid");

		if(!PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53)) return Msg(playerid, "Nem vagy 24/7-ben.");

		if(!subfunc[0])
			return Msg(playerid, "Haszn�lat: /bicikli vesz [bmx / bike / mountain]");

		if(egyezik(subfunc, "bmx"))
			PlayerInfo[playerid][pBicikli] = 1;
		else if(egyezik(subfunc, "bike"))
			PlayerInfo[playerid][pBicikli] = 2;
		else if(egyezik(subfunc, "mountain"))
			PlayerInfo[playerid][pBicikli] = 3;
		else
			return Msg(playerid, "Haszn�lat: /bicikli vesz [bmx / bike / mountain]");

		BicikliFlood[playerid]++;
		if(BicikliFlood[playerid] >= 3)
			return SeeBan(playerid, 0, NINCS, "Bicikli bugkihaszn�l�s");

		if(!BankkartyaFizet(playerid, 100000))
		{
			Msg(playerid, "Egy bicikli �ra 100 000Ft");
			PlayerInfo[playerid][pBicikli] = 0;
			return 1;
		}
		BizPenz(BIZ_247, 100000);
		BizzInfo[BIZ_247][bProducts]--;
		Msg(playerid, "Sikeresen megvetted, el�v�tel: /bicikli el�vesz");
	}
	else if(egyezik(func, "elad"))
	{
		if(PlayerInfo[playerid][pBicikli] < 1 || PlayerInfo[playerid][pBicikli] > 3)
			return Msg(playerid, "Nincs biciklid");

		if(!PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53)) return Msg(playerid, "Nem vagy 24/7-ben.");

		BicikliFlood[playerid]++;

		PlayerInfo[playerid][pBicikli] = 0;
		GiveMoney(playerid, 25000);

		if(Bicikli[playerid])
			DestroyVehicle(Bicikli[playerid]);

		Msg(playerid, "Eladtad a biciklidet");

	}
	else if(egyezik(func, "el�vesz") || egyezik(func, "elovesz"))
	{
		if(Bicikli[playerid])
			return Msg(playerid, "M�r vett�l biciklit, el�bb rakd el");
			
		if(TaxiOnline() > 1) return Msg(playerid, "Van el�g szolg�latban l�v� taxis! (/service taxi)");
		
		if(IsPlayerInAnyVehicle(playerid))
			return Msg(playerid, "J�rm�ben?");

		if(GetPlayerInterior(playerid) || GetPlayerVirtualWorld(playerid) || NemMozoghat(playerid))
			return Msg(playerid, "Itt nem veheted el�");

		if( !(1 <= PlayerInfo[playerid][pBicikli] <= 3) )
			return Msg(playerid, "Nincs biciklid");

		if( MunkaFolyamatban[playerid] )
			return Msg(playerid, "Nyugi");

		Msg(playerid, "El�vetted a biciklid �s �ssze szereled.");
		Cselekves(playerid, "elkezdte �sszeszerelni a biciklij�t");
		
		new szine = random(256);
		if(PlayerInfo[playerid][pMember] && !egyezik(subfunc, "random"))
			szine = FrakcioBicikliSzin[ PlayerInfo[playerid][pMember] ];

		if(szine == NINCS)
			szine = random(255);

		Freeze(playerid);
		ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
		MunkaFolyamatban[playerid] = 1;
		SetTimerEx("Munkavege", 10000, false, "dddd", playerid, M_BICIKLI, PlayerInfo[playerid][pBicikli], szine);
	}
	else if(egyezik(func, "elrak"))
	{
		if(!Bicikli[playerid])
			return Msg(playerid, "M�g nem vett�l el� biciklit");

		if(IsPlayerInAnyVehicle(playerid))
			return Msg(playerid, "J�rm�ben?");

		if(GetPlayerDistanceFromVehicle(playerid, Bicikli[playerid]) > 5.0)
			return Msg(playerid, "Nem vagy a biciklid mellett");

		KocsiObjectTorol(PlayerInfo[playerid][pBicikli]);
		new Float:xPos[3];
		GetPlayerPos(playerid, ArrExt(xPos));
		switch(PlayerInfo[playerid][pBicikli])
		{
			case 1, 2, 3: DestroyVehicle(Bicikli[playerid]);
			default: return Msg(playerid, "Nincs biciklid");
		}

		Bicikli[playerid] = 0;

		Msg(playerid, "Elraktad a biciklid");
		Cselekves(playerid, "�sszeszerelte �s elrakta a biciklij�t");
	}
	else
		Msg(playerid, "Haszn�lat: /bicikli [vesz / el�vesz / elrak]");

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

CMD:buyweapon(playerid, params[])
{
	Msg(playerid, "/f vesz");
}

CMD:sellgun(playerid, params[])
{
	Msg(playerid, "/f k�sz�t");
}

ALIAS(h1zl6szert5r5l):hazloszertorol;
CMD:hazloszertorol(playerid, params[])
{
	/*new subcmd[32];
	if(Admin(playerid, 1337) && !sscanf(params, "s", haz))
	{
		if(haz < 0 || haz >= MAXHAZ || !HouseInfo[haz][Van])
			return Msg(playerid, "Ez a h�z nem l�tezik");
	}*/
	
	new haz = HazabanVan(playerid);
	if(haz == NINCS)
		return Msg(playerid, "Nem vagy a h�zadban!");
	
	for(new s = 0; s < 10; s++)
	{
		HouseInfo[haz][hLoszerTipus][s] = 0;
		HouseInfo[haz][hLoszerMennyiseg][s] = 0;
	}
	Msg(playerid, "Sikeres t�rl�s! Minden slotr�l t�r�lve az �sszes l�szer.");
	format(_tmpString, 128, "[/h�zl�szert�r�l] %s t�r�lte az �sszes l�szer�t a %d. h�zb�l", PlayerName(playerid), haz), Log("Fegyver", _tmpString);
	HazUpdate(haz, HAZ_Loszer);
	return 1;
}

ALIAS(h1zfegyvert5r5l):hazfegyvertorol;
CMD:hazfegyvertorol(playerid, params[])
{
	new haz = HazabanVan(playerid);
	if(haz == NINCS)
		return Msg(playerid, "Nem vagy a h�zadban!");
	
	for(new s = 0; s < 10; s++)
	{
		HouseInfo[haz][hFegyver][s] = 0;
	}
	Msg(playerid, "Sikeres t�rl�s! Minden slotr�l t�r�lve az �sszes fegyver.");
	format(_tmpString, 128, "[/h�zfegyvert�r�l] %s t�r�lte az �sszes fegyver�t a %d. h�zb�l", PlayerName(playerid), haz), Log("Fegyver", _tmpString);
	HazUpdate(haz, HAZ_Loszer);
	return 1;
}

ALIAS(5duty):onkentesduty;
ALIAS(oduty):onkentesduty;
ALIAS(5nk2ntesszolgalat):onkentesduty;
ALIAS(5nk2ntesduty):onkentesduty;
CMD:onkentesduty(playerid, params[])
{
	new ertesites[128];
	if(!IsOnkentes(playerid)) return Msg(playerid, "Nem vagy �nk�ntes!");
	if(!IsAt(playerid, IsAt_Korhaz)) return Msg(playerid, "Nem vagy a k�rh�zban!");
	if(OnDuty[playerid]) return Msg(playerid, "El�bb l�pj ki m�sik munk�d duty-j�b�l!");
	if(Onkentesszolgalatban[playerid])
	{
		if(IsValidDynamic3DTextLabel(Onkentestext[playerid])) DestroyDynamic3DTextLabel(Onkentestext[playerid]), Onkentestext[playerid] = INVALID_3D_TEXT_ID;
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Mostm�r nem vagy szolg�latban, �gy nem fogsz kapni h�v�sokat!");
		Onkentesszolgalatban[playerid] = false;
		Medics--;
		Munkaruha(playerid, 0);
		Cselekves(playerid, "leadta az �nk�ntes ment�s szolg�latot.", 1);
		format(ertesites, sizeof(ertesites), "* �rtes�t�s: %s kil�pett az �nk�ntes ment�s szolg�latb�l.", ICPlayerName(playerid));
		SendMessage(SEND_MESSAGE_RADIO, ertesites, COLOR_LIGHTBLUE, FRAKCIO_MENTO);
	}
	else
	{
		Onkentestext[playerid] = CreateDynamic3DTextLabel("�nk�ntes", 0x63FF60FF, 0.0, 0.0, 0.05, 15.0, playerid, INVALID_VEHICLE_ID, 1);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Mostm�r szolg�latban vagy, �gy fogadnod kell a h�v�sokat!");
		SendClientMessageToAll(COLOR_LIGHTBLUE, "* �nk�ntes ment�s�k szolg�latban! H�vd �ket ha baj van!");
		if(PlayerInfo[playerid][pSex] == 2) SetPlayerSkin(playerid, 91);
		else SetPlayerSkin(playerid, 276);
		Onkentesszolgalatban[playerid] = true;
		Medics++;
		if((PlayerInfo[playerid][pKotszer] + 10) < MAXKOTSZER) PlayerInfo[playerid][pKotszer] += 10;
		Cselekves(playerid, "�nk�ntes ment�s szolg�latba �llt.", 1);
		format(ertesites, sizeof(ertesites), "* �rtes�t�s: %s �nk�ntes ment�s szolg�latba �llt.", ICPlayerName(playerid));
		SendMessage(SEND_MESSAGE_RADIO, ertesites, COLOR_LIGHTBLUE, FRAKCIO_MENTO);
	}
	return 1;
}

ALIAS(or):onkentesradio;
ALIAS(5r):onkentesradio;
ALIAS(5nk2ntesr1di4):onkentesradio;
CMD:onkentesradio(playerid, params[])
{
	if(!IsOnkentes(playerid) && !LMT(playerid, FRAKCIO_MENTO)) return Msg(playerid, "Nem vagy �nk�ntes!");
	if(Bortonben(playerid)) return Msg(playerid, "B�rt�nben nem haszn�lhat�!");
	if(Csendvan) return Msg(playerid, "Most nem besz�lhetsz!");
	if(gFam[playerid] || !PlayerInfo[playerid][pRadio])	return Msg(playerid, "Kivan kapcsolva a r�di�d vagy nincs");
	if(PlayerCuffed[playerid] || Leutve[playerid] || PlayerTied[playerid]) return Msg(playerid, "Ilyenkor hogy akarsz a r�di�ba besz�lni?");
	if(PlayerInfo[playerid][pMuted] == 1) return SendClientMessage(playerid, TEAM_CYAN_COLOR, "N�m�tva vagy, hogy akarsz besz�lni? :D");

	new result[128];
   	if(sscanf(params, "s[128]", result))
		return SendClientMessage(playerid, COLOR_WHITE, "Haszn�lat: /�nk�ntesr�di�(/�r) [IC �zeneted]");
	
	if(IsOnkentes(playerid))
		Format(_tmpString, "** �nk�ntes %s: %s **", PlayerName(playerid), result);
	else
		Format(_tmpString, "** %s %s: %s **", RangNev(playerid), PlayerName(playerid), result);
	SendMessage(SEND_MESSAGE_ONKENTES, _tmpString, TEAM_BLUE_COLOR);
	Format(_tmpString, "[R�di�] %s mondja: %s", ICPlayerName(playerid), result);
	ProxDetector(20.0, playerid, _tmpString, COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	return 1;
}

ALIAS(orb):onkentesradiob;
ALIAS(5rb):onkentesradiob;
ALIAS(5nk2ntesr1di4b):onkentesradiob;
CMD:onkentesradiob(playerid, params[])
{
	if(!IsOnkentes(playerid) && !LMT(playerid, FRAKCIO_MENTO)) return Msg(playerid, "Nem vagy �nk�ntes!");
	if(Bortonben(playerid)) return Msg(playerid, "B�rt�nben nem haszn�lhat�!");
	if(Csendvan) return Msg(playerid, "Most nem besz�lhetsz!");
	if(gFam[playerid] || !PlayerInfo[playerid][pRadio])	return Msg(playerid, "Kivan kapcsolva a r�di�d vagy nincs");
	if(PlayerCuffed[playerid] || Leutve[playerid] || PlayerTied[playerid]) return Msg(playerid, "Ilyenkor hogy akarsz a r�di�ba besz�lni?");
	if(PlayerInfo[playerid][pMuted] == 1) return SendClientMessage(playerid, TEAM_CYAN_COLOR, "N�m�tva vagy, hogy akarsz besz�lni? :D");

	new result[128];
   	if(sscanf(params, "s[128]", result))
		return SendClientMessage(playerid, COLOR_WHITE, "Haszn�lat: /�nk�ntesr�di�b(/�rb) [OOC �zeneted]");
		
	if(SzovegEllenorzes(playerid, result, "/�rb", ELLENORZES_MINDKETTO)) return 1;
	
	if(IsOnkentes(playerid))
		Format(_tmpString, "** �nk�ntes %s OOC: (( %s )) **", PlayerName(playerid), result);
	else
		Format(_tmpString, "** %s %s OOC: (( %s )) **", RangNev(playerid), PlayerName(playerid), result);
	SendMessage(SEND_MESSAGE_ONKENTES, _tmpString, TEAM_BLUE_COLOR);
	Format(_tmpString, "[R�di�] %s mondja OOC: (( %s ))", PlayerName(playerid), result);
	ProxDetector(20.0, playerid, _tmpString,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	return 1;
}

ALIAS(5nk2ntesek):onkentesek;
CMD:onkentesek(playerid, params[])
{
	new count = 0;
	SendClientMessage(playerid, COLOR_GREEN, "=====[�nk�ntes ment�s�k]=====");
	foreach(Jatekosok, x)
	{
		if(IsOnkentes(x))
		{
			if(Onkentesszolgalatban[x])
				SendFormatMessage(playerid, COLOR_GREEN, "[%i]%s (Szolg�latban) | Tel.: %s | Ment�sei: %ddb", x, ICPlayerName(x), FormatNumber( PlayerInfo[x][pPnumber], 0, '-'), PlayerInfo[x][pMechSkill]);
			else
				SendFormatMessage(playerid, COLOR_RED, "[%i]%s (Nincs szolg�latban) | Ment�sei: %ddb", x, ICPlayerName(x), PlayerInfo[x][pMechSkill]);// �nk�ntesek ment�seit a /�nk�ntesek-ben mutatja.
			count++;
		}
	}
	if(count == 0) SendClientMessage(playerid, COLOR_YELLOW, "Nincs �nk�ntes ment�s.");
	return 1;
}

ALIAS(5nk2ntes):onkentes;
CMD:onkentes(playerid, params[])
{
	if(PlayerInfo[playerid][pLeader] != 4 && !Admin(playerid, 4))
		return Msg(playerid, "Nem haszn�lhatod ezt a parancsot!");
	
	new target, ido;
	if(sscanf(params, "rd", target, ido))
		return Msg(playerid, "Haszn�lata: /�nk�ntes [j�t�kosn�v / ID] [Id�(�ra)]");
	
	if(target == INVALID_PLAYER_ID)
		return Msg(playerid, "Nincs ilyen j�t�kos");
		
	if(LMT(target, FRAKCIO_MENTO))
		return Msg(playerid, "OMSZ tagot nem!");
		
	if(!LegalisSzervezetTagja(target) && !Civil(target))
		return Msg(playerid, "Illeg�lis frakci�tagot nem nevezhetsz ki!");
	
	if(IsOnkentes(target))
	{
		PlayerInfo[target][pOnkentes] = 0;
		SendFormatMessage(playerid, COLOR_LIGHTRED, "Elvetted %s �nk�ntes ment�s jog�t!", PlayerName(target));
		SendFormatMessage(target, COLOR_LIGHTRED, "%s elvette az �nk�ntes ment�s jogodat!", PlayerName(playerid));
		ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s elvette %s �nk�ntes jog�t >>", PlayerName(playerid), PlayerName(target));
	}
	else
	{	
		if(ido < 1 || ido > 240) return Msg(playerid, "Minimum 1 �s maximum 240 �ra lehet!"); //OMSZ leader k�r�s�re az id� dupl�zva by Amos
		PlayerInfo[target][pOnkentes] = UnixTime + ido*3600;
		SendFormatMessage(playerid, COLOR_YELLOW, "Kinevezted %s-t �nk�ntes ment�snek %d �r�ig!", PlayerName(target), ido);
		SendFormatMessage(target, COLOR_YELLOW, "%s kinevezett �nk�ntes ment�snek %d �r�ig! A munk�hoz sz�ks�ges parancsokat a /help be�r�s�val tal�lhatsz!", PlayerName(playerid), ido);
		ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s kinevezte %s-t �nk�ntes ment�snek %d �r�ig >>", PlayerName(playerid), PlayerName(target), ido);
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
ALIAS(k5r5z2sek):wanted; //wanted m�r m�k�dik /k�r�z�sek-re is by Amos
CMD:wanted(playerid, params[])
{
//   if(!IsACop(playerid) return 1;
   SendClientMessage(playerid, COLOR_GREEN, "==[ K�r�z�tt szem�lyek �s j�rm�vek ]==");
   
   new cop = IsACop(playerid);
   foreach(Jatekosok, i)
   {
      if(playerid != i && !egyezik(PlayerCrime[i][pVad], "-"))
      {
         if(cop || !PlayerInfo[i][pMember] || PlayerInfo[i][pMember] != PlayerInfo[playerid][pMember])
            SendFormatMessage(playerid,COLOR_NAR,"N�v: %s - V�d: %s", ICPlayerName(i), PlayerCrime[i][pVad]);
      }
   }
   For(x, 1, MAX_VEHICLES)
   {
      if(!egyezik(VehicleCrime[x][vVad], "-"))
      {
         if(!SajatKocsi(playerid, x))
            SendFormatMessage(playerid, COLOR_ORANGE, "Rendsz�m: CLS-%d - V�d: %s", x, VehicleCrime[x][vVad]);
      }
   }
      
   return 1;
}

ALIAS(l6szereim):loszereim;
CMD:loszereim(playerid, params[])
{
	if(NincsHaza(playerid))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs h�zad!");
		
	new house = HazabanVan(playerid);
	if(house == NINCS)
		return Msg(playerid, "Nem vagy a h�zadban!");

	new slots = 5;
	if(PlayerInfo[playerid][pPremiumCsomag] >= 400)
	{
		switch(PlayerInfo[playerid][pPremiumCsomag])
		{
			case 400: slots += 1;
			case 800: slots += 2;
			case 1600: slots += 5;
		}
	}

	SendClientMessage(playerid, COLOR_LIGHTBLUE, "===========[L�szereim]===========");
	for(new x = 0; x < slots; x++)
	{
		if(!HouseInfo[house][hLoszerTipus][x] || !HouseInfo[house][hLoszerMennyiseg][x])
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Rekesz #%d: �res", x+1);
		else
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Rekesz #%d: L�szer: %s (%ddb)", x+1, GetGunName(HouseInfo[house][hLoszerTipus][x]), HouseInfo[house][hLoszerMennyiseg][x]);
	}
	
	if(slots < 10)
		SendFormatMessage(playerid, COLOR_YELLOW, "Rekesz #%d-10: Pr�mium rekesz", slots+1);
		
	return 1;
}

CMD:fegyvereim(playerid, params[])
{
	if(NincsHaza(playerid))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs h�zad!");
		
	new house = HazabanVan(playerid);
	if(house == NINCS)
		return Msg(playerid, "Nem vagy a h�zadban!");

	new slots = 5;
	if(PlayerInfo[playerid][pPremiumCsomag] >= 400)
	{
		switch(PlayerInfo[playerid][pPremiumCsomag])
		{
			case 400: slots += 1;
			case 800: slots += 2;
			case 1600: slots += 5;
		}
	}

	SendClientMessage(playerid, COLOR_LIGHTBLUE, "===========[Fegyvereim]===========");
	for(new x = 0; x < slots; x++)
	{
		if(!HouseInfo[house][hFegyver][x])
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Rekesz #%d: �res", x+1);
		else
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Rekesz #%d: Fegyver: %s", x+1, GetGunName(HouseInfo[house][hFegyver][x]));
	}
	
	if(slots < 10)
		SendFormatMessage(playerid, COLOR_YELLOW, "Rekesz #%d-10: Pr�mium rekesz", slots+1);
		
	return 1;
}

ALIAS(fegyverrakt1r):fegyverraktar;
CMD:fegyverraktar(playerid, params[])
{
	if(FloodCheck(playerid)) return 1;
	
	if(LegalisSzervezetTagja(playerid) || PlayerInfo[playerid][pMember] == 0)
		return Msg(playerid, "Nem vagy illeg�lis szervezet tagja!");
		
	new frakcio = PlayerInfo[playerid][pMember];
	if(!PlayerToPoint(3, playerid, FrakcioInfo[frakcio][fPosX], FrakcioInfo[frakcio][fPosY], FrakcioInfo[frakcio][fPosZ]))
		return Msg(playerid, "Nem vagy a sz�f k�zel�ben.");
	
	new param[4][20];
	if(sscanf(params, "A<s[20]>()[4]", param) || !param[0][0])
		return
			Msg(playerid, "Haszn�lata: /fegyverrakt�r [funkci�]", false),
			Msg(playerid, "/fegyverrakt�r berak fegyver [fegyvern�v / ID]", false),
			Msg(playerid, "/fegyverrakt�r berak l�szer [fegyvern�v / ID] [l�szer]", false),
			Msg(playerid, "/fegyverrakt�r kivesz fegyver [fegyvern�v / ID]", false),
			Msg(playerid, "/fegyverrakt�r kivesz l�szer [fegyvern�v / ID] [l�szer]", false),
			Msg(playerid, "/fegyverrakt�r t�r�l fegyver/l�szer [slot (1-50)]", false),
			Msg(playerid, "/fegyverrakt�r megn�z fegyver/l�szer [slot (1-5)]", false)
		;
		
	if(egyezik(param[0], "berak"))
	{
		if(!param[2][0])
			return Msg(playerid, "/fegyverrakt�r berak [fegyver/l�szer] [fegyvern�v / ID] [l�szer]");
		
		new weapon;
		if(isNumeric(param[2]))
			weapon = strval(param[2]);
		else
			weapon = GetGunID(param[2]);
			
		if(weapon < 1 || weapon > MAX_WEAPONS)
			return Msg(playerid, "Ilyen fegyver nem l�tezik");
		
		if(weapon == WEAPON_CHAINSAW || weapon == WEAPON_FIREEXTINGUISHER)
			return Msg(playerid, "L�ncf�r�sz �s porolt� nem rakhat� el");
		
		if(egyezik(param[1], "fegyver")) // fegyver
		{
			if(WeaponHaveWeapon(playerid, weapon) == NINCS)
				return Msg(playerid, "Nincs ilyen fegyvered");
				
			new slot = NINCS;
			for(new s = 0; s < MAX_FEGYVERRAKTAR_SLOT; s++)
			{
				if(!FrakcioInfo[frakcio][fFegyver][s])
				{
					slot = s;
					break;
				}
			}
			
			if(slot == NINCS)
				return Msg(playerid, "Nincs szabad hely a rakt�rban");
			
			if(WeaponTakeWeapon(playerid, weapon))
			{
				FrakcioInfo[frakcio][fFegyver][slot] = weapon;
				SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Berakt�l egy %s fegyvert a rakt�rba", GunName(weapon));
				format(_tmpString, 128, "berakott egy fegyvert (%s) a rakt�rba", GunName(weapon)), Cselekves(playerid, _tmpString);
				format(_tmpString, 128, "[/fegyverrakt�r berak fegyver %d] %s berakott egy %s fegyvert a rakt�rba", frakcio,PlayerName(playerid), GunName(weapon)), Log("Fegyver", _tmpString);
				INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
			}
			else
				Msg(playerid, "Hiba (#1)");
		}
		else if(egyezik(param[1], "l�szer") || egyezik(param[1], "l�szer")) // l�szer
		{
			if(!param[3][0] || !isNumeric(param[3]))
				return Msg(playerid, "/fegyverrakt�r berak [fegyver/l�szer] [fegyvern�v / ID] [l�szer]");
			
			new ammo = strval(param[3]);
			if(ammo < 1)
				return Msg(playerid, "Hib�s l�szersz�m");
			
			if(WeaponType(weapon) == WEAPON_TYPE_HAND)
				return Msg(playerid, "Ez a fegyver nem l�szer alap�");
				
			if(WeaponAmmo(playerid, weapon) < 1)
				return Msg(playerid, "Ehhez a fegyverhez nincs l�szered");
			
			new berakva, berakni = max(0, min(ammo, WeaponAmmo(playerid, weapon))), t;
			for(new s = 0; s < MAX_FEGYVERRAKTAR_SLOT; s++)
			{
				if((FrakcioInfo[frakcio][fLoszerTipus][s] == weapon || !FrakcioInfo[frakcio][fLoszerTipus][s]) && FrakcioInfo[frakcio][fLoszerMennyiseg][s] < WeaponMaxAmmo(weapon))
				{
					t = max(0, min(berakni, WeaponMaxAmmo(weapon) - FrakcioInfo[frakcio][fLoszerMennyiseg][s]));
					
					berakva += t;
					berakni -= t;
					FrakcioInfo[frakcio][fLoszerMennyiseg][s] += t;
					WeaponGiveAmmo(playerid, weapon, -t);
					
					FrakcioInfo[frakcio][fLoszerTipus][s] = weapon;
					
					if(!berakni)
						break;
				}
			}
			
			if(!berakva)
				return Msg(playerid, "Nem tudt�l berakni egy darab l�szert sem, mivel nincs szabad hely");
			
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Berakt�l %ddb %s l�szert a rakt�rba", berakva, GunName(weapon));
			format(_tmpString, 128, "berakott n�mi %s l�szert (%ddb) a rakt�rba", GunName(weapon), berakva), Cselekves(playerid, _tmpString);
			format(_tmpString, 128, "[/fegyverrakt�r berak l�szer %d] %s berakott %ddb %s l�szert a rakt�rba", frakcio,PlayerName(playerid), berakva, GunName(weapon)), Log("Fegyver", _tmpString);
			INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
		}
	}
	else if(egyezik(param[0], "kivesz"))
	{
		if(PlayerInfo[playerid][pRank] < FrakcioInfo[frakcio][fRaktarRang])
			return Msg(playerid, "Nincs el�g magas rangod hozz�!");
			
		if(!param[2][0])
			return Msg(playerid, "/fegyverrakt�r kivesz [fegyver/l�szer] [fegyvern�v / ID] [l�szer]");
		
		if(Szint(playerid) < WEAPON_MIN_LEVEL)
			return Msg(playerid, "T�l kicsi a szinted a fegyverhaszn�lathoz");
		
		new weapon;
		if(isNumeric(param[2]))
			weapon = strval(param[2]);
		else
			weapon = GetGunID(param[2]);
			
		if(weapon < 1 || weapon > MAX_WEAPONS)
			return Msg(playerid, "Ilyen fegyver nem l�tezik");

		if(egyezik(param[1], "fegyver")) // fegyver
		{
			if(!WeaponCanHave(playerid, weapon))
				return Msg(playerid, "Ilyen fegyvert nem viselhetsz");
			
			if(WeaponCanHoldWeapon(playerid, weapon, 0) < 0)
				return Msg(playerid, "Ilyen fegyvert nem vehetsz ki");
				
			new slot = NINCS;
			for(new s = 0; s < MAX_FEGYVERRAKTAR_SLOT; s++)
			{
				if(FrakcioInfo[frakcio][fFegyver][s] == weapon)
				{
					slot = s;
					break;
				}
			}
			
			if(slot == NINCS)
				return Msg(playerid, "Nincs ilyen fegyver a rakt�rban");
			
			if(WeaponGiveWeapon(playerid, weapon, _, 0) >= 0)
			{
				FrakcioInfo[frakcio][fFegyver][slot] = 0;
				SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kivett�l egy fegyvert (%s) a rakt�rb�l", GunName(weapon));
				format(_tmpString, 128, "kivett egy fegyvert (%s) a rakt�rb�l", GunName(weapon)), Cselekves(playerid, _tmpString);
				format(_tmpString, 128, "[/fegyverrakt�r berak fegyver %d] %s kivett egy %s fegyvert a rakt�rb�l", frakcio,PlayerName(playerid), GunName(weapon)), Log("Fegyver", _tmpString);
				INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
			}
			else
				Msg(playerid, "Hiba (#1)");
		}
		else if(egyezik(param[1], "l�szer") || egyezik(param[1], "loszer")) // l�szer
		{
			if(!param[3][0] || !isNumeric(param[3]))
				return Msg(playerid, "/fegyverrakt�r kivesz [fegyver/l�szer] [fegyvern�v / ID] [l�szer]");
			
			new ammo = strval(param[3]);
			if(ammo < 1)
				return Msg(playerid, "Hib�s l�szersz�m");
			
			if(WeaponType(weapon) == WEAPON_TYPE_HAND)
				return Msg(playerid, "Ez a fegyver nem l�szer alap�");
			
			new kiveve, kivenni = max(0, min(ammo, WeaponMaxAmmo(weapon) - WeaponAmmo(playerid, weapon))), t;
			
			if(!kivenni)
				return Msg(playerid, "Nincs n�lad ennyi hely");
			
			for(new s = 0; s < MAX_FEGYVERRAKTAR_SLOT; s++)
			{
				if(FrakcioInfo[frakcio][fLoszerTipus][s] == weapon && FrakcioInfo[frakcio][fLoszerMennyiseg][s] > 0)
				{
					t = max(0, min(kivenni, FrakcioInfo[frakcio][fLoszerMennyiseg][s]));
					
					kiveve += t;
					kivenni -= t;
					FrakcioInfo[frakcio][fLoszerMennyiseg][s] -= t;
					WeaponGiveAmmo(playerid, weapon, t);
					
					if(FrakcioInfo[frakcio][fLoszerMennyiseg][s] < 1)
						FrakcioInfo[frakcio][fLoszerTipus][s] = 0;
					
					if(!kivenni)
						break;
				}
			}
			
			if(!kiveve)
				return Msg(playerid, "Nem tudt�l kivenni egy darab l�szert sem, mert nincs ilyen fajta l�szer a rakt�rban");
			
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Kivett�l %ddb %s l�szert a rakt�rb�l", kiveve, GunName(weapon));
			format(_tmpString, 128, "kivett n�mi %s l�szert (%ddb) a rakt�rb�l", GunName(weapon), kiveve), Cselekves(playerid, _tmpString);
			format(_tmpString, 128, "[/fegyverrakt�r kivesz l�szer %d] %s kivett %ddb %s l�szert a rakt�rb�l", frakcio,PlayerName(playerid), kiveve, GunName(weapon)), Log("Fegyver", _tmpString);
			INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
		}
	}
	else if(egyezik(param[0], "t�r�l") || egyezik(param[0], "torol"))
	{
		if(PlayerInfo[playerid][pRank] < FrakcioInfo[frakcio][fRaktarRang])
			return Msg(playerid, "Nincs el�g magas rangod hozz�!");
		
		if(!param[2][0])
			return Msg(playerid, "/fegyverrakt�r t�r�l fegyver/l�szer [slot (1-50)]", false);
			
		new slot = strval(param[2]) - 1;
		if(slot < 0 || slot >= MAX_FEGYVERRAKTAR_SLOT)
			return SendFormatMessage(playerid, COLOR_LIGHTRED, "Slot: 1-%d", MAX_FEGYVERRAKTAR_SLOT);
		
		if(egyezik(param[1], "fegyver"))
		{
			if(!FrakcioInfo[frakcio][fFegyver][slot])
				return Msg(playerid, "Ezen a sloton nincs fegyver");
			
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Kidobott egy %s fegyvert a rakt�rb�l", GunName(FrakcioInfo[frakcio][fFegyver][slot]));
			format(_tmpString, 128, "kidobott egy fegyvert (%ddb) a rakt�rb�l", GunName(FrakcioInfo[frakcio][fFegyver][slot])), Cselekves(playerid, _tmpString);
			format(_tmpString, 128, "[/fegyverrakt�r t�r�l fegyver] %s t�r�lt egy %s fegyvert a rakt�rb�l", PlayerName(playerid), GunName(FrakcioInfo[frakcio][fFegyver][slot])), Log("Fegyver", _tmpString);
			INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
			
			FrakcioInfo[frakcio][fFegyver][slot] = 0;
		}
		else if(egyezik(param[1], "l�szer") || egyezik(param[1], "loszer"))
		{
			if(!FrakcioInfo[frakcio][fLoszerTipus][slot] && !FrakcioInfo[frakcio][fLoszerMennyiseg][slot])
				return Msg(playerid, "Ezen a sloton nincs l�szer");
			
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Kidobt�l %ddb %s l�szert a rakt�rb�l", FrakcioInfo[frakcio][fLoszerMennyiseg][slot], GunName(FrakcioInfo[frakcio][fLoszerTipus][slot]));
			format(_tmpString, 128, "kidobott %ddb %s l�szert a rakt�rb�l", FrakcioInfo[frakcio][fLoszerMennyiseg][slot], GunName(FrakcioInfo[frakcio][fLoszerTipus][slot])), Cselekves(playerid, _tmpString);
			format(_tmpString, 128, "[/fegyverrakt�r t�r�l fegyver] %s t�r�lt %ddb %s l�szert a rakt�rb�l", PlayerName(playerid), FrakcioInfo[frakcio][fLoszerMennyiseg][slot], GunName(FrakcioInfo[frakcio][fLoszerTipus][slot])), Log("Fegyver", _tmpString);
			INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
			
			FrakcioInfo[frakcio][fLoszerTipus][slot] = 0;
			FrakcioInfo[frakcio][fLoszerMennyiseg][slot] = 0;
		}
	}
	else if(egyezik(param[0], "megn�z") || egyezik(param[0], "megnez"))
	{
		if(!param[1][0])
			return Msg(playerid, "/fegyverrakt�r megn�z fegyver/l�szer", false);
		
		if(egyezik(param[1], "fegyver"))
		{
			new wepstat[MAX_WEAPONS], free;
			for(new s = 0; s < MAX_FEGYVERRAKTAR_SLOT; s++)
			{
				if(1 <= FrakcioInfo[frakcio][fFegyver][s] <= MAX_WEAPONS)
					wepstat[ FrakcioInfo[frakcio][fFegyver][s] - 1 ]++;
				else
					free++;
			}
			
			SendClientMessage(playerid, COLOR_WHITE, "==[ Fegyverrakt�r: fegyverek ]==");
			
			_tmpString = "";
			for(new w = 0; w < MAX_WEAPONS; w++)
			{
				if(strlen(_tmpString) >= 100) SendClientMessage(playerid, COLOR_YELLOW, _tmpString), _tmpString = "";
				
				if(wepstat[w])
				{
					if(strlen(_tmpString))
						format(_tmpString, 128, "%s, %s = %ddb", _tmpString, GunName(w+1), wepstat[w]);
					else
						format(_tmpString, 128, "%s = %ddb", GunName(w+1), wepstat[w]);
				}
			}
			
			if(strlen(_tmpString))
				SendClientMessage(playerid, COLOR_YELLOW, _tmpString), SendFormatMessage(playerid, COLOR_WHITE, "Szabad rekeszek: %ddb", free);
			else
				SendClientMessage(playerid, COLOR_WHITE, "Nincsenek fegyverek a rakt�rban");
		}
		else if(egyezik(param[1], "l�szer") || egyezik(param[1], "loszer"))
		{
			new ammostat[MAX_WEAPONS], free;
			for(new s = 0; s < MAX_FEGYVERRAKTAR_SLOT; s++)
			{
				if(1 <= FrakcioInfo[frakcio][fLoszerTipus][s] <= MAX_WEAPONS && FrakcioInfo[frakcio][fLoszerMennyiseg][s] > 0)
					ammostat[ FrakcioInfo[frakcio][fLoszerTipus][s] - 1 ] += FrakcioInfo[frakcio][fLoszerMennyiseg][s];
				else
					free++;
			}
			
			SendClientMessage(playerid, COLOR_WHITE, "==[ Fegyverrakt�r: l�szerek ]==");
			
			_tmpString = "";
			for(new w = 0; w < MAX_WEAPONS; w++)
			{
				if(strlen(_tmpString) >= 100) SendClientMessage(playerid, COLOR_YELLOW, _tmpString), _tmpString = "";
				
				if(ammostat[w])
				{
					if(strlen(_tmpString))
						format(_tmpString, 128, "%s, %s = %ddb", _tmpString, GunName(w+1), ammostat[w]);
					else
						format(_tmpString, 128, "%s = %ddb", GunName(w+1), ammostat[w]);
				}
			}
			 
			if(strlen(_tmpString))
				SendClientMessage(playerid, COLOR_YELLOW, _tmpString), SendFormatMessage(playerid, COLOR_WHITE, "Szabad rekeszek: %ddb", free);
			else
				SendClientMessage(playerid, COLOR_WHITE, "Nincsenek l�szerek a rakt�rban");
		}
	}
	return 1;
}

ALIAS(f):fegyver;
CMD:fegyver(playerid, params[])
{
	if(Bortonben(playerid) > 0) return Msg(playerid, "Persze csak is ezt lehet egy b�rt�nben");
	new func[20], param2[32];
	if(!params[0] || sscanf(params, "s[20] S()[32] ", func, param2))
		return
			Msg(playerid, "Haszn�lata: /f(egyver) [funkci�]"),
			Msg(playerid, "Funkci�: el�vesz [fegyvern�v / fegyverid] - R�vid�t�s: /f e [fegyvern�v / id]"),
			Msg(playerid, "Funkci�: elrak - R�vid�t�s: /f k"),
			Msg(playerid, "Funkci�: �jrat�lt�s - R�vid�t�s: /f r"),
			Msg(playerid, "Funkci�: �tad [fegyver / l�szer] [fegyvern�v / ID]"),
			Msg(playerid, "Funkci�: [vesz / k�sz�t] [fegyver / l�szer] [fegyvern�v / ID]"),
			Msg(playerid, "Funkci�: [sz�tszed] [fegyvern�v / ID]")
		
		;

	if(egyezik(func, "�jrat�lt�s") || egyezik(func, "ujratoltes") || egyezik(func, "r"))
	{
		if(FloodCheck(playerid)) return 1;
		//new weapon = PlayerWeapons[playerid][pArmed];
		if(!WeaponArmed(playerid))
			return Msg(playerid, "Nincs fegyver a kezedben");
		
		/*if(WeaponData[weapon][wType] == WEAPON_TYPE_HAND)
			return Msg(playerid, "M�gis mit akarsz �jrat�lteni?");
		
		new slot = WeaponHaveWeapon(playerid, weapon);
		if(slot == NINCS)
			return Msg(playerid, "M�gis mit akarsz �jrat�lteni?");*/
			
		WeaponArm(playerid, PlayerWeapons[playerid][pArmed]);
		
		if(WeaponArmed(playerid) >= WEAPON_DEAGLE && WeaponArmed(playerid) <= WEAPON_SNIPER)
			OnePlayAnim(playerid,"UZI","UZI_reload",4.0,0,0,0,0,0);
			
		Msg(playerid, "Fegyver �jrat�ltve!");
	}
	if(egyezik(func, "elrak") || egyezik(func, "k"))
	{
		//Cselekves(playerid, "elrakta a fegyver�t", 1);
		
		Msg(playerid, "Elraktad");
		WeaponArm(playerid);
		return 1;
	}
	else if(egyezik(func, "el�vesz") || egyezik(func, "elovesz") || egyezik(func, "e"))
	{
		
		if(PlayerInfo[playerid][pFegyverTiltIdo] > 0) return Msg(playerid, "El vagy tiltva a fegyver haszn�latt�l!");
		if(PlayerInfo[playerid][pKozmunka] != 0) return Msg(playerid, "K�zmunk�n vagy, nem vehetsz el� fegyvert");
		if(param2[0] == EOS)
			return Msg(playerid, "Haszn�lat: /fegyver el�vesz [n�v / id]");

		if(NemMozoghat(playerid))
			return Msg(playerid, "Nem vehetsz el� fegyvert!");

		if(PlayerState[playerid] == PLAYER_STATE_DRIVER && !IsHitman(playerid))
			return Msg(playerid, "Vezet�k�nt nem vehetsz el� fegyvert");

		if(AdminDuty[playerid] == 1)
		{
			if(PlayerInfo[playerid][pAdmin] <= 5)
			{
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "Admin szolg�latban vagy, nincs sz�ks�ged a fegyveredre!!");
				return 1;
			}
			else SendClientMessage(playerid, COLOR_LIGHTBLUE, "Admin szolg�latban vagy, ha elfelejtetted l�pj ki!!");
		 }

		new slot, fegyo;
		if(IsNumeric(param2))
		{
			fegyo = strval(param2);
			if(fegyo < 1 || fegyo > MAX_WEAPONS)
				return Msg(playerid, "Nincs ilyen fegyver");
			
			slot = WeaponHaveWeapon(playerid, fegyo);

			if(slot == NINCS)
				return Msg(playerid, "Nincs ilyen fegyvered!");
			
			if(WeaponData[ PlayerWeapons[playerid][pWeapon][slot] ][wType] != WEAPON_TYPE_HAND && PlayerWeapons[playerid][pAmmo][fegyo] < 1)
				return Msg(playerid, "Ehhez a fegyverhez nincs l�szered");

			if(IsPlayerInAnyVehicle(playerid) && (fegyo == 22 || fegyo == 23 || fegyo == 24))
				return Msg(playerid, "Ezt nem veheted el� j�rm�ben");
				
			if(fegyo == 8 && Harcol[playerid])
			{
				SendClientMessage(playerid, COLOR_LIGHTRED, "Rendszer bez�rt a b�rt�nbe, Oka: T�ltott fegyver waron!");
				Jail(playerid, "set", 1800, "ajail2", "T�ltott fegyver waron");
				return 1;
			}
			
			if(WeaponData[fegyo][wType] != WEAPON_TYPE_HAND && Harcol[playerid] && !TeruletInfo[ HarcolTerulet[playerid] ][tLofegyver])
				return Msg(playerid, "L�fegyvert NEM vehetsz el�!");
			
			WeaponArm(playerid, fegyo);
			//Cselekves(playerid, "el�vett egy fegyvert",1);
			Msg(playerid, "El�vett�l egy fegyvert!");
			if(SpawnVedelem[playerid] > 0)
				SpawnVedelem[playerid] = 0;
				
			if(NoDamage[playerid])
				NoDamage[playerid] = 0;

			if(24 <= fegyo <= 34)
				OnePlayAnim(playerid,"UZI","UZI_reload",4.0,0,0,0,0,0);
		}
		else
		{
			fegyo = GetGunID(param2);
			if(fegyo < 1)
				return Msg(playerid, "Nincs ilyen fegyver");
			
			slot = WeaponHaveWeapon(playerid, fegyo);
			
			if(slot == NINCS)
				return Msg(playerid, "Nincs ilyen fegyvered!");
				
			if(WeaponData[fegyo][wType] != WEAPON_TYPE_HAND && PlayerWeapons[playerid][pAmmo][fegyo] < 1)
				return Msg(playerid, "Ehhez a fegyverhez nincs l�szered");

			if(IsPlayerInAnyVehicle(playerid) && (fegyo == 22 || fegyo == 23 || fegyo == 24))
				return Msg(playerid, "Ezt nem veheted el� j�rm�ben");
			
			if(WeaponData[fegyo][wType] != WEAPON_TYPE_HAND && Harcol[playerid] && !TeruletInfo[ HarcolTerulet[playerid] ][tLofegyver])
				return Msg(playerid, "L�fegyvert NEM vehetsz el�!");
			
			WeaponArm(playerid, fegyo);
			//Cselekves(playerid, "el�vett egy fegyvert", 1);
			Msg(playerid, "El�vett�l egy fegyvert!");
			
			if(SpawnVedelem[playerid] > 0)
				SpawnVedelem[playerid] = 0;
				
			if(NoDamage[playerid])
				NoDamage[playerid] = 0;

			if(fegyo >= 24 && fegyo <= 34)
				OnePlayAnim(playerid,"UZI","UZI_reload",4.0,0,0,0,0,0);
		}
	}
	else if(egyezik(func, "sz�tszed") || egyezik(func, "szetszed") || egyezik(func, "sz"))
	{
		
		if(param2[0] == EOS)
			return Msg(playerid, "Haszn�lat: /fegyver sz�tszed [N�v / ID]");
		
		if(!IsAt(playerid, IsAt_Fegyverkeszitohely))
		{
			        SendClientMessage(playerid, COLOR_LIGHTRED, "Nem vagy a mati k�sz�t� hely�n�l, a gy�rban");
			        return 1;
		}
		
		if( MunkaFolyamatban[playerid] )
			return Msg(playerid, "Nyugi-nyugi");
		
		new slot, fegyo;
		if(IsNumeric(param2))
		{
				
			fegyo = strval(param2);
			new weapon = fegyo;
			if(fegyo < 1 || fegyo > MAX_WEAPONS)
				return Msg(playerid, "Nincs ilyen fegyver");
			
			slot = WeaponHaveWeapon(playerid, fegyo);
			
			if(slot == NINCS)
				return Msg(playerid, "Nincs ilyen fegyvered!");
				
			if(weapon < 16 || weapon == 17 || weapon == 18 || weapon > 38 || weapon > MAX_WEAPONS)
				return Msg(playerid, "A-a!");
				
			
			new weapontipus;
			if(weapon == 22 || weapon == 23 || weapon == 24) 
				weapontipus = 1;
			if(weapon == 29)
				weapontipus = 2;
			if(weapon == 25 || weapon == 27 || weapon == 33)
				weapontipus = 3;
			if(weapon == 30 || weapon == 31)
				weapontipus = 4;
			if(weapon == 34)
				weapontipus = 5;
				
			new level = PlayerInfo[playerid][pCarSkill];
			
			if(level <= 15 && weapontipus == 2) return Msg(playerid, "Ehhez minimum 2es skill kell!");
			else if(level <= 85 && weapontipus == 3) return Msg(playerid, "Ehhez minimum 3as skill kell!");
			else if(level <= 125 && weapontipus == 4) return Msg(playerid, "Ehhez minimum 4es skill kell!");
			else if(level <= 185 && weapontipus == 5) return Msg(playerid, "Ehhez minimum 5�s skill kell!");
			
			PlayerInfo[playerid][pCarSkill] += 2;
			
			MunkaFolyamatban[playerid] = 1;
			WeaponTakeWeapon(playerid, fegyo);
			GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~~n~Szetszeded a fegyvert... Varj...", 3000, 3);
			TogglePlayerControllable(playerid, false);
			ApplyAnimation(playerid, "SCRATCHING", "scmid_l", 4.0, 1, 1, 1, 1, -1);
			MunkaTimerID[playerid]=SetTimerEx("Munkavege", (MunkaIdo[6]*5), false, "ddd", playerid, M_FEGYOSZETSZED, fegyo);
		}
		else
		{
			fegyo = GetGunID(param2);
			if(fegyo < 1)
				return Msg(playerid, "Nincs ilyen fegyver");
			
			slot = WeaponHaveWeapon(playerid, fegyo);
			
			if(slot == NINCS)
				return Msg(playerid, "Nincs ilyen fegyvered!");
			
			new weapon = fegyo;
			if(weapon < 16 || weapon == 17 || weapon == 18 || weapon > 38 || weapon > MAX_WEAPONS)
				return Msg(playerid, "A-a!");
			
			new weapontipus;
			if(weapon == 16 || weapon >= 22 && weapon <= 24) 
				weapontipus = 1;
			if(weapon == 29)
				weapontipus = 2;
			if(weapon == 25 || weapon == 27 || weapon == 33)
				weapontipus = 3;
			if(weapon == 30 || weapon == 31)
				weapontipus = 4;
			if(weapon == 34)
				weapontipus = 5;
				
			new level = PlayerInfo[playerid][pCarSkill];
			
			if(level <= 15 && weapontipus == 2) return Msg(playerid, "Ehhez minimum 2es skill kell!");
			else if(level <= 85 && weapontipus == 3) return Msg(playerid, "Ehhez minimum 3as skill kell!");
			else if(level <= 125 && weapontipus == 4) return Msg(playerid, "Ehhez minimum 4es skill kell!");
			else if(level <= 185 && weapontipus == 5) return Msg(playerid, "Ehhez minimum 5�s skill kell!");
			
			
			PlayerInfo[playerid][pCarSkill] += 2;

			MunkaFolyamatban[playerid] = 1;
			WeaponTakeWeapon(playerid, fegyo);
			GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~~n~Szetszeded a fegyvert... Varj...", 3000, 3);
			TogglePlayerControllable(playerid, false);
			ApplyAnimation(playerid, "SCRATCHING", "scmid_l", 4.0, 1, 1, 1, 1, -1);
			MunkaTimerID[playerid]=SetTimerEx("Munkavege", (MunkaIdo[6]*5), false, "ddd", playerid, M_FEGYOSZETSZED, fegyo);
		}
	}
	/*else if(egyezik(func, "�jrat�lt�s") || egyezik(func, "ujratoltes") || egyezik(func, "r"))
	{
		if(!PlayerWeapons[playerid][pArmed])
			Msg(playerid, "Nincs fegyver a kezedben");
			
		new fegyo = PlayerWeapons[playerid][pArmed];
		
		if(WeaponData[fegyo][wType] == WEAPON_TYPE_HAND)
			return Msg(playerid, "M�gis mit akarsz �jrat�lteni?");
		
		new slot = WeaponHaveWeapon(playerid, fegyo);
		if(slot == NINCS)
			return Msg(playerid, "M�gis mit akarsz �jrat�lteni?");
			
		//Cselekves(playerid, "�jrat�lt�tte a fegyver�t", 1);
		WeaponArm(playerid, PlayerWeapons[playerid][pArmed]);
		Msg(playerid, "Fegyver �jrat�ltve!");
		
		if(WeaponArmed(playerid) >= WEAPON_DEAGLE && WeaponArmed(playerid) <= WEAPON_SNIPER)
			OnePlayAnim(playerid,"UZI","UZI_reload",4.0,0,0,0,0,0);
	}*/
	else if(egyezik(func, "vesz"))
	{
		if(Szint(playerid) < WEAPON_MIN_LEVEL)
			return SendFormatMessage(playerid, COLOR_LIGHTRED, "Hiba: Fegyverhaszn�lat nem enged�lyezett a %d. szintig", WEAPON_MIN_LEVEL);
		
		if(PlayerInfo[playerid][pFegyverTiltIdo] > 1)
			return Msg(playerid, "El vagy tiltva a fegyverekt�l");
		 
		new iswep = !param2[0] ? -1 : (egyezik(param2, "fegyver") ? 1 : (egyezik(param2, "l�szer") || egyezik(param2, "loszer") ? 0 : -1));
		
		new weaponstr[32], ammo, celpont;
		if(!param2[0] || iswep == -1
			|| iswep == 1 && sscanf(params, "{s[32]s[32]}s[32]R(-1)", weaponstr, celpont)
			|| iswep == 0 && sscanf(params, "{s[32]s[32]}s[32]I(0)R(-1)", weaponstr, ammo, celpont)
		)
			return
				SendClientMessage(playerid, COLOR_WHITE, "===[ �rak ]==="),
				WeaponPrices(playerid, WEAPON_PRICES_CASH, COLOR_LIGHTBLUE),
				SendClientMessage(playerid, COLOR_YELLOW, "Haszn�lat: /fegyver vesz fegyver [fegyvern�v / ID] (j�t�kos)"),
				SendClientMessage(playerid, COLOR_YELLOW, "Haszn�lat: /fegyver vesz l�szer [fegyvern�v / ID] [mennyis�g] (j�t�kos)")
			;
		
		if(celpont == INVALID_PLAYER_ID)
			return Msg(playerid, "Nincs ilyen j�t�kos");
		else if(celpont == -1)
			celpont = playerid;
		else if(celpont != playerid && GetDistanceBetweenPlayers(playerid, celpont) > 5)
				return Msg(playerid, "� nincs a k�zeledben");
		
		new biz = BizbeVan(playerid);
		if(biz != BIZ_GS1 && biz != BIZ_GS2 && biz != BIZ_PB)
			return Msg(playerid, "Nem vagy fegyverboltban");
		
		if(BizzInfo[biz][bProducts] < 1)
			return Msg(playerid, "A fegyverbolt �res, nincs rakt�ron fegyver");
			
		if(PlayerInfo[playerid][pGunLic] < 1) return Msg(playerid, "Nincs fegyverenged�lyed!");
			
		if(iswep == 1)
		{
			new weapon = GetGunFromString(weaponstr);
			if(weapon < 1 || weapon > MAX_WEAPONS)
				return Msg(playerid, "Ilyen fegyver nem l�tezik");
			
			if(!WeaponPrice[weapon][wWeapon])
				return Msg(playerid, "Ilyen fegyver nem vehet� a fegyverboltban");
			
			if(WeaponCanHoldWeapon(celpont, weapon, 0) < 0)
				return Msg(playerid, "Ilyen fegyvert nem tudsz venni");
			
			if(!BankkartyaFizet(playerid, WeaponPrice[weapon][wWeapon]))
				return Msg(playerid, "Ezt nem tudod kifizetni");
			
			BizPenz(biz, WeaponPrice[weapon][wWeapon]);
			BizzInfo[biz][bProducts]--;
			BizUpdate(biz, BIZ_Products);
			
			WeaponGiveWeapon(celpont, weapon, .maxweapon = 0);
			
			if(celpont == playerid)
			{
				format(_tmpString, 128, "vett egy %s-t", GunName(weapon)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Vett�l egy %s-t", GunName(weapon));
			}
			else
			{
				format(_tmpString, 128, "vett egy %s-t neki: %s", GunName(weapon), PlayerName(celpont)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Vett�l egy %s-t neki: %s", GunName(weapon), PlayerName(celpont));
				SendFormatMessage(celpont, COLOR_WHITE, "%s vett neked egy %s-t", PlayerName(playerid), GunName(weapon));
			}
		}
		else if(iswep == 0)
		{
			new weapon = GetGunFromString(weaponstr);
			if(weapon < 1 || weapon > MAX_WEAPONS)
				return Msg(playerid, "Ilyen fegyver nem l�tezik");
			
			if(!WeaponPrice[weapon][wAmmo])
				return Msg(playerid, "Ilyen l�szer nem vehet� a fegyverboltban");
			
			if(ammo < 1)
				return Msg(playerid, "Hib�s l�szer mennyis�g");
				
			new venni = max(0, min(ammo, WeaponMaxAmmo(weapon) - WeaponAmmo(celpont, weapon)));
			if(!venni)
				return Msg(playerid, "Nincs hely l�szernek");
			
			new koltseg = venni * WeaponPrice[weapon][wAmmo];
			if(!BankkartyaFizet(playerid, koltseg))
				return Msg(playerid, "Ezt nem tudod kifizetni");
				
			BizPenz(biz, koltseg);
			BizzInfo[biz][bProducts]--;
			BizUpdate(biz, BIZ_Products);
			
			WeaponGiveAmmo(celpont, weapon, venni);
			
			if(celpont == playerid)
			{
				format(_tmpString, 128, "vett n�mi %s l�szert", GunName(weapon)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Vett�l %ddb %s l�szert", venni, GunName(weapon));
			}
			else
			{
				format(_tmpString, 128, "vett n�mi %s l�szert neki: %s", GunName(weapon), PlayerName(celpont)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Vett�l %ddb %s l�szert neki: %s", venni, GunName(weapon), PlayerName(celpont));
				SendFormatMessage(celpont, COLOR_WHITE, "%s vett neked %ddb %s l�szert", PlayerName(playerid), venni, GunName(weapon));
			}
		}
		else
			Msg(playerid, "Hib�s opci� (fegyver / l�szer)");
	}
	else if(egyezik(func, "k�sz�t") || egyezik(func, "keszit"))
	{
		if (!IsMaffia(playerid)) return Msg(playerid, "Csak a Maffia k�sz�thet fegyvert!");//Maffia k�sz�thet csak fegyvert felt�tel by Amos
	
		if(Szint(playerid) < WEAPON_MIN_LEVEL)
			return SendFormatMessage(playerid, COLOR_LIGHTRED, "Hiba: Fegyverhaszn�lat nem enged�lyezett a %d. szintig", WEAPON_MIN_LEVEL);
		
		if(PlayerInfo[playerid][pFegyverTiltIdo] > 1)
			return Msg(playerid, "El vagy tiltva a fegyverekt�l");
		
		new iswep = !param2[0] ? -1 : (egyezik(param2, "fegyver") ? 1 : (egyezik(param2, "l�szer") || egyezik(param2, "loszer") ? 0 : -1));
		
		new weaponstr[32], ammo, celpont;
		if(!param2[0] || iswep == -1
			|| iswep == 1 && sscanf(params, "{s[32]s[32]}s[32]R(-1)", weaponstr, celpont)
			|| iswep == 0 && sscanf(params, "{s[32]s[32]}s[32]I(0)R(-1)", weaponstr, ammo, celpont)
		)
			return
				SendClientMessage(playerid, COLOR_WHITE, "===[ �rak ]==="),
				WeaponPrices(playerid, WEAPON_PRICES_MATS, COLOR_LIGHTBLUE),
				SendClientMessage(playerid, COLOR_YELLOW, "Haszn�lat: /fegyver k�sz�t fegyver [fegyvern�v / ID] (j�t�kos)"),
				SendClientMessage(playerid, COLOR_YELLOW, "Haszn�lat: /fegyver k�sz�t l�szer [fegyvern�v / ID] [mennyis�g] (j�t�kos)")
			;
		
		if(celpont == INVALID_PLAYER_ID)
			return Msg(playerid, "Nincs ilyen j�t�kos");
		else if(celpont == -1)
			celpont = playerid;
		else if(celpont != playerid && GetDistanceBetweenPlayers(playerid, celpont) > 5)
			return Msg(playerid, "� nincs a k�zeledben");
		
		if(!IsAt(playerid, IsAt_Fegyverkeszitohely))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "Nem vagy a fegyver k�sz�t� hely�n�l, a gy�rban");
			return 1;
		}
		
		if(iswep == 1)
		{
			new weapon = GetGunFromString(weaponstr);
			if(weapon < 1 || weapon > MAX_WEAPONS)
				return Msg(playerid, "Ilyen fegyver nem l�tezik");
			
			if(!WeaponPrice[weapon][wWeaponMat])
				return Msg(playerid, "Ilyen fegyver nem k�sz�thet�");
			
			if(WeaponCanHoldWeapon(celpont, weapon, 0) < 0)
				return Msg(playerid, "Ilyen fegyvert nem tudsz k�sz�teni");
			
			if(PlayerInfo[playerid][pMats] < WeaponPrice[weapon][wWeaponMat])
				return Msg(playerid, "Nincs ennyi materialod");
			
			new weapontipus;
			if(weapon == 16 || weapon >= 22 && weapon <= 24) 
				weapontipus = 1;
			if(weapon == 29)
				weapontipus = 2;
			if(weapon == 25 || weapon == 27 || weapon == 33)
				weapontipus = 3;
			if(weapon == 30 || weapon == 31)
				weapontipus = 4;
			if(weapon == 34)
				weapontipus = 5;
			
			new level = PlayerInfo[playerid][pCarSkill];
			
			/*if(level >= 16 && level <= 85 && weapontipus == 2) return Msg(playerid, "Ehhez minimum 2es skill kell!");
			else if(level >= 86 && level <= 125 && weapontipus == 3) return Msg(playerid, "Ehhez minimum 3as skill kell!");
			else if(level >= 126 && level <= 185 && weapontipus == 4) return Msg(playerid, "Ehhez minimum 4es skill kell!");
			else if(level >= 186 && weapontipus == 5) return Msg(playerid, "Ehhez minimum 5�s skill kell!");*/
			
			//Jav�tva by Ryan
			
			if(level <= 15 && weapontipus == 2) return Msg(playerid, "Ehhez minimum 2es skill kell!");
			else if(level <= 85 && weapontipus == 3) return Msg(playerid, "Ehhez minimum 3as skill kell!");
			else if(level <= 125 && weapontipus == 4) return Msg(playerid, "Ehhez minimum 4es skill kell!");
			else if(level <= 185 && weapontipus == 5) return Msg(playerid, "Ehhez minimum 5�s skill kell!");
				
			PlayerInfo[playerid][pMats] -= WeaponPrice[weapon][wWeaponMat];
			
			WeaponGiveWeapon(celpont, weapon, .maxweapon = 0);
			
			if(weapontipus == 1) PlayerInfo[playerid][pCarSkill] += 1;
			if(weapontipus == 2) PlayerInfo[playerid][pCarSkill] += 2;
			if(weapontipus == 3) PlayerInfo[playerid][pCarSkill] += 3;
			if(weapontipus == 4) PlayerInfo[playerid][pCarSkill] += 4;
			if(weapontipus == 5) PlayerInfo[playerid][pCarSkill] += 5;
			
			if(celpont == playerid)
			{
				format(_tmpString, 128, "k�sz�tett egy %s-t", GunName(weapon)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "K�sz�tett�l egy %s-t", GunName(weapon));
			}
			else
			{
				format(_tmpString, 128, "k�sz�tett egy %s-t neki: %s", GunName(weapon), PlayerName(celpont)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "K�sz�tett�l egy %s-t neki: %s", GunName(weapon), PlayerName(celpont));
				SendFormatMessage(celpont, COLOR_WHITE, "%s k�sz�tett neked egy %s-t", PlayerName(playerid), GunName(weapon));
			}
		}
		else if(iswep == 0)
		{
			new weapon = GetGunFromString(weaponstr);
			if(weapon < 1 || weapon > MAX_WEAPONS)
				return Msg(playerid, "Ilyen fegyver nem l�tezik");
			
			if(!WeaponPrice[weapon][wAmmoMat])
				return Msg(playerid, "Ilyen l�szer nem k�sz�thet�");
			
			if(ammo < 1)
				return Msg(playerid, "Hib�s l�szer mennyis�g");
				
			new venni = max(0, min(ammo, WeaponMaxAmmo(weapon) - WeaponAmmo(celpont, weapon)));
			if(!venni)
				return Msg(playerid, "Nincs hely l�szernek");
			
			new koltseg = venni * WeaponPrice[weapon][wAmmoMat];
			if(PlayerInfo[playerid][pMats] < koltseg)
				return Msg(playerid, "Nincs ennyi materialod");
				
			PlayerInfo[playerid][pMats] -= koltseg;
			
			WeaponGiveAmmo(celpont, weapon, venni);
			
			if(celpont == playerid)
			{
				format(_tmpString, 128, "k�sz�tett n�mi %s l�szert", GunName(weapon)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "K�sz�tett�l %ddb %s l�szert", venni, GunName(weapon));
			}
			else
			{
				format(_tmpString, 128, "k�sz�tett n�mi %s l�szert neki: %s", GunName(weapon), PlayerName(celpont)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "K�sz�tett�l %ddb %s l�szert neki: %s", venni, GunName(weapon), PlayerName(celpont));
				SendFormatMessage(celpont, COLOR_WHITE, "%s k�sz�tett neked %ddb %s l�szert", PlayerName(playerid), venni, GunName(weapon));
			}
		}
		else
			Msg(playerid, "Hib�s opci� (fegyver / l�szer)");
	}
	else if(egyezik(func, "�tad") || egyezik(func, "atad"))
	{
		if(Paintballozik[playerid])
			return Msg(playerid, "Paintball alatt nem lehets�ges");
			
		new celpont, weaponstr[32], ammo;
		if(!param2[0] || sscanf(params, "{s[32] s[32] }rs[32] I(0)", celpont, weaponstr, ammo))
			return
				SendClientMessage(playerid, COLOR_YELLOW, "Haszn�lat: /f �tad fegyver [j�t�kos n�v / ID] [fegyvern�v / ID]"),
				SendClientMessage(playerid, COLOR_YELLOW, "Haszn�lat: /f �tad l�szer [j�t�kos n�v / ID] [fegyvern�v / ID] [mennyis�g]")
			;
		
		if(celpont == INVALID_PLAYER_ID)
			return Msg(playerid, "Nem l�tez� j�t�kos");
		
		if(GetDistanceBetweenPlayers(playerid, celpont) > 2)
			return Msg(playerid, "� nincs a k�zeledben");
		
		if(PlayerState[playerid] != PLAYER_STATE_ONFOOT || PlayerState[celpont] != PLAYER_STATE_ONFOOT)
			return Msg(playerid, "Kocsiban nem lehet");

		if(Szint(playerid) < WEAPON_MIN_LEVEL || Szint(celpont) < WEAPON_MIN_LEVEL)
			return Msg(playerid, "T�l kicsi a szinted vagy az � szintje a fegyverhaszn�lathoz");
		
		if(PlayerInfo[playerid][pFegyverTiltIdo] > 0 || PlayerInfo[celpont][pFegyverTiltIdo] > 0 )
			return Msg(playerid, "Egyik�t�k el van tiltva a fegyvert�l!");
		
		new weapon = GetGunFromString(weaponstr);
		if(weapon < 1 || weapon > MAX_WEAPONS)
			return Msg(playerid, "Ilyen fegyver nem l�tezik");
		
		if(egyezik(param2, "fegyver"))
		{
			if((weapon == WEAPON_CHAINSAW || weapon == WEAPON_FIREEXTINGUISHER) && !LMT(celpont, FRAKCIO_TUZOLTO))
				return Msg(playerid, "Porolt� �s l�ncf�r�sz nem adhat� �t, csak t�zolt�nak!");
			
			if(WeaponHaveWeapon(playerid, weapon) < 0)
				return Msg(playerid, "Nincs ilyen fegyvered");
			
			if(WeaponCanHoldWeapon(celpont, weapon, 0) < 0)
				return Msg(playerid, "Nincs hely a fegyvernek");
			
			WeaponTakeWeapon(playerid, weapon);
			WeaponGiveWeapon(celpont, weapon, 0);
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "�tadt�l neki egy %s-t", GunName(weapon));
			SendFormatMessage(celpont, COLOR_LIGHTBLUE, "�tadtak neked egy %s-t", GunName(weapon));
			
			OnePlayAnim(playerid, "GANGS", "shake_cara", 4.0, 0, 0, 0, 0, 0);
			OnePlayAnim(celpont, "GANGS", "shake_cara", 4.0, 0, 0, 0, 0, 0);
			
			if(!PlayerInfo[playerid][pMember])
				if(!PlayerInfo[celpont][pMember])
					format(_tmpString, 128, "[�tad][Civil]%s �tadott neki: [Civil]%s, egy %s-t", PlayerName(playerid), PlayerName(celpont), GunName(weapon)), Log("Fegyver", _tmpString);
				else
					format(_tmpString, 128, "[�tad][Civil]%s �tadott neki: [%s]%s, egy %s-t", PlayerName(playerid), Szervezetneve[ PlayerInfo[celpont][pMember] - 1 ], PlayerName(celpont), GunName(weapon)), Log("Fegyver", _tmpString);
			else
				if(!PlayerInfo[celpont][pMember])
					format(_tmpString, 128, "[�tad][%s]%s �tadott neki: [Civil]%s, egy %s-t", Szervezetneve[ PlayerInfo[playerid][pMember] - 1 ], PlayerName(playerid), PlayerName(celpont), GunName(weapon)), Log("Fegyver", _tmpString);
				else
					format(_tmpString, 128, "[�tad][%s]%s �tadott neki: [%s]%s, egy %s-t", Szervezetneve[ PlayerInfo[playerid][pMember] - 1 ], PlayerName(playerid), Szervezetneve[ PlayerInfo[celpont][pMember] - 1 ], PlayerName(celpont), GunName(weapon)), Log("Fegyver", _tmpString);
		}
		else if(egyezik(param2, "l�szer") || egyezik(param2, "loszer"))
		{
			if(ammo < 1)
				return Msg(playerid, "Hib�s l�szer mennyis�g");
			
			new atadni = max(0, min(ammo, min(WeaponAmmo(playerid, weapon), WeaponMaxAmmo(weapon) - WeaponAmmo(celpont, weapon))));
			if(!atadni)
				return Msg(playerid, "Nincs hely n�la");
			
			if(WeaponAmmo(playerid, weapon) < 0)
				return Msg(playerid, "Nincs ilyen fegyvered");
			
			if(WeaponCanHoldWeapon(celpont, weapon, 0) < 0)
				return Msg(playerid, "Nincs hely a fegyvernek");
			
			WeaponGiveAmmo(playerid, weapon, -atadni);
			WeaponGiveAmmo(celpont, weapon, atadni);
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "�tadt�l neki egy %ddb %s l�szert", atadni, GunName(weapon));
			SendFormatMessage(celpont, COLOR_LIGHTBLUE, "%s �tadott neked %ddb %s l�szert", PlayerName(playerid), atadni, GunName(weapon));
			
			OnePlayAnim(playerid, "GANGS", "shake_cara", 4.0, 0, 0, 0, 0, 0);
			OnePlayAnim(celpont, "GANGS", "shake_cara", 4.0, 0, 0, 0, 0, 0);
			
			if(!PlayerInfo[playerid][pMember])
				if(!PlayerInfo[celpont][pMember])
					format(_tmpString, 128, "[�tad][Civil]%s �tadott neki: [Civil]%s, %ddb %s l�szert", PlayerName(playerid), PlayerName(celpont), atadni, GunName(weapon)), Log("Fegyver", _tmpString);
				else
					format(_tmpString, 128, "[�tad][Civil]%s �tadott neki: [%s]%s, %ddb %s l�szert", PlayerName(playerid), Szervezetneve[ PlayerInfo[celpont][pMember] - 1 ], PlayerName(celpont), atadni, GunName(weapon)), Log("Fegyver", _tmpString);
			else
				if(!PlayerInfo[celpont][pMember])
					format(_tmpString, 128, "[�tad][%s]%s �tadott neki: [Civil]%s, %ddb %s l�szert", Szervezetneve[ PlayerInfo[playerid][pMember] - 1 ], PlayerName(playerid), PlayerName(celpont), atadni, GunName(weapon)), Log("Fegyver", _tmpString);
				else
					format(_tmpString, 128, "[�tad][%s]%s �tadott neki: [%s]%s, %ddb %s l�szert", Szervezetneve[ PlayerInfo[playerid][pMember] - 1 ], PlayerName(playerid), Szervezetneve[ PlayerInfo[celpont][pMember] - 1 ], PlayerName(celpont), atadni, GunName(weapon)), Log("Fegyver", _tmpString);
		}
	}
	
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

ALIAS(t2rfigyel6):terfigyelo;
CMD:terfigyelo(playerid, params[])
{
	if(!IsACop(playerid))
		return 1;

	new sub[32], subparams[64];
	if(sscanf(params, "s[32]S()[64]", sub, subparams))
		return SendClientMessage(playerid, COLOR_WHITE, "Haszn�lata: /t�rfigyel� [jelz�sek / jelz�s / t�rk�p / utols�poz�ci�]");
	
	if(egyezik(sub, "jelzes") || egyezik(sub, "jelz�s"))
	{
		new jelzes;
		if(sscanf(subparams, "i", jelzes))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /t�rfigyel� jelz�s [jelz�s szint]");
			SendClientMessage(playerid, COLOR_WHITE, "Jelz�sek: 0 = kikapcsolva, 1 = fegyvervisel�s, 2 = c�lz�s + fegyvervisel�s, stb.");
			SendClientMessage(playerid, COLOR_WHITE, "Jelz�sek megtekinthet�ek a wikip�di�n: classrpg.net/T�rfigyel�");
			return 1;
		}
		
		if(jelzes < 0 || jelzes > PLAYER_MARKER_MKILL)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Jelz�s: Minimum 0, maximum 5");
			
		PlayerInfo[playerid][pJelzes] = jelzes;
		
		switch(jelzes)
		{
			case PLAYER_MARKER_WEAPONHOLD: Msg(playerid, "Jelz�sek: fegyvervisel�s, fenyeget�s, testis�rt�s, ember�l�s, t�bbsz�r�s ember�l�s");
			case PLAYER_MARKER_TARGET: Msg(playerid, "Jelz�sek: fenyeget�s, testis�rt�s, ember�l�s, t�bbsz�r�s ember�l�s");
			case PLAYER_MARKER_SHOOT: Msg(playerid, "Jelz�sek: testis�rt�s, ember�l�s, t�bbsz�r�s ember�l�s");
			case PLAYER_MARKER_KILL: Msg(playerid, "Jelz�sek: ember�l�s, t�bbsz�r�s ember�l�s");
			case PLAYER_MARKER_MKILL: Msg(playerid, "Jelz�sek: t�bbsz�r�s ember�l�s");
			default: Msg(playerid, "Jelz�s kikapcsolva - most m�r nem fogja chatben �rni az �j b�n�z�ket");
		}
	}
	elseif(egyezik(sub, "terkep") || egyezik(sub, "t�rk�p"))
	{
		new jelzes;
		if(sscanf(subparams, "i", jelzes))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /t�rfigyel� t�rk�p [jelz�s szint]");
			SendClientMessage(playerid, COLOR_WHITE, "Jelz�sek: 0 = kikapcsolva, 1 = fegyvervisel�s, 2 = c�lz�s + fegyvervisel�s, stb.");
			SendClientMessage(playerid, COLOR_WHITE, "Jelz�sek megtekinthet�ek a wikip�di�n: classrpg.net/T�rfigyel�");
			return 1;
		}
		
		if(jelzes < 0 || jelzes > PLAYER_MARKER_MKILL)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Jelz�s: Minimum 0, maximum 5");
			
		PlayerInfo[playerid][pJelzesTerkep] = jelzes;
		
		switch(jelzes)
		{
			case PLAYER_MARKER_WEAPONHOLD: Msg(playerid, "T�rk�p jelz�sek: fegyvervisel�s, fenyeget�s, testis�rt�s, ember�l�s, t�bbsz�r�s ember�l�s");
			case PLAYER_MARKER_TARGET: Msg(playerid, "T�rk�p jelz�sek: fenyeget�s, testis�rt�s, ember�l�s, t�bbsz�r�s ember�l�s");
			case PLAYER_MARKER_SHOOT: Msg(playerid, "T�rk�p jelz�sek: testis�rt�s, ember�l�s, t�bbsz�r�s ember�l�s");
			case PLAYER_MARKER_KILL: Msg(playerid, "T�rk�p jelz�sek: ember�l�s, t�bbsz�r�s ember�l�s");
			case PLAYER_MARKER_MKILL: Msg(playerid, "T�rk�p jelz�sek: t�bbsz�r�s ember�l�s");
			default: Msg(playerid, "Jelz�s kikapcsolva - most m�r nem fogja chatben �rni az �j b�n�z�ket");
		}
		
		MarkerAction(playerid, PLAYER_MARKER_ON_REFRESH);
	}
	elseif(egyezik(sub, "utolsopozicio") || egyezik(sub, "utols�poz�ci�"))
	{
		new bid;
		if(sscanf(subparams, "i", bid))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Haszn�lata: /t�rfigyel� utols�poz�ci� [egyedi ID (pl.: 1234)]");
		
		if(bid < 1000 || bid > 9999)
			return Msg(playerid, "1000-9999");
		
		new player = NINCS;
		foreach(Jatekosok, p)
		{
			if(PlayerInfo[p][pBID] == bid)
			{
				player = p;
				break;
			}
		}
		
		if(player == NINCS || PlayerMarker[player][mLastPos][0] == 0.0)
			return Msg(playerid, "Utols� poz�ci� nem ismert");
			
		SetPlayerCheckpoint(playerid, ArrExt(PlayerMarker[player][mLastPos]), 3.0);
		SendFormatMessage(playerid, COLOR_LIGHTRED, "T�rfigyel�: %d jelezve a t�rk�pen", PlayerInfo[player][pBID]);
	}
	elseif(egyezik(sub, "jelzesek") || egyezik(sub, "jelz�sek"))
	{
		new jelzes;
		sscanf(subparams, "I(1)", jelzes);
		
		if(jelzes < 1 || jelzes > PLAYER_MARKER_MKILL)
			jelzes = PLAYER_MARKER_MKILL;
		
		foreach(Jatekosok, p)
		{
			if(PlayerMarker[p][mType] >= jelzes && !PLAYER_MARKER_IS_HIDDEN(p))
			{
				switch(PlayerMarker[p][mType])
				{
					case PLAYER_MARKER_WEAPONHOLD:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_WEAPONHOLD, "[T�rfigyel�: fegyvervisel�s] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
					case PLAYER_MARKER_TARGET:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_TARGET, "[T�rfigyel�: c�lz�s] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
					case PLAYER_MARKER_SHOOT:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_SHOOT, "[T�rfigyel�: testis�rt�s] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
					case PLAYER_MARKER_KILL:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_KILL, "[T�rfigyel�: ember�l�s] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
					case PLAYER_MARKER_MKILL:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_MKILL, "[T�rfigyel�: t�bbsz�r�s ember�l�s] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
				}
			}
		}
	}
	
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
ALIAS(sajt4):sajto;
CMD:sajto(playerid, params[])
{
	if(!LMT(playerid, FRAKCIO_RIPORTER)) return Msg(playerid, "Nem vagy riporter!");
	if(PlayerInfo[playerid][pNewsSkill] < 101) return Msg(playerid, "A parancs haszn�lat�hoz minimum 3-as ripoter skill sz�ks�ges");
	if(IsValidDynamic3DTextLabel(SajtoIgazolvany[playerid]))
	{
		DestroyDynamic3DTextLabel(SajtoIgazolvany[playerid]), SajtoIgazolvany[playerid] = INVALID_3D_TEXT_ID;
		Cselekves(playerid, "levette a nyak�b�l a sajt�igazolv�nyt.");
	}
	else
	{
		SajtoIgazolvany[playerid] = CreateDynamic3DTextLabel("Sajt�", COLOR_DYELLOW, 0.0, 0.0, 0.25, 10.0, playerid, INVALID_VEHICLE_ID, 1);
		Cselekves(playerid, "felrakta a nyak�ba a sajt�igazolv�nyt.");
	}
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

ALIAS(ter8let):terulet;
CMD:terulet(playerid, params[])
{
	if(!PlayerInfo[playerid][pLeader])
		return Msg(playerid, "Ezt a parancsot csak leader haszn�lhatja");
	
	new func[32];
	if(sscanf(params, "s[32] ", func))
		return Msg(playerid, "Haszn�lata: /ter�let �tad [j�t�kos]");
	
	if(egyezik(func, "�tad") || egyezik(func, "atad"))
	{
		new player;
		if(sscanf(params, "{s[32]}r", player) || player == INVALID_PLAYER_ID)
			return Msg(playerid, "Haszn�lat: /ter�let �tad [j�t�kos]");
		
		if(!PlayerInfo[player][pMember] || PlayerInfo[player][pMember] == PlayerInfo[playerid][pMember] || LegalisSzervezetTagja(player) || Civil(player))
			return Msg(playerid, "Neki nem adhatod �t");
		
		new area = NINCS, db, Float:pos[3];
		GetPlayerPos(playerid, ArrExt(pos));
		
		for(new a = 0; a < MAXTERULET; a++)
		{
			if(TeruletInfo[a][tMinX] <= pos[0] <= TeruletInfo[a][tMaxX] && TeruletInfo[a][tMinY] <= pos[1] <= TeruletInfo[a][tMaxY])
				area = a;
			
			if(TeruletInfo[a][tTulaj] == PlayerInfo[player][pMember])
				db++;
		}
		
		if(area == NINCS)
			return Msg(playerid, "A ter�letre kell menned, hogy �tadhasd");
		
		if(TeruletInfo[area][tTulaj] != PlayerInfo[playerid][pLeader])
			return Msg(playerid, "Ez nem a ti ter�letetek");
			
		if(db >= TERULET_FRAKCIO_LIMIT)
			return Msg(playerid, "Nekik m�r t�l sok ter�let�k van");
		
		FrakcioInfo[PlayerInfo[playerid][pMember]][fPenz] -= 1000000;
		TeruletInfo[area][tTulaj] = PlayerInfo[player][pMember];
		TeruletUpdate(area, TERULET_Tulaj);
		TeruletFrissites();
		
		new msg1[128], msg2[128];
		format(msg1, 128, "<< �tadt�tok a %s ter�letet nekik: %s, az �truh�z�si d�j 1.000.000 Ft volt >>", TeruletInfo[area][tNev], Szervezetneve[ PlayerInfo[player][pMember] - 1][2]);
		format(msg2, 128, "<< Megkapt�tok a %s ter�letet t�l�k: %s >>", TeruletInfo[area][tNev], Szervezetneve[ PlayerInfo[playerid][pLeader] - 1][2]);
		foreach(Jatekosok, p)
		{
			if(PlayerInfo[p][pMember] == PlayerInfo[playerid][pMember])
				SendClientMessage(p, COLOR_YELLOW, msg1);
			else if(PlayerInfo[p][pMember] == PlayerInfo[player][pMember])
				SendClientMessage(p, COLOR_YELLOW, msg2);
		}
		format(_tmpString, 200, "[%s]%s �tadta a %s ter�letet nekik: %s", Szervezetneve[ PlayerInfo[playerid][pLeader] - 1][2], PlayerName(playerid), TeruletInfo[area][tNev], Szervezetneve[ PlayerInfo[player][pMember] - 1][2]), Log("Egyeb", _tmpString);
	}
	return 1;
}

CMD:nyit(playerid,params[])
{
	#pragma unused params

	new bool:van;
	for(new k = 0; k < MAX_KAPU; k++)
	{
		if(IsPlayerInRangeOfPoint(playerid, Kapu[k][kTav], Kapu[k][kZPos][0], Kapu[k][kZPos][1], Kapu[k][kZPos][2]) && GetPlayerVirtualWorld(playerid) == Kapu[k][Vw])
		{
			if(Admin(playerid,1)|| IsScripter(playerid) || KapuEngedely(playerid, k))
			{
			    if(Kapu[k][kKod] != -1)
			    {
			        Szamok[playerid][0] = EOS;
					
					PlayerTextDrawSetString(playerid, Gombok[0], "1");
					PlayerTextDrawSetString(playerid, Gombok[1], "2");
					
			        for(new i = 0; i < 2; i++)
						PlayerTextDrawShow(playerid, Kellek[i]);
					for(new i = 0; i < 10; i++)
						PlayerTextDrawShow(playerid, Gombok[i]);
					for(new i = 0; i < 2; i++)
						PlayerTextDrawShow(playerid, Jelzes[i]);
						
					PlayerTextDrawShow(playerid, KapuNev);
					SelectTextDraw(playerid,0xF7C25EAA);
					KeyPadActive[playerid] = true;
					
			        if(Admin(playerid, 2))
					{
						SendFormatMessage(playerid, COLOR_GREEN, "[Info]: A kapu jelszava a k�vetkez�: %d | {FF0000}Ha vissza�lsz vele a b�ntet�s nem marad el!", Kapu[k][kKod]);
						SendClientMessage(playerid, COLOR_LIGHTRED, "[Info]: Ha a kapu nem a te tulajdonodban �ll, a jelszav�t nem mondhatod el senkinek se!");
					}
			        PlayerTextDrawSetString(playerid, KapuNev, Kapu[k][kNev]);
			        Valtozott[playerid] = false;
			        MelyikKapu[playerid] = k;
			        return true;
				}
				if(Kapu[k][kMozgo])
					MoveDynamicObject(Kapu[k][kOID], ArrExt(Kapu[k][kNPos]), Kapu[k][kSpeed]);
				else
				{
					SetDynamicObjectPos(Kapu[k][kOID], ArrExt(Kapu[k][kNPos]));
					SetDynamicObjectRot(Kapu[k][kOID], ArrExt(Kapu[k][kNRPos]));
				}
			}
			else
				Msg(playerid, "Ezt a kaput nem nyithatod ki");

			van = true;
			break;
		}
	}
	if(van)
	{
		// nem csin�l semmit
	}
	/*else if(PlayerToPoint(9.0, playerid,  -2432.2708,495.7582,29.9228))
	{
		if(LMT(playerid, FRAKCIO_SFPD) || IsAdmin(playerid))
		{
			MoveDynamicObject(SFPDKapu[0], -2442.35, 492.14, 31.19, 3);
			MoveDynamicObject(SFPDKapu[1], -2424.37, 500.08, 31.19, 3);
		}
		else {Msg(playerid, "Nem nyithatod ki!");}
	}*/
	//v�ge
	else if(PlayerToPoint(1.5, playerid, 246.4032,72.1604,1003.6406))
	{
		if(LMT(playerid, FRAKCIO_SCPD) || LMT(playerid, FRAKCIO_FBI) || IsAdmin(playerid))
		{
			MoveDynamicObject(LSPDAjto[0], 243.86218261719, 72.516616821289, 1002.640625, 3);
			MoveDynamicObject(LSPDAjto[1], 248.84548950195, 72.573768615723, 1002.640625, 3);
		}
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(1.5, playerid, 245.1471,75.7220,1003.6406))
	{
		if(LMT(playerid, FRAKCIO_SCPD) || LMT(playerid, FRAKCIO_FBI) || IsAdmin(playerid))
		{
			MoveDynamicObject(LSPDAjto[2], 244.75708007813, 73.263664245605, 1002.8529663086, 3);
			MoveDynamicObject(LSPDAjto[3], 244.72633361816, 78.411727905273, 1002.8547363281, 3);
		}
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(1.5, playerid, 247.5527,76.0110,1003.6406))
	{
		if(LMT(playerid, FRAKCIO_SCPD) || LMT(playerid, FRAKCIO_FBI) || IsAdmin(playerid))
		{
			MoveDynamicObject(LSPDAjto[4], 248.14546203613, 73.249778747559, 1002.640625, 3);
			MoveDynamicObject(LSPDAjto[5], 248.08885192871, 78.353271484375, 1002.640625, 3);
		}
		else Msg(playerid, "Nem nyithatod ki!");
	}
	/*else if(PlayerToPoint(10, playerid, 1547.3752441406, -1627.8746337891, 15.156204223633))
	{
		if(LMT(playerid, FRAKCIO_SCPD) || LMT(playerid, FRAKCIO_FBI) || IsAdmin(playerid))
			MoveDynamicObject(LSPDKapu[1],  1547.9416503906, -1639.4859619141, 15.156204223633, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}*/
	/*else if(PlayerToPoint(10, playerid, -1039.0400390625, -588.142578125, 33.356178283691))
	{
		if(LMT(playerid, FRAKCIO_SFPD) || IsAdmin(playerid))
			MoveDynamicObject(Katonakapu[2],-1039.0400390625, -588.142578125, 27.356178283691, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(10, playerid,  -1014.3894042969, -650.97711181641, 32.082801818848))
	{
		if(LMT(playerid, FRAKCIO_SFPD) || IsAdmin(playerid))
			MoveDynamicObject(Katonakapu[3],  -1014.3894042969, -650.97711181641, 26.082801818848, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}*/
	else if(PlayerToPoint(3, playerid, 353.48245239258, 165.39109802246, 1024.7963867188))
	{
		if(LMT(playerid, FRAKCIO_ONKORMANYZAT) || IsAdmin(playerid))
			SetDynamicObjectRot(OnkormanyzatAjto[0], 0, 0, 90);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	/*else if(PlayerToPoint(10, playerid, -2242.9084472656, 643.27691650391, 48.45153427124))
	{
		if(LMT(playerid, FRAKCIO_YAKUZA) || IsAdmin(playerid))
			MoveDynamicObject(Yakuzakapu[1], -2242.9084472656, 643.27691650391, 41.45153427124,3);
		else Msg(playerid, "Nem nyithatod ki ezt a kaput!");
	}*/
	else if(PlayerToPoint(7, playerid, -1917.303833, 301.403687, 40.874542))
	{
		if(PlayerInfo[playerid][pSzerelo]>0 || IsAdmin(playerid))
			MoveDynamicObject(AutoSzereloKapu, -1917.303833, 301.403687, 36.874542, 2);
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy aut�szerel�!");
	}

	else if(PlayerToPoint(10, playerid, -1627.539185, 688.910339, 15.875875))
	{
	    if(IsACop(playerid) || IsAdmin(playerid))
	    	MoveDynamicObject(sfpdkapu, -1627.539185, 688.910339, 20.875875, 3);
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy az SFPD tagja!");
	}


	else if(PlayerToPoint(10, playerid, 96.694069, 1920.418091, 17.354036))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
		    MoveDynamicObject(FortKapu, 96.694069, 1920.418091, 12.354036, 2);
		else
		    SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy rend�r.");
	}
//SWAT1
	else if(PlayerToPoint(20, playerid, 1626.2834472656, -1856.1879882813, 12.547634124756))
	{
	    if(PlayerInfo[playerid][pSwattag] == 1 || IsAdmin(playerid))
		{
	    	MoveDynamicObject(swatkapu1,1621.47375, -1856.35315, 8.78574, 3);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy a SWAT Egys�g tagja!");
	}
	else if(PlayerToPoint(10, playerid, -1696.796997, 22.362562, 3.554687))
	{
	    if(PlayerInfo[playerid][pAutoker]>0 || IsAdmin(playerid))
		{
	    	MoveDynamicObject(KereskedoKapu, -1690.9190673828, 16.893825531006, 5.3280787467957, 2);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem nyithatod ki ezt a kaput!");
	}

	else if(PlayerToPoint(5, playerid, -2017.732178, -261.280273, 37.093704))
	{
	    if(PlayerInfo[playerid][pPhousekey] == 171)
		{
	    	MoveDynamicObject(KereskedoKapuHQn, -2017.735229, -261.234833, 31.499201, 2);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem nyithatod ki ezt a kaput!");

	}
	else if(PlayerToPoint(1.5, playerid, 1780.891, -1297.801, 13.375))
	{
		
		if(LMT(playerid, FRAKCIO_FBI))
		{
		
			MoveDynamicObject(Fbibelso, 1781.56238, -1299.39258, 13.70000, 3);
			SetTimer("FbiKapuBecsuk", 20000, false);
			HolTart[playerid] = NINCS;
			return 1;

		}
		else
		{
		
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 12.78430, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 12.33860, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 12.33860, 4);

			SendMessage(SEND_MESSAGE_RADIO, "FBI HQ: Figyelem minden egys�g! Illet�ktelen behatol�si k�s�rlet!", COLOR_RED, FRAKCIO_FBI);
			
			Fbibelepes = 1;
			HolTart[playerid] = NINCS;
			return 1;
		
		}
	}
	else
		SendClientMessage(playerid, COLOR_RED, "Nem vagy kapu k�zel�ben!");

	return 1;
}

ALIAS(z1r):zar;
CMD:zar(playerid,params[])
{
	#pragma unused params

	new bool:van;
	for(new k = 0; k < MAX_KAPU; k++)
	{
		if(IsPlayerInRangeOfPoint(playerid, Kapu[k][kTav], Kapu[k][kZPos][0], Kapu[k][kZPos][1], Kapu[k][kZPos][2]) && GetPlayerVirtualWorld(playerid) == Kapu[k][Vw])
		{
			if(Admin(playerid,1) || IsScripter(playerid) || KapuEngedely(playerid, k))
			{
				if(Kapu[k][kMozgo])
					MoveDynamicObject(Kapu[k][kOID], ArrExt(Kapu[k][kZPos]), Kapu[k][kSpeed]);
				else
				{
					SetDynamicObjectPos(Kapu[k][kOID], ArrExt(Kapu[k][kZPos]));
					SetDynamicObjectRot(Kapu[k][kOID], ArrExt(Kapu[k][kZRPos]));
				}
			}
			else
				Msg(playerid, "Ezt a kaput nem z�rhatod be");

			van = true;
			break;
		}
	}

	if(van)
	{
		// Nem csin�l semmit
	}
	/*else if(PlayerToPoint(5.0, playerid,  1357.6400, -1527.9961, 14.2907))
	{
		if(PlayerInfo[playerid][pAutoker]>0 || IsAdmin(playerid))
		{
			MoveDynamicObject(AutokerKapu[0], 1357.5579, -1528.3359, 14.2000, 3);
		}
		else{ Msg(playerid, "Nem nyithatod ki!");}

	}
	else if(PlayerToPoint(5.0, playerid,  1360.6237, -1470.5786, 15))
	{
		if(PlayerInfo[playerid][pAutoker]>0 || IsAdmin(playerid))
		{
			MoveDynamicObject(AutokerKapu[1], 1359.8763, -1474.0000, 15.0000, 3);
		}
		else{ Msg(playerid, "Nem nyithatod ki!");}

	}*/
	//nav
	else if(PlayerToPoint(9.0, playerid, -2432.2708,495.7582,29.9228))
	{
		if(LMT(playerid, FRAKCIO_SFPD) || IsAdmin(playerid))
		{
			MoveDynamicObject(SFPDKapu[0], -2437.47, 494.53, 31.19,3);
			MoveDynamicObject(SFPDKapu[1], -2429.23, 498.23, 31.19,3);
		}
		else {Msg(playerid, "Nem nyithatod ki!");}
	}
	//vl�
	else if(PlayerToPoint(1.5, playerid, 246.4032,72.1604,1003.6406))
	{
		if(LMT(playerid, FRAKCIO_SCPD) || LMT(playerid, FRAKCIO_FBI) || IsAdmin(playerid))
		{
			MoveDynamicObject(LSPDAjto[0], 244.92448425293, 72.571937561035, 1002.640625, 3);
			MoveDynamicObject(LSPDAjto[1], 247.93836975098, 72.613395690918, 1002.640625, 3);
		}
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(1.5, playerid, 245.1471,75.7220,1003.6406))
	{
		if(LMT(playerid, FRAKCIO_SCPD) || LMT(playerid, FRAKCIO_FBI) || IsAdmin(playerid))
		{
			MoveDynamicObject(LSPDAjto[2], 244.8291015625, 74.322265625, 1002.8529663086, 3);
			MoveDynamicObject(LSPDAjto[3], 244.80000305176, 77.2890625, 1002.8547363281, 3);
		}
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(1.5, playerid, 247.5527,76.0110,1003.6406))
	{
		if(LMT(playerid, FRAKCIO_SCPD) || LMT(playerid, FRAKCIO_FBI) || IsAdmin(playerid))
		{
			MoveDynamicObject(LSPDAjto[4], 248, 74.330642700195, 1002.640625, 3);
			MoveDynamicObject(LSPDAjto[5], 247.9700012207, 77.340270996094, 1002.640625, 3);
		}
		else Msg(playerid, "Nem nyithatod ki!");
	}
	/*else if(PlayerToPoint(10, playerid, 1547.3752441406, -1627.8746337891, 15.156204223633))
	{
		if(LMT(playerid, FRAKCIO_SCPD) || LMT(playerid, FRAKCIO_FBI) || IsAdmin(playerid))
			MoveDynamicObject(LSPDKapu[1],  1547.3752441406, -1627.8746337891, 15.156204223633, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}*//*
	else if(PlayerToPoint(3, playerid, 501.25299072266, 2150.326171875, 73.24250793457))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[0], 501.158203125, 2150.3115234375, 73.24250793457, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 493.05209350586, 2134.2416992188, 73.24250793457))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[1], 493.05209350586, 2134.2416992188, 73.24250793457, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 486.06985473633, 2157.6770019531, 73.241966247559))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[2], 486.09765625, 2157.6640625, 73.241966247559, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 486.0888671875, 2142.8662109375, 73.241966247559))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[3], 486.1025390625, 2142.8115234375, 73.241966247559, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 347.14822387695, 2258.4675292969, 68.162895202637))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[4], 347.1083984375, 2258.53125, 68.562896728516, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 366.9912109375, 2269.9091796875, 68.162895202637))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[5], 366.9853515625, 2269.9638671875, 68.542892456055, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 374.66009521484, 2259.7258300781, 68.162895202637))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[6], 374.69921875, 2259.7568359375, 68.599884033203, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 369.14831542969, 2247.8674316406, 68.162895202637))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[7], 369.17364501953, 2247.8354492188, 68.522895812988, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid,  358.26196289063, 2241.5490722656, 68.162895202637))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[8], 358.2971496582, 2241.4477539063, 68.552894592285, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 346.97393798828, 2235.0319824219, 71.452285766602))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[9], 346.97393798828, 2235.0319824219, 71.452285766602, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 1765.0519,-1577.7461,1734.9430) || PlayerToPoint(3, playerid, 1761.3695,-1577.8676,1734.9430) || PlayerToPoint(3, playerid, 1757.2570,-1578.3303,1734.9430))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[10], 1757.1634521484, -1588.1893310547, 1735.8120117188, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 1778.4402,-1577.5663,1734.9430) || PlayerToPoint(3, playerid, 1774.0573,-1577.8120,1734.9430) || PlayerToPoint(3, playerid, 1770.0316,-1577.9769,1734.9430))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[11],  1779.0579833984, -1587.5596923828, 1735.8120117188, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 1766.0846,-1578.1926,1738.7173) || PlayerToPoint(3, playerid, 1761.9205,-1578.6665,1738.7173) || PlayerToPoint(3, playerid, 1757.2748,-1578.4095,1738.7173))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[12],  1757.1630859375, -1588.1884765625, 1739.5620117188, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 1777.8969,-1578.2285,1738.7173) || PlayerToPoint(3, playerid, 1773.6508,-1578.5394,1738.7173) || PlayerToPoint(3, playerid, 1770.3903,-1578.5159,1738.7173))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[13],  1779.0576171875, -1587.5595703125, 1739.5625, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 1757.3049,-1568.6636,1734.9430) || PlayerToPoint(3, playerid, 1760.8292,-1568.5592,1734.9430) || PlayerToPoint(3, playerid, 1764.7097,-1568.5317,1734.9430))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[14],  1756.6878662109, -1558.7972412109, 1735.8120117188, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 1770.7676,-1568.6954,1734.9430) || PlayerToPoint(3, playerid, 1774.3579,-1568.0826,1734.9430) || PlayerToPoint(3, playerid, 1778.5599,-1567.6423,1734.9430))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[15],  1778.7756347656, -1558.3518066406, 1735.8120117188, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 1757.5356,-1567.8169,1738.6935) || PlayerToPoint(3, playerid, 1760.9333,-1568.3413,1738.6935) || PlayerToPoint(3, playerid, 1765.0258,-1567.9735,1738.6935))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[16],  1756.6875, -1558.796875, 1739.5617675781, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 1773.8770,-1567.2980,1738.6935) || PlayerToPoint(3, playerid, 1769.7799,-1567.3806,1738.6935) || PlayerToPoint(3, playerid, 1778.3804,-1567.4862,1738.6937))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
			MoveDynamicObject(ftelepkapu[17],  1778.775390625, -1558.3515625, 1739.5620117188, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(10, playerid, -1349.1685791016, 472.1936340332, 8.9608917236328))
	{
		if(LMT(playerid, FRAKCIO_SFPD) || IsAdmin(playerid))
			MoveDynamicObject(Katonakapu[0], -1349.1685791016, 472.1936340332, 8.9608917236328, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(10, playerid, -1422.0300292969, 494.76760864258, 4.8124537467957))
	{
		if(LMT(playerid, FRAKCIO_SFPD) || IsAdmin(playerid))
			MoveDynamicObject(Katonakapu[1], -1422.0300292969, 494.76760864258, 4.8124537467957, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(10, playerid, -1039.0400390625, -588.142578125, 33.356178283691))
	{
		if(LMT(playerid, FRAKCIO_SFPD) || IsAdmin(playerid))
			MoveDynamicObject(Katonakapu[2],-1039.0400390625, -588.142578125, 33.356178283691, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(10, playerid,  -1014.3894042969, -650.97711181641, 32.082801818848))
	{
		if(LMT(playerid, FRAKCIO_SFPD) || IsAdmin(playerid))
			MoveDynamicObject(Katonakapu[3],  -1014.3894042969, -650.97711181641, 32.082801818848, 3);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(10, playerid, -2242.9084472656, 643.27691650391, 48.45153427124))
	{
		if(LMT(playerid, FRAKCIO_YAKUZA) || IsAdmin(playerid))
			MoveDynamicObject(Yakuzakapu[1], -2242.9084472656, 643.27691650391, 48.45153427124,3);
		else Msg(playerid, "Nem nyithatod ki ezt a kaput!");
	}
	else if(PlayerToPoint(10, playerid, -2157.3999023438, 453.06936645508, 37.700000762939))
	{
		if(LMT(playerid, FRAKCIO_YAKUZA) || IsAdmin(playerid))
			MoveDynamicObject(Yakuzakapu[2],-2157.3999023438, 453.06936645508, 37.700000762939,3);
		else Msg(playerid, "Nem nyithatod ki ezt a kaput!");
	}*/
	else if(PlayerToPoint(5, playerid, 2118.0407714844, -2274.5852050781, 19.675098419189))
	{
		if(LMT(playerid, FRAKCIO_GSF) ||IsAdmin(playerid))
			SetDynamicObjectRot(GSFAjto, 0, 0, 315);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	else if(PlayerToPoint(3, playerid, 353.48245239258, 165.39109802246, 1024.7963867188))
	{
		if(LMT(playerid, FRAKCIO_ONKORMANYZAT) || IsAdmin(playerid))
			SetDynamicObjectRot(OnkormanyzatAjto[0], 0, 0, 0);
		else Msg(playerid, "Nem nyithatod ki!");
	}
	/*else if(PlayerToPoint(15, playerid, 1041.4748535156, -1459.7044677734, 15))
	{
	    if(LMT(playerid, FRAKCIO_OKTATO) || IsAdmin(playerid))
	    	MoveDynamicObject(OktatoKapu, 1041.4748535156, -1459.7044677734, 15, 2);
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy az Oktat�k tagja!");
	}
*/
	else if(PlayerToPoint(7, playerid, -1917.303833, 301.403687, 40.874542))
	{
		if(PlayerInfo[playerid][pSzerelo]>0 || IsAdmin(playerid))
			MoveDynamicObject(AutoSzereloKapu, -1917.303833, 301.403687, 40.874542, 2);
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy aut�szerel�!");
	}
 	else if(PlayerToPoint(10, playerid, -1627.539185, 688.910339, 15.875875))
	{
	    if(IsACop(playerid) || IsAdmin(playerid))
	    	MoveDynamicObject(sfpdkapu, -1627.539185, 688.910339, 15.875875, 2);
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy az SFPD tagja!");
	}

	/*else if(PlayerToPoint(15, playerid, 777.7919921875, -1384.720703125, 13.066568374634))
	{
	    if(LMT(playerid, FRAKCIO_NAV) || IsAdmin(playerid))
	    	MoveDynamicObject(VPOPkapu1, 777.7919921875, -1384.720703125, 13.066568374634, 2);
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy a VPOP tagja!");
	}

	else if(PlayerToPoint(15, playerid, 777.6494140625, -1330.0947265625, 12.966569900513))
	{
	    if(LMT(playerid, FRAKCIO_NAV) || IsAdmin(playerid))
	    	MoveDynamicObject(VPOPkapu2, 777.6494140625, -1330.0947265625, 12.966569900513, 2);
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy a VPOP tagja!");
	}
*/

	else if(PlayerToPoint(10, playerid, 96.694069, 1920.418091, 17.354036))
	{
		if(IsACop(playerid) || IsAdmin(playerid))
		    MoveDynamicObject(FortKapu, 96.694069, 1920.418091, 17.354036, 2);
		else
		    SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy rend�r.");
	}
//SWAT1
	else if(PlayerToPoint(20, playerid, 1626.2834472656, -1856.1879882813, 12.547634124756))
	{
	    if(PlayerInfo[playerid][pSwattag] == 1 || IsAdmin(playerid))
		{
	    	MoveDynamicObject(swatkapu1,1621.47375, -1856.35315, 16.36366, 3);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy a SWAT Egys�g tagja!");
	}

	else if(PlayerToPoint(10, playerid, -1696.796997, 22.362562, 3.554687))
	{
	    if(PlayerInfo[playerid][pAutoker]>0 || IsAdmin(playerid))
		{
	    	MoveDynamicObject(KereskedoKapu, -1697.0, 23.0, 5.3280787467957, 2);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem z�rhatod be ezt a kaput!");
	}

	else if(PlayerToPoint(5, playerid, -2017.732178, -261.280273, 37.093704))
	{
	    if(PlayerInfo[playerid][pPhousekey] == 171)
		{
	    	MoveDynamicObject(KereskedoKapuHQn, -2017.732178, -261.280273, 37.093704, 2);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem z�rhatod be ezt a kaput!");
	}

	else
	    SendClientMessage(playerid, COLOR_RED, "Nem vagy kapu k�zel�ben!");

	return 1;
}

ALIAS(clubri4):rio;
ALIAS(clubrio):rio;
ALIAS(rioclub):rio;
CMD:rio(playerid, params[])
{
	new func[6];

	if(sscanf(params, "s[5]", func)) return Msg(playerid,"/rio [info]");

	if(PlayerInfo[playerid][pBizniszKulcs] != BIZ_DISCO && PlayerInfo[playerid][pPbiskey] != BIZ_DISCO && !SAdmin(playerid, 6) && !IsScripter(playerid)) return 1;

	if(egyezik(func,"info"))
	{
		Msg(playerid, "{6EF83C}((Jelenleg fejleszt�s alatt �ll! �tletek �gy�ben keresd a Scriptereket vagy a biznisz �tletek alf�rumot!))");
	}
	return 1;
}