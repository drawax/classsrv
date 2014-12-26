#if defined __game_system_commands
	#endinput
#endif
#define __game_system_commands

/****************************
 *           cmdk           *
 *    á: 1   ó: 4   ú: 7    *
 *    é: 2   ö: 5   ü: 8    *
 *    í: 3   õ: 6   û: 9    *  
 ****************************/

CMD:adminfelirat(playerid, params[])//feliratot rak a fejed fölés by Amos
{
	if(IsSuper(playerid))
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

ALIAS(fecs):fme;
ALIAS(fejcselekv2s):fme; //feje fölé írja a cselekvést by Amos
CMD:fme(playerid, params[])
{
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0) return Msg(playerid, "Most nem beszélhetsz!");
	if(Leutve[playerid]) return Msg(playerid,"Leütve nem cselekedhetsz semmit!");
	new result[100], string[140];
	if(sscanf(params, "s[100]", result))
	{
		Msg(playerid, "Használat: /fme [leírás]");
		Msg(playerid, "A kikapcsolásához: /fme ki");
		return 1;
	}
	if(strlen(result) >30) return Msg(playerid, "A leírásnak hosszabbnak kell lennie, mint 30 karakter.");
	if(strcmp(result, "ki", true) == 0)
	{
		if(acselekves[playerid] == 0) return Msg(playerid, "Most már nincsen felirat a fejed fölött.");
		DestroyDynamic3DTextLabel(cselekvesfelirat[playerid]);
		Msg(playerid, "/fme törölve.");
		acselekves[playerid] = 0;
		return 1;
	}
	if(acselekves[playerid] == 0)
	{
		format(string, sizeof(string), "*[%d] %s *", playerid);
		cselekvesfelirat[playerid] = CreateDynamic3DTextLabel(string, COLOR_PURPLE, 0.0, 0.0, 0.0, 40.0, playerid);
		format(string, sizeof(string), "Cselekvés: %s", string);
		Msg(playerid, "/fme kirakva a fejed fölé.");
		SendClientMessage(playerid, COLOR_PURPLE, string);
		acselekves[playerid] = 1;
	}
	else
	{
		format(string, sizeof(string), "*[%d] %s *", playerid);
		UpdateDynamic3DTextLabelText(cselekvesfelirat[playerid], COLOR_PURPLE, string);
		format(string, sizeof(string), "Cselekvés: %s", string);
		SendClientMessage(playerid, COLOR_PURPLE, string);
		return 1;
	}
	return 1;
}
CMD:fdo(playerid, params[])// Feje fölé írja a történést by Amos 
{
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0) return Msg(playerid, "Most nem beszélhetsz!");
	new result[100], string[140];
	if(sscanf(params, "s[100]", result))
	{
		Msg(playerid, "Használat: /fdo [leírás]");
		Msg(playerid, "A kikapcsolásához: /fdo ki");
		return 1;
	}
	if(strlen(result) >30) return Msg(playerid, "A leírásnak hosszabbnak kell lennie, mint 30 karakter.");
	if(strcmp(result, "ki", true) == 0)
	{
		if(atortenet[playerid] == 0) return Msg(playerid, "Most már nincsen felirat a fejed fölött.");
		DestroyDynamic3DTextLabel(tortenesfelirat[playerid]);
		Msg(playerid, "/fdo törölve.");
		atortenet[playerid] = 0;
		return 1;
	}
	if(acselekves[playerid] == 0)
	{
		format(string, sizeof(string), "*[%d] %s *", playerid);
		tortenesfelirat[playerid] = CreateDynamic3DTextLabel(string, COLOR_BLUE, 0.0, 0.0, 0.0, 40.0, playerid);
		format(string, sizeof(string), "Történés: %s", string);
		Msg(playerid, "/fdo kirakva a fejed fölé.");
		SendClientMessage(playerid, COLOR_BLUE, string);
		atortenet[playerid] = 1;
	}
	else
	{
		format(string, sizeof(string), "*[%d] %s *", playerid);
		UpdateDynamic3DTextLabelText(tortenesfelirat[playerid], COLOR_BLUE, string);
		format(string, sizeof(string), "Történés: %s", string);
		SendClientMessage(playerid, COLOR_BLUE, string);
		return 1;
	}
	return 1;
}

CMD:fnv(playerid, params[])// Feje fölé írja a cselekvést név nélkül by Amos 
{
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0) return Msg(playerid, "Most nem beszélhetsz!");
	new result[100], string[140];
	if(sscanf(params, "s[100]", result))
	{
		Msg(playerid, "Használat: /fnv [leírás]");
		Msg(playerid, "A kikapcsolásához: /fnv ki");
		return 1;
	}
	if(strlen(result) >100) return Msg(playerid, "A leírásnak hosszabbnak kell lennie, mint 100 karakter.");
	if(strcmp(result, "ki", true) == 0)
	{
		if(vacselekves[playerid] == 0) return Msg(playerid, "Most már nincsen felirat a fejed fölött.");
		DestroyDynamic3DTextLabel(valakifelirat[playerid]);
		Msg(playerid, "/fnv törölve.");
		vacselekves[playerid] = 0;
		return 1;
	}
	if(acselekves[playerid] == 0)
	{
		format(string, sizeof(string), "*[%d] %s *", PlayerInfo[playerid][pBID]);
		valakifelirat[playerid] = CreateDynamic3DTextLabel(string, COLOR_BLUE, 0.0, 0.0, 0.0, 40.0, playerid);
		format(string, sizeof(string), "Cselekvés: %s", string);
		Msg(playerid, "/fnv kirakva a fejed fölé.");
		SendClientMessage(playerid, COLOR_BLUE, string);
		vacselekves[playerid] = 1;
	}
	else
	{
		format(string, sizeof(string), "*[%d] %s *", PlayerInfo[playerid][pBID]);
		UpdateDynamic3DTextLabelText(valakifelirat[playerid], COLOR_BLUE, string);
		format(string, sizeof(string), "Cselekvés: %s", string);
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
ALIAS(adafk):adminafk;
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


ALIAS(gy4gyszereim):gyogyszereim;
CMD:gyogyszereim(playerid, params[])
{
	Cselekves(playerid, "megnézte a gyógyszertáskáját.");
	ShowGyogyszerTaska(playerid, playerid);
	return 1;
}

ALIAS(sokkolo):tazer;
ALIAS(sokkol4):tazer;
CMD:tazer(playerid, params[])
{
	if(!IsACop(playerid)) return Msg(playerid, "Nem vagy rendõr!");
	if(!OnDuty[playerid]) return Msg(playerid, "Nem vagy szolgálatban!");
	if(IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Jármûben nem használhatod.");
	if(WeaponArmed(playerid) != WEAPON_DEAGLE && WeaponArmed(playerid) != WEAPON_SILENCED) return Msg(playerid, "Erre a fegyverre nem szerelheted fel a sokkolót.");
	if(!Tazer[playerid]) Tazer[playerid] = true, SendClientMessage(playerid, COLOR_LIGHTGREEN, "Sokkoló bekapcsolva.");
	else Tazer[playerid] = false, SendClientMessage(playerid, COLOR_LIGHTGREEN, "Sokkoló kikapcsolva.");
	return 1;
} 
 
ALIAS(5l2sid6):olesido;
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

ALIAS(segitseg):help;
ALIAS(seg3ts2g):help;
CMD:help(playerid, params[])
{
	new type[32];
	if(sscanf(params, "s[16]", type)) return Msg(playerid, "/help [alap/munka/ház/jármû/biznisz/leader/hal/sütés/irc/egyéb]");
	if(egyezik(type, "alap"))
	{
		Msg(playerid, "Felhasználói parancsok: /login /stats /zsebem /jelszovaltas", false, COLOR_YELLOW);
		Msg(playerid, "Adminisztrátori segítségkérés: /report join [0-3] /ü | Privát üzenet küldés: /pm", false, COLOR_YELLOW);
		Msg(playerid, "Cselekvések kifejezõi: /me /fme /fnv /va /megpróbál(ja) | Történések kifejezõi: /do /fdo", false, COLOR_YELLOW);
		Msg(playerid, "Kommunikáció: /o /s /c /l /b | Frakció Rádió: /r /rb /togradio", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "munka"))
	{
		if(AMT(playerid, MUNKA_DETEKTIV))
			Msg(playerid,"Detektív: /find /adat", false, COLOR_YELLOW);
	    if(AMT(playerid, MUNKA_UGYVED))
			Msg(playerid,"Ügyvéd: /free", false, COLOR_YELLOW);
		if(PlayerInfo[playerid][pSzerelo]>0)
		{
			Msg(playerid,"Autószerelõ: /szerelés /szerelõduty", false, COLOR_YELLOW);
			Msg(playerid,"Megjegyzés: Az alap kocsik feljavításáért az önkormányzat fizet. PL.: Kamion, úttisztító stb...", false, COLOR_YELLOW);
		}
	    if(AMT(playerid, MUNKA_TESTOR))
			Msg(playerid,"Testõr: /guard", false, COLOR_YELLOW);
		if(PlayerInfo[playerid][pAutoker]>0)
			Msg(playerid,"Autókereskedõ: (/k)ereskedõ | Importálás: /call 12345 | /autoker | /ar", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_PIZZAS))
			Msg(playerid,"Pizzafutár: /pizza", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_PENZ))
			Msg(playerid,"Pénzszállító: /psz vagy /pénzszállító", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_POSTAS))
			Msg(playerid,"Postás: /feltölt /postás", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_PILOTA))
			Msg(playerid,"Pilóta: /utasszállítás", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_UTTISZTITO))
			Msg(playerid,"Úttisztító: /úttisztítás", false, COLOR_YELLOW);
		if(!IsACop(playerid))
			Msg(playerid,"Prostituált: /sex", false, COLOR_YELLOW);
		if(IsBanda(playerid))
			Msg(playerid,"Drogkereskedõ: /szed /készít", false, COLOR_YELLOW);
	    if(!IsACop(playerid))
			Msg(playerid,"Autótolvaj: /car /ellop", false, COLOR_YELLOW);
		if(IsMaffia(playerid))
			Msg(playerid,"Fegyverkereskedõ: /felvesz /készít", false, COLOR_YELLOW);
        if(!IsACop(playerid))
			Msg(playerid,"Hacker: /hack", false, COLOR_YELLOW);
		if(!IsACop(playerid))
			Msg(playerid,"Páncélkészítõ: /készít", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_KAMIONOS))
			Msg(playerid,"Kamionos: /kamion /kr(kamionrádió)", false, COLOR_YELLOW);
        if(AMT(playerid, MUNKA_FARMER))
			Msg(playerid,"Farmer: /farmerkedés /alma /vetes", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_FUNYIRO))
			Msg(playerid,"Fûnyíró: /fûnyírás", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_EPITESZ))
			Msg(playerid,"Építész: /felújítás", false, COLOR_YELLOW);
		//if(AMT(playerid, MUNKA_KUKAS))
			//Msg(playerid,"Kukás: /kuka", false, COLOR_YELLOW);
		if(AMT(playerid, MUNKA_VADASZ))
			Msg(playerid,"Vadász: /vadász", false, COLOR_YELLOW);
		if(LMT(playerid, FRAKCIO_MENTO) || LMT(playerid, FRAKCIO_SFMENTO))
			Msg(playerid, "OMSZ: /r, /rb, /d, /heal, /duty, /mk, /segit, /lista, /accept medic, /nyit, /zar, /fizetesek, /mvisz", false, COLOR_YELLOW);
		if(IsHitman(playerid))
		    Msg(playerid,"Hitman: /portable /(h)itman(r)ádió /méreg /hitmansms /lehallgat /getskin2 /laptop ((Fontos: ölés elõtt laptopba lépj munkába))", false, COLOR_YELLOW);
   		if(IsDirector(playerid))
       		Msg(playerid, "Hitman Director: /hitman /hitmannév", false, COLOR_YELLOW);
		if(IsOnkentes(playerid))
			Msg(playerid, "Önkéntes Mentõs: /ör /örb /önkéntesek /önkéntesduty /segit /heal /lista /accept medic /mvisz", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "ház"))
		Msg(playerid, "/enter /exit /open /home /heal /houseupgrade (/hu)", false, COLOR_YELLOW);
	elseif(egyezik(type, "jármû") || egyezik(type, "jarmu"))
	{
		Msg(playerid, "/motor /fill /fillcar /kanna", false, COLOR_YELLOW);
		Msg(playerid, "/v /öröktuning /tuning /kocsi", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "biznisz") || egyezik(type, "business"))
		Msg(playerid, "/biznisz /bizutalás", false, COLOR_YELLOW);
	elseif(egyezik(type, "leader"))
	{
		Msg(playerid,"/invite /uninvite /giverank /széf /raktár /quitfaction", false, COLOR_YELLOW);
		if(PlayerInfo[playerid][pLeader] == 7)
			Msg(playerid,"/givetax", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "fish") || egyezik(type, "hal"))
	{
		Msg(playerid,"/fish (Megpróbálsz halat fogni) /fishes (Megmutatja a kifogott halakat)", false, COLOR_YELLOW);
		Msg(playerid,"/throwback (Elengeded a legutóbbi kifogott halat) /throwbackall(Minden halat visszadobsz)", false, COLOR_YELLOW);
		Msg(playerid,"/releasefish (Elengeded az egyik halat)", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "sütés") || egyezik(type, "sutes") || egyezik(type, "cook"))
	{
		Msg(playerid,"/fõzés (Kiírja a lehetõségeket) /megfõzve (Kiírja miket fõztél meg)", false, COLOR_YELLOW);
		Msg(playerid,"/enni (Megeszed a fõztöd)", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "irc"))
	{
		Msg(playerid,"/irc join /irc leave /irc password", false, COLOR_YELLOW);
		Msg(playerid,"/irc password /irc needpass /irc lock", false, COLOR_YELLOW);
		Msg(playerid,"/irc admins /irc motd /irc status /i", false, COLOR_YELLOW);
	}
	elseif(egyezik(type, "egyéb") || egyezik(type, "egyeb"))
	{
		Msg(playerid,"/átad /f /eldob /accept /cancel /pay /pays /nyit /zar /enter /exit /carresi /zenecím", false, COLOR_YELLOW);
		Msg(playerid,"/zuhanok /r /rb /bérszéf /bankszámla /laptopom /menu /buy /service /ölésidõ", false, COLOR_YELLOW);
	}
	return 1;
}
ALIAS(specjogsi):jspecial; // /jspecial már megy /specjogsira is by Amos
CMD:jspecial(playerid, params[])
{
	if(!Munkarang(playerid, 4)) return Msg(playerid, "Minimum 4-es rang kell hogy használhasd!");
	if(!LMT(playerid,FRAKCIO_OKTATO)) return Msg(playerid, "Csak oktató!");
	
	new player, km, jogsinev[128];
	if(sscanf(params, "rds[128]", player,km,jogsinev)) return Msg(playerid,"/jspecial [id] [KM] [jogsineve]");

	
	if(player == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen játékos");
			
	if(GetDistanceBetweenPlayers(playerid, player) > 2) return Msg(playerid, "Nincs a közeledben!");
	
	format(PlayerInfo[player][pSpecialJogsiNev],128,"%s",jogsinev);
	PlayerInfo[player][pSpecialJogsiKm] = float(km)*1000.0;
	SendFormatMessage(playerid,COLOR_YELLOW,"[SPECIÁLIS JOGOSÍTVÁNYT ADTÁL] Megnevezés: %s, KM: %.3f",PlayerInfo[player][pSpecialJogsiNev],PlayerInfo[player][pSpecialJogsiKm]/1000.0);
	SendFormatMessage(player,COLOR_YELLOW,"[SPECIÁLIS JOGOSÍTVÁNY KAPTÁL] Megnevezés: %s, KM: %.3f",PlayerInfo[player][pSpecialJogsiNev],PlayerInfo[player][pSpecialJogsiKm]/1000.0);
	return 1;
}
CMD:kikerdez(playerid, params[])
{
	if(GetPlayerVirtualWorld(playerid)!=1555) return Msg(playerid, "A.A");
	if(FloodCheck(playerid,10)) return 1;
	if(!PlayerToPoint(3, playerid, 1913.67269229, -2415.88067467, 13.9656142578)) return Msg(playerid, "Nincs a közeledben!");
	new result[128];
	if(!IsACop(playerid))
	{
		format(result, 128, "Pénztáros: Csak rendõröknek beszélek!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	elseif(Rob < 2500) 
	{
		format(result, 128, "Pénztáros: Nem tudok semmi érdekeset mondani önöknek!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	else
	{
		
		format(result, 128, "Pénztáros: Kérem bejöttek ide cirka %d fó, és rámfogták a fegyvert!",LSBankRablok);
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		
		format(result, 128, "Pénztáros: Azt a személyt biztos felismerem aki rám fogta a fegyvert és órdított!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		Msg(playerid,"/felismeri ID");
		return 1;
	}

}
CMD:felismeri(playerid, params[])
{
	if(GetPlayerVirtualWorld(playerid)!=1555) return Msg(playerid, "A.A");
	if(!PlayerToPoint(3, playerid, 1913.67269229, -2415.88067467, 13.9656142578)) return Msg(playerid, "Nincs a közeledben!");
	new rablo;
	new result[128];
	if(sscanf(params, "r", rablo)) return Msg(playerid,"id?");

	if(!PlayerToPoint(3, rablo, 1913.67269229, -2415.88067467, 13.9656142578)) return Msg(playerid, "Nincs a közelben a megjelölt személy!");
	if(!IsACop(playerid))
	{
		format(result, 128, "Pénztáros: Csak rendõröknek beszélek!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	elseif(Rob < 2500) 
	{
		format(result, 128, "Pénztáros: Nem tudok semmi érdekeset mondani önöknek!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	elseif(RabloID == rablo)
	{
		format(result, 128, "Pénztáros:Felismerem õt õ volt az!");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	}
	else
	{
		format(result, 128, "Pénztáros: Nem ismerem így fel, nem õ órdított rám, de lehet hogy itt volt, nem tudom.");
		ProxDetector(B_Tavol, BankNPC, result, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE, COLOR_LIGHTBLUE);
		return 1;
	
	}
}

ALIAS(ment6st1ska):mentostaska;
CMD:mentostaska(playerid, params[])
{
	if(LMT(playerid, FRAKCIO_MENTO)){
		OMSZTaskaInfo(playerid);
		Cselekves(playerid, "megnézte a Mentõs táskája tartalmát");}
	return 1;
}

CMD:zuhanok(playerid, params[])
{
	if(AfterLoginTime[playerid] < UnixTime) return Msg(playerid, "Nem használhatod ezt a parancsot, mert több, mint 15 másodperce léptél be!");
	new Float:pos[3];
	GetPlayerPos(playerid, ArrExt(pos));
	SetPlayerPosFindZ(playerid, ArrExt(pos));
	Msg(playerid, "Teleportálva");
	ABroadCastFormat(COLOR_LIGHTRED, 1, "<< %s alkalmazta a /zuhanok parancsot, így a legközelebbi szilárd helyre került >>", PlayerName(playerid));
	AfterLoginTime[playerid] = 0;
	return 1;
}

ALIAS(korhaz):k4rh1z;
CMD:k4rh1z(playerid, params[])
{
	if(!PlayerToPoint(20,playerid,1944.6885,-2458.5464,13.5703) || GetPlayerVirtualWorld(playerid) != 104) return Msg(playerid, "Nem vagy kórházban!");
	
	if(KorhazIdo[playerid] > 0)  return Msg(playerid,"Szeretnéd mi?!");
	
	if(MentoOnline() > 3) return Msg(playerid, "Van fent bõven mentõs, keresd inkább õket!");
	new Float:elet;
	if(GetPlayerHealth(playerid,elet) > 100.0) return Msg(playerid, "Túj jól vagy a kórházi ellátáshoz!");
		
	
	new ido = floatround(150.0 - elet);
	
	if(!BankkartyaFizet(playerid,ido*1000)) return SendFormatMessage(playerid,COLOR_YELLOW,"A kórházi díj: %s Ft",FormatInt(ido*1000));
	
	FrakcioSzef(FRAKCIO_MENTO,ido*1000);
	
	SendFormatMessage(playerid,COLOR_YELLOW,"Befeküdtél a kórházba ellátásra. Fellépülési idõd: %d",ido);
	Jail(playerid,"+",ido,"korhaz","Kórház fellépülés");
	
	SetPlayerHealth(playerid, 150.0);
	return 1;
}
CMD:carresiset(playerid, params[])
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
ALIAS(gyogyszer):gy4gyszer;
CMD:gy4gyszer(playerid, params[])
{
	new param[32];
	
	if(GyogyszerTime[playerid] > 0) return SendFormatMessage(playerid,COLOR_LIGHTRED,"A-A ez túl sûrû! %d sec",GyogyszerTime[playerid]);
	
	if(sscanf(params, "s[32]", param)) 
	{
		Msg(playerid,"/gyógyszer [aspirin / cataflan / info]");
		
		return 1;
	}
	if(egyezik(param, "info"))
	{
		Msg(playerid, "Hogy ne lehessen használni õket lövöldözés közben, akit meglõttek nem tudja használni a termékeket!");
		Msg(playerid,"Aspirin: 10 hp-t tölt /db-ja. Kizárólag akkor használható ha a HP-d több mint 70!");
		Msg(playerid,"Cataflan: 15 HP-t tölt /db-ja. Kizárólag akkor használható ha a HP-d 50 - 80 között van!");
		return 1;
	}
	if(PlayerInfo[playerid][pLoves] > UnixTime)	return SendFormatMessage(playerid,COLOR_LIGHTRED,"Nem használhatod nem rég meglõttek: %d sec",PlayerInfo[playerid][pLoves]-UnixTime);
	if(egyezik(param, "aspirin"))
	{
		if(PlayerInfo[playerid][pAspirin] < 1) return Msg(playerid, "Nincs aspirined!");
		new Float:hp;
		GetPlayerHealth(playerid,hp);
		if(hp < 70.0) return Msg(playerid, "Ez a gyógyszer már kevés!");
		
		Cselekves(playerid,"bevett egy gyógyszert!");
		
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
		if(hp < 50.0) return Msg(playerid, "Ez a gyógyszer már kevés!");
		if(hp > 80.0) return Msg(playerid, "Ez a gyószer már erõs, ehhez túl jól vagy!");
		
		Cselekves(playerid,"bevett egy gyógyszert!");
		
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
		Msg(playerid,"/taxi [lista / fogad / lemond / díj / duty]");
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
			Cselekves(playerid, "visszaöltözött!");
			return 1;
		}
		else
		{
			Taxi[playerid][tDuty] = true;
			OnDuty[playerid] = true;
			
			Taxi[playerid][tFizetes] = 0;
			new string[128];
			format(string, sizeof(string), "Taxi Sofõr %s szolgálatban van, viteldíj: %dFt/Km", ICPlayerName(playerid), FrakcioInfo[FRAKCIO_TAXI][fDij]);
			SendClientMessageToAll(TEAM_GROVE_COLOR,string);
			Msg(playerid, "/taxi lista");
			
			Cselekves(playerid, "átöltözött a munkaruhájába", 0);
			
			Munkaruha(playerid, 1);
			Taxi[playerid][tDuty] = true;
			return 1;
		}
		
	}
	if(egyezik(param, "lista"))
	{
		

		SendClientMessage(playerid, COLOR_WHITE, "======= [Híváslista] =======");
		foreach(Jatekosok, x)
			if(TaxiHivas[x] == 1) SendFormatMessage(playerid, COLOR_GREY, "[%d][%s]", x, ICPlayerName(x));
		SendClientMessage(playerid, COLOR_WHITE, "======= [Híváslista] =======");
		
		return 1;
	}
	if(egyezik(param, "fogad"))
	{
	
		if(Taxi[playerid][tHivas]) return Msg(playerid, "Már fogadtál hívást! Vond vissza ha nem kell! /taxi lemond");
		if(!Taxi[playerid][tDuty]) return Msg(playerid, "Nem  vagy szolgálatban!");
		
		new jatekos;
		foreach(Jatekosok, x)
			if(TaxiHivas[x] == 1) jatekos = x;

		if(TaxiHivas[jatekos] != 1) return Msg(playerid, "Nem hívott taxit!");
		TaxiHivas[jatekos] = 2;
		foreach(Jatekosok, x)
		{
			if(AdminDuty[x] == 0 && ScripterDuty[x] == 0)
				SetPlayerMarkerForPlayer(playerid, x, COLOR_INVISIBLE);
		}
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Fogadtad %s hívását!", ICPlayerName(jatekos));
		SendFormatMessage(jatekos, COLOR_LIGHTGREEN, "%s fogadta a hívásod!", ICPlayerName(playerid));
		SendFormatMessageToAll(COLOR_GREEN, "Taxi sofõr %s fogadta %s hívását", ICPlayerName(playerid), ICPlayerName(jatekos));
		SetPlayerMarkerForPlayer(playerid, jatekos, COLOR_YELLOW);
		SetPlayerMarkerForPlayer(jatekos, playerid, COLOR_YELLOW);
		
		TaxiHivasJelzes[playerid] = jatekos;
		Taxi[playerid][tHivas] = true;
		
		new taxiszoveg[64];
		format(taxiszoveg, 64, "Taxisofõr HÍVÁSRA MEGY\nViteldíj: %d Ft / KM",FrakcioInfo[FRAKCIO_TAXI][fDij]);
		
		new vehicleid = GetPlayerVehicleID(playerid);
		if(IsValidDynamic3DTextLabel(TAXITEXT[vehicleid])) DestroyDynamic3DTextLabel(TAXITEXT[vehicleid]), TAXITEXT[vehicleid]=INVALID_3D_TEXT_ID;
		TAXITEXT[vehicleid] = CreateDynamic3DTextLabel(taxiszoveg, COLOR_YELLOW_TAXI, 0.0, 0.0, 2.0, 20.0, INVALID_PLAYER_ID, vehicleid, 1);
		
		return 1;
	
	}
	if(egyezik(param, "lemond"))
	{
		if(!Taxi[playerid][tHivas]) return Msg(playerid, "Nincs mit lemondani!");
		
		Taxi[playerid][tHivas] = false;
		SendFormatMessage(TaxiHivasJelzes[playerid], COLOR_LIGHTGREEN, "Taxisofõr %s lemondta a szállítást, nem megy érted!",ICPlayerName(playerid));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Lemondtad %s hívását!",ICPlayerName(TaxiHivasJelzes[playerid]));
		TaxiHivasJelzes[playerid] = NINCS;
		
		SetPlayerMarkerForPlayer(playerid, TaxiHivasJelzes[playerid], COLOR_INVISIBLE);
		SetPlayerMarkerForPlayer(TaxiHivasJelzes[playerid], playerid, COLOR_INVISIBLE);
		return 1;
	}
	if(egyezik(param, "díj") || egyezik(param,"dij"))
	{
		if(!PlayerInfo[playerid][pLeader]) return Msg(playerid, "Csak leader!");
		if(sscanf(func, "d", FrakcioInfo[FRAKCIO_TAXI][fDij])) return Msg(playerid, "/taxi díj [ára]");
	
		SendFormatMessage(playerid,COLOR_YELLOW,"Egységes díj átírva: %s Ft",FormatInt(FrakcioInfo[FRAKCIO_TAXI][fDij]));
		
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
ALIAS(5r5kkulcs):orokkulcs;
CMD:orokkulcs(playerid, params[])
{
	new pm[32], pid, kid, spm[32], jarmu;
	if(PlayerInfo[playerid][pPcarkey] == NINCS && PlayerInfo[playerid][pPcarkey2] == NINCS && PlayerInfo[playerid][pPcarkey3] == NINCS) return Msg(playerid, "Nincs jármûved.");
	if(sscanf(params, "s[32]S()[32]", pm, spm)) { Msg(playerid, "/örökkulcs [ad/elvesz]"); if(Admin(playerid, 1337)) Msg(playerid, "/örökkulcs töröl"); return true; }
	if(egyezik(pm, "ad"))
	{
		if(sscanf(spm, "ri", pid, kid)) return Msg(playerid, "/örökkulcs ad [név/id] [1/2/3]");
		if(pid == INVALID_PLAYER_ID || pid == playerid) return Msg(playerid, "Nem létezõ játékos");
		if(GetDistanceBetweenPlayers(playerid, pid) > 3.0) return Msg(playerid, "Nincs a közeledben a játékos.");
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
		else return Msg(playerid, "Úgy tudom csak 3 jármûved lehet.. nem? :)");
		
		if(CarInfo[jarmu][cKulcsok][0] != NINCS && CarInfo[jarmu][cKulcsok][1] != NINCS) return Msg(playerid,"Csak két pótkulcs van hozzá, amiket már átadtál valakinek!");
		if(PlayerInfo[pid][pKulcsok][0] != NINCS && PlayerInfo[pid][pKulcsok][1] != NINCS && PlayerInfo[pid][pKulcsok][2] != NINCS) return Msg(playerid,"Nála már több mint 3 kulcs van");
		
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
		
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Átadtad a jármûved egyik pótkulcsát neki: %s | V-s Rendszám: %d | JármûID: %d", ICPlayerName(pid), jarmu, CarInfo[jarmu][cId]);
		SendFormatMessage(pid, COLOR_LIGHTGREEN, "* %s odaadta a jármûve egyik pótkulcsát neked | V-s Rendszám: %d | JármûID: %d", ICPlayerName(playerid), jarmu, CarInfo[jarmu][cId]);
	}
	elseif(egyezik(pm, "elvesz"))
	{
		if(sscanf(spm, "ri", pid, kid)) return Msg(playerid, "/örökkulcs elvesz [név/id] [1/2/3]");
		if(pid == INVALID_PLAYER_ID || pid == playerid) return Msg(playerid, "Nem létezõ játékos");
		if(GetDistanceBetweenPlayers(playerid, pid) > 3.0) return Msg(playerid, "Nincs a közeledben a játékos.");
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
		else return Msg(playerid, "Úgy tudom csak 3 jármûved lehet.. nem? :)");
		
		if(CarInfo[jarmu][cKulcsok][0] != PlayerInfo[pid][pID] && CarInfo[jarmu][cKulcsok][1] != PlayerInfo[pid][pID]) return Msg(playerid, "Ehhez a jármûhöz neki nincsen pótkulcsa!");
		if(PlayerInfo[pid][pKulcsok][0] != CarInfo[jarmu][cId] && PlayerInfo[pid][pKulcsok][1] != CarInfo[jarmu][cId] && PlayerInfo[pid][pKulcsok][2] != CarInfo[jarmu][cId]) return Msg(playerid,"Ehhez a jármûhöz neki nincsen pótkulcsa!");
		
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
			
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Elvetted a jármûved pótkulcsát tõle: %s | V-s Rendszám: %d | JármûID: %d", ICPlayerName(pid), jarmu, CarInfo[jarmu][cId]);
		SendFormatMessage(pid, COLOR_LIGHTGREEN, "* %s elvette a jármûve pótkulcsát tõled | V-s Rendszám: %d | JármûID: %d", ICPlayerName(playerid), jarmu, CarInfo[jarmu][cId]);
	}
	elseif(egyezik(pm, "töröl") || egyezik(pm, "torol"))
	{
		if(!Admin(playerid, 1337)) return 1;
		new type;
		if(sscanf(spm, "ri", pid, type)) return Msg(playerid, "/örökkulcs töröl [név/id] [1/2/3]");
		if(pid == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
		switch(type)
		{
			case 1:
			{
				if(CarInfo[PlayerInfo[pid][pKulcsok][0]][cKulcsok][0] == PlayerInfo[pid][pID])
					CarInfo[PlayerInfo[pid][pKulcsok][0]][cKulcsok][0] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
				else
					CarInfo[PlayerInfo[pid][pKulcsok][0]][cKulcsok][1] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
					
				PlayerInfo[pid][pKulcsok][0] = NINCS;
				
				SendFormatMessage(pid, COLOR_LIGHTRED, "ClassRPG: %s %s elvette az 1. pótkulcsodat", AdminRangNev(playerid), AdminName(playerid));
				SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Elvetted %s 1. pótkulcsát", PlayerName(pid));
				format(_tmpString,sizeof(_tmpString),"<< %s %s elvette %s 1. pótkulcsát >>", AdminRangNev(playerid), AdminName(playerid), PlayerName(pid));
				SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			}
			case 2:
			{
				if(CarInfo[PlayerInfo[pid][pKulcsok][1]][cKulcsok][0] == PlayerInfo[pid][pID])
					CarInfo[PlayerInfo[pid][pKulcsok][1]][cKulcsok][0] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
				else
					CarInfo[PlayerInfo[pid][pKulcsok][1]][cKulcsok][1] = NINCS, CarUpdate(jarmu, CAR_Kulcsok2);
					
				PlayerInfo[pid][pKulcsok][1] = NINCS;
				
				SendFormatMessage(pid, COLOR_LIGHTRED, "ClassRPG: %s %s elvette az 2. pótkulcsodat", AdminRangNev(playerid), AdminName(playerid));
				SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Elvetted %s 2. pótkulcsát", PlayerName(pid));
				
				format(_tmpString,sizeof(_tmpString),"<< %s %s elvette %s 2. pótkulcsát >>", AdminRangNev(playerid), AdminName(playerid), PlayerName(pid));
				
				SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			}
			case 3:
			{
				if(CarInfo[PlayerInfo[pid][pKulcsok][2]][cKulcsok][0] == PlayerInfo[pid][pID])
					CarInfo[PlayerInfo[pid][pKulcsok][2]][cKulcsok][0] = NINCS, CarUpdate(jarmu, CAR_Kulcsok1);
				else
					CarInfo[PlayerInfo[pid][pKulcsok][2]][cKulcsok][1] = NINCS, CarUpdate(jarmu, CAR_Kulcsok2);
					
				PlayerInfo[pid][pKulcsok][2] = NINCS;
				
				SendFormatMessage(pid, COLOR_LIGHTRED, "ClassRPG: %s %s elvette az 3. pótkulcsodat", AdminRangNev(playerid), AdminName(playerid));
				SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Elvetted %s 3. pótkulcsát", PlayerName(pid));
			
				
				format(_tmpString,sizeof(_tmpString),"<< %s %s elvette %s 3. pótkulcsát >>", AdminRangNev(playerid), AdminName(playerid), PlayerName(pid));
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
	if(sscanf(params, "s[32]S()[32]", a, b)) return Msg(playerid, "/vadászengedély [kivált/megnéz]");
	if(egyezik(a, "kivált") || egyezik(a, "kivalt"))
	{
		if(!PlayerToPoint(2, playerid, 362.3623,209.2845,1008.3828)) return Msg(playerid, "Városházán elsõ iroda jobra! 300,000Ft; 24 hónapig érvényes ((óra))");
		if(PlayerInfo[playerid][pVadaszEngedely] > 0) return Msg(playerid,"Neked van engedélyed!");
		if(!BankkartyaFizet(playerid, 300000)){ Msg(playerid, "A vadászengedély ára: 300,000Ft"); return 1; }
		PlayerInfo[playerid][pVadaszEngedely] = 24;
		Cselekves(playerid, "kiváltott egy vadászengedélyt.");
		Msg(playerid, "Kiváltottad az engedélyt, mostmár mehetsz vadászni!");
	}
	elseif(egyezik(a, "megnéz") || egyezik(a, "megnez"))
	{
		if(PlayerInfo[playerid][pVadaszEngedely] < 1) return Msg(playerid, "Nincs engedélyed!");

		SendClientMessage(playerid, COLOR_GREEN, "====== Vadász Engedély ======");
		SendFormatMessage(playerid, COLOR_GRAD6, "Név: %s", ICPlayerName(playerid));
		SendFormatMessage(playerid, COLOR_GRAD5, "Érvényes: %d hónapig ((óráig))", PlayerInfo[playerid][pVadaszEngedely]);
		Cselekves(playerid, "elõvette az egyik iratát, és megnézte.", 0);
	}
	return 1;
}


ALIAS(vad1sz):vadasz;
CMD:vadasz(playerid, params[])
{
	new a[64];
	if(!AMT(playerid, MUNKA_VADASZ)) return Msg(playerid, "Nem vagy vadász!");
	if(OnDuty[playerid]) return Msg(playerid, "Döntsd elõbb el mit dolgozol! ((frakció dutyba nem!))");
	if(sscanf(params, "s[32]", a)) return Msg(playerid, "/vadász [munka/ellát/felpakol/elszámol/segítség]");
	if(egyezik(a, "munka"))
	{
		if(!IsPlayerInAnyVehicle(playerid))
		{
			if(!PlayerToPoint(5.0, playerid, -1633.1276, -2238.6843, 31.4766))
			{
				SetPlayerCheckpoint(playerid, -1633.1276, -2238.6843, 31.4766, 5.0);
				Msg(playerid, "Nem vagy a vadásztelepen!");
				return 1;
			}
			if(Munkaban[playerid] != MUNKA_VADASZ)
			{
				if(PlayerInfo[playerid][pVadaszEngedely] == 0) return Msg(playerid, "Nincs vadászengedélyed!");
				if(PlayerInfo[playerid][pPayCheck] > 700000) return Msg(playerid, "Túl sok vadat lõttél már ki, nem adhatsz le többet!");
				
				Munkaban[playerid] = MUNKA_VADASZ;
				if(PlayerInfo[playerid][pSex] == 2) SetPlayerSkin(playerid, 201);
				else SetPlayerSkin(playerid, 161);
				Msg(playerid, "Felvetted a ruhádat, így munkába álltál. A munka végzéséhez segítség: /vadász segítség");
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
				Msg(playerid, "Visszavetted a civil ruhádat, így már nem dolgozol.");
			}
		}
		else Msg(playerid, "Jármûben NEM!");
		return 1;
	}
	elseif(egyezik(a, "segitseg") || egyezik(a, "segítség"))
	{
		SendClientMessage(playerid, COLOR_GREEN, "=====[ Vadászat munka használati útmutató ]=====");
		SendClientMessage(playerid, COLOR_WHITE, "A munkát elkezdeni a /vadász munka paranccsal tudod.");
		SendClientMessage(playerid, COLOR_WHITE, "A munkához fegyvert neked kell vásárolnod, ami rifle vagy shotgun lehet.");
		SendClientMessage(playerid, COLOR_GRAD6, "A munkához vadászengedély szükséges, amit az Oktatóktól tudsz kiváltani 48 játszott órára 150.000 Ft-ért, vagy 300.000 Ft-ért 24 játszott órára a városházán.");
		SendClientMessage(playerid, COLOR_GRAD6, "Egyszerre 25db õz található az erdõben.");
		SendClientMessage(playerid, COLOR_GRAD5, "Új õz akkor kerül elõ, ha egy új vadász áll munkába; automatikusan 10 percenként spawnol egy õz.");
		SendClientMessage(playerid, COLOR_GRAD5, "Miután elejtettük az õzt, 5 perc áll rendelkezésre, hogy a talált golyót eltávolítsuk belõle.");
		SendClientMessage(playerid, COLOR_GRAD4, "Miután eltávolítottuk a lövedéket, az állatot lehetõségünk van felpakolni egy Yosemite-ra (/vadász felpakol), amire egyszerre 5 állat fér.");
		SendClientMessage(playerid, COLOR_GRAD4, "Az állat elszállítására korlátlan idõ áll rendelkezésre, de továbbra is csak maximum 25 õz lesz megtalálható.");
		SendClientMessage(playerid, COLOR_GRAD3, "Az állatokat ezután egy megadott GPS pontra kell elvinni, ahol az erdészeten átveszik az állatokat.");
		SendClientMessage(playerid, COLOR_GRAD3, "A fizetés az állat sérülési állapotától, és a fegyver lövedékének fajtájától függ, és a lövés távolságától.");
		SendClientMessage(playerid, COLOR_GRAD2, "Vigyázz! Ha túl közel mész egy állathoz, akkor az elszalad!");
		SendClientMessage(playerid, COLOR_GRAD2, "Vigyázz! Az elejtett õzeket bárki el tudja szállítani saját profitjára!");
	}
	elseif(egyezik(a, "ellát") || egyezik(a, "ellat"))
	{
		new b = GetClosestDeer(playerid);
		
		if(PlayerInfo[playerid][pPayCheck] > 700000) return Msg(playerid, "Túl sok vadat lõttél már ki, nem adhatsz le többet!");
		
		if(Munkaban[playerid] != MUNKA_VADASZ) return Msg(playerid, "Nem vagy vadász szolgálatban!");
		if(WeaponArmed(playerid) != 4) return Msg(playerid, "Egy kés kell ahhoz, hogy a golyót el tudd távolítani az õz testébõl!");
		if(GetDistanceToDeer(playerid, b) > 2.0) return Msg(playerid, "Túl messzi vagy az õztõl!");
		if(DeerInfo[b][dSupplied]) return Msg(playerid, "Ez az õz már el van látva!");
		if(!DeerInfo[b][dKilled]) return Msg(playerid, "Ez az õz nincs megölve!");
		if(DeerInfo[b][dHealth] < 5) return Msg(playerid, "Ezt az õzet már hiába látod el, túlságosan elfertõzõdött a seb, nem kapnál érte fizetést!");
		if(MunkaFolyamatban[playerid] == 1) return Msg(playerid, "Épp végzel valamit, nem tudod ellátni az õz sérülését!");
		SetTimerEx("Munkavege", (101-DeerInfo[b][dHealth])*1000, false, "ddd", playerid, M_OZELLATAS, b);
		SendClientMessage(playerid, COLOR_GREEN, "Elkezdted ellátni az õz sérülését a késed segítségével.");
		MunkaFolyamatban[playerid] = 1;
		Freeze(playerid);
		ApplyAnimation(playerid, "BOMBER","BOM_Plant_Loop",4.0,1,0,0,1,0);
	}
	elseif(egyezik(a, "elszamol") || egyezik(a, "elszámol"))
	{
		new kocsi = GetPlayerVehicleID(playerid);
		if(!PlayerToPoint(10.0, playerid, -1945.2025,-1084.0623,30.7779)) return SetPlayerCheckpoint(playerid, -1945.2025,-1084.0623,30.7779, 10.0);
		if(Munkaban[playerid] != MUNKA_VADASZ) return Msg(playerid, "Ez nem vadászfelszerelés, vedd fel elõször azt!");
		if(!IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Nem vagy jármûben!");
		if(GetVehicleModel(kocsi) != 554) return Msg(playerid, "Ez nem egy Yosemite!");
		if(VehicleAdatok[kocsi][_DEER_NUM_] == 0) return Msg(playerid, "Ennek a Yosemitenak a hátulján nincsen egy elejtett állat sem!");
		
		if(PlayerInfo[playerid][pPayCheck] > 700000) return Msg(playerid, "Túl sok vadat lõttél már ki, nem adhatsz le többet!");
		
		SendClientMessage(playerid, COLOR_GREEN, "Erdészet szakigazgató: "COL_FEHER"Munkásaim elkezdték a lõtt vadak lepakolását, kivizsgálását feldolgozását! Kérem várjon türelemmel!");
		Freeze(playerid, 25000);
		
		/* **************************************************************** */
		new fizu, hpszorzo;
		
		//ezzel vissza lehet venni a nagy bevételt
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
			SendFormatMessage(playerid, COLOR_GREEN, "Erdészeti szakigazgató: "COL_FEHER"Az állatot rendben találtuk. Ezért a lõtt vadért %s forintot írtunk a fizetési csekkére!", FormatInt(fizu));
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
			SendFormatMessage(playerid, COLOR_GREEN, "Erdészeti szakigazgató: "COL_FEHER"Az állatot rendben találtuk. Ezért a lõtt vadért %s forintot írtunk a fizetési csekkére!", FormatInt(fizu));
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
			SendFormatMessage(playerid, COLOR_GREEN, "Erdészeti szakigazgató: "COL_FEHER"Az állatot rendben találtuk. Ezért a lõtt vadért %s forintot írtunk a fizetési csekkére!", FormatInt(fizu));
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
			SendFormatMessage(playerid, COLOR_GREEN, "Erdészeti szakigazgató: "COL_FEHER"Az állatot rendben találtuk. Ezért a lõtt vadért %s forintot írtunk a fizetési csekkére!", FormatInt(fizu));
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
			SendFormatMessage(playerid, COLOR_GREEN, "Erdészeti szakigazgató: "COL_FEHER"Az állatot rendben találtuk. Ezért a lõtt vadért %s forintot írtunk a fizetési csekkére!", FormatInt(fizu));
			VehicleAdatok[kocsi][_DEER_HEALTH_1_] = 0;
			VehicleAdatok[kocsi][_DEER_DISTANCE_1_] = 0.0;
			VehicleAdatok[kocsi][_DEER_GUN_1_] = 0;
			VehicleAdatok[kocsi][_DEER_NUM_] = 0;
		}
		return Msg(playerid, "Ennek a Yosemitenak a hátulján nincsen egy elejtett állat sem!");
	}
	elseif(egyezik(a, "felpakol"))
	{
		new oz = GetClosestDeer(playerid), kocsi = GetClosestVehicle(playerid);
		
		if((GetDistanceToDeer(playerid, oz) > 5.0))
			return Msg(playerid, "Nincs õz a közeledben!");
		if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 5.0)
			return Msg(playerid, "Nincs jármû a közeledben!");
		if(IsPlayerInAnyVehicle(playerid))
			return Msg(playerid, "Jármûben hogy akarod?");
		if(GetVehicleModel(kocsi) != 554)
			return Msg(playerid, "Ezzel a jármûvel nem tudod elszállítani az õz(eke)t!");
		if(!DeerInfo[oz][dSupplied])
			return Msg(playerid, "Ez az õz nincs ellátva!");
		
		if(VehicleAdatok[kocsi][_DEER_NUM_] != 5)
			VehicleAdatok[kocsi][_DEER_NUM_]++;
		else
			return Msg(playerid, "Erre a jármûre már nem tudsz több vadat pakolni!");

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
                SendClientMessage(playerid, COLOR_GREEN, "A jármûre már nem tudsz több õzt pakolni! Vidd el az erdészetre õket!");
				SetPlayerCheckpoint(playerid, -1945.2025,-1084.0623,30.7779, 10.0);
				VehicleAdatok[kocsi][_DEER_DISTANCE_5_] = DeerInfo[oz][dDistance];
				VehicleAdatok[kocsi][_DEER_HEALTH_5_] = DeerInfo[oz][dHealth];
				if(DeerInfo[oz][dWeaponType] == 25) VehicleAdatok[kocsi][_DEER_GUN_5_] = 1;
				else VehicleAdatok[kocsi][_DEER_GUN_5_] = 2;
			}
		}
		Streamer_Update(playerid);
		SendClientMessage(playerid, COLOR_GREEN, "Az õz(ek) sikeresen felpakolva a platóra!");
		RemoveDeer(oz);
	}
	elseif(egyezik(a, "go"))
	{
		if(!IsScripter(playerid)) return 1;
		new kac_kac_kukac = GetClosestDeer(playerid);
		SetPlayerPos(playerid, ArrExt(DeerInfo[kac_kac_kukac][dPos]));
		SendFormatMessage(playerid, -1, "Teleportálva a(z) #%d számú õzhöz (te lusta disznó! :P)", kac_kac_kukac);
	}
	elseif(egyezik(a, "create"))
	{
		if(!IsScripter(playerid)) return 1;
		CreateDeer();
		SendClientMessage(playerid, -1, "Kész");
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

ALIAS(korm1ny):kormany;
CMD:kormany(playerid, params[])
{
	new func[10];
	new func2[60];

	if(sscanf(params, "s[12]S()[60]", func,func2)) return Msg(playerid,"/kormány [stat / frakcióadó / akitüntetés / rendezvény / settax / givetax]");

	if(!LMT(playerid, FRAKCIO_ONKORMANYZAT) && !Admin(playerid, 1337) && IsScripter(playerid)) return SendClientMessage(playerid, COLOR_GREY, "Nem vagy (Al)Elnök!");
			
			
		
	if(egyezik(func,"stat"))
	{
		if(!Munkarang(playerid,10)) return Msg(playerid, "A-A");
		//FrakcioAdoStat();
		
		SendClientMessage(playerid,COLOR_WHITE,"============= Frakció adó bevételek =================");
		new heti,havi,ossz;
		for(new yx; yx < MAX_ADO_FRAKCIO; yx++)
		{
			new id=AdozoFrakciok[yx];
			SendFormatMessage(playerid, COLOR_YELLOW, "[%d]%s Heti: %s Ft, Havi %s Ft, Összes: %s Ft",id,Szervezetneve[id-1][0], FormatInt(FrakcioInfo[id][fHeti]),FormatInt(FrakcioInfo[id][fHavi]),FormatInt(FrakcioInfo[id][fOsszes]));
			heti +=FrakcioInfo[id][fHeti];
			havi +=FrakcioInfo[id][fHavi];
			ossz +=FrakcioInfo[id][fOsszes];
		}
		SendFormatMessage(playerid, COLOR_YELLOW, "Összesen: Heti %s Ft, Havi %s Ft, Összesen: %s Ft",FormatInt(heti),FormatInt(havi),FormatInt(ossz));
		SendClientMessage(playerid,COLOR_WHITE,"Heti: Vasárnap 23:44 - 59-között, Havi: Minden hó utolsó nap 23:44 -59 -között => nullázódik");
	}
	if(egyezik(func,"givetax"))
    {
		new string[128];
		if(PlayerInfo[playerid][pLeader] != FRAKCIO_ONKORMANYZAT) return SendClientMessage(playerid, COLOR_GREY, "Nem vagy az Elnök!");

		if(FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] < 1) return SendClientMessage(playerid, COLOR_GREY, "A kasszában nincs pénz!");

		new penz,frakcio;
		if(sscanf(func2, "dd", frakcio,penz))
		{
			
			for(new yx; yx < MAX_ADO_FRAKCIO; yx++)
			{
				new id=AdozoFrakciok[yx];
				
				format(string, sizeof(string),"%s %s[%d],", string, Szervezetneve[id-1][0],id);
			
			}	
			SendClientMessage(playerid, COLOR_GREY, "Használata: /kormány givetax [frakcióID] [pénz]");
			SendFormatMessage(playerid, COLOR_GREY, "%s",string);
			SendClientMessage(playerid, COLOR_GREY, "Speciális: Civil[30], SWAT[31], Kisebbség[32]");
			SendFormatMessage(playerid, COLOR_GREY, "Kassza: %s Ft", FormatNumber( FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] , 0, ',' ));
			return 1;
		}
	
		if(penz > FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz])
		{
			SendFormatMessage(playerid, COLOR_GREY, "A kasszában nincs % sFt, csak %s Ft!", FormatNumber( penz , 0, ',' ), FormatNumber( FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz], 0, ',' ));
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
					format(string, sizeof(string), "* A nagylelkû (al)elnök átutalta az adók egy részét a %s számára! %s Ft került a széfbe!", Szervezetneve[frakcio-1][0],FormatInt(penz));
					SendClientMessage(i, COLOR_LIGHTBLUE, string);
				}
			}

			FrakcioInfo[frakcio][fPenz] += penz;
			
			FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] -= penz;
			SendFormatMessage(playerid, COLOR_GREY, " Átutaltál %s Ft-ot a %s számára.", FormatInt(penz),Szervezetneve[frakcio-1][0]);

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
							format(string, sizeof(string), "* A nagylelkû (al)elnök segélyt küldött a kisebbség számára. A részed: %d",price);
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
							GiveMoney(i, price);
							FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] -= price;
						}
					}
				}
				SendFormatMessage(playerid, COLOR_GREY, " Átutaltál %dFt-t a kisebbség számára. %d kisebbségi van, fejenként %dFt-t kaptak!", penz, Tagok, price);
				//SaveStuff();
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Nincs fennt Bandás/Mafiás!");
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
							format(string, sizeof(string), "* A nagylelkû (al)elnök átutalta az adók egy részét a SWAT számára. A részed: %d",price);
							SendClientMessage(i, COLOR_LIGHTBLUE, string);
							GiveMoney(i, price);
							FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] -= price;
						}
					}
				}
				SendFormatMessage(playerid, COLOR_GREY, " Átutaltál %dFt-t a SWAT számára. %d  SWAT-os van, fejenként %dFt-t kaptak!", penz, Tagok, price);
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
						format(string, sizeof(string), "* A nagylelkû (al)elnök átutalta az adók egy részét a civilek számára. A részed: %d",price);
						SendClientMessage(i, COLOR_LIGHTBLUE, string);
						GiveMoney(i, price);
						FrakcioInfo[FRAKCIO_ONKORMANYZAT][fPenz] -= price;
					}
				}
				SendFormatMessage(playerid, COLOR_GREY, " Átutaltál %dFt-t a civilek számára. %d civil van, fejenként %dFt-t kaptak!", penz, Tagok, price);
				//SaveStuff();
			}
			else
			{
				SendClientMessage(playerid, COLOR_GREY, "Nincs fennt civil!");
				return 1;
			}
		}
		else Msg(playerid,"Hibás ID!");
		
		return 1;
	}
	if(egyezik(func, "settax"))
    {
		if(!Admin(playerid, 5555)) return Msg(playerid,"Súlyos vissza  élések miatt tiltva");
		//if(!LMT(playerid, FRAKCIO_ONKORMANYZAT) && !Admin(playerid, 1337))
		//	return SendClientMessage(playerid, COLOR_GREY, "Nem vagy (Al)Elnök!");

		//if(!Munkarang(playerid, 5))
		//	return SendClientMessage(playerid, COLOR_GREY, "Minimum Alelnöki rang szükséges!");

		new ado;
		if(sscanf(func2, "d", ado))
			return SendFormatMessage(playerid, COLOR_LIGHTRED, "Használat: /kormány settax [adó (50 = normál, 100 = kétszeres, stb...] - Jelenlegi adó: %d", TaxValue), 1;

		//if(ado < 0 || ado > 100)
		//	return Msg(playerid, "Min. 0, max 100 - A normál adó az 50, a 100 az adó kétszerese, 0 esetén nincs adó");

		if(ado < ADO_MIN || ado > ADO_MAX)
		{
			SendFormatMessage(playerid, COLOR_LIGHTRED, "%s: Minimum %d, maximum %d - A normál adó 50, a kétszerese 100, másfélszerese 75, stb.", SERVER_NEV, ADO_MIN, ADO_MAX);
			return 1;
		}

		if(ado >= 100 && !IsClint(playerid))
			return Msg(playerid, "Csak 75ig állíthatod - ha ennél nagyobbra szeretnéd, szólj Clintnek");

		SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Az új adó mostmár %d! (A régi %d volt)", ado, TaxValue);
		TaxValue = ado;
	    return 1;
	}
	if(egyezik(func, "rendezvény"))
	{
		if(FloodCheck(playerid)) return 1;
		new result[128];
		new string[128];
		if(sscanf(func2, "s[128]", result))
			return SendClientMessage(playerid, COLOR_WHITE, "Használat: /kormány rendezvény [Szöveg]");

		if(SzovegEllenorzes(playerid, result, "/rendezvény", ELLENORZES_MINDKETTO))
			return 1;

		if(LMT(playerid, FRAKCIO_ONKORMANYZAT) || IsAdmin(playerid))
		{
			format(string, sizeof(string), "[%d] **Rendezvény** %s", playerid, result);
			SendMessage(SEND_MESSAGE_OOCOFF, string, COLOR_RENDEZVENY);
			printf("%s\n", string);
		}
		
		return 1;
	}
	if(egyezik(func, "akituntetes") || egyezik(func, "akitüntetés"))
	{
	    new player;
		new szam;
		new string[128];
		if(sscanf(func2, "rd", player, szam))
		{
			Msg(playerid,"Használata: /kormány akitüntetés [Név / ID] [1-6]");
			Msg(playerid,"Kitüntetések: 1. Tiszteletbeli polgár | 2. Díszpolgár | 3. Veterán érdemrend | 4. Vörös csillag");
			Msg(playerid,"Kitüntetések: 5. Konszolidációs Érdemrend | 6. Vörös Csillag Érdemrend");
			return 1;
		}	
		
		if(player == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen játékos.");
		if(player == playerid) return Msg(playerid, "Nana..");
		if(GetDistanceBetweenPlayers(playerid,player) > 3) return Msg(playerid, "Õ nincs a közeledben!");
		
		if(!LMT(player, FRAKCIO_ONKORMANYZAT)) return Msg(playerid, "Õ nem tag!");
		if(szam > 6 || szam < 1) return Msg(playerid,"A kitüntetés száma 1 és 6 között lehet!");
		SendFormatMessage(player, COLOR_LIGHTBLUE, "Kitünetést kaptál tõle: %s", ICPlayerName(playerid));
		SendFormatMessage(player, COLOR_LIGHTBLUE, "Kitüntetésed: %s", KormanyKituntetes[szam]);
		format(string, sizeof(string), "Rádió: %s kitüntette %s -t | Kitüntetése: %s **", ICPlayerName(playerid), ICPlayerName(player), KormanyKituntetes[szam]);
		SendMessage(SEND_MESSAGE_RADIO, string, COLOR_RED, FRAKCIO_ONKORMANYZAT);
		PlayerInfo[player][pKormanyKituntetes] = szam;
		
		return 1;
	}
	if(egyezik(func,"frakcióadó") || egyezik(func,"frakcioado"))
	{
		if(!Munkarang(playerid, 5))
			return SendClientMessage(playerid, COLOR_GREY, "Minimum Alelnöki rang szükséges!");
			
		new ado;
		new szam;
		if(sscanf(func2, "dd", szam, ado))
		{
			Msg(playerid, "Használat: /frakcióadó [frakció száma] [szorzó]");
			
			SendClientMessage(playerid, COLOR_LIGHTRED,"=================Frakciók adói=================");
			for(new yx; yx < MAX_ADO_FRAKCIO; yx++)
			{
				new id=AdozoFrakciok[yx];
				new string[128];
				format(string,sizeof(string),"[%d] %s || Jelenlegi adója: %d %% || Széf %s Ft",id,Szervezetneve[id-1][0], FrakcioInfo[id][fAdo],FormatInt(FrakcioInfo[id][fPenz]));
				SendFormatMessage(playerid, COLOR_LIGHTRED, "%s", string);
			
			}	
			SendClientMessage(playerid, COLOR_LIGHTRED,"=================Frakciók adói=================");
			return 1;
		}

		new bool:ellen;
		for(new x; x < MAX_ADO_FRAKCIO; x++)
		{	
			if(AdozoFrakciok[x] == szam) 
				ellen=true;
		}
		if(!ellen) return Msg(playerid, "Ez a frakció nem adózik!");
		
		if(ado < 0 || ado > 25)
		{
			Msg(playerid,"Az adónak 0-25% között kell lenni-e!");
			return 1;
		}
		
			
		SendFormatMessage(playerid, COLOR_LIGHTBLUE, "A(z) %s adója %d ", Szervezetneve[szam-1][0], ado);
		FrakcioInfo[szam][fAdo] = ado;
		return 1;
	}

	return 1;
}
ALIAS(pil4taradar):pilotaradar;
CMD:pilotaradar(playerid, params[])
{
	new veh = GetPlayerVehicleID(playerid), pilotak = 0;
	if(!AMT(playerid, MUNKA_PILOTA)) return Msg(playerid, "Nem vagy pilóta!");
	if(!IsAPRepulo(veh)) return Msg(playerid, "Nem utasszállító gépben ülsz!");
	if(Repul[playerid] == 0) return Msg(playerid, "Nincs leszerzõdtetett szállításod, így nem kérheted le a többi pilóta helyzetét!");
	if(!PilotaRadar[playerid])
	{
		foreach(Jatekosok, p)
		{
			new allveh = GetPlayerVehicleID(p);
			if(AMT(p, MUNKA_PILOTA) && IsAPRepulo(allveh) && Repul[p] == 1)
				SetPlayerMarkerForPlayer(playerid, p, 0xFFFFFF44), pilotak++;
		}
		PilotaRadar[playerid] = 1;
		SendFormatMessage(playerid, COLOR_GREEN, "Pilótaradar bekapcsolva, összesen %d pilóta van a légtérben!", pilotak);
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
		SendClientMessage(playerid, COLOR_GREEN, "Pilótaradar kikapcsolva");
	}
	return 1;
}
ALIAS(derbi):roncsderbi;
CMD:roncsderbi(playerid, params[])
{
	if(RoncsDerbi[rInditva]) return Msg(playerid, "Jelenleg foglalt a pálya!");
	
	if(!PlayerToPoint(5,playerid,-2110.9934,-444.3106,38.7344,0,0)) return Msg(playerid, "Nem vagy San Fiero stadion bejáratánál! ((az i betûnél))");
	
	if(RoncsDerbi[rIndit]) return Msg(playerid, "Várj egy kicsit még, most indít valaki!");
	
	if(!RoncsDerbi[rFutam])
	{
		if(!BankkartyaFizet(playerid,DERBI_ARA,false)) return SendFormatMessage(playerid, COLOR_YELLOW,"A verseny ára %s Ft!",FormatInt(DERBI_ARA));
		RoncsDerbi[rIndit] = true;
		ShowPlayerDialog(playerid, DIALOG_DERBI_KOCSIVALASZT, DIALOG_STYLE_LIST, "Roncsderbi, szabad a kocsi választás?!", "IGEN - a csatlakozó játékos adja meg milyen kocsival lesz.\nNEM - Te adod meg milyen kocsival legyenek a játékosok.", "Tovább","Mégse");
	}
	else
	{
		if(RoncsDerbi[rJatekos] >= 20) return Msg(playerid, "A versenyen maximum 20-an lehetnek, betelt a pálya!");
		if(RoncsDerbi[rModel] == NINCS)
		{
			if(!BankkartyaFizet(playerid,DERBI_ARA,false)) return SendFormatMessage(playerid, COLOR_YELLOW,"A verseny ára %s Ft!",FormatInt(DERBI_ARA));
			ShowPlayerDialog(playerid, DIALOG_DERBI_KOCSIMODEL, DIALOG_STYLE_INPUT, "Roncsderbi", "Milyen jármûvel akarsz indulni? ((model ID vagy NÉV))", "Tovább", "Mégse");

		}
		else
		{
			if(!BankkartyaFizet(playerid,DERBI_ARA,false)) return SendFormatMessage(playerid, COLOR_YELLOW,"A verseny ára %s Ft!",FormatInt(DERBI_ARA));
			
			new string[256];
			format(string,sizeof(string),"RoncsDerbi futam információk / szabályok\nMindenki azonos típusú kocsival indul\nKocsiból kiszálni tilos!\nSzerencsés futamot!");
			ShowPlayerDialog(playerid, DIALOG_DERBI_BELEPES, DIALOG_STYLE_MSGBOX, "DERBI INFÓ", string, "Kezdés", "");
			
		
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
		if(Almossag[playerid] <= 25.0) return Msg(playerid, "Nem vagy álmos");
		if(ownhouse != NINCS)
		{
			Alszik[playerid] = 1;
			Cselekves(playerid,"lefeküdt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(house != NINCS)
		{
			Alszik[playerid] = 2;
			Cselekves(playerid,"lefeküdt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(PlayerInfo[playerid][pJailed] == 7)
		{
			Alszik[playerid] = 3;
			Cselekves(playerid,"lefeküdt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(GetPlayerVirtualWorld(playerid) != 0 || GetPlayerInterior(playerid) != 0)
		{
			Alszik[playerid] = 4;
			Cselekves(playerid,"lefeküdt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(PlayerToPoint(2.0, playerid, 2513.154, -1729.182, 778.637) && GetPlayerInterior(playerid) == 1)
		{
			Alszik[playerid] = 5;
			Cselekves(playerid,"lefeküdt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		elseif(IsATruck(GetPlayerVehicleID(playerid)))
		{
			Alszik[playerid] = 6;
			Cselekves(playerid,"lefeküdt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
		else
		{
			Alszik[playerid] = 7;
			Cselekves(playerid,"lefeküdt aludni");
			Feketeseg(playerid, true);
			Freeze(playerid);
			ApplyAnimation(playerid,"CRACK","CRCKIDLE2",4.0,1,0,0,0,NINCS);
			return 1;
		}
	}
	else
	{
		if(Almossag[playerid] >= 75.0) return Msg(playerid, "Túl fáradt vagy ahhoz, hogy felkelj!");
		if(Alszik[playerid] < 7)
			ProxDetector(B_Cselekves, playerid, "* Ébresztõ csörgése", COLOR_BLUE,COLOR_BLUE,COLOR_BLUE,COLOR_BLUE,COLOR_BLUE);
		Cselekves(playerid,"felébredt");
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
}

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
		return SeeBan(playerid, 0, NINCS, "Cuffolva vagy viszbe Paintballba menés!" );
	new pm[32], subpm[32], teremid, jatekido, ido;
	if(!PlayerToPoint(15, playerid, BizzInfo[BIZ_PB][bEntranceX], BizzInfo[BIZ_PB][bEntranceY], BizzInfo[BIZ_PB][bEntranceZ])) return Msg(playerid,"Nem vagy Paintball Terem elõtt!");
	if(BizzInfo[BIZ_PB][bLocked]) return Msg(playerid,"A paintball zárva van, gyere vissza késõbb!");
	if(sscanf(params, "s[32]S()[32]", pm,subpm)) return Msg(playerid, "/paintball [indítás/nevezés/termek/indítások/fegyverek]");
	if(PlayerInfo[playerid][pPaintballKitiltva] == 1) return Msg(playerid, "Te el vagy tiltva a paintballozástól!");
	if(egyezik(pm,"indítás") || egyezik(pm,"inditas"))
	{
		if(BizzInfo[BIZ_PB][bLocked]) return Msg(playerid,"A paintball zárva van, gyere vissza késõbb!");
		if(sscanf(subpm, "ddd", teremid,ido,jatekido)) return Msg(playerid,"Használata: /pb indítás [Terem ID] [Nevezési Idõ(percben)] [Játékidõ(percben)]");
		if(teremid < 1 || teremid > 4) return Msg(playerid, "A teremid minimum 1-es idjû, maximum 4-es idjû!");
		if(PaintballInfo[teremid][pbMerkozesIdo] >= UnixTime && PaintballInfo[teremid][pbHasznalva]) return Msg(playerid, "Ez a terem foglalt!");
		if(PaintballInfo[teremid][pbNevezesIdo] > 0) return Msg(playerid,"Már van nevezés folyamatban erre a teremre!");
		if(PaintballInfo[1][pbNevezesIdo] > 0 || PaintballInfo[2][pbNevezesIdo] > 0 || PaintballInfo[3][pbNevezesIdo] > 0 || PaintballInfo[4][pbNevezesIdo] > 0) return Msg(playerid,"Sajnálom! Egyszerre csak 1 termet tudunk üzemeltetni!");
		if(ido < 1 || ido > 5) return Msg(playerid,"A nevezési idõ, legalább 1 perc és maximum 5 perc!");
		if(jatekido < 1 || jatekido > 30) return Msg(playerid, "A játékidõ minimum 1 perc, maximum 30 perc!");
		if(!BankkartyaFizet(playerid, BizzInfo[BIZ_PB][bEntranceCost], false)) return Msg(playerid,"Nemtudod kifizetni a mérkõzés árát");
		PaintballInfo[teremid][pbNevezesek] = 1;
		PaintballInfo[teremid][pbNevezesIdo] = ido*60;
		PaintballInfo[teremid][pbMerkozesIdo][1] = jatekido;
		Paintballnevezve[playerid] = true;
		PBTerem[playerid] = teremid;
		
		SendClientMessage(playerid,COLOR_LIGHTRED,"Paintball: Globális nevezést indítottál! Ha eltávolodsz a bejárattól, akkor a nevezésed megszûnik!");
		foreach(Jatekosok, p)
		{
			SendClientMessage(p,COLOR_DYELLOW,"=====[ Paintball ]=====");
			SendClientMessage(p,COLOR_WHITE,"Hamarosan paintball mérkõzés indul, részletek a terem bejárata elõtt!");
			SendFormatMessage(p,COLOR_WHITE,"TeremID: %d | Nevezési díj: %s Ft | Játékidõ: %d perc | Nevezettek száma: %d db | Nevezni lehet még: %d másodpercig", teremid, FormatInt(BizzInfo[BIZ_PB][bEntranceCost]*PaintballInfo[teremid][pbMerkozesIdo][1]), jatekido, PaintballInfo[teremid][pbNevezesek],PaintballInfo[teremid][pbNevezesIdo]);
		}
	}
	elseif(egyezik(pm,"nevezés") || egyezik(pm,"nevezes"))	
	{
		if(sscanf(subpm, "d", teremid)) return Msg(playerid,"Használata /pb nevezés [teremid]");
		if(teremid < 1 || teremid > 4) return Msg(playerid, "A teremid minimum 1-es idjû, maximum 4-es idjû!");
		if(PaintballInfo[teremid][pbNevezesek] == 0) return Msg(playerid,"Jelenleg nincs nevezés folyamatban!");
		if(Paintballnevezve[playerid] || PBTerem[playerid] != 0) return Msg(playerid, "Te már nevezve vagy!");
		if(!BankkartyaFizet(playerid, BizzInfo[BIZ_PB][bEntranceCost], false)) return Msg(playerid,"Nemtudod kifezetni a mérkõzés árát");
		PaintballInfo[teremid][pbNevezesek]++;
		Paintballnevezve[playerid] = true;
		PBTerem[playerid] = teremid;
		SendFormatMessage(playerid,COLOR_LIGHTRED,"Paintball: Neveztél a mérkõzésre, jelenleg %d ember van benevezve. Ha eltávolodsz a bejárattól, akkor a nevezésed megszûnik!",PaintballInfo[teremid][pbNevezesek]);
		foreach(Jatekosok, p)
		{
			if(Paintballnevezve[p])
				SendFormatMessage(p,COLOR_LIGHTRED,"Paintball: Egy ember nevezett a mérkõzésre, jelenleg %d ember van benevezve.",PaintballInfo[teremid][pbNevezesek]);
		}
		
		
	}
	elseif(egyezik(pm, "termek"))
	{
		SendClientMessage(playerid, COLOR_DYELLOW, "=====[ Paintball Termek ]=====");
		SendFormatMessage(playerid, COLOR_WHITE, "1: Hagyományos, RC Battlefieldes terem (%s"COL_FEHER")", (PaintballInfo[1][pbHasznalva]) ? (""COL_PIROS"Foglalt") : (""COL_VZOLD"Szabad"));
		SendFormatMessage(playerid, COLOR_WHITE, "2: Sivatagi, elhagyatott, kis falu (%s"COL_FEHER")", (PaintballInfo[2][pbHasznalva]) ? (""COL_PIROS"Foglalt") : (""COL_VZOLD"Szabad"));
		SendFormatMessage(playerid, COLOR_WHITE, "3: Sivatagi, nagy méretû terem (%s"COL_FEHER")", (PaintballInfo[3][pbHasznalva]) ? (""COL_PIROS"Foglalt") : (""COL_VZOLD"Szabad"));
		SendFormatMessage(playerid, COLOR_WHITE, "4: Elhagyatott Area51-es terem (%s"COL_FEHER")", (PaintballInfo[4][pbHasznalva]) ? (""COL_PIROS"Foglalt") : (""COL_VZOLD"Szabad"));
	}
	elseif(egyezik(pm, "indítások"))
	{
		SendClientMessage(playerid, COLOR_DYELLOW, "=====[ Paintball termek, ahová lehet nevezni ]=====");
		for(new teremidk = 1; teremidk < sizeof(PaintballInfo); teremidk++)
		{
			if(PaintballInfo[teremidk][pbNevezesek] > 0)
				SendFormatMessage(playerid, COLOR_WHITE, "TeremID: %d | Nevezési díj: %s Ft | Játékidõ: %d perc | Nevezettek száma: %d db | Nevezni lehet még: %d másodpercig", teremidk, FormatInt(BizzInfo[BIZ_PB][bEntranceCost]*PaintballInfo[teremidk][pbMerkozesIdo][1]), jatekido, PaintballInfo[teremidk][pbNevezesek],PaintballInfo[teremidk][pbNevezesIdo]);
			else continue;
		}
	}
	/*elseif(egyezik(pm, "fegyverek"))
	{
		Msg(playerid, "Állítsd be, hogy milyen fegyverekkel szeretnél játszani!", true, COLOR_DYELLOW);
		tformat(256, "Pisztoly (Jelenleg: "COL_CITROM"%s"COL_FEHER")\nKönnyû lõfegyver (Jelenleg: "COL_CITROM"%s"COL_FEHER")\nSörétes puska (Jelenleg: "COL_CITROM"%s"COL_FEHER")\nNehéz lõfegyver (Jelenleg: "COL_CITROM"%s"COL_FEHER")", GunName(PlayerInfo[playerid][pPBFegyver][0]), GunName(PlayerInfo[playerid][pPBFegyver][1]), GunName(PlayerInfo[playerid][pPBFegyver][2]), GunName(PlayerInfo[playerid][pPBFegyver][3]));
		ShowPlayerDialog(playerid, DIALOG_PAINTBALL_FEGYVEREK, DIALOG_STYLE_LIST, "Paintball", _tmpString, "Kiválaszt", "Mégse");
		Freeze(playerid);
	}*/
	elseif(egyezik(pm, "kitilt") && (PlayerInfo[playerid][pPbiskey] == BIZ_PB || PlayerInfo[playerid][pBizniszKulcs] == BIZ_PB))
	{
		new jatekos, ok[128];
		if(sscanf(subpm, "rs[128]", jatekos, ok)) return Msg(playerid, "/paintball kitilt [Név/ID] [Oka]");
		if(jatekos == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ név/id");
		if(PlayerInfo[playerid][pPaintballKitiltva] == 0)
		{
			PlayerInfo[playerid][pPaintballKitiltva] = 1;
			SendFormatMessage(playerid, COLOR_LIGHTRED, "%s eltiltva a paintballozástól!", ICPlayerName(jatekos));
			SendFormatMessage(jatekos, COLOR_LIGHTRED, "%s eltiltott a paintballozástól, oka: %s", ICPlayerName(playerid), ok);
		}
		else
		{
			PlayerInfo[playerid][pPaintballKitiltva] = 0;
			SendFormatMessage(playerid, COLOR_LIGHTRED, "%s tiltása feloldva, újra paintballozhat!", ICPlayerName(jatekos));
			SendFormatMessage(jatekos, COLOR_LIGHTRED, "%s feloldotta a tiltást, ismét paintballozhatsz! Oka: %s", ICPlayerName(playerid), ok);
		}
	}
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

ALIAS(k5zmunk1sok):kozmunkasok;
CMD:kozmunkasok(playerid, params[])
{
	if(!IsACop(playerid) && !Admin(playerid, 1)) return Msg(playerid, "Nem vagy rendõr!");
	new c = 0;
	SendClientMessage(playerid, COLOR_ADD, "=====[ Közmunkán lévõ emberek ]=====");
	foreach(Jatekosok, x)
	{
		if(PlayerInfo[x][pKozmunka] != 0)
		{
			if(PlayerInfo[x][pKozmunkaIdo] != 0)
				SendFormatMessage(playerid, COLOR_GREEN, "[%d]%s | Hátralévõ játszott órák: %d | Hátralévõ letöltendõ büntetés: %d másodperc", x, ICPlayerName(x), PlayerInfo[x][pKozmunkaIdo], PlayerInfo[x][pJailTime]);
			else
			{
				SendFormatMessage(playerid, COLOR_RED, "[%d]%s | Elhalasztotta a közmunkát | Körözés kiadva", x, ICPlayerName(x));
				if(!egyezik(PlayerCrime[x][pVad], "Közmunka elhalasztása")) SetPlayerCriminal(x, 255, "Közmunka elhalasztása");
			}
			c++;
		}
	}
	if(c == 0) SendClientMessage(playerid, COLOR_WHITE, "Jelenleg nincs közmunkán lévõ ember.");
	return 1;
}

CMD:carresi(playerid, params[])
{
	if(CarRespawnSzamlalo != NINCS) return Msg(playerid, "Épp folyamatban van egy carresi!");
	SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Legközelebb %d mp múlva lesz car resi.", ResiCounter);
	if(Admin(playerid, 6)) Msg(playerid, "Carresihez parancsok: /acrmost /acr /acr30");
	return 1;
}

ALIAS(l6szerek):loszerek;
CMD:loszerek(playerid, params[])
{
	if(!MunkaLeader(playerid, FRAKCIO_SCPD) && !MunkaLeader(playerid, FRAKCIO_FBI) && !MunkaLeader(playerid, FRAKCIO_KATONASAG) && !MunkaLeader(playerid, FRAKCIO_NAV) && !Admin(playerid, 1)) return 1;
	
	new frakcio;
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "================================ LÕSZEREK ================================");
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_SCPD || Admin(playerid, 1)) frakcio=FRAKCIO_SCPD;
	SendFormatMessage(playerid, COLOR_WHITE, "[Rendõrség] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][1], FrakcioInfo[frakcio][fSilenced][1], FrakcioInfo[frakcio][fMp5][1], FrakcioInfo[frakcio][fM4][1], FrakcioInfo[frakcio][fShotgun][1]);
	SendFormatMessage(playerid, COLOR_WHITE, "[Rendõrség] Sniper: %d | Combat: %d | Rifle: %d | Ejtõernyõ: %d",FrakcioInfo[frakcio][fSniper][1], FrakcioInfo[frakcio][fCombat][1],FrakcioInfo[frakcio][fRifle][1],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_FBI || Admin(playerid, 1)) frakcio=FRAKCIO_FBI;
	SendFormatMessage(playerid, COLOR_WHITE, "[FBI] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][1], FrakcioInfo[frakcio][fSilenced][1], FrakcioInfo[frakcio][fMp5][1], FrakcioInfo[frakcio][fM4][1], FrakcioInfo[frakcio][fShotgun][1]);
	SendFormatMessage(playerid, COLOR_WHITE, "[FBI] Sniper: %d | Combat: %d | Rifle: %d | Ejtõernyõ: %d",FrakcioInfo[frakcio][fSniper][1], FrakcioInfo[frakcio][fCombat][1],FrakcioInfo[frakcio][fRifle][1],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_NAV || Admin(playerid, 1)) frakcio=FRAKCIO_NAV;
	SendFormatMessage(playerid, COLOR_WHITE, "[SASD] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][1], FrakcioInfo[frakcio][fSilenced][1], FrakcioInfo[frakcio][fMp5][1], FrakcioInfo[frakcio][fM4][1], FrakcioInfo[frakcio][fShotgun][1]);
	SendFormatMessage(playerid, COLOR_WHITE, "[SASD] Sniper: %d | Combat: %d | Rifle: %d | Ejtõernyõ: %d",FrakcioInfo[frakcio][fSniper][1], FrakcioInfo[frakcio][fCombat][1],FrakcioInfo[frakcio][fRifle][1],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_KATONASAG || Admin(playerid, 1)) frakcio=FRAKCIO_KATONASAG;
	SendFormatMessage(playerid, COLOR_WHITE, "[CCMF] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][1], FrakcioInfo[frakcio][fSilenced][1], FrakcioInfo[frakcio][fMp5][1], FrakcioInfo[frakcio][fM4][1], FrakcioInfo[frakcio][fShotgun][1]);
	SendFormatMessage(playerid, COLOR_WHITE, "[CCMF] Sniper: %d | Combat: %d | Rifle: %d | Ejtõernyõ: %d",FrakcioInfo[frakcio][fSniper][1], FrakcioInfo[frakcio][fCombat][1],FrakcioInfo[frakcio][fRifle][1],FrakcioInfo[frakcio][fParachute]);
	SendClientMessage(playerid, COLOR_LIGHTGREEN,"================================ LÕSZEREK ================================");
	return 1;
}

CMD:fegyverek(playerid, params[])
{
	if(!MunkaLeader(playerid, FRAKCIO_SCPD) && !MunkaLeader(playerid, FRAKCIO_FBI) && !MunkaLeader(playerid, FRAKCIO_KATONASAG) && !MunkaLeader(playerid, FRAKCIO_NAV) && !Admin(playerid, 1)) return 1;
	
	new frakcio;
	SendClientMessage(playerid, COLOR_LIGHTGREEN, "================================ FEGYVEREK ================================");
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_SCPD || Admin(playerid, 1)) frakcio=FRAKCIO_SCPD;
	SendFormatMessage(playerid, COLOR_WHITE, "[LSPD] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][0], FrakcioInfo[frakcio][fSilenced][0], FrakcioInfo[frakcio][fMp5][0], FrakcioInfo[frakcio][fM4][0], FrakcioInfo[frakcio][fShotgun][0]);
	SendFormatMessage(playerid, COLOR_WHITE, "[LSPD] Sniper: %d | Combat: %d | Rifle: %d | Ejtõernyõ: %d",FrakcioInfo[frakcio][fSniper][0], FrakcioInfo[frakcio][fCombat][0],FrakcioInfo[frakcio][fRifle][0],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_FBI || Admin(playerid, 1)) frakcio=FRAKCIO_FBI;
	SendFormatMessage(playerid, COLOR_WHITE, "[FBI] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][0], FrakcioInfo[frakcio][fSilenced][0], FrakcioInfo[frakcio][fMp5][0], FrakcioInfo[frakcio][fM4][0], FrakcioInfo[frakcio][fShotgun][0]);
	SendFormatMessage(playerid, COLOR_WHITE, "[FBI] Sniper: %d | Combat: %d | Rifle: %d | Ejtõernyõ: %d",FrakcioInfo[frakcio][fSniper][0], FrakcioInfo[frakcio][fCombat][0],FrakcioInfo[frakcio][fRifle][0],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_NAV || Admin(playerid, 1)) frakcio=FRAKCIO_NAV;
	SendFormatMessage(playerid, COLOR_WHITE, "[SASD] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][0], FrakcioInfo[frakcio][fSilenced][0], FrakcioInfo[frakcio][fMp5][0], FrakcioInfo[frakcio][fM4][0], FrakcioInfo[frakcio][fShotgun][0]);
	SendFormatMessage(playerid, COLOR_WHITE, "[SASD] Sniper: %d | Combat: %d | Rifle: %d | Ejtõernyõ: %d",FrakcioInfo[frakcio][fSniper][0], FrakcioInfo[frakcio][fCombat][0],FrakcioInfo[frakcio][fRifle][0],FrakcioInfo[frakcio][fParachute]);
	//
	if(PlayerInfo[playerid][pLeader] == FRAKCIO_KATONASAG || Admin(playerid, 1)) frakcio=FRAKCIO_KATONASAG;
	SendFormatMessage(playerid, COLOR_WHITE, "[CCMF] Deagle: %d | Silenced: %d | Mp5: %d | M4: %d | Shotgun: %d",FrakcioInfo[frakcio][fDeagle][0], FrakcioInfo[frakcio][fSilenced][0], FrakcioInfo[frakcio][fMp5][0], FrakcioInfo[frakcio][fM4][0], FrakcioInfo[frakcio][fShotgun][0]);
	SendFormatMessage(playerid, COLOR_WHITE, "[CCMF] Sniper: %d | Combat: %d | Rifle: %d | Ejtõernyõ: %d",FrakcioInfo[frakcio][fSniper][0], FrakcioInfo[frakcio][fCombat][0],FrakcioInfo[frakcio][fRifle][0],FrakcioInfo[frakcio][fParachute]);
	SendClientMessage(playerid, COLOR_LIGHTGREEN,"================================ FEGYVEREK ================================");
	return 1;
}

ALIAS(rakt1r):raktar;
CMD:raktar(playerid, params[])
{
	new pm[32], subpm[64], subby[64], mit[32], mennyit, melo = PlayerInfo[playerid][pMember], fkid, szeflog[256];
	if(FloodCheck(playerid)) return 1;
	if(Civil(playerid) && !IsScripter(playerid)) return Msg(playerid, "Nem tartozol frakcióhoz.");
	if(sscanf(params, "s[32]S()[64]", pm, subpm))
	{
		if(!Admin(playerid, 1337) && !IsScripter(playerid)) return Msg(playerid, "/raktár [Megnéz/Berak/Kivesz/Minrang(leadernek)]");
		Msg(playerid, "/raktár [Megnéz/Berak/Kivesz/Minrang/Érték/Nulláz/Amegnéz]");
		return 1;
	}
	if(egyezik(pm, "megnéz") || egyezik(pm, "megnez"))
	{
		if(!PlayerToPoint(3, playerid, FrakcioInfo[melo][fPosX], FrakcioInfo[melo][fPosY], FrakcioInfo[melo][fPosZ])) return Msg(playerid, "Nem vagy a széf közelében.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "===========[ Raktár Tartalma ]===========");
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kaja: %ddb - Alma: %ddb", FrakcioInfo[melo][fKaja], FrakcioInfo[melo][fAlma]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Material: %sdb - Heroin: %sg", FormatNumber( FrakcioInfo[melo][fMati], 0, ',' ), FormatNumber( FrakcioInfo[melo][fHeroin], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kokain: %sg - Marihuana: %sg", FormatNumber( FrakcioInfo[melo][fKokain], 0, ',' ), FormatNumber( FrakcioInfo[melo][fMarihuana], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "C4: %ddb", FrakcioInfo[melo][fC4]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(1-10): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][0],FrakcioInfo[melo][fRuha][1],FrakcioInfo[melo][fRuha][2],FrakcioInfo[melo][fRuha][3],FrakcioInfo[melo][fRuha][4],FrakcioInfo[melo][fRuha][5],FrakcioInfo[melo][fRuha][6],FrakcioInfo[melo][fRuha][7],FrakcioInfo[melo][fRuha][8],FrakcioInfo[melo][fRuha][9]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(11-20): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][10],FrakcioInfo[melo][fRuha][11],FrakcioInfo[melo][fRuha][12],FrakcioInfo[melo][fRuha][13],FrakcioInfo[melo][fRuha][14],FrakcioInfo[melo][fRuha][15],FrakcioInfo[melo][fRuha][16],FrakcioInfo[melo][fRuha][17],FrakcioInfo[melo][fRuha][18],FrakcioInfo[melo][fRuha][19]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(21-30): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][20],FrakcioInfo[melo][fRuha][21],FrakcioInfo[melo][fRuha][22],FrakcioInfo[melo][fRuha][23],FrakcioInfo[melo][fRuha][24],FrakcioInfo[melo][fRuha][25],FrakcioInfo[melo][fRuha][26],FrakcioInfo[melo][fRuha][27],FrakcioInfo[melo][fRuha][28],FrakcioInfo[melo][fRuha][29]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(31-40): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][30],FrakcioInfo[melo][fRuha][31],FrakcioInfo[melo][fRuha][32],FrakcioInfo[melo][fRuha][33],FrakcioInfo[melo][fRuha][34],FrakcioInfo[melo][fRuha][35],FrakcioInfo[melo][fRuha][36],FrakcioInfo[melo][fRuha][37],FrakcioInfo[melo][fRuha][38],FrakcioInfo[melo][fRuha][39]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(41-50): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[melo][fRuha][40],FrakcioInfo[melo][fRuha][41],FrakcioInfo[melo][fRuha][42],FrakcioInfo[melo][fRuha][43],FrakcioInfo[melo][fRuha][44],FrakcioInfo[melo][fRuha][45],FrakcioInfo[melo][fRuha][46],FrakcioInfo[melo][fRuha][47],FrakcioInfo[melo][fRuha][48],FrakcioInfo[melo][fRuha][49]);
		Cselekves(playerid, "megnézte a raktárat...", 1);
	}
	elseif(egyezik(pm, "amegnéz") || egyezik(pm, "amegnez"))
	{
		if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
		if(sscanf(subpm, "d", fkid)) return SendClientMessage(playerid, COLOR_LIGHTRED, "ClassRPG: /raktár amegnéz [FrakcióID]");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "===========[ Raktár Tartalma ]===========");
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kaja: %ddb - Alma: %ddb", FrakcioInfo[fkid][fKaja], FrakcioInfo[fkid][fAlma]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Material: %sdb - Heroin: %sg", FormatNumber( FrakcioInfo[fkid][fMati], 0, ',' ), FormatNumber( FrakcioInfo[fkid][fHeroin], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kokain: %sg - Marihuana: %sg", FormatNumber( FrakcioInfo[fkid][fKokain], 0, ',' ), FormatNumber( FrakcioInfo[fkid][fMarihuana], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "C4: %ddb", FrakcioInfo[fkid][fC4]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(1-10): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][0],FrakcioInfo[fkid][fRuha][1],FrakcioInfo[fkid][fRuha][2],FrakcioInfo[fkid][fRuha][3],FrakcioInfo[fkid][fRuha][4],FrakcioInfo[fkid][fRuha][5],FrakcioInfo[fkid][fRuha][6],FrakcioInfo[fkid][fRuha][7],FrakcioInfo[fkid][fRuha][8],FrakcioInfo[fkid][fRuha][9]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(11-20): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][10],FrakcioInfo[fkid][fRuha][11],FrakcioInfo[fkid][fRuha][12],FrakcioInfo[fkid][fRuha][13],FrakcioInfo[fkid][fRuha][14],FrakcioInfo[fkid][fRuha][15],FrakcioInfo[fkid][fRuha][16],FrakcioInfo[fkid][fRuha][17],FrakcioInfo[fkid][fRuha][18],FrakcioInfo[fkid][fRuha][19]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(21-30): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][20],FrakcioInfo[fkid][fRuha][21],FrakcioInfo[fkid][fRuha][22],FrakcioInfo[fkid][fRuha][23],FrakcioInfo[fkid][fRuha][24],FrakcioInfo[fkid][fRuha][25],FrakcioInfo[fkid][fRuha][26],FrakcioInfo[fkid][fRuha][27],FrakcioInfo[fkid][fRuha][28],FrakcioInfo[fkid][fRuha][29]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(31-40): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][30],FrakcioInfo[fkid][fRuha][31],FrakcioInfo[fkid][fRuha][32],FrakcioInfo[fkid][fRuha][33],FrakcioInfo[fkid][fRuha][34],FrakcioInfo[fkid][fRuha][35],FrakcioInfo[fkid][fRuha][36],FrakcioInfo[fkid][fRuha][37],FrakcioInfo[fkid][fRuha][38],FrakcioInfo[fkid][fRuha][39]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Ruhatár(41-50): %d,%d,%d,%d,%d,%d,%d,%d,%d,%d", FrakcioInfo[fkid][fRuha][40],FrakcioInfo[fkid][fRuha][41],FrakcioInfo[fkid][fRuha][42],FrakcioInfo[fkid][fRuha][43],FrakcioInfo[fkid][fRuha][44],FrakcioInfo[fkid][fRuha][45],FrakcioInfo[fkid][fRuha][46],FrakcioInfo[fkid][fRuha][47],FrakcioInfo[fkid][fRuha][48],FrakcioInfo[fkid][fRuha][49]);
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Frakció: %d | Neve: %s", fkid, Szervezetneve[fkid-1][1]);
	}
	elseif(egyezik(pm, "berak"))
	{
		if(!PlayerToPoint(3, playerid, FrakcioInfo[melo][fPosX], FrakcioInfo[melo][fPosY], FrakcioInfo[melo][fPosZ])) return Msg(playerid, "Nem vagy a széf közelében.");
		if(sscanf(subpm, "s[32]S()[64]", mit, subby)) return Msg(playerid, "/raktár berak [Kaja/Alma/Mati/Heroin/Marihuana/Kokain/Ruha/C4] [Mennyit/RaktárID]");
		new mati = PlayerInfo[playerid][pMats];
		new heroin = PlayerInfo[playerid][pHeroin];
		new kokain = PlayerInfo[playerid][pKokain];
		new marihuana = PlayerInfo[playerid][pMarihuana];
		new kaja = PlayerInfo[playerid][pKaja];
		new alma = PlayerInfo[playerid][pAlma];
		if(egyezik(mit, "kaja"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár berak kaja [mennyit]");
			if(kaja < mennyit) return Msg(playerid, "Nincs elég kajád.");
			PlayerInfo[playerid][pKaja] -= mennyit;
			FrakcioInfo[melo][fKaja] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktál %ddb kaját a raktárba.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s berakott a raktárba %d db kaját",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "alma"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár berak alma [mennyit]");
			if(alma < mennyit) return Msg(playerid, "Nincs elég almád.");
			PlayerInfo[playerid][pAlma] -= mennyit;
			FrakcioInfo[melo][fAlma] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktál %ddb almát a raktárba.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s berakott a raktárba %d db almát",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "mati") || egyezik(mit, "material"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár berak mati [mennyit]");
			if(mati < mennyit) return Msg(playerid, "Nincs elég matid.");
			PlayerInfo[playerid][pMats] -= mennyit;
			FrakcioInfo[melo][fMati] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktál %ddb matit a raktárba.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s berakott a raktárba %d db matit",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "heroin"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár berak heroin [mennyit]");
			if(heroin < mennyit) return Msg(playerid, "Nincs elég heroinod.");
			PlayerInfo[playerid][pHeroin] -= mennyit;
			FrakcioInfo[melo][fHeroin] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktál %dg heroint a raktárba.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s berakott a raktárba %d db heroint",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "kokain"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár berak kokain [mennyit]");
			if(kokain < mennyit) return Msg(playerid, "Nincs elég kokainod.");
			PlayerInfo[playerid][pKokain] -= mennyit;
			FrakcioInfo[melo][fKokain] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktál %dg kokaint a raktárba.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s berakott a raktárba %d db kokaint",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "marihuana"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár berak marihuana [mennyit]");
			if(marihuana < mennyit) return Msg(playerid, "Nincs elég marihuanád.");
			PlayerInfo[playerid][pMarihuana] -= mennyit;
			FrakcioInfo[melo][fMarihuana] += mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktál %dg marihuanát a raktárba.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s berakott a raktárba %d db marihuanát",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "ruha"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár berak ruha [slot]");
			if(GetPlayerSkin(playerid) == 252) return Msg(playerid, "Még az alsógatyádat is a raktárba akarod rakni?..");
			if(mennyit < 0 || mennyit > 49) return Msg(playerid, "0-49");
			if(FrakcioInfo[melo][fRuha][mennyit] != 252 && FrakcioInfo[melo][fRuha][mennyit] != 0) return Msg(playerid, "Ezen a sloton már van valami!");
			FrakcioInfo[melo][fRuha][mennyit] = GetPlayerSkin(playerid);
			SetPlayerSkin(playerid, 252);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktad a ruhádat a raktárba (slot: %d).", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s berakott a raktárba a %d skint, a %d slotra", melo, Szervezetneve[melo - 1][2],PlayerName(playerid), FrakcioInfo[melo][fRuha][mennyit], mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "C4"))
		{
			if(PlayerInfo[playerid][pC4] == 0) return Msg(playerid, "Nincs C4 nálad.");
			PlayerInfo[playerid][pC4] --;
			FrakcioInfo[melo][fC4] ++;
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "* Beraktál 1 darab C4 robbanószert a raktárba.");
			format(szeflog, 256, "[%d. frakció (%s)]%s berakott a raktárba 1db C4-t", melo, Szervezetneve[melo - 1][2],PlayerName(playerid)); Log("Szef", szeflog);
		}
		INI_Save(INI_TYPE_FRAKCIO, melo);
	}
	elseif(egyezik(pm, "kivesz"))
	{
		if(!PlayerToPoint(3, playerid, FrakcioInfo[melo][fPosX], FrakcioInfo[melo][fPosY], FrakcioInfo[melo][fPosZ])) return Msg(playerid, "Nem vagy a széf közelében.");
		if(PlayerInfo[playerid][pRank] < FrakcioInfo[melo][fRaktarRang]) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Nem elég nagy a rangod, minimum rang: %d", FrakcioInfo[melo][fRaktarRang]);
		if(sscanf(subpm, "s[32]S()[64]", mit, subby)) return Msg(playerid, "/raktár kivesz [Kaja/Alma/Mati/Heroin/Marihuana/Kokain/Ruha/C4] [Mennyit/RaktárID]");
		new mati = FrakcioInfo[melo][fMati];
		new heroin = FrakcioInfo[melo][fHeroin];
		new kokain = FrakcioInfo[melo][fKokain];
		new marihuana = FrakcioInfo[melo][fMarihuana];
		new kaja = FrakcioInfo[melo][fKaja];
		new alma = FrakcioInfo[melo][fAlma];
		new c4 = FrakcioInfo[melo][fC4];
		if(egyezik(mit, "kaja"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár kivesz kaja [mennyit]");
			if(kaja < mennyit) return Msg(playerid, "Nincs elég kaja a széfben.");
			if((PlayerInfo[playerid][pKaja] + mennyit) > MAXKAJA) return Msg(playerid, "Ennyi nem fér el nálad.");
			PlayerInfo[playerid][pKaja] += mennyit;
			FrakcioInfo[melo][fKaja] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivettél %ddb kaját a raktárból.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s kivett a raktárból %d db kaját",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "alma"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár kivesz alma [mennyit]");
			if(alma < mennyit) return Msg(playerid, "Nincs elég alma a széfben.");
			if((PlayerInfo[playerid][pAlma] + mennyit) > MAXALMA) return Msg(playerid, "Ennyi nem fér el nálad.");
			PlayerInfo[playerid][pAlma] += mennyit;
			FrakcioInfo[melo][fAlma] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivettél %ddb almát a raktárból.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s kivett a raktárból %d db almát",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "mati") || egyezik(mit, "material"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár kivesz mati [mennyit]");
			if(mati < mennyit) return Msg(playerid, "Nincs elég mati a széfben.");
			if((PlayerInfo[playerid][pMats] + mennyit) > MAXMATI) return Msg(playerid, "Ennyi nem fér el nálad.");
			PlayerInfo[playerid][pMats] += mennyit;
			FrakcioInfo[melo][fMati] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivettél %ddb matit a raktárból.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s kivett a raktárból %d db matit",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "heroin"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár kivesz heroin [mennyit]");
			if(heroin < mennyit) return Msg(playerid, "Nincs elég heroin a széfben.");
			if((PlayerInfo[playerid][pHeroin] + mennyit) > MAXHEROIN) return Msg(playerid, "Ennyi nem fér el nálad.");
			PlayerInfo[playerid][pHeroin] += mennyit;
			FrakcioInfo[melo][fHeroin] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivettél %dg heroint a raktárból.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s kivett a raktárból %d db heroint",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "kokain"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár kivesz kokain [mennyit]");
			if(kokain < mennyit) return Msg(playerid, "Nincs elég kokain a széfben.");
			if((PlayerInfo[playerid][pKokain] + mennyit) > MAXKOKAIN) return Msg(playerid, "Ennyi nem fér el nálad.");
			PlayerInfo[playerid][pKokain] += mennyit;
			FrakcioInfo[melo][fKokain] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivettél %ddb kokaint a raktárból.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s kivett a raktárból %d db kokaint",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "marihuana"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár kivesz marihuana [mennyit]");
			if(marihuana < mennyit) return Msg(playerid, "Nincs elég marihuana a széfben.");
			if((PlayerInfo[playerid][pMarihuana] + mennyit) > MAXMARIHUANA) return Msg(playerid, "Ennyi nem fér el nálad.");
			PlayerInfo[playerid][pMarihuana] += mennyit;
			FrakcioInfo[melo][fMarihuana] -= mennyit;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Kivettél %ddb marihuanát a raktárból.", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s kivett a raktárból %d db marihuanat",melo, Szervezetneve[melo - 1][2],PlayerName(playerid), mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "ruha"))
		{
			if(sscanf(subby, "d", mennyit)) return Msg(playerid, "/raktár kivesz ruha [slot]");
			if(GetPlayerSkin(playerid) != 252) return Msg(playerid, "Már fel vagy öltözve!");
			if(mennyit < 0 || mennyit > 49) return Msg(playerid, "0-50");
			if(FrakcioInfo[melo][fRuha][mennyit] == 252) return Msg(playerid, "Ezen a slot üres!");
			SetPlayerSkin(playerid, FrakcioInfo[melo][fRuha][mennyit]);
			FrakcioInfo[melo][fRuha][mennyit] = 252;
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Beraktad a ruhádat a raktárból (slot: %d).", mennyit);
			format(szeflog, 256, "[%d. frakció (%s)]%s kivett a raktárból a %d skint, a %d slotról", melo, Szervezetneve[melo - 1][2],PlayerName(playerid), FrakcioInfo[melo][fRuha][mennyit], mennyit); Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "C4"))
		{
			if(c4 < 1) return Msg(playerid, "Nincs C4 a széfben!");
			if(PlayerInfo[playerid][pC4] == 1) return Msg(playerid, "Már van nálad C4!");
			PlayerInfo[playerid][pC4] = 1;
			FrakcioInfo[melo][fC4]--;
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "* Kivettél 1db C4 robbanószert a raktárból.");
			format(szeflog, 256, "[%d. frakció (%s)]%s kivett a raktárból 1db C4-et", melo, Szervezetneve[melo - 1][2],PlayerName(playerid)); Log("Szef", szeflog);
		}
		Log("Szef", szeflog);
		INI_Save(INI_TYPE_FRAKCIO, melo);
	}
	elseif(egyezik(pm, "minrang"))
	{
		if(PlayerInfo[playerid][pLeader] == 0) return Msg(playerid, "Kizárólag Leadernek!");
		if(sscanf(subpm, "d", mennyit))
		{
			SendFormatMessage(playerid, COLOR_LIGHTRED, "/raktár minrang [0-%d]", OsszRang[PlayerInfo[playerid][pLeader]]);
			SendFormatMessage(playerid, COLOR_LIGHTRED, "Jelenlegi szükséges rang: %d", FrakcioInfo[melo][fRaktarRang]);
			return 1;
		}
		if(mennyit < 0 || mennyit > OsszRang[PlayerInfo[playerid][pLeader]]) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: 0-%d", OsszRang[PlayerInfo[playerid][pLeader]]);
		format(szeflog, 256, "[%d. frakció (%s) - info]%s átírta a raktárnak min. rangját errõl: %d, erre: %d", melo, Szervezetneve[melo - 1][2],PlayerName(playerid), FrakcioInfo[melo][fRaktarRang], mennyit); Log("Szef", szeflog);

		FrakcioInfo[melo][fRaktarRang] = mennyit;
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* A raktárból mostantól %d rangtól lehet kivenni.", mennyit);
		INI_Save(INI_TYPE_FRAKCIO, melo);
	}
	elseif(egyezik(pm, "érték") || egyezik(pm, "ertek"))
	{
		if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
		if(sscanf(subpm, "ds[32]d", fkid, mit, mennyit))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "/raktár érték [FrakcióID] [Mit] [Mennyire]");
			SendClientMessage(playerid, COLOR_LIGHTRED, "Paraméterek: Kaja, Alma, Mati, Heroin, Marihuana, Kokain, C4");
			return 1;
		}
		if(mennyit < 0) return Msg(playerid, "Mínuszt?");
		new mati = FrakcioInfo[fkid][fMati];
		new heroin = FrakcioInfo[fkid][fHeroin];
		new kokain = FrakcioInfo[fkid][fKokain];
		new marihuana = FrakcioInfo[fkid][fMarihuana];
		new kaja = FrakcioInfo[fkid][fKaja];
		new alma = FrakcioInfo[fkid][fAlma];
		new c4 = FrakcioInfo[fkid][fC4];
		if(egyezik(mit, "material") || egyezik(mit, "mati"))
		{
			
			format(_tmpString,sizeof(_tmpString),"<< %s beállította a(z) (%d)%s frakció széfének tartalmát! Adat: Mati | Új: %s | Régi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( mati, 0, ',' ));
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Széf tartalma beállítva: %sdb Mati | Régi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber(mati, 0, ','));
			format(szeflog, 256, "%s beállította a %d. frakció (%s) raktárának materialtartalmát errõl: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], mati, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fMati] = mennyit;
		}
		elseif(egyezik(mit, "heroin"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s beállította a(z) (%d)%s frakció széfének tartalmát! Adat: Heroin | Új: %s | Régi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( heroin, 0, ',' ));
			
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Széf tartalma beállítva: %sg Heroin | Régi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( heroin, 0, ',' ));
			format(szeflog, 256, "%s beállította a %d. frakció (%s) raktárának herointartalmát errõl: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], heroin, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fHeroin] = mennyit;
		}
		elseif(egyezik(mit, "kokain"))
		{
			
			format(_tmpString,sizeof(_tmpString),"<< %s beállította a(z) (%d)%s frakció széfének tartalmát! Adat: Kokain | Új: %s | Régi: %s  >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( kokain, 0, ',' ));
			
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Széf tartalma beállítva: %sg Kokain | Régi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( kokain, 0, ',' ));
			format(szeflog, 256, "%s beállította a %d. frakció (%s) raktárának kokaintartalmát errõl: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], kokain, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fKokain] = mennyit;
		}
		elseif(egyezik(mit, "marihuana"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s beállította a(z) (%d)%s frakció széfének tartalmát! Adat: Marihuana | Új: %s | Régi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( marihuana, 0, ','));
		
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Széf tartalma beállítva: %sg Marihuana | Régi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( marihuana, 0, ',' ));
			format(szeflog, 256, "%s beállította a %d. frakció (%s) raktárának marihuanatartalmát errõl: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], marihuana, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fMarihuana] = mennyit;
		}
		elseif(egyezik(mit, "kaja"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s beállította a(z) (%d)%s frakció széfének tartalmát! Adat: Kaja | Új: %s | Régi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ), FormatNumber( kaja, 0, ',' ));
			
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Széf tartalma beállítva: %sdb Kaja | Régi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( mennyit, 0, ',' ), FormatNumber( kaja, 0, ',' ));
			format(szeflog, 256, "%s beállította a %d. frakció (%s) raktárának kajatartalmát errõl: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], kaja, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fKaja] = mennyit;
		}
		elseif(egyezik(mit, "alma"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s beállította a(z) (%d)%s frakció széfének tartalmát! Adat: Alma | Új: %s | Régi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ),  FormatNumber( alma, 0, ',' ));
	
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Széf tartalma beállítva: %sdb Alma | Régi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( alma, 0, ',' ));
			format(szeflog, 256, "%s beállította a %d. frakció (%s) raktárának almatartalmát errõl: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], alma, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fAlma] = mennyit;
		}
		elseif(egyezik(mit, "C4"))
		{
			format(_tmpString,sizeof(_tmpString),"<< %s beállította a(z) (%d)%s frakció széfének tartalmát! Adat: C4 | Új: %s | Régi: %s >>", PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mennyit, 0, ',' ),  FormatNumber( c4, 0, ',' ));
			
			SendMessage(SEND_MESSAGE_ADMIN,_tmpString,COLOR_LIGHTRED,PlayerInfo[playerid][pAdmin]);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Széf tartalma beállítva: %sdb C4 | Régi: %s", FormatNumber( mennyit, 0, ',' ), FormatNumber( c4, 0, ',' ));
			format(szeflog, 256, "%s beállította a %d. frakció (%s) raktárának C4 tartalmát errõl: %s erre: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], c4, mennyit), Log("Szef", szeflog);
			FrakcioInfo[fkid][fC4] = mennyit;
		}
		INI_Save(INI_TYPE_FRAKCIO, fkid);
	}
	elseif(egyezik(pm, "nulláz") || egyezik(pm, "nullaz"))
	{
		if(!Admin(playerid, 1337) && !IsScripter(playerid)) return 1;
		if(sscanf(subpm, "ds[32]", mit))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "/raktár nulláz [FrakcióID] [Mit]");
			SendClientMessage(playerid, COLOR_LIGHTRED, "Paraméterek: Kaja, Alma, Mati, Heroin, Marihuana, Kokain, C4");
			return 1;
		}
		if(mennyit < 0) return Msg(playerid, "Mínuszt?");
		new mati = FrakcioInfo[fkid][fMati];
		new heroin = FrakcioInfo[fkid][fHeroin];
		new kokain = FrakcioInfo[fkid][fKokain];
		new marihuana = FrakcioInfo[fkid][fMarihuana];
		new kaja = FrakcioInfo[fkid][fKaja];
		new alma = FrakcioInfo[fkid][fAlma];
		new c4 = FrakcioInfo[fkid][fC4];
		if(egyezik(mit, "material") || egyezik(mit, "mati"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s nullázta a(z) (%d)%s frakció raktárának tartalmát! Adat: Mati | Régi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( mati, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Raktár tartalma (Material) nullázva | Régi: %s", FormatNumber( mati, 0, ',' ));
			format(szeflog, 256, "%s nullázta a %d. frakció (%s) raktárának materialtartalmát - eredeti mennyiség: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], mati), Log("Szef", szeflog);
			FrakcioInfo[fkid][fMati] = 0;
		}
		elseif(egyezik(mit, "heroin"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s nullázta a(z) (%d)%s frakció raktárának tartalmát! Adat: Heroin | Régi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( heroin, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Raktár tartalma (Heroin) nullázva | Régi: %s", FormatNumber( heroin, 0, ',' ));
			format(szeflog, 256, "%s nullázta a %d. frakció (%s) raktárának herointartalmát - eredeti mennyiség: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], heroin), Log("Szef", szeflog);
			FrakcioInfo[fkid][fHeroin] = 0;
		}
		elseif(egyezik(mit, "kokain"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s nullázta a(z) (%d)%s frakció raktárának tartalmát! Adat: Kokain | Régi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( kokain, 0, ',' ));
			
			
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Raktár tartalma (Kokain) nullázva | Régi: %s", FormatNumber( kokain, 0, ',' ));
			format(szeflog, 256, "%s nullázta a %d. frakció (%s) raktárának kokaintartalmát - eredeti mennyiség: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], kokain), Log("Szef", szeflog);
			FrakcioInfo[fkid][fKokain] = 0;
		}
		elseif(egyezik(mit, "marihuana"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s nullázta a(z) (%d)%s frakció raktárának tartalmát! Adat: Marihuana | Régi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( marihuana, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Raktár tartalma (Marihuana) nullázva | Régi: %s", FormatNumber( marihuana, 0, ',' ));
			format(szeflog, 256, "%s nullázta a %d. frakció (%s) raktárának marihuanatartalmát - eredeti mennyiség: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], marihuana), Log("Szef", szeflog);
			FrakcioInfo[fkid][fMarihuana] = 0;
		}
		elseif(egyezik(mit, "kaja"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s nullázta a(z) (%d)%s frakció raktárának tartalmát! Adat: Kaja | Régi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( kaja, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Raktár tartalma (Kaja) nullázva | Régi: %s", FormatNumber( kaja, 0, ',' ));
			format(szeflog, 256, "%s nullázta a %d. frakció (%s) raktárának kajatartalmát - eredeti mennyiség: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], kaja), Log("Szef", szeflog);
			FrakcioInfo[fkid][fKaja] = 0;
		}
		elseif(egyezik(mit, "alma"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s nullázta a(z) (%d)%s frakció raktárának tartalmát! Adat: Alma | Régi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( alma, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Raktár tartalma (Alma) nullázva | Régi: %s", FormatNumber( alma, 0, ',' ));
			format(szeflog, 256, "%s nullázta a %d. frakció (%s) raktárának materialtartalmát - eredeti mennyiség: %s", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], alma), Log("Szef", szeflog);
			FrakcioInfo[fkid][fAlma] = 0;
		}
		elseif(egyezik(mit, "ruha"))
		{
			for(new s = 0; s < 49; s++) if(FrakcioInfo[fkid][fRuha][s] != 0) FrakcioInfo[fkid][fRuha][s] = 0;
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s nullázta a(z) (%d)%s frakció raktárának tartalmát! Adat: Ruha >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1]);
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "* Raktár tartalma (Ruha) nullázva");
			format(szeflog, 256, "%s nullázta a %d. frakció (%s) raktárának ruhatartalmát", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2]), Log("Szef", szeflog);
		}
		elseif(egyezik(mit, "c4"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s nullázta a(z) (%d)%s frakció raktárának tartalmát! Adat: C4 | Régi: %s >>",AdminRangNev(playerid), PlayerName(playerid), fkid, Szervezetneve[fkid-1][1], FormatNumber( c4, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Raktár tartalma (C4) nullázva | Régi: %s", FormatNumber( c4, 0, ',' ));
			format(szeflog, 256, "%s nullázta a %d. frakció (%s) raktárának materialtartalmát - eredeti mennyiség: %d", PlayerName(playerid), fkid, Szervezetneve[fkid-1][2], c4), Log("Szef", szeflog);
			FrakcioInfo[fkid][fC4] = 0;
		}
		INI_Save(INI_TYPE_FRAKCIO, fkid);
	}
	return 1;
}

ALIAS(k5zmunka):kozmunka;
CMD:kozmunka(playerid, params[])
{
	if(PInfo(playerid,Jailed) != 7) return Msg(playerid, "Nem a fegyenctelepen vagy elhelyezve, ezért nem kérhetsz közmunkás enyhítést!");
	if(JailTime[playerid] >= 1200) return Msg(playerid, "Nem kérhetsz közmunkát, mivel 20 évet ((percet)) vagy annál többet kell leülnöd!");
	if(PInfo(playerid,JailTime) > 900) return Msg(playerid, "A büntetésed még több, mint 15 év ((perc))!");
	if(PInfo(playerid,Kozmunka) != 0) return Msg(playerid, "Te már kérvényeztél valamilyen közmunkát!");
	new munka[32];
	if(sscanf(params, "s[32]", munka)) return Msg(playerid, "/közmunka [Fûnyírás/Úttisztítás]");
	new Float:yay[3];
	if(egyezik(munka, "fûnyírás") || egyezik(munka, "funyiras"))
	{
		CopMsgFormat(COLOR_ALLDEPT, "[Fegyenctelep] Figyelem: %s közmunkás enyhítést kért", ICPlayerName(playerid));
		CopMsgFormat(COLOR_ALLDEPT, "[Fegyenctelep] ezt a vádat enyhíti: %s - ezzel enyhíti a vádat: fûnyírás", PlayerInfo[playerid][pJailOK]);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Menj egy fûnyíró traktorhoz, ülj rá, és a /fûnyírás paranccsal kezdd el ledolgozni az idõdet.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Figyelem: A közmunka letöltésére 3 játszott óra lehetõséged van.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ez idõ alatt nem vehetsz elõ fegyvert, és nem warozhatsz.");
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0, "unjail7_kozmunkafunyiras");
		SetPlayerWorldBounds(playerid,20000.0000,-20000.0000,20000.0000,-20000.0000);
	 	SetPlayerPos(playerid, 2029.5023, -1404.1078, 17.2503);
		PlayerInfo[playerid][pJailed] = 0;
		PlayerInfo[playerid][pKozmunka] = MUNKA_FUNYIRO;
		PlayerInfo[playerid][pKozmunkaIdo] = 3;
		GetPlayerPos(playerid, ArrExt(yay));
		KozmunkasFelirat[playerid] = CreateDynamic3DTextLabel("Közmunkás\nFûnyírás", 0x640000FF, 0.0, 0.0, 0.15, 25.0, playerid, INVALID_VEHICLE_ID);
		BortonInfo[CellaID[playerid]][bRabok]--;
	}
	elseif(egyezik(munka, "úttisztítás") || egyezik(munka, "uttisztitas"))
	{
		CopMsgFormat(COLOR_ALLDEPT, "[Fegyenctelep] Figyelem: %s közmunkás enyhítést kért", ICPlayerName(playerid));
		CopMsgFormat(COLOR_ALLDEPT, "[Fegyenctelep] ezt a vádat enyhíti: %s - ezzel enyhíti a vádat: úttisztítás", PlayerInfo[playerid][pJailOK]);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Menj egy úttisztítós kocsihoz, ülj bele, és a /úttisztítás paranccsal kezdd el ledolgozni az idõdet.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Figyelem: A közmunka letöltésére 3 játszott óra lehetõséged van.");
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Ez idõ alatt nem vehetsz elõ fegyvert, és nem warozhatsz.");
		SetPlayerInterior(playerid, 0);
		SetPlayerVirtualWorld(playerid, 0, "unjail7_kozmunkauttisztitas");
		SetPlayerWorldBounds(playerid,20000.0000,-20000.0000,20000.0000,-20000.0000);
	 	SetPlayerPos(playerid, 2029.5023, -1404.1078, 17.2503);
		PlayerInfo[playerid][pJailed] = 0;
		PlayerInfo[playerid][pKozmunka] = MUNKA_UTTISZTITO;
		PlayerInfo[playerid][pKozmunkaIdo] = 3;
		GetPlayerPos(playerid, ArrExt(yay));
		KozmunkasFelirat[playerid] = CreateDynamic3DTextLabel("Közmunkás\nÚttisztító", 0x640000FF, 0.0, 0.0, 0.15, 25.0);
		BortonInfo[CellaID[playerid]][bRabok]--;
	}
	return 1;
}
ALIAS(menza):koszt; // /koszt már megy /menza parancsra is by Amos
CMD:koszt(playerid, params[])
{
   if(FloodCheck(playerid)) return 1;
   if(IsACop(playerid)) return Msg(playerid, "Megéheztél? :-D");
   if(Evett[playerid] > UnixTime) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Még nem kérhetsz kosztot! Legközelebb %d másodperc múlva kérhetsz", Evett[playerid]-UnixTime);
   //if(PInfo(playerid,Jailed) != 7) return Msg(playerid, "Nem a fegyenctelepen vagy elhelyezve, így nem kérhetsz kosztot!");
   if(!PInfo(playerid,Jailed)) return Msg(playerid, "Nem vagy börtönben");
   new kaja[32];
   if(sscanf(params, "s[32]", kaja)) return Msg(playerid, "/koszt [bableves/tojásleves/sertéspörkölt/rántotthús/borsófõzelék/krumplifõzelék/tökfözelék/tökleves/hagymásleves]");
   if(egyezik(kaja, "bableves"))
      Szukseglet(playerid, -7.5, -2.5),Cselekves(playerid, "kért egy adag bablevest.");
   elseif(egyezik(kaja, "tojásleves") || egyezik(kaja, "tojasleves"))
      Szukseglet(playerid, -2.5, -5.0),Cselekves(playerid, "kért egy adag tojáslevest.");
   elseif(egyezik(kaja, "sertéspörkölt") || egyezik(kaja, "sertesporkolt") || egyezik(kaja, "pörkölt") || egyezik(kaja, "porkolt"))
      Szukseglet(playerid, -10.0),Cselekves(playerid, "kért egy adag sertéspörköltet.");
   elseif(egyezik(kaja, "rántotthús") || egyezik(kaja, "rantotthus"))
      Szukseglet(playerid, -9.0, -1.0),Cselekves(playerid, "kért egy adag rántotthúst.");
   elseif(egyezik(kaja, "borsófõzelék") || egyezik(kaja, "borsofozelek"))
      Szukseglet(playerid, -8.5, -1.5),Cselekves(playerid, "kért egy adag borsófõzeléket.");
   elseif(egyezik(kaja, "krumplifõzelék") || egyezik(kaja, "krumplifozelek"))
      Szukseglet(playerid, -4.5, -5.5),Cselekves(playerid, "kért egy adag krumplifõzeléket.");
   elseif(egyezik(kaja, "tökfözelék") || egyezik(kaja, "tokfozelek"))
      Szukseglet(playerid, -5.5, -4.5),Cselekves(playerid, "kért egy adag tökfözelék.");
   else return Msg(playerid,"Nincs ilyen koszt.");
   
   Evett[playerid] = UnixTime+300;
   ApplyAnimation(playerid, "FOOD", "EAT_Burger", 3.0, 0, 0, 0, 0, 0);
   SendClientMessage(playerid, COLOR_GREEN, "Kértél egy menüt, nem kell sietned, öt percenként szolgálnak ki újra! Jó étvágyat!");
   return 1;
}


ALIAS(b5rt5ncella):bortoncella;
CMD:bortoncella(playerid, params[])
{
	if(!IsACop(playerid) && !Admin(playerid, 5)) return Msg(playerid, "Ez a parancs nem elérhetõ számodra!");
	if(!PlayerToPoint(3.0, playerid, 1354.1110, 1356.7679, 10.9698)) return Msg(playerid, "Nem vagy a rabokat irányító számítógépnél!");
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
		CopMsgFormat(TEAM_BLUE_COLOR, "[Fegyenctelep] Figyelmeztetés: %s kinyitotta a fegyenctelep összes cellájának ajtaját", ICPlayerName(playerid));
		Msg(playerid, "Az összes cella ajtaja kinyitva! Figyelem, a szökés veszélye fenn állhat!", false);
	}
	else
	{
		Fegyenckapuknyitva = false;
		CopMsgFormat(TEAM_BLUE_COLOR, "[Fegyenctelep] Figyelmeztetés: %s bezárta a fegyenctelep összes cellájának ajtaját", ICPlayerName(playerid));
		Msg(playerid, "Az összes cella ajtaja bezárva!", false);
	}
	return 1;
}

CMD:adatforgalom(playerid, params[])
{
	new ertek;
	if(PlayerInfo[playerid][pPbiskey] != BIZ_TELEFON && !Admin(playerid, 1337)) return Msg(playerid, "Ez a parancs csak a telefonszolgáltató tulajdonosának érhetõ el!");
	if(AdatforgalomValtoztatas > UnixTime) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Nem módosíthatod az adatforgalmat, egy héten csak egyszer szabad! Legközelebb %d nap múlva lehet", (AdatforgalomValtoztatas-UnixTime)/3600);
	if(sscanf(params, "d", ertek)) return Msg(playerid, "/adatforgalom [ár]");
	if(ertek < 0 || ertek > 100) return Msg(playerid, "0-100 közötti értéket adj meg!");
	AdatforgalomAr = ertek;
	AdatforgalomValtoztatas = UnixTime+604800;
	SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Adatforgalom ár átírva ennyire: %d Ft - Ez 1 kb adatforgalom ára!", ertek);
	return 1;
}

CMD:mobilnet(playerid, params[])
{
	new wp[32];
	if(PlayerInfo[playerid][pMobilnet] == NINCS) return Msg(playerid, "Nincs mobilnet szerzõdésed!");
	if(sscanf(params, "s[32]", wp)) return Msg(playerid, "/mobilnet [Adatforgalmam/Lemond/Ár]");
	if(egyezik(wp, "adatforgalmam"))
		SendFormatMessage(playerid, COLOR_DARKYELLOW, "[ClassTel] Önnek jelenleg %d kb elhasznált adatforgalma van.", PlayerInfo[playerid][pMobilnet]);
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
			SendFormatMessage(playerid, COLOR_DARKYELLOW, "[ClassTel] Ön sikeresen lemondta mobilnet szerzõdését, a szerzõdésbontás miatt %d forintot fizetett (20000 Ft + elhasznált adatforgalom)!", ar+20000);
		}
		else
		{
			BizPenz(BIZ_TELEFON, 20000);
			if(PlayerInfo[playerid][pBankSzamla] > 0)
				PlayerInfo[playerid][pAccount] -= 20000;
			else
				GiveMoney(playerid, -20000);
			SendClientMessage(playerid, COLOR_DARKYELLOW, "[ClassTel] Ön sikeresen lemondta mobilnet szerzõdését, a szerzõdésbontás miatt 20000 Forintot fizetett!");
		}
		PlayerInfo[playerid][pMobilnet] = NINCS;
	}
	elseif(egyezik(wp, "ár") || egyezik(wp, "ar"))
		SendFormatMessage(playerid, COLOR_DARKYELLOW, "[ClassTel] A jelenlegi adatforgalom ár: %d Ft/kb", AdatforgalomAr);
	return 1;
}

CMD:wifi(playerid, params[])
{
	new param[32], sparam[32];
	if(FloodCheck(playerid)) return 1;
	if(PlayerInfo[playerid][pLaptop] == 0) return Msg(playerid, "Nincs laptopod!");
	if(sscanf(params, "s[32]S()[32]", param, sparam)) return Msg(playerid, "Használata: /wifi [csatlakozás/lecsatlakozás/közel/pontok]");
	if(egyezik(param, "csatlakozás") || egyezik(param, "csatlakozas") || egyezik(param, "connect"))
	{
		new wifipont = GetClosestWifiPoint(playerid), wifierosseg = GetWifiSignal(playerid, wifipont);
		if(wifierosseg < 10) return Msg(playerid, "Nincs közeledben wifi pont!");
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "... Csatlakozás ehhez a hotspothoz: {FFFFFF}%s {9ACD32}...", WifiPont[wifipont][wNev]);
		MunkaFolyamatban[playerid] = 1;
		SetTimerEx("Munkavege", 5000, false, "ddd", playerid, M_WIFICONNECT, wifipont);
	}
	elseif(egyezik(param, "közel") || egyezik(param, "kozel"))
	{
		new Float:tavolsag, Float:s[3], wifipont = 0;
		GetPlayerPos(playerid, ArrExt(s));
		SendClientMessage(playerid, COLOR_DARKYELLOW, "===[ Közelben található Wifi Hotspot(ok) ]===");
		for(new a = 0; a < sizeof(WifiPont); a++)
		{
			tavolsag = GetDistanceBetweenPoints(ArrExt(s), ArrExt(WifiPont[a][wPos]));
			if(tavolsag <= 100.0 && GetPlayerVirtualWorld(playerid) == WifiPont[a][wVw] && GetPlayerInterior(playerid) == WifiPont[a][wInt])
			{
				new wifi = GetWifiSignal(playerid, a);
				wifipont++;
				SendFormatMessage(playerid, COLOR_WHITE, "%s - Jelerõsség: %d százalék - HotSpot ID: %d", WifiPont[a][wNev], wifi, WifiPont[a][wID]);
			}
		}
		if(wifipont < 1) return Msg(playerid, "A közelben nincs egyetlen wifi hotspot sem!");
	}
	elseif(egyezik(param, "lecsatlakozás") || egyezik(param, "lecsatlakozas") || egyezik(param, "disconnect"))
	{
		if(!LaptopConnected[playerid]) return Msg(playerid, "Nem csatlakoztál hotspothoz!");
		
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "... Lecsatlakozva errõl a hotspotról: {FFFFFF}%s {9ACD32}...", WifiPont[LaptopIP[playerid]][wNev]);
		LaptopIP[playerid] = NINCS;
		LaptopConnected[playerid] = false;
	}
	elseif(egyezik(param, "pontok"))
	{
		new wifipont = 0;
		SendClientMessage(playerid, COLOR_DARKYELLOW, "===[ Wifi Hotspotok listája ]===");
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
		if(sscanf(sparam, "s[32]", nev)) return Msg(playerid, "/wifi lerak [Wifipont neve - ClassHotSpot_név]");
		new Float:p[3], int = GetPlayerInterior(playerid), vw = GetPlayerVirtualWorld(playerid);
		GetPlayerPos(playerid, ArrExt(p));
		CreateWifi(ArrExt(p), vw, int, nev);
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Wifi hotspot lerakva, neve: ClassHotSpot_%s", nev);
		Format(_tmpString, "%s lerakott egy wifi hotspotot, név: ClassHotSpot_%s", nev);
		Log("Scripter", _tmpString);
	}
	return 1;
}

ALIAS(tdsz3n):textdrawszin;
ALIAS(tdszin):textdrawszin;
ALIAS(textdrawsz3n):textdrawszin;
CMD:textdrawszin(playerid, params[])
{
	ShowPlayerDialog(playerid, DIALOG_TEXTDRAW_COLOR, DIALOG_STYLE_LIST, "Textdrawháttér szín választása", "{505055}Fekete\n{FFFFFF}Fehér\n{22AAFF}Kék\n{111133}Sötétkék\n{00D900}Világoszöld\n{33AA33}Sötétzöld\n{AA0000}Piros\n{FFFF00}Sárga\n{FF1493}Pink\nÁtlátszó", "Kiválaszt", "Mégse");
	SendClientMessage(playerid, COLOR_SPEC, "Válaszd ki azt a színt, amelyet textdraw háttérként szeretnél használni!");
	return 1;
}

CMD:arany(playerid, params[])
{
	new pm[32], spm[32];
	if(FloodCheck(playerid)) return 1;
	if(!IsAt(playerid, IsAt_Bank)) return Msg(playerid, "Csak bankban használható!");
	if(sscanf(params, "s[32]S()[32]", pm, spm)) return Msg(playerid, "Használata: /arany [vétel/berak/kivesz/elad/információ]");
	/*if(egyezik(pm, "vétel") || egyezik(pm,"vetel") || egyezik(pm, "vesz"))
	{
		new db;
		if(sscanf(spm, "d", db)) return Msg(playerid, "Használata: /arany vétel [darab]");
		if(db < 1 || db > 5) return Msg(playerid, "Egyszerre maximum 5 darabot tudunk elõállítani! A minimális vásárlási mennyiség: 1 db");
		if(!BankkartyaFizet(playerid, db*50000000)) return SendFormatMessage(playerid, COLOR_LIGHTRED, "%d darab arany %s Forintba kerül, ennyit nem bír kifizetni!", db, FormatInt(db*50000000));
		if(Biztos[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
			SendClientMessage(playerid, COLOR_WHITE, "Kérem gondolja át alaposan, hogy befekteti-e pénzét aranyba!");
			SendFormatMessage(playerid, COLOR_WHITE, "%d darab arany megvásárlása után %s Ft marad egyenlegén!", db, FormatInt(PlayerInfo[playerid][pAccount] - 50000000*db));
			SendClientMessage(playerid, COLOR_WHITE, "A mûvelet nem visszavonható, így ha ténylegesen meg szeretné válaszolni, írja be mégegyszer a parancsot!");
			Biztos[playerid] = 1;
		}
		else
		{
			PlayerInfo[playerid][pArany] += db;
			BankSzef += db*10000000;
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
			SendFormatMessage(playerid, COLOR_WHITE, "Sikeres vásárlás! Egyenlegérõl levontunk %s Ft-t, így maradt %s Ft!", FormatInt(50000000*db), FormatInt(PlayerInfo[playerid][pAccount]));
			SendClientMessage(playerid, COLOR_WHITE, "Köszönjük, hogy minket választott! Aranyait berakhatja bankba, mellyel aranyai után "#ARANY_KAMAT"%%-os kamathoz juthat!");
			Biztos[playerid] = 0;
		}
	}
	else*/
	if(egyezik(pm, "berak") || egyezik(pm, "befektet"))
	{
		new db;
		if(PlayerInfo[playerid][pArany] == 0) return Msg(playerid, "Nincs arany Önnél!");
		if(sscanf(spm, "d", db)) return Msg(playerid, "Használata: /arany befektet [darab]");
		if(db < 1) return Msg(playerid, "Persze..");
		if(PlayerInfo[playerid][pArany] < db) return Msg(playerid, "Nincs ennyi arany Önnél!");
		if(Biztos[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
			SendClientMessage(playerid, COLOR_WHITE, "Kérem gondolja át alaposan, hogy befekteti-e az aranyait!");
			SendFormatMessage(playerid, COLOR_WHITE, "%d darab arany befektetése után %.3f százalék kamatot kap!", db, db*ARANY_KAMAT);
			SendClientMessage(playerid, COLOR_WHITE, "Amennyiben tényleg ezt szeretné, írja be mégegyszer a parancsot!");
			Biztos[playerid] = 1;
		}
		else
		{
			PlayerInfo[playerid][pArany] -= db;
			PlayerInfo[playerid][pAranyBank] += db;
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
			SendFormatMessage(playerid, COLOR_WHITE, "Sikeres befektetés! %d darab aranyt fektetett be bankunkba, mely után %.3f%% kamatot kap!", db, db*ARANY_KAMAT);
			SendClientMessage(playerid, COLOR_WHITE, "Köszönjük, hogy minket választott! ClassBank Zrt.");
			Biztos[playerid] = 0;
		}
	}
	else if(egyezik(pm, "kivesz"))
	{
		new db;
		if(PlayerInfo[playerid][pAranyBank] == 0) return Msg(playerid, "Ön még nem fektetett be aranyat a bankba!");
		if(sscanf(spm, "d", db)) return Msg(playerid, "Használata: /arany kivesz [darab]");
		if(db < 1) return Msg(playerid, "Persze..");
		if(PlayerInfo[playerid][pAranyBank] < db) return Msg(playerid, "Nincs ennyi aranya a bankban!");
		if(Biztos[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
			SendClientMessage(playerid, COLOR_WHITE, "Kérem gondolja át alaposan, hogy megszünteti-e befektetését!");
			SendFormatMessage(playerid, COLOR_WHITE, "%d darab arany kivétele után %.3f%% kamattól esik el!", db, db*ARANY_KAMAT);
			SendClientMessage(playerid, COLOR_WHITE, "Amennyiben tényleg ezt szeretné, írja be mégegyszer a parancsot!");
			Biztos[playerid] = 1;
		}
		else
		{
			PlayerInfo[playerid][pArany] += db;
			PlayerInfo[playerid][pAranyBank] -= db;
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
			SendFormatMessage(playerid, COLOR_WHITE, "Sikeres kivétel! %d darab aranyt vett ki bankunkból, így %.3f%% kamattól esett el!", db, db*ARANY_KAMAT);
			SendClientMessage(playerid, COLOR_WHITE, "Köszönjük, hogy minket választott! ClassBank Zrt.");
			Biztos[playerid] = 0;
		}
	}
	else if(egyezik(pm, "info") || egyezik(pm, "infó") || egyezik(pm, "információ") || egyezik(pm, "informacio"))
	{
		SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
		SendFormatMessage(playerid, COLOR_WHITE, "Jelenleg %ddb aranya van, mely után %.3f%% kamatot kap.", PlayerInfo[playerid][pAranyBank], PlayerInfo[playerid][pAranyBank] * ARANY_KAMAT);
		SendClientMessage(playerid, COLOR_WHITE, "Jelenleg egy darab aranyrúd ára: 50,000,000 Ft.");
		SendClientMessage(playerid, COLOR_WHITE, "Banki befektetés esetén a befektetett aranyak száma után "#ARANY_KAMAT"%% kamatot kap aranyrudanként.");
		SendClientMessage(playerid, COLOR_WHITE, "Az arany használható fizetõeszközként, illetve befektetésként is.");
	}
	else if(egyezik(pm, "elad"))
	{
		if(UnixTime > 1391990399)
			return Msg(playerid, "Már nincs lehetõség arany eladására");
			
		new db;
		if(PlayerInfo[playerid][pAranyBank] == 0) return Msg(playerid, "Ön még nem fektetett be aranyat a bankba!");
		if(sscanf(spm, "d", db)) return Msg(playerid, "Használata: /arany elad [darab]");
		if(db < 1) return Msg(playerid, "Persze..");
		if(PlayerInfo[playerid][pAranyBank] < db) return Msg(playerid, "Nincs ennyi aranya a bankban!");
		if(Biztos[playerid] != 1)
		{
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
			SendClientMessage(playerid, COLOR_WHITE, "Kérem gondolja át alaposan, hogy eladja-e aranyait a banknak!");
			SendClientMessage(playerid, COLOR_WHITE, "Egy aranyrudat 49 millió forintért vásárol vissza a bank!");
			SendFormatMessage(playerid, COLOR_WHITE, "%d darab arany eladásáért %d forintot fog érte kapni!", db, db*49000000);
			SendClientMessage(playerid, COLOR_WHITE, "Amennyiben tényleg ezt szeretné, írja be mégegyszer a parancsot!");
			Biztos[playerid] = 1;
		}
		else
		{
			PlayerInfo[playerid][pAranyBank] -= db;
			PlayerInfo[playerid][pAccount] += 49000000*db;
			SendClientMessage(playerid, COLOR_DARKYELLOW, "=====[ Banki üzenet ]=====");
			SendFormatMessage(playerid, COLOR_WHITE, "Sikeres kivétel! %d darab aranyt adott el, mely után %s Ft-t kapott!", db, FormatInt(49000000*db));
			SendClientMessage(playerid, COLOR_WHITE, "Köszönjük, hogy minket választott! ClassBank Zrt.");
			Biztos[playerid] = 0;
		}
	}
	else if(egyezik(pm, "set"))
	{
		new uid, type[32], amount, zseb = PlayerInfo[uid][pArany], bank = PlayerInfo[uid][pAranyBank];
		if(!IsScripter(playerid)) return 1;
		if(IdgScripter[playerid]) return Msg(playerid, "Csak a rendes scripterek használhatják!");
		if(sscanf(spm, "rs[32]d", uid, type, amount)) return Msg(playerid, "Használata: /arany set [Név/ID] [Zseb/Bank] [Mennyiség]");
		if(uid == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
		if(amount < 0) return Msg(playerid, "A minimum érték 0!");
		if(egyezik(type, "zseb"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s beállította %s zsebében lévõ aranyának mennyiségét! Új: %s | Régi: %s >>",AdminRangNev(playerid), PlayerName(playerid), PlayerName(uid), FormatNumber( amount, 0, ',' ), FormatNumber( zseb, 0, ',' ));
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* %s zsebe beállítva: %sdb Arany | Régi: %s", PlayerName(uid), FormatNumber( amount, 0, ',' ), FormatNumber( zseb, 0, ',' ));
			PlayerInfo[uid][pArany] = amount;
		}
		elseif(egyezik(type, "bank"))
		{
			ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s %s beállította %s bankban lévõ aranyának mennyiségét! Új: %s (%.3f%%) | Régi: %s (%.3f%%) >>",AdminRangNev(playerid), PlayerName(playerid), PlayerName(uid), FormatNumber( amount, 0, ',' ), amount*ARANY_KAMAT, FormatNumber( bank, 0, ',' ), zseb*ARANY_KAMAT);
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* %s zsebe beállítva: %sdb (%.3f%%) Arany | Régi: %s (%.3f%%)", PlayerName(uid), FormatNumber( amount, 0, ',' ), amount*ARANY_KAMAT, FormatNumber( bank, 0, ',' ), bank*ARANY_KAMAT);
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
		Msg(playerid, "KIkapcsoltad a havazást!");
		return 1;
	}
	else
	{
	
		if(IdoJaras[iMost] == NINCS)
			IdojarasValt(playerid, NINCS);
		
		Havazas[playerid]=true;		
		Msg(playerid, "BEkapcsoltad a havazást! A következõ havazásnál havazni fog!");
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
	
	if(sscanf(params, "s[9]S()[32]", func,func2)) return Msg(playerid,"/kupon [megnéz / töröl / saját / megmutat]");
	
	if(egyezik(func,"megnéz") || egyezik(func,"saját") || egyezik(func,"megmutat"))
	{
		if(egyezik(func,"megnéz"))
		{
			if(!Admin(playerid,1337)) return Msg(playerid, "Csak fõadmin!");
			if(sscanf(func2, "u", player)) return Msg(playerid,"/kupon megnéz [id]");
			if(player == INVALID_PLAYER_ID) return Msg(playerid,"Nincs ilyen játékos!");
			SendFormatMessage(playerid,COLOR_LIGHTRED,"==== %s kuponja====",PlayerName(player));
		}
		else if(egyezik(func,"megmutat"))
		{
			if(player == INVALID_PLAYER_ID) return Msg(playerid,"Nincs ilyen játékos!");
			if(GetDistanceBetweenPlayers(playerid, player) > 3) return Msg(playerid, "Nincs a közeledben!");
			if(sscanf(func2, "u", player)) return Msg(playerid,"/kupon megmutat [id]");
			Msg(playerid, "Megmutattad a kuponodat!");
			Cselekves(playerid, "megmutatta a kuponját!");
			SendFormatMessage(player,COLOR_LIGHTRED,"==== %s kuponja====",PlayerName(playerid));
			
			switch(PlayerInfo[playerid][pAjandek])
			{
				case 1: Msg(player,"Neked/neki egy ingyen kocs alakítása van. ((/alakit))");
				case 2: Msg(player,"Neked/neki egy ingyen ház áthelyezése van.");
				case 3: Msg(player,"Neked/neki egy ingyen ház belsõ alakítása van.");
				case 4: Msg(player,"Neked/neki egy ingyen öröktuningod van!");
				default: Msg(player,"Neked/neki nincs kuponod!");
			}
			return 1;
		}
		else
			player=playerid;
			
		switch(PlayerInfo[player][pAjandek])
		{
			case 1: Msg(playerid,"Neked/neki egy ingyen kocs alakítása van. ((/alakit))");
			case 2: Msg(playerid,"Neked/neki egy ingyen ház áthelyezése van.");
			case 3: Msg(playerid,"Neked/neki egy ingyen ház belsõ alakítása van.");
			case 4: Msg(playerid,"Neked/neki egy ingyen öröktuningod van!");
			default: Msg(playerid,"Neked/neki nincs kupond!");
		}
		return 1;
	}
	if(egyezik(func,"töröl"))
	{
		
		if(!Admin(playerid,1337)) return Msg(playerid, "Csak fõadmin!");
		if(sscanf(func2, "u",player)) return Msg(playerid,"/kupon töröl [id]");
		if(player == INVALID_PLAYER_ID) return Msg(playerid,"Nincs ilyen játékos!");
		if(PlayerInfo[player][pAjandek] == NINCS) return Msg(playerid, "nincs neki kuponja");
		SendFormatMessage(playerid,COLOR_YELLOW,"Törölted a kuponját %s",PlayerName(player));
		Msg(player,"Törölték a kuponodat!");
		PlayerInfo[player][pAjandek] = NINCS;
		format(log,sizeof(log),"[ajandek]%s törölte %s kuponját",PlayerName(playerid),PlayerName(player));
		Log("Egyeb",log);
		return 1;
	
	}
	

	return 1;
}
/*ALIAS(aj1nd2k):ajandek;
CMD:ajandek(playerid, params[])
{
	
	if(PlayerInfo[playerid][pAjandekUnixtime] > 1) return Msg(playerid, "Már kaptál ajándékot!");
	
	if(PlayerInfo[playerid][pBID] > 8187279) return Msg(playerid, "Csak a karácsonyig létrehozott karakterek kapnak ajándékot!");
	
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
	if(id == NINCS) return Msg(playerid, "Ez nem a te csomagod próbálj másikat!");
	
	
	
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
		
		Msg(playerid, "Kinyitottad az ajándékodat! Az ajándékod 1.000.000 Ft volt! Boldog karácsonyt kívánunk!");
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
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen kocsi alakítás egy olyan modelre aminek UCP ára nem éri el a 80.000.000 FT-ott");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott model, menj lecserélni! ((/alakit))");
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen kocsi alakítást!",PlayerName(playerid));
						Log("Egyeb",log);
						PlayerInfo[playerid][pAjandek] = 1;
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen házáthelyezés!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott helyszín, keres fel egy fõadmint!");
						PlayerInfo[playerid][pAjandek] = 2;
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen hátáthelyezést!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen belsõ csere!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott belsõ, keres fel egy fõadmint!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen belsõ alakítást!",PlayerName(playerid));
						Log("Egyeb",log);
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						PlayerInfo[playerid][pAjandek] = 3;
						return 1;
					
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen örök tuning!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott örök tuning, menj keres fel egy garázst és rakd fel a választottad!");
						PlayerInfo[playerid][pAjandek] = 4;
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen öröktuningot!",PlayerName(playerid));
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
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen kocsi alakítás egy olyan modelre aminek UCP ára nem éri el a 80.000.000 FT-ott");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott model, menj lecserélni! ((/alakit))");
						PlayerInfo[playerid][pAjandek] = 1;
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen kocsi alakítást!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen örök tuning!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott örök tuning, menj keres fel egy garázst és rakd fel a választottad!");
						PlayerInfo[playerid][pAjandek] = 4;
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						format(log,sizeof(log),"[ajandek] %s egy ingyen örök tuningot",PlayerName(playerid));
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
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen házáthelyezés!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott helyszín, keres fel egy fõadmint!");
						PlayerInfo[playerid][pAjandek] = 2;
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen házáthelyezést",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen belsõ csere!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott belsõ, keres fel egy fõadmint!");
						PlayerInfo[playerid][pAjandek] = 3;
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen belsõ cserét!",PlayerName(playerid));
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
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy aranyrúd!");
						PlayerInfo[playerid][pArany] = 1;
						format(log,sizeof(log),"[ajandek] %s kapott egy aranyrudat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						if(PlayerInfo[playerid][pLaptop] == 0)
						{
						
							Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy laptop!");
							PlayerInfo[playerid][pLaptop] = 1;
							format(log,sizeof(log),"[ajandek] %s kapott egy laptopot",PlayerName(playerid));
							Log("Egyeb",log);
							return 1;
						
						}
						else
						{
							Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy aranyrúd!");
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
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen kocsi alakítás egy olyan modelre aminek UCP ára nem éri el a 80.000.000 FT-ott");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott model, menj lecserélni! ((/alakit))");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen kocsi alakítást!",PlayerName(playerid));
						Log("Egyeb",log);
						PlayerInfo[playerid][pAjandek] = 1;
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						return 1;
						
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen házáthelyezés!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott helyszín, keres fel egy fõadmint!");
						PlayerInfo[playerid][pAjandek] = 2;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen hátáthelyezést!",PlayerName(playerid));
						Log("Egyeb",log);
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						return 1;
					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen belsõ csere!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott belsõ, keres fel egy fõadmint!");
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen belsõ alakítást!",PlayerName(playerid));
						Log("Egyeb",log);
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						PlayerInfo[playerid][pAjandek] = 3;
						return 1;
					
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen örök tuning!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott örök tuning, menj keres fel egy garázst és rakd fel a választottad!");
						PlayerInfo[playerid][pAjandek] = 4;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen öröktuningot!",PlayerName(playerid));
						Log("Egyeb",log);
						Msg(playerid, "A kuponok nem átválthatóak PÉNZRE adminok által!!!");
						return 1;

					}
				case 4:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 1500g heroin!");
						PlayerInfo[playerid][pHeroin] +=1500;
						format(log,sizeof(log),"[ajandek] %s kapott 1500g heroint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 5:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 2000g Kokain!");
						PlayerInfo[playerid][pKokain] +=2000;
						format(log,sizeof(log),"[ajandek] %s kapott 2000g kokaint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 6:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 30.000db material!");
						PlayerInfo[playerid][pMats] +=30000;
						format(log,sizeof(log),"[ajandek] %s kapott 30.000db materialt",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 7:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 1000g Marihuana!");
						PlayerInfo[playerid][pMarihuana] +=1000;
						format(log,sizeof(log),"[ajandek] %s kapott 1000g marihuanat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 8:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy Sniper és 100 lõszer hozzá!");
						WeaponGiveWeapon(playerid, WEAPON_SNIPER, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_SNIPER, 100);
						format(log,sizeof(log),"[ajandek] %s kapott egy Sniper-t 1000 lõszerrel!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 9:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy M4-es 500 lõszerrel!");
						WeaponGiveWeapon(playerid, WEAPON_M4, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_M4, 500);
						format(log,sizeof(log),"[ajandek] %s kapott egy M4-et 500 lõszerrel",PlayerName(playerid));
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
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen kocsi alakítás egy olyan modelre aminek UCP ára nem éri el a 80.000.000 FT-ott");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott model, menj lecserélni! ((/alakit))");
						PlayerInfo[playerid][pAjandek] = 1;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen kocsi alakítást!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen örök tuning!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott örök tuning, menj keres fel egy garázst és rakd fel a választottad!");
						PlayerInfo[playerid][pAjandek] = 4;
						format(log,sizeof(log),"[ajandek] %s egy ingyen örök tuningot",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;

					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 1500g heroin!");
						PlayerInfo[playerid][pHeroin] +=1500;
						format(log,sizeof(log),"[ajandek] %s kapott 1500g heroint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 2000g Kokain!");
						PlayerInfo[playerid][pKokain] +=2000;
						format(log,sizeof(log),"[ajandek] %s kapott 2000g kokaint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 4:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 30.000db material!");
						PlayerInfo[playerid][pMats] +=30000;
						format(log,sizeof(log),"[ajandek] %s kapott 30.000db materialt",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 5:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 1000g Marihuana!");
						PlayerInfo[playerid][pMarihuana] +=1000;
						format(log,sizeof(log),"[ajandek] %s kapott 1000g marihuanat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 6:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy Sniper és 100 lõszer hozzá!");
						WeaponGiveWeapon(playerid, WEAPON_SNIPER, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_SNIPER, 100);
						format(log,sizeof(log),"[ajandek] %s kapott egy Sniper-t 1000 lõszerrel!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 7:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy M4-es 500 lõszerrel!");
						WeaponGiveWeapon(playerid, WEAPON_M4, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_M4, 500);
						format(log,sizeof(log),"[ajandek] %s kapott egy M4-et 500 lõszerrel",PlayerName(playerid));
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
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen házáthelyezés!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott helyszín, keres fel egy fõadmint!");
						PlayerInfo[playerid][pAjandek] = 2;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen házáthelyezést",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy ingyen belsõ csere!");
						Msg(playerid,"Ezt az ajándékot oda is adhatod másnak a /átad ajándék parancsal!");
						Msg(playerid, "Ha meg van a választott belsõ, keres fel egy fõadmint!");
						PlayerInfo[playerid][pAjandek] = 3;
						format(log,sizeof(log),"[ajandek] %s kapott egy ingyen belsõ cserét!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					
					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 1500g heroin!");
						PlayerInfo[playerid][pHeroin] +=1500;
						format(log,sizeof(log),"[ajandek] %s kapott 1500g heroint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 2000g Kokain!");
						PlayerInfo[playerid][pKokain] +=2000;
						format(log,sizeof(log),"[ajandek] %s kapott 2000g kokaint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 4:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 30.000db material!");
						PlayerInfo[playerid][pMats] +=30000;
						format(log,sizeof(log),"[ajandek] %s kapott 30.000db materialt",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 5:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 1000g Marihuana!");
						PlayerInfo[playerid][pMarihuana] +=1000;
						format(log,sizeof(log),"[ajandek] %s kapott 1000g marihuanat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 6:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy Sniper és 100 lõszer hozzá!");
						WeaponGiveWeapon(playerid, WEAPON_SNIPER, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_SNIPER, 100);
						format(log,sizeof(log),"[ajandek] %s kapott egy Sniper-t 1000 lõszerrel!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 7:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy M4-es 500 lõszerrel!");
						WeaponGiveWeapon(playerid, WEAPON_M4, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_M4, 500);
						format(log,sizeof(log),"[ajandek] %s kapott egy M4-et 500 lõszerrel",PlayerName(playerid));
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
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 1500g heroin!");
						PlayerInfo[playerid][pHeroin] +=1500;
						format(log,sizeof(log),"[ajandek] %s kapott 1500g heroint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 1:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 2000g Kokain!");
						PlayerInfo[playerid][pKokain] +=2000;
						format(log,sizeof(log),"[ajandek] %s kapott 2000g kokaint!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 2:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 30.000db material!");
						PlayerInfo[playerid][pMats] +=30000;
						format(log,sizeof(log),"[ajandek] %s kapott 30.000db materialt",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 3:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod 1000g Marihuana!");
						PlayerInfo[playerid][pMarihuana] +=1000;
						format(log,sizeof(log),"[ajandek] %s kapott 1000g marihuanat",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 4:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy Sniper és 100 lõszer hozzá!");
						WeaponGiveWeapon(playerid, WEAPON_SNIPER, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_SNIPER, 100);
						format(log,sizeof(log),"[ajandek] %s kapott egy Sniper-t 1000 lõszerrel!",PlayerName(playerid));
						Log("Egyeb",log);
						return 1;
					}
				case 5:
					{
						Msg(playerid,"Kinyitottad az ajándékodat! Az ajándékod egy M4-es 500 lõszerrel!");
						WeaponGiveWeapon(playerid, WEAPON_M4, .maxweapon = 0);
						WeaponGiveAmmo(playerid, WEAPON_M4, 500);
						format(log,sizeof(log),"[ajandek] %s kapott egy M4-et 500 lõszerrel",PlayerName(playerid));
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

ALIAS(bel2p2sek):belepesek;
CMD:belepesek(playerid, params[])
{
	if(Belepesek[playerid])
	{
		Belepesek[playerid] = false;
		Msg(playerid, "Most már nem látod, hogy kik lépnek be a közeledben.");
	}
	else
	{
		Belepesek[playerid] = true;
		Msg(playerid, "Most már látod, hogy kik lépnek be a közeledben.");
	}
	return 1;
}

CMD:detektor(playerid, params[])
{
	new v = GetPlayerVehicleID(playerid), vs = IsAVsKocsi(v), m[32];
	if(!IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Csak jármûben használható!");
	if(vs == NINCS) return Msg(playerid, "Ebben a jármûben nincs detektor! (vs)");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return Msg(playerid, "Sofõrként kell vezetned!");
	if(CarInfo[vs][cDetektor] == 0) return Msg(playerid, "Ebben a jármûben nincs detektor!");
	if(sscanf(params, "s[32]", m))
	{
		if(Detektor[v])
		{
			Detektor[v] = false;
			Msg(playerid, "Detektor kikapcsolva, vigyázz, ismét elkaphat a traffipax!");
			Cselekves(playerid, "babrál valamit az ülése alatt...", 1);
		}
		else
		{
			Detektor[v] = true;
			Msg(playerid, "Detektor bekapcsolva, vigyázz, ha a rendõr észreveszi, lecsukhat érte!");
			Cselekves(playerid, "babrál valamit az ülése alatt...", 1);
		}
	}
	else if(!sscanf(params, "s[32]", m)) SendFormatMessage(playerid, COLOR_ADD, "Ebben a jármûben %d-as szintû detektor van", CarInfo[vs][cDetektor]);
	return 1;
}
CMD:emp(playerid, params[])
{
	new v = GetPlayerVehicleID(playerid), vs = IsAVsKocsi(v), m[32];
	if(!IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Csak jármûben használható!");
	if(vs == NINCS) return Msg(playerid, "Ebben a jármûben nincs EMP! (vs)");
	if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER) return Msg(playerid, "Sofõrként kell vezetned!");
	if(CarInfo[vs][cEMP] == 0) return Msg(playerid, "Ebben a jármûben nincs EMP védelem!");
	if(sscanf(params, "s[32]", m))
	{
		if(EMPKE[v])
		{
			EMPKE[v] = false;
			Msg(playerid, "EMP kikapcsolva, vigyázz, ismét lesokkolhatják a jármûved!");
			Cselekves(playerid, "babrál valamit az ülése alatt...", 1);
		}
		else
		{
			EMPKE[v] = true;
			Msg(playerid, "EMP bekapcsolva, vigyázz, ha a rendõr észreveszi, lecsukhat érte!");
			Cselekves(playerid, "babrál valamit az ülése alatt...", 1);
		}
	}
	else if(!sscanf(params, "s[32]", m)) SendFormatMessage(playerid, COLOR_ADD, "Ebben a jármûben %d-as szintû EMP van", CarInfo[vs][cEMP]);
	return 1;
}

/*ALIAS(szem2t):szemet;
CMD:szemet(playerid, params[])
{
	new mitakarvele[32];
	if(sscanf(params, "s[32]", mitakarvele)) return Msg(playerid, "/szemét [felvesz/lerak]");
	if(egyezik(mitakarvele, "felvesz"))
	{
		if(VanSzemetNala[playerid]) return Msg(playerid, "Nálad már van szemét, elõbb azt rakd le!");
		new kuka = NINCS;
		for(new k = 0; k < sizeof(TrashInfo); k++)
		{
			if(PlayerToPoint(1.0, playerid, ArrExt(TrashInfo[k][tSzemetPos])) && TrashInfo[k][tSzemet])
			{
				kuka = k;
				break;
			}
		}
		if(kuka == NINCS) return Msg(playerid, "Nem vagy szemét közelében!");
		
		VanSzemetNala[playerid] = true;
		SetPlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS, 1265, 6, 0.189000, -0.236000, 0.011999, -55.500057, 0.000000, 110.500022);
		TrashInfo[kuka][tSzemet] = false;
		if(IsValidDynamicPickup(TrashInfo[kuka][tSzemetPickup])) DestroyDynamicPickup(TrashInfo[kuka][tSzemetPickup]);
		if(IsValidDynamic3DTextLabel(TrashInfo[kuka][tSzemetLabel])) DestroyDynamic3DTextLabel(TrashInfo[kuka][tSzemetLabel]), TrashInfo[kuka][tSzemetLabel] = INVALID_3D_TEXT_ID;
		Streamer_Update(playerid);
		Msg(playerid, "Szemét felvéve");
	}
	if(egyezik(mitakarvele, "lerak"))
	{
		if(!VanSzemetNala[playerid]) return Msg(playerid, "Nincs nálad szemét!");
		new Float:pozicio[3], kuka = NINCS, vw = GetPlayerVirtualWorld(playerid), int = GetPlayerInterior(playerid);
		GetPlayerPos(playerid, ArrExt(pozicio));
		if(vw != 0 || int != 0) return Msg(playerid, "Csak a szabadban helyezheted el a szemetet! (0-s vw és 0-s interior)");
		
		for(new k = 0; k < sizeof(TrashInfo); k++)
		{
			if(!TrashInfo[k][tSzemet])
			{
				kuka = k;
				break;
			}
		}
		if(kuka == NINCS) { SzemetDebug[playerid] = true; Msg(playerid, "Hiba, nincs hely lerakni a szemetet, írj a scripterek topikjába! Most írd be: /szemét debug"); return 1; }
		
		TrashInfo[kuka][tSzemetPos][0] = pozicio[0];
		TrashInfo[kuka][tSzemetPos][1] = pozicio[1];
		TrashInfo[kuka][tSzemetPos][2] = pozicio[2];
		TrashInfo[kuka][tSzemet] = true;
		VanSzemetNala[playerid] = false;
		if(!IsValidDynamicPickup(TrashInfo[kuka][tSzemetPickup])) TrashInfo[kuka][tSzemetPickup] = UjPickup(1265, 23, ArrExt(TrashInfo[kuka][tSzemetPos]), 0, 0);
		tformat(64, "Szemét\nLerakta:%s", ICPlayerName(playerid));
		if(!IsValidDynamic3DTextLabel(TrashInfo[kuka][tSzemetLabel])) TrashInfo[kuka][tSzemetLabel] = CreateDynamic3DTextLabel(_tmpString, 0xFFC801AA, ArrExt(TrashInfo[kuka][tSzemetPos]), 25.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0);
		RemovePlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS);
		Streamer_Update(playerid);
		Msg(playerid, "Szemét lerakva");
	}
	if(egyezik(mitakarvele, "debug"))
	{
		if(!SzemetDebug[playerid]) return 1;
		VanSzemetNala[playerid] = false;
		SzemetDebug[playerid] = false;
		RemovePlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS);
		Streamer_Update(playerid);
		Msg(playerid, "Szemét debugolva");
	}
	return 1;
}*/

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
				SendFormatMessage(playerid,COLOR_YELLOW,"[Hívásra megy][%d]%s Díjszabás:%d FT [Szállítások: %d, Km: %.3f]",id,ICPlayerName(id),FrakcioInfo[FRAKCIO_TAXI][fDij],Taxi[id][tHivasok], Taxi[id][tOKm]/1000.0);
			}
			elseif(Taxi[id][tUtas] == NINCS)
			{
				GetPlayerPos(id, xx,yy,zz);
				new Float:tavolsag = GetDistanceBetweenPoints(x, y, z, xx, yy, zz);
				SendFormatMessage(playerid,COLOR_GREEN,"[Szabad][%d]%s Díjszabás:%d FT távolság: %.3f [Szállítások: %d, Km: %.3f]",id,ICPlayerName(id),FrakcioInfo[FRAKCIO_TAXI][fDij],tavolsag,Taxi[id][tHivasok], Taxi[id][tOKm]/1000.0);
			}
			else
				SendFormatMessage(playerid,COLOR_LIGHTRED,"[Foglalt][%d]%s Díjszabás:%d FT [Szállítások: %d, Km: %.3f]",id,ICPlayerName(id),FrakcioInfo[FRAKCIO_TAXI][fDij],Taxi[id][tHivasok], Taxi[id][tOKm]/1000.0);
		
		
		}
	}
	Msg(playerid, "/service taxi [id]");
	return 1;
}

/*ALIAS(kukas):kuka;
ALIAS(kuk1s):kuka;
CMD:kuka(playerid, params[])
{
	if(OnDuty[playerid]) return Msg(playerid, "Döntsd elõbb el mit dolgozol! ((frakció dutyba nem!))");
	new parameter[64];
	if(!AMT(playerid, MUNKA_KUKAS)) return Msg(playerid, "Nem vagy kukás!");
	if(sscanf(params, "s[64]", parameter)) return Msg(playerid, "/kuka [munka/hely/segítség]");
	if(egyezik(parameter, "munka") || egyezik(parameter, "szolgalat") || egyezik(parameter, "szolgálat"))
	{
		if(!PlayerToPoint(2.5, playerid, -586.7446,-1501.2863,10.3250))
		{
			SetPlayerCheckpoint(playerid, -586.7446,-1501.2863,10.3250, 2.5);
			Msg(playerid, "Nem vagy a szeméttelepen!");
			return 1;
		}
		if(Munkaban[playerid] != MUNKA_KUKAS)
		{
			Munkaban[playerid] = MUNKA_KUKAS;
			if(PlayerInfo[playerid][pSex] == 2) SetPlayerSkin(playerid, 157);
			else SetPlayerSkin(playerid, 8);
			Msg(playerid, "Felvetted a ruhádat, így munkába álltál. A munka végzéséhez segítség: /kuka segítség");
			
		}
		else if(Munkaban[playerid] == MUNKA_KUKAS)
		{
			Munkaban[playerid] = NINCS;
			if(!LegalisSzervezetTagja(playerid) && !Civil(playerid))
				SetPlayerSkin(playerid, PlayerInfo[playerid][pChar]);
			else
				SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
				
			Msg(playerid, "Visszavetted a civil ruhádat, így már nem dolgozol.");
		}
	}
	else if(egyezik(parameter, "hely"))
	{
		if(Munkaban[playerid] != MUNKA_KUKAS) return Msg(playerid, "Nem kukásként dolgozol!");
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
		if(legkozelebb == 5000.0) return Msg(playerid, "Jelenleg nincs elszállításra váró kuka.");
		SetPlayerCheckpoint(playerid, ArrExt(TrashInfo[kukac][tSzemetPos]), 2.0);
		Msg(playerid, "Az irányító ügynökség megjelölte a számodra legközelebbi elszállítatlan szemetet.");
	}
	else if(egyezik(parameter, "segítség") || egyezik(parameter, "segitseg") || egyezik(parameter, "help"))
	{
		SendClientMessage(playerid, COLOR_GREEN, "=====[ Kukás munka használati útmutató ]=====");
		SendClientMessage(playerid, COLOR_WHITE, "A munkát elkezdeni a /kuka munka paranccsal tudod.");
		SendClientMessage(playerid, COLOR_GRAD6, "Miután beleültél egy kukáskocsiba, egy házhoz kell menned, ahol fel kell venned a szemetet.");
		SendClientMessage(playerid, COLOR_GRAD5, "Ezt a kukáskocsihoz állva bele kell tenned a szemétmegsemmisítõbe a BAL EGÉRGOMB megnyomásával.");
		SendClientMessage(playerid, COLOR_GRAD4, "Egy kukáskocsiba maximum 20 szemét fér, így ha ez megtelik, el kell vinni a szeméttelepre.");
		SendClientMessage(playerid, COLOR_GRAD3, "Ott a szemétlerakó széléhez kell állni, ahol a BAL EGÉRGOMB megnyomása után egy kis idõ elteltével kiürül a tartály.");
		SendClientMessage(playerid, COLOR_GRAD2, "Ekkor jóváíródik a fizetésedhez a szemetekért kapott pénz, majd folytathatod a munkát, vagy befejezheted.");
		SendClientMessage(playerid, COLOR_GRAD1, "A játékosok házai elõtt a szemetek a játékosok fizetéseikor újra lerakódnak.");
	}
	return 1;
}*/
ALIAS(h3rek):news;
CMD:news(playerid, params[])
{
	new szoveg[128], jarmu = GetPlayerVehicleID(playerid);
	if(FloodCheck(playerid)) return 1;
	if(!LMT(playerid, FRAKCIO_RIPORTER)) return Msg(playerid, "Ez a parancs nem elérhetõ számodra");
	if(IsFrakcioKocsi(jarmu) != 9 && !PlayerToPoint(2, playerid, -1821.3152,323.6341,-41.7493) && !PlayerToPoint(6, playerid, 1429.8469,-2448.7258,13.5629)) return Msg(playerid, "Riporter jármûben kell lenned vagy a stúdióban!");
	if(!Munkarang(playerid, 1)) return Msg(playerid, "Ez a parancs nem elérhetõ számodra");
	if(sscanf(params, "s[128]", szoveg)) return Msg(playerid, "/mûsornév [Mûsor neve]");
	if(strlen(szoveg) > 100) return Msg(playerid, "Maximum 100 karakter!");
	if(SzovegEllenorzes(playerid, szoveg, "/news", ELLENORZES_HIRDETES)) return 1;
	
	if(strcmp(RadioMusorNev,"NINCS") == 0)
		format(_tmpString, sizeof(_tmpString), "Rádiós %s: %s", ICPlayerName(playerid), szoveg);
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
	if(!LMT(playerid, FRAKCIO_RIPORTER)) return Msg(playerid, "Ez a parancs nem elérhetõ számodra");
	if(IsFrakcioKocsi(jarmu) != 9 && !PlayerToPoint(2, playerid, -1821.3152,323.6341,-41.7493) && !PlayerToPoint(6, playerid, 1429.8469,-2448.7258,13.5629)) return Msg(playerid, "Riporter jármûben kell lenned vagy a stúdióban!");
	if(!Munkarang(playerid, 1)) return Msg(playerid, "Ez a parancs nem elérhetõ számodra");
	if(PlayerInfo[playerid][pNewsSkill] < 101) return Msg(playerid, "A parancs használatához minimum 3-as ripoter skill szükséges");
	if(sscanf(params, "s[64]", musorcime)) return Msg(playerid, "/mûsornév [Mûsor neve]");
	if(strlen(musorcime) > 32) return Msg(playerid, "Maximum 32 karakteres lehet a mûsor címe!");
	if(SzovegEllenorzes(playerid, musorcime, "/musornev", ELLENORZES_HIRDETES)) return 1;
	if(egyezik(musorcime, "ki") || egyezik(musorcime, "NINCS"))
	{
		RadioMusorNev = "NINCS";
		Msg(playerid, "Rádió mûsornév kikapcsolva!");
		RadioAktivsag = UnixTime+300;
		PlayerInfo[playerid][pNewsSkill] ++;
		if(PlayerInfo[playerid][pNewsSkill] == 200)
			SendClientMessage(playerid, COLOR_YELLOW, "* A riporter skilled elérte a 4es szintet! Mostmár tudsz repülni a riporter helikopterrel!");
		else if(PlayerInfo[playerid][pNewsSkill] == 400)
			SendClientMessage(playerid, COLOR_YELLOW, "* A riporter skilled elérte az 5ös szintet! Mostmár tudsz felkérni másokat, hogy élõ adásban szerepeljen, illetve tudsz zenét indítani!");
		format(_tmpString, 128, "<< %s kikapcsolta a mûsornevek használatát >>", PlayerName(playerid), musorcime);
		SendMessage(SEND_MESSAGE_FRACTION, _tmpString, COLOR_LIGHTRED, 9);
		EgyebLog(_tmpString);
		return 1;
	}
	RadioMusorNev = musorcime;
	SendFormatMessage(playerid, COLOR_GREEN, "Az új mûsornév: %s, kikapcsoláshoz: /mûsornév ki", musorcime);
	RadioAktivsag = UnixTime+300;
	PlayerInfo[playerid][pNewsSkill] ++;
	if(PlayerInfo[playerid][pNewsSkill] == 200)
		SendClientMessage(playerid, COLOR_YELLOW, "* A riporter skilled elérte a 4es szintet! Mostmár tudsz repülni a riporter helikopterrel!");
	else if(PlayerInfo[playerid][pNewsSkill] == 400)
		SendClientMessage(playerid, COLOR_YELLOW, "* A riporter skilled elérte a 5ös szintet! Mostmár tudsz felkérni másokat, hogy élõ adásban szerepeljen, illetve tudsz zenét indítani!");
	format(_tmpString, 128, "<< %s megváltoztatta a mûsornevet erre: %s >>", PlayerName(playerid), musorcime);
	SendMessage(SEND_MESSAGE_FRACTION, _tmpString, COLOR_LIGHTRED, 9);
	EgyebLog(_tmpString);
	return 1;
}

CMD:megad(playerid, params[])
{
	if(FloodCheck(playerid)) return 1;
	if(NemMozoghat(playerid)) return Msg(playerid, "Már késõ, nem gondolod?");
	if(!PlayerInfo[playerid][pMegad])
	{
		PlayerInfo[playerid][pMegad] = true;
		Cselekves(playerid, "megadta magát");
		Msg(playerid, "Megadtad magadat. Kikapcsoláshoz írd be ismét a parancsot: /megad");
		
		ApplyAnimation(playerid, "ROB_BANK","SHP_HandsUp_Scr", 4.0, 0, 0, 0, 0, 1);
	}
	else
	{
		PlayerInfo[playerid][pMegad] = false;
		Msg(playerid, "Már nem adod meg magadat. Bekapcsoláshoz írd be ismét a parancsot: /megad");
		ClearAnim(playerid);
		
	}
	return 1;
}

CMD:uninvite(playerid, params[])
{
	new target, reason[128], str[128];
	if(!PlayerInfo[playerid][pLeader]) return Msg(playerid, "Nem vagy leader");
	if(sscanf(params, "us[128]", target, reason)) return Msg(playerid, "/uninvite [Név/ID] [Oka]");
	if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
	if(PlayerInfo[playerid][pMember] != PlayerInfo[target][pMember]) return Msg(playerid, "Õ nem a te tagod");
	if(PlayerInfo[target][pLeader] > 0) return Msg(playerid, "Nem rúghatod ki, mivel leader");
	if(FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fUtolsoTagFelvetel] > (UnixTime - 300)) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Csak 5percenként lehet tagot felvenni / kirúgni, még %dmp van hátra", FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fUtolsoTagFelvetel] - (UnixTime - 300));
	
	FrakcioInfo[PlayerInfo[playerid][pLeader]][fUtolsoTagFelvetel] = UnixTime;
	FrakcioInfo[PlayerInfo[playerid][pLeader]][fTagokSzama]--;
	SendFormatMessage(playerid, COLOR_GREEN, "ClassRPG: Kirúgtad %s-t a frakcióból, oka: %s", PlayerName(target), reason);
	SendFormatMessage(target, COLOR_GREEN, "ClassRPG: %s kirúgott a frakcióból, oka: %s", PlayerName(playerid), reason);
	format(str, 128, "<< ClassRPG: %s kirúgta %s-t a frakcióból - Oka: %s >>", PlayerName(playerid), PlayerName(target), reason);
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
	if(sscanf(params, "u", target)) return Msg(playerid, "/invite [Név/ID]");
	if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
	if(PlayerInfo[target][pMember] > 0) return Msg(playerid, "Õ már tag valahol");
	if(PlayerInfo[target][pLeader] > 0) return Msg(playerid, "Õ már leader valahol");
	if(PlayerInfo[target][pFrakcioTiltIdo]) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Õ el van tiltva a frakcióktól, oka: %s, még %d óráig", PlayerInfo[target][pFrakcioTiltOk], PlayerInfo[target][pFrakcioTiltIdo]);
	if(PlayerInfo[playerid][pLeader] < 1 || PlayerInfo[playerid][pLeader] > sizeof(Szervezetneve)) return 1;
	if(FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fUtolsoTagFelvetel] > (UnixTime - 300)) return SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Csak 5percenként lehet tagot felvenni / kirúgni, még %dmp van hátra", FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fUtolsoTagFelvetel] - (UnixTime - 300));
	if(FrakcioInfo[ PlayerInfo[playerid][pLeader] ][fTagokSzama] >= SzervezetLimit[ PlayerInfo[playerid][pLeader] - 1 ]) return Msg(playerid, "A frakció tele van");
	if(Invitejog[target]) return Msg(playerid, "Õ már meg van hívva valahova, így nem tudsz meghívást küldeni neki");
	
	Invitejog[target] = PlayerInfo[playerid][pMember];
	SendFormatMessage(playerid, COLOR_GREEN, "ClassRPG: Meghívtad %s-t, hogy csatlakozzon hozzátok, ha elfogadja, taggá válik", PlayerName(target));
	SendFormatMessage(target, COLOR_LIGHTBLUE, "ClassRPG: %s meghívott téged, hogy csatlakozz a(z) %s frakcióhoz.", PlayerName(playerid), Szervezetneve[PlayerInfo[playerid][pLeader] - 1][1]);
	SendClientMessage(target, COLOR_LIGHTBLUE, "ClassRPG: Elfogadáshoz használd a /accept invite parancsot, elutasításhoz pedig a /cancel invite parancsot.");
	format(str, 128, "<< ClassRPG: %s meghívta %s-t a frakcióba, ha elfogadja, taggá válik >>", PlayerName(playerid), PlayerName(target));
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
		return Msg(playerid, "Nem vagy tûzoltó!");
	if(Visz[playerid] != NINCS)
	{
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "Elengedted");
		Visz[playerid] = NINCS;
		return 1;
	}
		
	if(!IsPlayerConnected(jatekos)) 
		return 1;
	
	if(GetDistanceBetweenPlayers(playerid, jatekos) > 3)
		return Msg(playerid, "Nincs a közeledben!");
	
	for(new t = 0; t < TUZ_MAX; t++)
	{
		if(!Tuz[t][tuzAktiv])
			continue;
		
		if(!PlayerToPoint(TUZ_SERULES_TAV, jatekos, ArrExt( Tuz[t][tPoz] )))
			return Msg(playerid, "Õ nincs a tûzben!");
			
		Visz[playerid] = jatekos;
		Msg(playerid, "Megfogtad és elkezdted húzni õt, siess, nehogy komolyabb baja essen!", false, COLOR_LIGHTBLUE);
		Cselekves(playerid, "elkezdett valakit kihúzni a lángok közül");
	}
	
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

ALIAS(mobiledatacomputer):mdc;
CMD:mdc(playerid, params[])
{
	new type[16], subtype[32];
	if(!IsACop(playerid)) return Msg(playerid, "Nem vagy rendõr!");
	if(OnDuty[playerid] != 1 && AdminDuty[playerid] != 1) return Msg(playerid, "Nem vagy szolgálatban!");
	if(sscanf(params, "s[16]S()[32]", type, subtype)) return Msg(playerid, "/mdc [játékos/jármû]");
	if(egyezik(type, "játékos") || egyezik(type, "jatekos") || egyezik(type, "player"))
	{
		new target;
		if(sscanf(subtype, "u", target)) return Msg(playerid, "/mdc játékos [Név/ID]");
		if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen játékos!");
		SendClientMessage(playerid, TEAM_BLUE_COLOR, "==========[ MOBILE DATA COMPUTER ]==========");
		SendFormatMessage(playerid, COLOR_WHITE, "Név: %s", ICPlayerName(target));
		SendFormatMessage(playerid, COLOR_WHITE, "Bûn: %s", PlayerCrime[target][pVad]);
		SendFormatMessage(playerid, COLOR_WHITE, "Jelentõ: %s", PlayerCrime[target][pJelento]);
		SendClientMessage(playerid, TEAM_BLUE_COLOR,"==========[ MOBILE DATA COMPUTER ]==========");
	}
	else if(egyezik(type, "jármû") || egyezik(type, "jarmu") || egyezik(type, "vehicle"))
	{
		new target;
		if(sscanf(subtype, "i", target)) return Msg(playerid, "/mdc jármû [Rendszám]");
		if(target == INVALID_VEHICLE_ID) return Msg(playerid, "Nincs ilyen jármû");
		SendClientMessage(playerid, TEAM_BLUE_COLOR, "==========[ MOBILE DATA COMPUTER ]==========");
		SendFormatMessage(playerid, COLOR_WHITE, "Rendszám: CLS-%d", target);
		SendFormatMessage(playerid, COLOR_WHITE, "Jármû típus: %s", GetVehicleModelName(GetVehicleModel(target)-400));
		SendFormatMessage(playerid, COLOR_WHITE, "Bûn: %s", VehicleCrime[target][vVad]);
		SendFormatMessage(playerid, COLOR_WHITE, "Jelentõ: %s", VehicleCrime[target][vJelento]);
		SendClientMessage(playerid, TEAM_BLUE_COLOR,"==========[ MOBILE DATA COMPUTER ]==========");
	}
	return 1;
}

ALIAS(su):suspect;
CMD:suspect(playerid, params[])
{
	new type[16], subtype[32];
	if(!IsACop(playerid)) return Msg(playerid, "Nem vagy rendõr!");
	if(OnDuty[playerid] != 1) return Msg(playerid, "Nem vagy szolgálatban!");
	if(sscanf(params, "s[16]S()[32]", type, subtype)) return Msg(playerid, "/suspect [játékos/jármû]");
	if(egyezik(type, "játékos") || egyezik(type, "jatekos") || egyezik(type, "player"))
	{
		new target, crime[128];
		if(sscanf(subtype, "us[128]", target, crime)) return Msg(playerid, "/suspect játékos [Név/ID] [Bûntett]");
		if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen játékos!");
		if(IsACop(target)) return Msg(playerid, "Rendõrt nem lehet feljelenteni!");
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Sikeresen feljelentetted %s-t!", ICPlayerName(target));
		SetPlayerCriminal(target, playerid, crime);
	}
	if(egyezik(type, "jármû") || egyezik(type, "jarmu") || egyezik(type, "vehicle"))
	{
		new target, crime[128];
		if(sscanf(subtype, "is[128]", target, crime)) return Msg(playerid, "/suspect jármû [Rendszám] [Bûntett]");
		if(target == INVALID_VEHICLE_ID) return Msg(playerid, "Nincs ilyen jármû");
		if(IsACopCar(target)) return Msg(playerid, "Rendõrkocsit nem lehet feljelenteni!");
		SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Sikeresen feljelentetted a CLS-%d rendszámú jármûvet!", target);
		SetVehicleCriminal(target, playerid, crime);
	}
	return 1;
}

ALIAS(szerv3zk5nyv):szervizkonyv;
ALIAS(szervizk5nyv):szervizkonyv;
CMD:szervizkonyv(playerid, params[])
{
	new target, car = GetPlayerVehicleID(playerid);
	if(!IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "A szervizkönyv a kocsiban van");
	if(sscanf(params, "u", target)) return Msg(playerid, "/szervizkönyv [Név/ID]");
	if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen játékos");
	if(GetDistanceBetweenPlayers(playerid, target) > 4.0) return Msg(playerid, "Nincs a közeledben");
	if(IsABicikli(car)) return Msg(playerid, "Ennek nincs szervizkönyve");
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
			
	SendFormatMessage(target, COLOR_GREEN, "=====[ CLS-%d jármû szervizkönyve ]=====", car);
	if(tulaj != NINCS)
		SendFormatMessage(target, COLOR_LIGHTGREEN, "Jármû tulajdonosa: %s", CarInfo[tulaj][cOwner]);
	else
		SendClientMessage(target, COLOR_LIGHTGREEN, "Jármû tulajdonosa: Céges tulajdon");
	SendFormatMessage(target, COLOR_LIGHTGREEN, "Jármû típusa: %s", GetVehicleModelName(GetVehicleModel(car)-400));
	if(tulaj != NINCS)
		SendFormatMessage(target,COLOR_WHITE,"Jármû színkódja: %d & %d",CarInfo[tulaj][cColorOne], CarInfo[tulaj][cColorTwo]);
	else if(id != NINCS)
		SendFormatMessage(target,COLOR_WHITE,"Jármû színkódja: %d & %d",FrakcioKocsi[frakcio][id][fSzin][0], FrakcioKocsi[frakcio][id][fSzin][1]);
	else	
		SendClientMessage(target,COLOR_WHITE,"Jármû színkódja: Nincs bejegyezve");
	SendFormatMessage(target, COLOR_WHITE, "Futott kilométer: %.2f km", KmSzamol[car]/1000);
	SendFormatMessage(target, COLOR_WHITE, "Kerekek: %.2f százalékban elhasználódott", CarPart[car][cKerekek]);
	SendFormatMessage(target, COLOR_WHITE, "Motorolaj: %.2f százalékban elhasználódott", CarPart[car][cMotorolaj]);
	SendFormatMessage(target, COLOR_WHITE, "Akkumulátor töltöttsége: %.2f százalék", CarPart[car][cAkkumulator]);
	SendFormatMessage(target, COLOR_WHITE, "Motor: %.2f százalékban elhasználódott", CarPart[car][cMotor]/5); // Valós értéket mutasson, ne azt h pl. 300%-ban elhasználódott
	SendFormatMessage(target, COLOR_WHITE, "Fék: %.2f százalékban elhasználódott", CarPart[car][cFek]);
	SendFormatMessage(target, COLOR_WHITE, "Elektronika: %.2f százalékban elhasználódott", CarPart[car][cElektronika]);
	SendFormatMessage(target, COLOR_WHITE, "Karosszéria: %d alkalommal volt cserélve", CarPart[car][cKarosszeria]);
	SendFormatMessage(target, COLOR_WHITE, "Karosszéria: %.0f százalékban károsodott", serules);
	if(legutoljara > 250)
		SendClientMessage(target, COLOR_LIGHTGREEN, "A jármû még nem volt szervizben");
	else
		SendFormatMessage(target, COLOR_LIGHTGREEN, "A jármû legutoljára szervizben volt: %d napja", legutoljara);
		
	if(target == playerid)
		Cselekves(playerid, "elõvette az autó szervizkönyvét, és megnézte.");
	else
		Cselekves(playerid, "elõvette az autó szervizkönyvét, és megmutatta valakinek.");
	
	return 1;
}

ALIAS(repair):szereles;
ALIAS(szerel2s):szereles;
CMD:szereles(playerid, params[])
{
	new target, mit[32], sub[64], mennyiert, car = GetClosestVehicle(playerid);
	if(PlayerInfo[playerid][pSzerelo] < 1) return Msg(playerid, "Nem vagy szerelõ");
	if(OnDuty[playerid]) return Msg(playerid, "Döntsd elõbb el mit dolgozol! ((frakció dutyba nem!))");
	
	if(IsPlayerInAnyVehicle(playerid)) return Msg(playerid,"Kocsiban nem tudsz szerelni");
	if(GetPlayerDistanceFromVehicle(playerid, car) > 10) return Msg(playerid, "Nincs a közeledben jármû");
	
	if((IsAPRepulo(car) || IsAMotor(car) || IsARepulo(car) || IsAPlane(car)) && !IsAt(playerid, IsAt_Szerelohely))
	{
		new szkocsi=GetClosestVehicle(playerid, false, 525);
		if(GetPlayerDistanceFromVehicle(playerid, szkocsi) > 10) return Msg(playerid, "Nincs a közeledben szerelõ kocsi!");
	}
	else
		if(!IsAt(playerid, IsAt_Szerelohely)) return Msg(playerid, "Itt nem tudsz javítani");
		
	if(sscanf(params, "s[32]S()[64]", mit, sub))
	{
		Msg(playerid, "/szerelés [Kerekek/Motorolaj/Akkumulátor/Motor/Elektronika/Fék/Karosszéria] [Név/ID] [Ár]");
		Msg(playerid, "Jármû állapotfelmérése: /szerelés állapot");
		return 1;
	}
	if(IsABicikli(car)) return Msg(playerid, "Ezt nem lehet megjavítani");
	if(egyezik(mit, "Kerekek"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerelés kerekek [Név/ID] [Ára]");
		if(target == playerid)
		{
			new panels, doors, lights, tires;
			if(!BankkartyaFizet(playerid, 150000)) return Msg(playerid, "ClassRPG: Nincs elég pénzed, a garnitúra gumi ára: 150,000Ft!");
			Cselekves(playerid,"kicserélte a jármûvén az abroncsokat.",0);
			GetVehicleDamageStatus(car, panels, doors, lights, tires);
			UpdateVehicleDamageStatus(car, panels, doors, lights, 0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicserélted a gumikat, a gumi ára: 150,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 150000);
			CarPart[car][cKerekek] = 0.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(GumitCserel[target]) return Msg(playerid, "Már fel lett ajánlva neki!");
			if(mennyiert < 150000 || mennyiert > 300000) return Msg(playerid, "Az ára minimum 150 000 Ft, max 300 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a közeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem ül jármûben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felajánlottad %s-nak, hogy kicseréled a gumikat %dFT-ért", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Autószerelõ %s felajánlotta, hogy kicseréli a gumikat %dFT-ért. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			GumitCserel[target] = true;
			AlkatreszAr[target] += 150000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Motorolaj"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerelés motorolaj [Név/ID] [Ára]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 25000)) return Msg(playerid, "Nincs elég pénzed, az olaj ára: 25,000Ft!");
			Cselekves(playerid,"kicserélte a jármûvében az olajat.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicserélted az olajat, az ára: 25,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 25000);
			CarPart[car][cMotorolaj] = 0.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(OlajatCserel[target]) return Msg(playerid, "Már fel lett ajánlva neki!");
			if(mennyiert < 25000 || mennyiert > 50000) return Msg(playerid, "Az ára minimum 25 000 Ft, max 50 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a közeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem ül jármûben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felajánlottad %s-nak, hogy kicseréled az olajat %dFT-ért", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Autószerelõ %s felajánlotta, hogy kicseréli az olajat %dFT-ért. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			OlajatCserel[target] = true;
			AlkatreszAr[target] += 25000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Akkumulátor") || egyezik(mit, "Akkumulator") || egyezik(mit, "Akku"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerelés akkumulátor [Név/ID] [Ára]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 25000)) return Msg(playerid, "ClassRPG: Nincs elég pénzed, az akku ára: 25,000Ft!");
			Cselekves(playerid,"kicserélte a jármûvében az akkumulátort.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicserélted az akkut, az ára: 25,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 25000);
			CarPart[car][cAkkumulator] = 100.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(AkkutCserel[target]) return Msg(playerid, "Már fel lett ajánlva neki!");
			if(mennyiert < 25000 || mennyiert > 55000) return Msg(playerid, "Az ára minimum 25 000 Ft, max 55 000 Ft lehet!");
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a közeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem ül jármûben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felajánlottad %s-nak, hogy kicseréled az akkut %dFT-ért", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Autószerelõ %s felajánlotta, hogy kicseréli az akkumulátort %dFT-ért. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			AkkutCserel[target] = true;
			AlkatreszAr[target] += 25000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Motor"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerelés motor [Név/ID] [Ára]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 300000)) return Msg(playerid, "ClassRPG: Nincs elég pénzed, a motor ára: 300,000Ft!");
			Cselekves(playerid,"kicserélte a jármûvében a motort.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicserélted a motort, az ára: 300,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 300000);
			CarPart[car][cMotor] = 0.0;
			SetVehicleHealth(car, 1000);
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(MotortCserel[target]) return Msg(playerid, "Már fel lett ajánlva neki!");
			if(mennyiert < 300000 || mennyiert > 600000) return Msg(playerid, "Az ára minimum 300 000 Ft, max 600 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a közeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem ül jármûben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felajánlottad %s-nak, hogy kicseréled a motort %dFT-ért", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Autószerelõ %s felajánlotta, hogy kicseréli a motort %dFT-ért. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			MotortCserel[target] = true;
			AlkatreszAr[target] += 300000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Elektronika"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerelés elektronika [Név/ID] [Ára]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 70000)) return Msg(playerid, "ClassRPG: Nincs elég pénzed, az elektronika ára: 70,000Ft!");
			Cselekves(playerid,"kicserélte a jármûvében az elektronikát.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicserélted az elektronikát, az ára: 70,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 70000);
			CarPart[car][cElektronika] = 0.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(ElektronikatCserel[target]) return Msg(playerid, "Már fel lett ajánlva neki!");
			if(mennyiert < 70000 || mennyiert > 140000) return Msg(playerid, "Az ára minimum 70 000 Ft, max 140 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a közeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem ül jármûben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felajánlottad %s-nak, hogy kicseréled az elektronikát %dFT-ért", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Autószerelõ %s felajánlotta, hogy kicseréli az elektronikát %dFT-ért. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			ElektronikatCserel[target] = true;
			AlkatreszAr[target] += 70000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Fék") || egyezik(mit, "Fek"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerelés fék [Név/ID] [Ára]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 40000)) return Msg(playerid, "ClassRPG: Nincs elég pénzed, a fékbetét ára: 40,000Ft!");
			Cselekves(playerid,"kicserélte a jármûvében a fékbetétet.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicserélted a féket, az ára: 40,000Ft");
			BizPenz(BIZ_AUTOSBOLT, 40000);
			CarPart[car][cFek] = 0.0;
			CarPart[car][cSzervizdatum] = UnixTime;
		}
		else
		{
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(FeketCserel[target]) return Msg(playerid, "Már fel lett ajánlva neki!");
			if(mennyiert < 40000 || mennyiert > 100000) return Msg(playerid, "Az ára minimum 40 000 Ft, max 100 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a közeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem ül jármûben!");
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felajánlottad %s-nak, hogy kicseréled a féket %dFT-ért", ICPlayerName(target), mennyiert);
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Autószerelõ %s felajánlotta, hogy kicseréli a fékbetétet %dFT-ért. Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert);
			JavitasAra[target] += mennyiert;
			FeketCserel[target] = true;
			AlkatreszAr[target] += 40000;
			NekiSzerel[target] = playerid;
		}
	}
	if(egyezik(mit, "Karosszéria") || egyezik(mit, "Karosszeria"))
	{
		if(sscanf(sub, "ui", target, mennyiert)) return Msg(playerid, "/szerelés karosszeria [Név/ID] [Ára]");
		if(target == playerid)
		{
			if(!BankkartyaFizet(playerid, 10000)) return Msg(playerid, "ClassRPG: Nincs elég pénzed, a karosszériacsere ára: 10,000Ft!");
			Cselekves(playerid,"kicserélte a jármûvén a karosszériát.",0);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Kicserélted a karosszériát, az ára: 10,000Ft");
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
			if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
			if(KarosszeriatCserel[target]) return Msg(playerid, "Már fel lett ajánlva neki!");
			if(mennyiert < 10000 || mennyiert > 100000) return Msg(playerid, "Az ára minimum 10 000 Ft, max 100 000 Ft lehet!");
			if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a közeledben!");
			if(!IsPlayerInAnyVehicle(target)) return Msg(playerid, "Nem ül jármûben!");
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
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felajánlottad %s-nak, hogy kicseréled a karosszériát %dFT-ért. Alkatrészek ára: %s Ft", ICPlayerName(target), mennyiert, FormatInt(AlkatreszAr[target]));
			SendFormatMessage(target, COLOR_LIGHTBLUE, "* Autószerelõ %s felajánlotta, hogy kicseréli a karosszériát %dFT-ért. Az alkatrészek ára: %s Ft Ha el akarod fogadni /accept repair", ICPlayerName(playerid), mennyiert, FormatInt(AlkatreszAr[target]));
		}
	}
	if(egyezik(mit, "állapot") || egyezik(mit, "allapot"))
	{
		if(sscanf(sub, "u", target)) return Msg(playerid, "/szerelés állapot [Név/ID]");
		if(target == INVALID_PLAYER_ID) return Msg(playerid, "Nem létezõ játékos");
		if(GetDistanceBetweenPlayers(playerid, target) > 8.0) return Msg(playerid, "Nincs a közeledben!");
		new Float:serules = (1000.0 - KocsiElete[car]) / 6.5;
		if(serules < 0.0)
			serules = 0.0;
		else if(serules > 100.0)
			serules = 100.0;
		SendFormatMessage(target, COLOR_GREEN, "=====[ CLS-%d jármû állapoti felmérése ]=====", car);
		SendFormatMessage(target, COLOR_WHITE, "Kerekek: %.2f százalékban elhasználódott", CarPart[car][cKerekek]);
		SendFormatMessage(target, COLOR_WHITE, "Motorolaj: %.2f százalékban elhasználódott", CarPart[car][cMotorolaj]);
		SendFormatMessage(target, COLOR_WHITE, "Akkumulátor töltöttsége: %.2f százalék", CarPart[car][cAkkumulator]);
		SendFormatMessage(target, COLOR_WHITE, "Motor: %.2f százalékban elhasználódott", CarPart[car][cMotor]/5);
		SendFormatMessage(target, COLOR_WHITE, "Elektronika: %.2f százalékban elhasználódott", CarPart[car][cElektronika]);
		SendFormatMessage(target, COLOR_WHITE, "Fék: %.2f százalékban elhasználódott", CarPart[car][cFek]);
		SendFormatMessage(target, COLOR_WHITE, "Karosszéria: %d alkalommal volt cserélve", CarPart[car][cKarosszeria]);
		SendFormatMessage(target, COLOR_WHITE, "Karosszéria: %.0f százalékban károsodott", serules);
		if(target == playerid)
			Cselekves(playerid, "megvizsgálta a jármû állapotát.");
		else
			Cselekves(playerid, "felvázolta valakinek a jármû állapotát.");
	}
	return 1;
}
CMD:motorolaj(playerid, params[])
{
	new mitakar[16];
	if(sscanf(params, "s[16]", mitakar)) return Msg(playerid, "/motorolaj [megnéz/csere]");
	if(IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Nem értelek, jármûben mégis hogy?");
	new jarmu = GetClosestVehicle(playerid);
	if(GetPlayerDistanceFromVehicle(playerid, jarmu) > 3.0) return Msg(playerid, "Nincs a közeledben jármû!");
	if(IsABicikli(jarmu)) return Msg(playerid, "Ebbe nincs olaj!");
	if(egyezik(mitakar, "megnéz") || egyezik(mitakar, "megnez"))
	{
		new Float:level = CarPart[jarmu][cMotorolaj];
		if(level >= 0.0 && level <= 10.0) 
		{ 
			SendClientMessage(playerid, COLOR_WHITE, "A közeledben lévõ jármû olaj elhasználódottsága:"); 
			SendClientMessage(playerid, COLOR_GREEN, "Kis mértékû"); 
		}
		else if(level >= 10.1 && level <= 40.0) 
		{ 
			SendClientMessage(playerid, COLOR_WHITE, "A közeledben lévõ jármû olaj elhasználódottsága:"); 
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "Közepes mértékû"); 
		}
		else if(level >= 40.1 && level <= 70.0) 
		{ 
			SendClientMessage(playerid, COLOR_WHITE, "A közeledben lévõ jármû olaj elhasználódottsága:");  
			SendClientMessage(playerid, COLOR_YELLOW, "Közepes mértékû"); 
		}
		else if(level >= 70.1 && level <= 100.0) 
		{ 
			SendClientMessage(playerid, COLOR_WHITE, "A közeledben lévõ jármû olaj elhasználódottsága:"); 
			SendClientMessage(playerid, COLOR_RED, "Nagy mértékû");
		}
	}
	if(egyezik(mitakar, "csere"))
	{
		if(PlayerInfo[playerid][pMotorolaj] == 0) return Msg(playerid, "Nincs motorolajad. Vehetsz az autósboltban!");
		Msg(playerid, "Elkezdted kicserélni az olajat.");
		Cselekves(playerid, "elkezdte kicserélni a motorolajat...", 1);
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
	Msg(playerid, "=====[ Légtérben közlekedõ jármûvek ]=====", false, COLOR_GREEN);
	foreach(Jatekosok, x)
	{
		new playerstate = GetPlayerState(x), repcsi = GetPlayerVehicleID(x);
		if(playerstate == PLAYER_STATE_DRIVER && IsARepulo(repcsi))
		{
			if(RepulesEngedely[repcsi] > 0)
				format(kozlony, sizeof(kozlony), "[Legálisan közlekedõ] CLS-%d | Engedély még %d másodpercig", repcsi, UnixTime-RepulesEngedely[repcsi]);
			else if(LMT(x, FRAKCIO_KATONASAG) && IsAKatonaCar(repcsi))
				format(kozlony, sizeof(kozlony), "[Katona] CLS-%d", repcsi);
			else if(IsACop(x) && IsACopCar(repcsi) && !LMT(x, FRAKCIO_KATONASAG))
				format(kozlony, sizeof(kozlony), "[Rendvédelem] CLS-%d", repcsi);
			else if(AdminDuty[x])
				format(kozlony, sizeof(kozlony), "[AdminSzolgálat] CLS-%d", repcsi);
			else
				format(kozlony, sizeof(kozlony), "[Illegálisan közlekedõ] CLS-%d | Engedélye nincs, vagy már lejárt", repcsi);
			count++;
			SendClientMessage(playerid, COLOR_WHITE, kozlony);
		}
	}
	if(count == 0) return Msg(playerid, "Nincsen légtérben közlekedõ jármû.", false, COLOR_WHITE);
	return 1;
} 
 
ALIAS(psz):p2nzsz1ll3t4;
CMD:p2nzsz1ll3t4(playerid, params[])
{

	if(!AMT(playerid, MUNKA_PENZ)) return SendClientMessage(playerid, COLOR_GREY, "Nem vagy pénzszállító!");
	if(OnDuty[playerid]) return Msg(playerid, "Döntsd elõbb el mit dolgozol! ((frakció dutyba nem!))");
	new func[20];
	if(sscanf(params,"s[20]",func))
	{
		Msg(playerid, "/pénzszállító [duty/felvesz/feltölt/berak]");
		Msg(playerid, "duty: munkába állás");
		Msg(playerid, "felvesz: Felveszed a táskát a bankba, vagy a pénzszállítóból!");
		Msg(playerid, "feltölt: Feltöltöd az ATM-et, ha nem vagy atm-nél add egy ATM pozt!");
		Msg(playerid, "berak: Berakod a pénzszállítóba a táskát!");
		return 1;
	}
	if(egyezik(func, "duty"))
	{
		if(GetPlayerVirtualWorld(playerid) != 0 || GetPlayerInterior(playerid) != 0) return 1;
		if(!PlayerToPoint(3, playerid,-1716.9442,1018.0319,17.5859)) return Msg(playerid, "Nem vagy a duty helynél!"),SetPlayerCheckpoint(playerid, -1716.9442,1018.0319,17.5859,3);
		if(PenzSzallitoDuty[playerid])
		{
			SetPlayerSkin(playerid, PlayerInfo[playerid][pModel]);
			PenzSzallitoDuty[playerid]=false;
			Cselekves(playerid,"átöltözött");
			Msg(playerid, "Kiléptél a munka szolgálatból!");
		}
		else
		{
			SetPlayerSkin(playerid,71);
			PenzSzallitoDuty[playerid]=true;
			Cselekves(playerid,"átöltözött öltözöt");
			Msg(playerid,"Szolgálatba áltál, menj San Fiero Bankba és vedd fel a pénz csomagokat.",false,COLOR_YELLOW);
		}
		
	}
	if(egyezik(func, "info"))
	{
		new kocsi = GetClosestVehicle(playerid);
		if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 6.0) return Msg(playerid, "Nincs jármû a közeledben!");
		SendFormatMessage(playerid, COLOR_YELLOW,"[info]%d DB van a kocsiban 10-bõl! %s Ft",PenzszallitoPenz[kocsi]/MAXTASKAPENZ, FormatInt(PenzszallitoPenz[kocsi]));
	
		return 1;
	
	}
	if(egyezik(func, "felvesz"))
	{
		if(GetPlayerVirtualWorld(playerid) == 0)
		{
			if(!PenzSzallitoDuty[playerid]) return Msg(playerid, "Nem vagy szolgálatban!");
			new kocsi = GetClosestVehicle(playerid);
			if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 6.0) return Msg(playerid, "Nincs jármû a közeledben!");
			if(GetVehicleModel(kocsi) != 428) return Msg(playerid, "Ez nem pénzszállító!");
			if(IsMunkaKocsi(kocsi) != MUNKA_PENZ) return Msg(playerid, "Ez nem munka kocsi!");
		
			if(PenzszallitoPenz[kocsi] < MAXTASKAPENZ)
			{
				Msg(playerid, "Nincs benne több táska! Menj San Fierro bankba!");
				SetPlayerCheckpoint(playerid,-1979.5792,442.3809,26.9659,5);
				return 1;
			}
			if(SzallitPenz[playerid] != NINCS) return Msg(playerid, "Van már nálad táska!");
			
			SzallitPenz[playerid] = MAXTASKAPENZ;
			PenzszallitoPenz[kocsi] -= MAXTASKAPENZ;
			
			Cselekves(playerid, "kivett egy pénz kazetta táskát a pénzszállítóból");
			SendFormatMessage(playerid, COLOR_YELLOW,"[info]%d DB van a kocsiban 10-bõl!",PenzszallitoPenz[kocsi]/MAXTASKAPENZ);
			SetPlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS, 1210, 5, 0.2949, 0.1309, 0.0409, 139.2000, -70.6999, 157.9999, 0.9739, 1.0000, 1.0000, 0, 0);
			Freeze(playerid, 1500); ApplyAnimation(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
		}
		else
		{
			
			if(GetPlayerVirtualWorld(playerid) != 1555) return Msg(playerid, "Szerintem nem jó helyen vagy!");
			if(GetDistanceBetweenPlayers(playerid, BankSFNPC) > 2) return Msg(playerid, "Nincs a közeledbe a pénztáros!");
			if(!PenzSzallitoDuty[playerid]) return Msg(playerid, "Nem vagy szolgálatban!");
			if(SzallitPenz[playerid] != NINCS) return Msg(playerid, "Van már nálad táska!");
			PenzSzallitimer[playerid] = 10;
			Freeze(playerid, 5500); 
			if(MegyPenzTimer) return Msg(playerid, "Egyszerre csak egy embert tud kiszolgálni!");
			MegyPenzTimer=true;
		}
		
	}
	if(!PenzSzallitoDuty[playerid]) return Msg(playerid, "Nem vagy szolgálatban!");
	if(egyezik(func, "berak"))
	{
		if(!IsPlayerAttachedObjectSlotUsed(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS) || SzallitPenz[playerid] != MAXTASKAPENZ)
			return Msg(playerid, "Nincs nálad a táska!");
		
		
		new kocsi = GetClosestVehicle(playerid);
		if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 6.0) return Msg(playerid, "Nincs jármû a közeledben!");
		if(GetVehicleModel(kocsi) != 428) return Msg(playerid, "Ez nem pénzszállító!");
		if(IsMunkaKocsi(kocsi) != MUNKA_PENZ) return Msg(playerid, "Ez nem munka kocsi!");
		
		if((PenzszallitoPenz[kocsi] +  SzallitPenz[playerid]) <= MAXTASKAPENZ*10)
		{
			PenzszallitoPenz[kocsi] += SzallitPenz[playerid];
			SzallitPenz[playerid] = NINCS;
			Cselekves(playerid, "bepakolt egy pénzzel teli táskát a pénzszállítóba");
			RemovePlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS);
			Freeze(playerid, 1500); ApplyAnimation(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
			SendFormatMessage(playerid, COLOR_YELLOW,"[info]%d DB van a kocsiban 10-bõl!",PenzszallitoPenz[kocsi]/MAXTASKAPENZ);
		}
		else
			Msg(playerid, "Teli van a kocsi nem fér bele több! Menj és töltsd fel az ATM-eket!");
	
	}
	if(egyezik(func, "feltölt"))
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
					SetPlayerCheckpoint(playerid, Ajtok[ajto][BeX], Ajtok[ajto][BeY], Ajtok[ajto][BeZ],4),Msg(playerid, "Az ATM egy házban van. Megjelölve a bejárat!");
			}
			if(atmid == NINCS) return Msg(playerid, "Minden ATM teli van!");
			
			if(ATM[atmid][aVw] == GetPlayerVirtualWorld(playerid) && ATM[atmid][aInt] == GetPlayerInterior(playerid))
				SetPlayerCheckpoint(playerid,ATM[atmid][aPosX],ATM[atmid][aPosY],ATM[atmid][aPosZ],4),Msg(playerid, "Megjelölve a GPS-en egy ATM amit fel kell tölteni!");
				
			if(IsTerno(playerid))
				SendFormatMessage(playerid, COLOR_YELLOW,"ATM id:%d",atmid);
			return 1;
		}
		
		
		if(IsPlayerInAnyVehicle(playerid)) return Msg(playerid, "Jármûbõl akarod feltölteni az ATM-et?");
				
			
		if(! IsPlayerAttachedObjectSlotUsed(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS) || SzallitPenz[playerid] != MAXTASKAPENZ)
			return Msg(playerid, "Nincs nálad a táska! Vedd ki a kocsiból!");	
			
		if(ATM[atmid][aPenz]+SzallitPenz[playerid] > MAXATMPENZ) return Msg(playerid, "Nincs üres kazetta az ATM-be!");
		
		ATM[atmid][aPenz] += SzallitPenz[playerid];
		SzallitPenz[playerid] = NINCS;
		Cselekves(playerid, "feltöltötte az ATM-et pénzzel!");
		Freeze(playerid, 1500); ApplyAnimation(playerid,"GANGS","shake_cara",4.0,0,0,0,0,0);
		RemovePlayerAttachedObject(playerid, ATTACH_SLOT_ZSAK_PAJZS_BILINCS);
		SendFormatMessage(playerid, COLOR_YELLOW, "Feltöltötted az ATM-et 1 kazettával. Ne feledd 1 kazetta %s Ft-ott tartalmaz és csak üreset cserélhetsz.",FormatInt(MAXTASKAPENZ));
		SendFormatMessage(playerid, COLOR_YELLOW, "ATM infó: %s Ft tartalom. Maximum %s Ft",FormatInt(ATM[atmid][aPenz]),FormatInt(MAXATMPENZ));
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
      Msg(playerid,"Színek: 1 COLOR_GREY | 2 COLOR_LIGHTRED | 3 COLOR_YELLOW | 4 COLOR_WHITE | 5 COLOR_ALLDEPT | 6 COLOR_NEWS");//[ADMINOKNAK] 5-ös és 6-ös színnel kiegészítve (riporter és sürgösségi szín) by Amos 
   
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
      if(player == INVALID_PLAYER_ID) return Msg(playerid, "Nincs ilyen játékos");
      SendClientMessage(player,szin,szoveg);
   }
   

   return 1;
}
CMD:bicikli(playerid, params[])
{
	new func[20], subfunc[20];
	if(!params[0] || sscanf(params, "s[20] S()[20] ", func, subfunc))
		return Msg(playerid, "Használat: /bicikli [vesz / elõvesz / elrak]");

	if(egyezik(func, "vesz"))
	{
		if(0 < PlayerInfo[playerid][pBicikli] <= 3)
			return Msg(playerid, "Már van biciklid");

		if(!PlayerToPoint(100, playerid,-30.875, -88.9609, 1004.53)) return Msg(playerid, "Nem vagy 24/7-ben.");

		if(!subfunc[0])
			return Msg(playerid, "Használat: /bicikli vesz [bmx / bike / mountain]");

		if(egyezik(subfunc, "bmx"))
			PlayerInfo[playerid][pBicikli] = 1;
		else if(egyezik(subfunc, "bike"))
			PlayerInfo[playerid][pBicikli] = 2;
		else if(egyezik(subfunc, "mountain"))
			PlayerInfo[playerid][pBicikli] = 3;
		else
			return Msg(playerid, "Használat: /bicikli vesz [bmx / bike / mountain]");

		BicikliFlood[playerid]++;
		if(BicikliFlood[playerid] >= 3)
			return SeeBan(playerid, 0, NINCS, "Bicikli bugkihasználás");

		if(!BankkartyaFizet(playerid, 100000))
		{
			Msg(playerid, "Egy bicikli ára 100 000Ft");
			PlayerInfo[playerid][pBicikli] = 0;
			return 1;
		}
		BizPenz(BIZ_247, 100000);
		BizzInfo[BIZ_247][bProducts]--;
		Msg(playerid, "Sikeresen megvetted, elõvétel: /bicikli elõvesz");
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
	else if(egyezik(func, "elõvesz") || egyezik(func, "elovesz"))
	{
		if(Bicikli[playerid])
			return Msg(playerid, "Már vettél biciklit, elõbb rakd el");
			
		if(TaxiOnline() > 1) return Msg(playerid, "Van elég szolgálatban lévõ taxis! (/service taxi)");
		
		if(IsPlayerInAnyVehicle(playerid))
			return Msg(playerid, "Jármûben?");

		if(GetPlayerInterior(playerid) || GetPlayerVirtualWorld(playerid) || NemMozoghat(playerid))
			return Msg(playerid, "Itt nem veheted elõ");

		if( !(1 <= PlayerInfo[playerid][pBicikli] <= 3) )
			return Msg(playerid, "Nincs biciklid");

		if( MunkaFolyamatban[playerid] )
			return Msg(playerid, "Nyugi");

		Msg(playerid, "Elõvetted a biciklid és össze szereled.");
		Cselekves(playerid, "elkezdte összeszerelni a biciklijét");
		
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
			return Msg(playerid, "Még nem vettél elõ biciklit");

		if(IsPlayerInAnyVehicle(playerid))
			return Msg(playerid, "Jármûben?");

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
		Cselekves(playerid, "összeszerelte és elrakta a biciklijét");
	}
	else
		Msg(playerid, "Használat: /bicikli [vesz / elõvesz / elrak]");

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

CMD:buyweapon(playerid, params[])
{
	Msg(playerid, "/f vesz");
}

CMD:sellgun(playerid, params[])
{
	Msg(playerid, "/f készít");
}

ALIAS(h1zl6szert5r5l):hazloszertorol;
CMD:hazloszertorol(playerid, params[])
{
	/*new subcmd[32];
	if(Admin(playerid, 1337) && !sscanf(params, "s", haz))
	{
		if(haz < 0 || haz >= MAXHAZ || !HouseInfo[haz][Van])
			return Msg(playerid, "Ez a ház nem létezik");
	}*/
	
	new haz = HazabanVan(playerid);
	if(haz == NINCS)
		return Msg(playerid, "Nem vagy a házadban!");
	
	for(new s = 0; s < 10; s++)
	{
		HouseInfo[haz][hLoszerTipus][s] = 0;
		HouseInfo[haz][hLoszerMennyiseg][s] = 0;
	}
	Msg(playerid, "Sikeres törlés! Minden slotról törölve az összes lõszer.");
	format(_tmpString, 128, "[/házlõszertöröl] %s törölte az összes lõszerét a %d. házból", PlayerName(playerid), haz), Log("Fegyver", _tmpString);
	HazUpdate(haz, HAZ_Loszer);
	return 1;
}

ALIAS(h1zfegyvert5r5l):hazfegyvertorol;
CMD:hazfegyvertorol(playerid, params[])
{
	new haz = HazabanVan(playerid);
	if(haz == NINCS)
		return Msg(playerid, "Nem vagy a házadban!");
	
	for(new s = 0; s < 10; s++)
	{
		HouseInfo[haz][hFegyver][s] = 0;
	}
	Msg(playerid, "Sikeres törlés! Minden slotról törölve az összes fegyver.");
	format(_tmpString, 128, "[/házfegyvertöröl] %s törölte az összes fegyverét a %d. házból", PlayerName(playerid), haz), Log("Fegyver", _tmpString);
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
	if(!IsOnkentes(playerid)) return Msg(playerid, "Nem vagy önkéntes!");
	if(!IsAt(playerid, IsAt_Korhaz)) return Msg(playerid, "Nem vagy a kórházban!");
	if(OnDuty[playerid]) return Msg(playerid, "Elõbb lépj ki másik munkád duty-jából!");
	if(Onkentesszolgalatban[playerid])
	{
		if(IsValidDynamic3DTextLabel(Onkentestext[playerid])) DestroyDynamic3DTextLabel(Onkentestext[playerid]), Onkentestext[playerid] = INVALID_3D_TEXT_ID;
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Mostmár nem vagy szolgálatban, így nem fogsz kapni hívásokat!");
		Onkentesszolgalatban[playerid] = false;
		Medics--;
		Munkaruha(playerid, 0);
		Cselekves(playerid, "leadta az önkéntes mentõs szolgálatot.", 1);
		format(ertesites, sizeof(ertesites), "* Értesítés: %s kilépett az önkéntes mentõs szolgálatból.", ICPlayerName(playerid));
		SendMessage(SEND_MESSAGE_RADIO, ertesites, COLOR_LIGHTBLUE, FRAKCIO_MENTO);
	}
	else
	{
		Onkentestext[playerid] = CreateDynamic3DTextLabel("Önkéntes", 0x63FF60FF, 0.0, 0.0, 0.05, 15.0, playerid, INVALID_VEHICLE_ID, 1);
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Mostmár szolgálatban vagy, így fogadnod kell a hívásokat!");
		SendClientMessageToAll(COLOR_LIGHTBLUE, "* Önkéntes mentõsök szolgálatban! Hívd õket ha baj van!");
		if(PlayerInfo[playerid][pSex] == 2) SetPlayerSkin(playerid, 91);
		else SetPlayerSkin(playerid, 276);
		Onkentesszolgalatban[playerid] = true;
		Medics++;
		if((PlayerInfo[playerid][pKotszer] + 10) < MAXKOTSZER) PlayerInfo[playerid][pKotszer] += 10;
		Cselekves(playerid, "önkéntes mentõs szolgálatba állt.", 1);
		format(ertesites, sizeof(ertesites), "* Értesítés: %s önkéntes mentõs szolgálatba állt.", ICPlayerName(playerid));
		SendMessage(SEND_MESSAGE_RADIO, ertesites, COLOR_LIGHTBLUE, FRAKCIO_MENTO);
	}
	return 1;
}

ALIAS(or):onkentesradio;
ALIAS(5r):onkentesradio;
ALIAS(5nk2ntesr1di4):onkentesradio;
CMD:onkentesradio(playerid, params[])
{
	if(!IsOnkentes(playerid) && !LMT(playerid, FRAKCIO_MENTO)) return Msg(playerid, "Nem vagy önkéntes!");
	if(Bortonben(playerid)) return Msg(playerid, "Börtönben nem használható!");
	if(Csendvan) return Msg(playerid, "Most nem beszélhetsz!");
	if(gFam[playerid] || !PlayerInfo[playerid][pRadio])	return Msg(playerid, "Kivan kapcsolva a rádiód vagy nincs");
	if(PlayerCuffed[playerid] || Leutve[playerid] || PlayerTied[playerid]) return Msg(playerid, "Ilyenkor hogy akarsz a rádióba beszélni?");
	if(PlayerInfo[playerid][pMuted] == 1) return SendClientMessage(playerid, TEAM_CYAN_COLOR, "Némítva vagy, hogy akarsz beszélni? :D");

	new result[128];
   	if(sscanf(params, "s[128]", result))
		return SendClientMessage(playerid, COLOR_WHITE, "Használat: /önkéntesrádió(/ör) [IC üzeneted]");
	
	if(IsOnkentes(playerid))
		Format(_tmpString, "** Önkéntes %s: %s **", PlayerName(playerid), result);
	else
		Format(_tmpString, "** %s %s: %s **", RangNev(playerid), PlayerName(playerid), result);
	SendMessage(SEND_MESSAGE_ONKENTES, _tmpString, TEAM_BLUE_COLOR);
	Format(_tmpString, "[Rádió] %s mondja: %s", ICPlayerName(playerid), result);
	ProxDetector(20.0, playerid, _tmpString, COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	return 1;
}

ALIAS(orb):onkentesradiob;
ALIAS(5rb):onkentesradiob;
ALIAS(5nk2ntesr1di4b):onkentesradiob;
CMD:onkentesradiob(playerid, params[])
{
	if(!IsOnkentes(playerid) && !LMT(playerid, FRAKCIO_MENTO)) return Msg(playerid, "Nem vagy önkéntes!");
	if(Bortonben(playerid)) return Msg(playerid, "Börtönben nem használható!");
	if(Csendvan) return Msg(playerid, "Most nem beszélhetsz!");
	if(gFam[playerid] || !PlayerInfo[playerid][pRadio])	return Msg(playerid, "Kivan kapcsolva a rádiód vagy nincs");
	if(PlayerCuffed[playerid] || Leutve[playerid] || PlayerTied[playerid]) return Msg(playerid, "Ilyenkor hogy akarsz a rádióba beszélni?");
	if(PlayerInfo[playerid][pMuted] == 1) return SendClientMessage(playerid, TEAM_CYAN_COLOR, "Némítva vagy, hogy akarsz beszélni? :D");

	new result[128];
   	if(sscanf(params, "s[128]", result))
		return SendClientMessage(playerid, COLOR_WHITE, "Használat: /önkéntesrádiób(/örb) [OOC üzeneted]");
		
	if(SzovegEllenorzes(playerid, result, "/örb", ELLENORZES_MINDKETTO)) return 1;
	
	if(IsOnkentes(playerid))
		Format(_tmpString, "** Önkéntes %s OOC: (( %s )) **", PlayerName(playerid), result);
	else
		Format(_tmpString, "** %s %s OOC: (( %s )) **", RangNev(playerid), PlayerName(playerid), result);
	SendMessage(SEND_MESSAGE_ONKENTES, _tmpString, TEAM_BLUE_COLOR);
	Format(_tmpString, "[Rádió] %s mondja OOC: (( %s ))", PlayerName(playerid), result);
	ProxDetector(20.0, playerid, _tmpString,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
	return 1;
}

ALIAS(5nk2ntesek):onkentesek;
CMD:onkentesek(playerid, params[])
{
	new count = 0;
	SendClientMessage(playerid, COLOR_GREEN, "=====[Önkéntes mentõsök]=====");
	foreach(Jatekosok, x)
	{
		if(IsOnkentes(x))
		{
			if(Onkentesszolgalatban[x])
				SendFormatMessage(playerid, COLOR_GREEN, "[%i]%s (Szolgálatban) | Tel.: %s | Mentései: %ddb", x, ICPlayerName(x), FormatNumber( PlayerInfo[x][pPnumber], 0, '-'), PlayerInfo[x][pMechSkill]);
			else
				SendFormatMessage(playerid, COLOR_RED, "[%i]%s (Nincs szolgálatban) | Mentései: %ddb", x, ICPlayerName(x), PlayerInfo[x][pMechSkill]);// Önkéntesek mentéseit a /önkéntesek-ben mutatja.
			count++;
		}
	}
	if(count == 0) SendClientMessage(playerid, COLOR_YELLOW, "Nincs önkéntes mentõs.");
	return 1;
}

ALIAS(5nk2ntes):onkentes;
CMD:onkentes(playerid, params[])
{
	if(PlayerInfo[playerid][pLeader] != 4 && !Admin(playerid, 4))
		return Msg(playerid, "Nem használhatod ezt a parancsot!");
	
	new target, ido;
	if(sscanf(params, "rd", target, ido))
		return Msg(playerid, "Használata: /önkéntes [játékosnév / ID] [Idõ(óra)]");
	
	if(target == INVALID_PLAYER_ID)
		return Msg(playerid, "Nincs ilyen játékos");
		
	if(LMT(target, FRAKCIO_MENTO))
		return Msg(playerid, "OMSZ tagot nem!");
		
	if(!LegalisSzervezetTagja(target) && !Civil(target))
		return Msg(playerid, "Illegális frakciótagot nem nevezhetsz ki!");
	
	if(IsOnkentes(target))
	{
		PlayerInfo[target][pOnkentes] = 0;
		SendFormatMessage(playerid, COLOR_LIGHTRED, "Elvetted %s önkéntes mentõs jogát!", PlayerName(target));
		SendFormatMessage(target, COLOR_LIGHTRED, "%s elvette az önkéntes mentõs jogodat!", PlayerName(playerid));
		ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s elvette %s önkéntes jogát >>", PlayerName(playerid), PlayerName(target));
	}
	else
	{	
		if(ido < 1 || ido > 240) return Msg(playerid, "Minimum 1 és maximum 240 óra lehet!"); //OMSZ leader kérésére az idõ duplázva by Amos
		PlayerInfo[target][pOnkentes] = UnixTime + ido*3600;
		SendFormatMessage(playerid, COLOR_YELLOW, "Kinevezted %s-t önkéntes mentõsnek %d óráig!", PlayerName(target), ido);
		SendFormatMessage(target, COLOR_YELLOW, "%s kinevezett önkéntes mentõsnek %d óráig! A munkához szükséges parancsokat a /help beírásával találhatsz!", PlayerName(playerid), ido);
		ABroadCastFormat(COLOR_LIGHTRED, PlayerInfo[playerid][pAdmin], "<< %s kinevezte %s-t önkéntes mentõsnek %d óráig >>", PlayerName(playerid), PlayerName(target), ido);
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
ALIAS(k5r5z2sek):wanted; //wanted már müködik /körözések-re is by Amos
CMD:wanted(playerid, params[])
{
//   if(!IsACop(playerid) return 1;
   SendClientMessage(playerid, COLOR_GREEN, "==[ Körözött személyek és jármûvek ]==");
   
   new cop = IsACop(playerid);
   foreach(Jatekosok, i)
   {
      if(playerid != i && !egyezik(PlayerCrime[i][pVad], "-"))
      {
         if(cop || !PlayerInfo[i][pMember] || PlayerInfo[i][pMember] != PlayerInfo[playerid][pMember])
            SendFormatMessage(playerid,COLOR_NAR,"Név: %s - Vád: %s", ICPlayerName(i), PlayerCrime[i][pVad]);
      }
   }
   For(x, 1, MAX_VEHICLES)
   {
      if(!egyezik(VehicleCrime[x][vVad], "-"))
      {
         if(!SajatKocsi(playerid, x))
            SendFormatMessage(playerid, COLOR_ORANGE, "Rendszám: CLS-%d - Vád: %s", x, VehicleCrime[x][vVad]);
      }
   }
      
   return 1;
}

ALIAS(l6szereim):loszereim;
CMD:loszereim(playerid, params[])
{
	if(NincsHaza(playerid))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs házad!");
		
	new house = HazabanVan(playerid);
	if(house == NINCS)
		return Msg(playerid, "Nem vagy a házadban!");

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

	SendClientMessage(playerid, COLOR_LIGHTBLUE, "===========[Lõszereim]===========");
	for(new x = 0; x < slots; x++)
	{
		if(!HouseInfo[house][hLoszerTipus][x] || !HouseInfo[house][hLoszerMennyiseg][x])
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Rekesz #%d: Üres", x+1);
		else
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Rekesz #%d: Lõszer: %s (%ddb)", x+1, GetGunName(HouseInfo[house][hLoszerTipus][x]), HouseInfo[house][hLoszerMennyiseg][x]);
	}
	
	if(slots < 10)
		SendFormatMessage(playerid, COLOR_YELLOW, "Rekesz #%d-10: Prémium rekesz", slots+1);
		
	return 1;
}

CMD:fegyvereim(playerid, params[])
{
	if(NincsHaza(playerid))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs házad!");
		
	new house = HazabanVan(playerid);
	if(house == NINCS)
		return Msg(playerid, "Nem vagy a házadban!");

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
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Rekesz #%d: Üres", x+1);
		else
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Rekesz #%d: Fegyver: %s", x+1, GetGunName(HouseInfo[house][hFegyver][x]));
	}
	
	if(slots < 10)
		SendFormatMessage(playerid, COLOR_YELLOW, "Rekesz #%d-10: Prémium rekesz", slots+1);
		
	return 1;
}

ALIAS(fegyverrakt1r):fegyverraktar;
CMD:fegyverraktar(playerid, params[])
{
	if(FloodCheck(playerid)) return 1;
	
	if(LegalisSzervezetTagja(playerid) || PlayerInfo[playerid][pMember] == 0)
		return Msg(playerid, "Nem vagy illegális szervezet tagja!");
		
	new frakcio = PlayerInfo[playerid][pMember];
	if(!PlayerToPoint(3, playerid, FrakcioInfo[frakcio][fPosX], FrakcioInfo[frakcio][fPosY], FrakcioInfo[frakcio][fPosZ]))
		return Msg(playerid, "Nem vagy a széf közelében.");
	
	new param[4][20];
	if(sscanf(params, "A<s[20]>()[4]", param) || !param[0][0])
		return
			Msg(playerid, "Használata: /fegyverraktár [funkció]", false),
			Msg(playerid, "/fegyverraktár berak fegyver [fegyvernév / ID]", false),
			Msg(playerid, "/fegyverraktár berak lõszer [fegyvernév / ID] [lõszer]", false),
			Msg(playerid, "/fegyverraktár kivesz fegyver [fegyvernév / ID]", false),
			Msg(playerid, "/fegyverraktár kivesz lõszer [fegyvernév / ID] [lõszer]", false),
			Msg(playerid, "/fegyverraktár töröl fegyver/lõszer [slot (1-50)]", false),
			Msg(playerid, "/fegyverraktár megnéz fegyver/lõszer [slot (1-5)]", false)
		;
		
	if(egyezik(param[0], "berak"))
	{
		if(!param[2][0])
			return Msg(playerid, "/fegyverraktár berak [fegyver/lõszer] [fegyvernév / ID] [lõszer]");
		
		new weapon;
		if(isNumeric(param[2]))
			weapon = strval(param[2]);
		else
			weapon = GetGunID(param[2]);
			
		if(weapon < 1 || weapon > MAX_WEAPONS)
			return Msg(playerid, "Ilyen fegyver nem létezik");
		
		if(weapon == WEAPON_CHAINSAW || weapon == WEAPON_FIREEXTINGUISHER)
			return Msg(playerid, "Láncfûrész és poroltó nem rakható el");
		
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
				return Msg(playerid, "Nincs szabad hely a raktárban");
			
			if(WeaponTakeWeapon(playerid, weapon))
			{
				FrakcioInfo[frakcio][fFegyver][slot] = weapon;
				SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Beraktál egy %s fegyvert a raktárba", GunName(weapon));
				format(_tmpString, 128, "berakott egy fegyvert (%s) a raktárba", GunName(weapon)), Cselekves(playerid, _tmpString);
				format(_tmpString, 128, "[/fegyverraktár berak fegyver %d] %s berakott egy %s fegyvert a raktárba", frakcio,PlayerName(playerid), GunName(weapon)), Log("Fegyver", _tmpString);
				INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
			}
			else
				Msg(playerid, "Hiba (#1)");
		}
		else if(egyezik(param[1], "lõszer") || egyezik(param[1], "lõszer")) // lõszer
		{
			if(!param[3][0] || !isNumeric(param[3]))
				return Msg(playerid, "/fegyverraktár berak [fegyver/lõszer] [fegyvernév / ID] [lõszer]");
			
			new ammo = strval(param[3]);
			if(ammo < 1)
				return Msg(playerid, "Hibás lõszerszám");
			
			if(WeaponType(weapon) == WEAPON_TYPE_HAND)
				return Msg(playerid, "Ez a fegyver nem lõszer alapú");
				
			if(WeaponAmmo(playerid, weapon) < 1)
				return Msg(playerid, "Ehhez a fegyverhez nincs lõszered");
			
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
				return Msg(playerid, "Nem tudtál berakni egy darab lõszert sem, mivel nincs szabad hely");
			
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Beraktál %ddb %s lõszert a raktárba", berakva, GunName(weapon));
			format(_tmpString, 128, "berakott némi %s lõszert (%ddb) a raktárba", GunName(weapon), berakva), Cselekves(playerid, _tmpString);
			format(_tmpString, 128, "[/fegyverraktár berak lõszer %d] %s berakott %ddb %s lõszert a raktárba", frakcio,PlayerName(playerid), berakva, GunName(weapon)), Log("Fegyver", _tmpString);
			INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
		}
	}
	else if(egyezik(param[0], "kivesz"))
	{
		if(PlayerInfo[playerid][pRank] < FrakcioInfo[frakcio][fRaktarRang])
			return Msg(playerid, "Nincs elég magas rangod hozzá!");
			
		if(!param[2][0])
			return Msg(playerid, "/fegyverraktár kivesz [fegyver/lõszer] [fegyvernév / ID] [lõszer]");
		
		if(Szint(playerid) < WEAPON_MIN_LEVEL)
			return Msg(playerid, "Túl kicsi a szinted a fegyverhasználathoz");
		
		new weapon;
		if(isNumeric(param[2]))
			weapon = strval(param[2]);
		else
			weapon = GetGunID(param[2]);
			
		if(weapon < 1 || weapon > MAX_WEAPONS)
			return Msg(playerid, "Ilyen fegyver nem létezik");

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
				return Msg(playerid, "Nincs ilyen fegyver a raktárban");
			
			if(WeaponGiveWeapon(playerid, weapon, _, 0) >= 0)
			{
				FrakcioInfo[frakcio][fFegyver][slot] = 0;
				SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Kivettél egy fegyvert (%s) a raktárból", GunName(weapon));
				format(_tmpString, 128, "kivett egy fegyvert (%s) a raktárból", GunName(weapon)), Cselekves(playerid, _tmpString);
				format(_tmpString, 128, "[/fegyverraktár berak fegyver %d] %s kivett egy %s fegyvert a raktárból", frakcio,PlayerName(playerid), GunName(weapon)), Log("Fegyver", _tmpString);
				INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
			}
			else
				Msg(playerid, "Hiba (#1)");
		}
		else if(egyezik(param[1], "lõszer") || egyezik(param[1], "loszer")) // lõszer
		{
			if(!param[3][0] || !isNumeric(param[3]))
				return Msg(playerid, "/fegyverraktár kivesz [fegyver/lõszer] [fegyvernév / ID] [lõszer]");
			
			new ammo = strval(param[3]);
			if(ammo < 1)
				return Msg(playerid, "Hibás lõszerszám");
			
			if(WeaponType(weapon) == WEAPON_TYPE_HAND)
				return Msg(playerid, "Ez a fegyver nem lõszer alapú");
			
			new kiveve, kivenni = max(0, min(ammo, WeaponMaxAmmo(weapon) - WeaponAmmo(playerid, weapon))), t;
			
			if(!kivenni)
				return Msg(playerid, "Nincs nálad ennyi hely");
			
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
				return Msg(playerid, "Nem tudtál kivenni egy darab lõszert sem, mert nincs ilyen fajta lõszer a raktárban");
			
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Kivettél %ddb %s lõszert a raktárból", kiveve, GunName(weapon));
			format(_tmpString, 128, "kivett némi %s lõszert (%ddb) a raktárból", GunName(weapon), kiveve), Cselekves(playerid, _tmpString);
			format(_tmpString, 128, "[/fegyverraktár kivesz lõszer %d] %s kivett %ddb %s lõszert a raktárból", frakcio,PlayerName(playerid), kiveve, GunName(weapon)), Log("Fegyver", _tmpString);
			INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
		}
	}
	else if(egyezik(param[0], "töröl") || egyezik(param[0], "torol"))
	{
		if(PlayerInfo[playerid][pRank] < FrakcioInfo[frakcio][fRaktarRang])
			return Msg(playerid, "Nincs elég magas rangod hozzá!");
		
		if(!param[2][0])
			return Msg(playerid, "/fegyverraktár töröl fegyver/lõszer [slot (1-50)]", false);
			
		new slot = strval(param[2]) - 1;
		if(slot < 0 || slot >= MAX_FEGYVERRAKTAR_SLOT)
			return SendFormatMessage(playerid, COLOR_LIGHTRED, "Slot: 1-%d", MAX_FEGYVERRAKTAR_SLOT);
		
		if(egyezik(param[1], "fegyver"))
		{
			if(!FrakcioInfo[frakcio][fFegyver][slot])
				return Msg(playerid, "Ezen a sloton nincs fegyver");
			
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Kidobott egy %s fegyvert a raktárból", GunName(FrakcioInfo[frakcio][fFegyver][slot]));
			format(_tmpString, 128, "kidobott egy fegyvert (%ddb) a raktárból", GunName(FrakcioInfo[frakcio][fFegyver][slot])), Cselekves(playerid, _tmpString);
			format(_tmpString, 128, "[/fegyverraktár töröl fegyver] %s törölt egy %s fegyvert a raktárból", PlayerName(playerid), GunName(FrakcioInfo[frakcio][fFegyver][slot])), Log("Fegyver", _tmpString);
			INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
			
			FrakcioInfo[frakcio][fFegyver][slot] = 0;
		}
		else if(egyezik(param[1], "lõszer") || egyezik(param[1], "loszer"))
		{
			if(!FrakcioInfo[frakcio][fLoszerTipus][slot] && !FrakcioInfo[frakcio][fLoszerMennyiseg][slot])
				return Msg(playerid, "Ezen a sloton nincs lõszer");
			
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Kidobtál %ddb %s lõszert a raktárból", FrakcioInfo[frakcio][fLoszerMennyiseg][slot], GunName(FrakcioInfo[frakcio][fLoszerTipus][slot]));
			format(_tmpString, 128, "kidobott %ddb %s lõszert a raktárból", FrakcioInfo[frakcio][fLoszerMennyiseg][slot], GunName(FrakcioInfo[frakcio][fLoszerTipus][slot])), Cselekves(playerid, _tmpString);
			format(_tmpString, 128, "[/fegyverraktár töröl fegyver] %s törölt %ddb %s lõszert a raktárból", PlayerName(playerid), FrakcioInfo[frakcio][fLoszerMennyiseg][slot], GunName(FrakcioInfo[frakcio][fLoszerTipus][slot])), Log("Fegyver", _tmpString);
			INI_Save(INI_TYPE_FEGYVERRAKTAR, frakcio);
			
			FrakcioInfo[frakcio][fLoszerTipus][slot] = 0;
			FrakcioInfo[frakcio][fLoszerMennyiseg][slot] = 0;
		}
	}
	else if(egyezik(param[0], "megnéz") || egyezik(param[0], "megnez"))
	{
		if(!param[1][0])
			return Msg(playerid, "/fegyverraktár megnéz fegyver/lõszer", false);
		
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
			
			SendClientMessage(playerid, COLOR_WHITE, "==[ Fegyverraktár: fegyverek ]==");
			
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
				SendClientMessage(playerid, COLOR_WHITE, "Nincsenek fegyverek a raktárban");
		}
		else if(egyezik(param[1], "lõszer") || egyezik(param[1], "loszer"))
		{
			new ammostat[MAX_WEAPONS], free;
			for(new s = 0; s < MAX_FEGYVERRAKTAR_SLOT; s++)
			{
				if(1 <= FrakcioInfo[frakcio][fLoszerTipus][s] <= MAX_WEAPONS && FrakcioInfo[frakcio][fLoszerMennyiseg][s] > 0)
					ammostat[ FrakcioInfo[frakcio][fLoszerTipus][s] - 1 ] += FrakcioInfo[frakcio][fLoszerMennyiseg][s];
				else
					free++;
			}
			
			SendClientMessage(playerid, COLOR_WHITE, "==[ Fegyverraktár: lõszerek ]==");
			
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
				SendClientMessage(playerid, COLOR_WHITE, "Nincsenek lõszerek a raktárban");
		}
	}
	return 1;
}

ALIAS(f):fegyver;
CMD:fegyver(playerid, params[])
{
	if(Bortonben(playerid) > 0) return Msg(playerid, "Persze csak is ezt lehet egy börtönben");
	new func[20], param2[32];
	if(!params[0] || sscanf(params, "s[20] S()[32] ", func, param2))
		return
			Msg(playerid, "Használata: /f(egyver) [funkció]"),
			Msg(playerid, "Funkció: elõvesz [fegyvernév / fegyverid] - Rövidítés: /f e [fegyvernév / id]"),
			Msg(playerid, "Funkció: elrak - Rövidítés: /f k"),
			Msg(playerid, "Funkció: újratöltés - Rövidítés: /f r"),
			Msg(playerid, "Funkció: átad [fegyver / lõszer] [fegyvernév / ID]"),
			Msg(playerid, "Funkció: [vesz / készít] [fegyver / lõszer] [fegyvernév / ID]"),
			Msg(playerid, "Funkció: [szétszed] [fegyvernév / ID]")
		
		;

	if(egyezik(func, "újratöltés") || egyezik(func, "ujratoltes") || egyezik(func, "r"))
	{
		if(FloodCheck(playerid)) return 1;
		//new weapon = PlayerWeapons[playerid][pArmed];
		if(!WeaponArmed(playerid))
			return Msg(playerid, "Nincs fegyver a kezedben");
		
		/*if(WeaponData[weapon][wType] == WEAPON_TYPE_HAND)
			return Msg(playerid, "Mégis mit akarsz újratölteni?");
		
		new slot = WeaponHaveWeapon(playerid, weapon);
		if(slot == NINCS)
			return Msg(playerid, "Mégis mit akarsz újratölteni?");*/
			
		WeaponArm(playerid, PlayerWeapons[playerid][pArmed]);
		
		if(WeaponArmed(playerid) >= WEAPON_DEAGLE && WeaponArmed(playerid) <= WEAPON_SNIPER)
			OnePlayAnim(playerid,"UZI","UZI_reload",4.0,0,0,0,0,0);
			
		Msg(playerid, "Fegyver újratöltve!");
	}
	if(egyezik(func, "elrak") || egyezik(func, "k"))
	{
		//Cselekves(playerid, "elrakta a fegyverét", 1);
		
		Msg(playerid, "Elraktad");
		WeaponArm(playerid);
		return 1;
	}
	else if(egyezik(func, "elõvesz") || egyezik(func, "elovesz") || egyezik(func, "e"))
	{
		
		if(PlayerInfo[playerid][pFegyverTiltIdo] > 0) return Msg(playerid, "El vagy tiltva a fegyver használattól!");
		if(PlayerInfo[playerid][pKozmunka] != 0) return Msg(playerid, "Közmunkán vagy, nem vehetsz elõ fegyvert");
		if(param2[0] == EOS)
			return Msg(playerid, "Használat: /fegyver elõvesz [név / id]");

		if(NemMozoghat(playerid))
			return Msg(playerid, "Nem vehetsz elõ fegyvert!");

		if(PlayerState[playerid] == PLAYER_STATE_DRIVER && !IsHitman(playerid))
			return Msg(playerid, "Vezetõként nem vehetsz elõ fegyvert");

		if(AdminDuty[playerid] == 1)
		{
			if(PlayerInfo[playerid][pAdmin] <= 5)
			{
				SendClientMessage(playerid, COLOR_LIGHTBLUE, "Admin szolgálatban vagy, nincs szükséged a fegyveredre!!");
				return 1;
			}
			else SendClientMessage(playerid, COLOR_LIGHTBLUE, "Admin szolgálatban vagy, ha elfelejtetted lépj ki!!");
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
				return Msg(playerid, "Ehhez a fegyverhez nincs lõszered");

			if(IsPlayerInAnyVehicle(playerid) && (fegyo == 22 || fegyo == 23 || fegyo == 24))
				return Msg(playerid, "Ezt nem veheted elõ jármûben");
				
			if(fegyo == 8 && Harcol[playerid])
			{
				SendClientMessage(playerid, COLOR_LIGHTRED, "Rendszer bezárt a börtönbe, Oka: Tíltott fegyver waron!");
				Jail(playerid, "set", 1800, "ajail2", "Tíltott fegyver waron");
				return 1;
			}
			
			if(WeaponData[fegyo][wType] != WEAPON_TYPE_HAND && Harcol[playerid] && !TeruletInfo[ HarcolTerulet[playerid] ][tLofegyver])
				return Msg(playerid, "Lõfegyvert NEM vehetsz elõ!");
			
			WeaponArm(playerid, fegyo);
			//Cselekves(playerid, "elõvett egy fegyvert",1);
			Msg(playerid, "Elõvettél egy fegyvert!");
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
				return Msg(playerid, "Ehhez a fegyverhez nincs lõszered");

			if(IsPlayerInAnyVehicle(playerid) && (fegyo == 22 || fegyo == 23 || fegyo == 24))
				return Msg(playerid, "Ezt nem veheted elõ jármûben");
			
			if(WeaponData[fegyo][wType] != WEAPON_TYPE_HAND && Harcol[playerid] && !TeruletInfo[ HarcolTerulet[playerid] ][tLofegyver])
				return Msg(playerid, "Lõfegyvert NEM vehetsz elõ!");
			
			WeaponArm(playerid, fegyo);
			//Cselekves(playerid, "elõvett egy fegyvert", 1);
			Msg(playerid, "Elõvettél egy fegyvert!");
			
			if(SpawnVedelem[playerid] > 0)
				SpawnVedelem[playerid] = 0;
				
			if(NoDamage[playerid])
				NoDamage[playerid] = 0;

			if(fegyo >= 24 && fegyo <= 34)
				OnePlayAnim(playerid,"UZI","UZI_reload",4.0,0,0,0,0,0);
		}
	}
	else if(egyezik(func, "szétszed") || egyezik(func, "szetszed") || egyezik(func, "sz"))
	{
		
		if(param2[0] == EOS)
			return Msg(playerid, "Használat: /fegyver szétszed [Név / ID]");
		
		if(!IsAt(playerid, IsAt_Fegyverkeszitohely))
		{
			        SendClientMessage(playerid, COLOR_LIGHTRED, "Nem vagy a mati készítõ helyénél, a gyárban");
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
			else if(level <= 185 && weapontipus == 5) return Msg(playerid, "Ehhez minimum 5ös skill kell!");
			
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
			else if(level <= 185 && weapontipus == 5) return Msg(playerid, "Ehhez minimum 5ös skill kell!");
			
			
			PlayerInfo[playerid][pCarSkill] += 2;

			MunkaFolyamatban[playerid] = 1;
			WeaponTakeWeapon(playerid, fegyo);
			GameTextForPlayer(playerid,"~w~~n~~n~~n~~n~~n~~n~~n~~n~~n~Szetszeded a fegyvert... Varj...", 3000, 3);
			TogglePlayerControllable(playerid, false);
			ApplyAnimation(playerid, "SCRATCHING", "scmid_l", 4.0, 1, 1, 1, 1, -1);
			MunkaTimerID[playerid]=SetTimerEx("Munkavege", (MunkaIdo[6]*5), false, "ddd", playerid, M_FEGYOSZETSZED, fegyo);
		}
	}
	/*else if(egyezik(func, "újratöltés") || egyezik(func, "ujratoltes") || egyezik(func, "r"))
	{
		if(!PlayerWeapons[playerid][pArmed])
			Msg(playerid, "Nincs fegyver a kezedben");
			
		new fegyo = PlayerWeapons[playerid][pArmed];
		
		if(WeaponData[fegyo][wType] == WEAPON_TYPE_HAND)
			return Msg(playerid, "Mégis mit akarsz újratölteni?");
		
		new slot = WeaponHaveWeapon(playerid, fegyo);
		if(slot == NINCS)
			return Msg(playerid, "Mégis mit akarsz újratölteni?");
			
		//Cselekves(playerid, "újratöltötte a fegyverét", 1);
		WeaponArm(playerid, PlayerWeapons[playerid][pArmed]);
		Msg(playerid, "Fegyver újratöltve!");
		
		if(WeaponArmed(playerid) >= WEAPON_DEAGLE && WeaponArmed(playerid) <= WEAPON_SNIPER)
			OnePlayAnim(playerid,"UZI","UZI_reload",4.0,0,0,0,0,0);
	}*/
	else if(egyezik(func, "vesz"))
	{
		if(Szint(playerid) < WEAPON_MIN_LEVEL)
			return SendFormatMessage(playerid, COLOR_LIGHTRED, "Hiba: Fegyverhasználat nem engedélyezett a %d. szintig", WEAPON_MIN_LEVEL);
		
		if(PlayerInfo[playerid][pFegyverTiltIdo] > 1)
			return Msg(playerid, "El vagy tiltva a fegyverektõl");
		 
		new iswep = !param2[0] ? -1 : (egyezik(param2, "fegyver") ? 1 : (egyezik(param2, "lõszer") || egyezik(param2, "loszer") ? 0 : -1));
		
		new weaponstr[32], ammo, celpont;
		if(!param2[0] || iswep == -1
			|| iswep == 1 && sscanf(params, "{s[32]s[32]}s[32]R(-1)", weaponstr, celpont)
			|| iswep == 0 && sscanf(params, "{s[32]s[32]}s[32]I(0)R(-1)", weaponstr, ammo, celpont)
		)
			return
				SendClientMessage(playerid, COLOR_WHITE, "===[ Árak ]==="),
				WeaponPrices(playerid, WEAPON_PRICES_CASH, COLOR_LIGHTBLUE),
				SendClientMessage(playerid, COLOR_YELLOW, "Használat: /fegyver vesz fegyver [fegyvernév / ID] (játékos)"),
				SendClientMessage(playerid, COLOR_YELLOW, "Használat: /fegyver vesz lõszer [fegyvernév / ID] [mennyiség] (játékos)")
			;
		
		if(celpont == INVALID_PLAYER_ID)
			return Msg(playerid, "Nincs ilyen játékos");
		else if(celpont == -1)
			celpont = playerid;
		else if(celpont != playerid && GetDistanceBetweenPlayers(playerid, celpont) > 5)
				return Msg(playerid, "Õ nincs a közeledben");
		
		new biz = BizbeVan(playerid);
		if(biz != BIZ_GS1 && biz != BIZ_GS2 && biz != BIZ_PB)
			return Msg(playerid, "Nem vagy fegyverboltban");
		
		if(BizzInfo[biz][bProducts] < 1)
			return Msg(playerid, "A fegyverbolt üres, nincs raktáron fegyver");
			
		if(PlayerInfo[playerid][pGunLic] < 1) return Msg(playerid, "Nincs fegyverengedélyed!");
			
		if(iswep == 1)
		{
			new weapon = GetGunFromString(weaponstr);
			if(weapon < 1 || weapon > MAX_WEAPONS)
				return Msg(playerid, "Ilyen fegyver nem létezik");
			
			if(!WeaponPrice[weapon][wWeapon])
				return Msg(playerid, "Ilyen fegyver nem vehetõ a fegyverboltban");
			
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
				SendFormatMessage(playerid, COLOR_WHITE, "Vettél egy %s-t", GunName(weapon));
			}
			else
			{
				format(_tmpString, 128, "vett egy %s-t neki: %s", GunName(weapon), PlayerName(celpont)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Vettél egy %s-t neki: %s", GunName(weapon), PlayerName(celpont));
				SendFormatMessage(celpont, COLOR_WHITE, "%s vett neked egy %s-t", PlayerName(playerid), GunName(weapon));
			}
		}
		else if(iswep == 0)
		{
			new weapon = GetGunFromString(weaponstr);
			if(weapon < 1 || weapon > MAX_WEAPONS)
				return Msg(playerid, "Ilyen fegyver nem létezik");
			
			if(!WeaponPrice[weapon][wAmmo])
				return Msg(playerid, "Ilyen lõszer nem vehetõ a fegyverboltban");
			
			if(ammo < 1)
				return Msg(playerid, "Hibás lõszer mennyiség");
				
			new venni = max(0, min(ammo, WeaponMaxAmmo(weapon) - WeaponAmmo(celpont, weapon)));
			if(!venni)
				return Msg(playerid, "Nincs hely lõszernek");
			
			new koltseg = venni * WeaponPrice[weapon][wAmmo];
			if(!BankkartyaFizet(playerid, koltseg))
				return Msg(playerid, "Ezt nem tudod kifizetni");
				
			BizPenz(biz, koltseg);
			BizzInfo[biz][bProducts]--;
			BizUpdate(biz, BIZ_Products);
			
			WeaponGiveAmmo(celpont, weapon, venni);
			
			if(celpont == playerid)
			{
				format(_tmpString, 128, "vett némi %s lõszert", GunName(weapon)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Vettél %ddb %s lõszert", venni, GunName(weapon));
			}
			else
			{
				format(_tmpString, 128, "vett némi %s lõszert neki: %s", GunName(weapon), PlayerName(celpont)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Vettél %ddb %s lõszert neki: %s", venni, GunName(weapon), PlayerName(celpont));
				SendFormatMessage(celpont, COLOR_WHITE, "%s vett neked %ddb %s lõszert", PlayerName(playerid), venni, GunName(weapon));
			}
		}
		else
			Msg(playerid, "Hibás opció (fegyver / lõszer)");
	}
	else if(egyezik(func, "készít") || egyezik(func, "keszit"))
	{
		if (!IsMaffia(playerid)) return Msg(playerid, "Csak a Maffia készíthet fegyvert!");//Maffia készíthet csak fegyvert feltétel by Amos
	
		if(Szint(playerid) < WEAPON_MIN_LEVEL)
			return SendFormatMessage(playerid, COLOR_LIGHTRED, "Hiba: Fegyverhasználat nem engedélyezett a %d. szintig", WEAPON_MIN_LEVEL);
		
		if(PlayerInfo[playerid][pFegyverTiltIdo] > 1)
			return Msg(playerid, "El vagy tiltva a fegyverektõl");
		
		new iswep = !param2[0] ? -1 : (egyezik(param2, "fegyver") ? 1 : (egyezik(param2, "lõszer") || egyezik(param2, "loszer") ? 0 : -1));
		
		new weaponstr[32], ammo, celpont;
		if(!param2[0] || iswep == -1
			|| iswep == 1 && sscanf(params, "{s[32]s[32]}s[32]R(-1)", weaponstr, celpont)
			|| iswep == 0 && sscanf(params, "{s[32]s[32]}s[32]I(0)R(-1)", weaponstr, ammo, celpont)
		)
			return
				SendClientMessage(playerid, COLOR_WHITE, "===[ Árak ]==="),
				WeaponPrices(playerid, WEAPON_PRICES_MATS, COLOR_LIGHTBLUE),
				SendClientMessage(playerid, COLOR_YELLOW, "Használat: /fegyver készít fegyver [fegyvernév / ID] (játékos)"),
				SendClientMessage(playerid, COLOR_YELLOW, "Használat: /fegyver készít lõszer [fegyvernév / ID] [mennyiség] (játékos)")
			;
		
		if(celpont == INVALID_PLAYER_ID)
			return Msg(playerid, "Nincs ilyen játékos");
		else if(celpont == -1)
			celpont = playerid;
		else if(celpont != playerid && GetDistanceBetweenPlayers(playerid, celpont) > 5)
			return Msg(playerid, "Õ nincs a közeledben");
		
		if(!IsAt(playerid, IsAt_Fegyverkeszitohely))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "Nem vagy a fegyver készítõ helyénél, a gyárban");
			return 1;
		}
		
		if(iswep == 1)
		{
			new weapon = GetGunFromString(weaponstr);
			if(weapon < 1 || weapon > MAX_WEAPONS)
				return Msg(playerid, "Ilyen fegyver nem létezik");
			
			if(!WeaponPrice[weapon][wWeaponMat])
				return Msg(playerid, "Ilyen fegyver nem készíthetõ");
			
			if(WeaponCanHoldWeapon(celpont, weapon, 0) < 0)
				return Msg(playerid, "Ilyen fegyvert nem tudsz készíteni");
			
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
			else if(level >= 186 && weapontipus == 5) return Msg(playerid, "Ehhez minimum 5ös skill kell!");*/
			
			//Javítva by Ryan
			
			if(level <= 15 && weapontipus == 2) return Msg(playerid, "Ehhez minimum 2es skill kell!");
			else if(level <= 85 && weapontipus == 3) return Msg(playerid, "Ehhez minimum 3as skill kell!");
			else if(level <= 125 && weapontipus == 4) return Msg(playerid, "Ehhez minimum 4es skill kell!");
			else if(level <= 185 && weapontipus == 5) return Msg(playerid, "Ehhez minimum 5ös skill kell!");
				
			PlayerInfo[playerid][pMats] -= WeaponPrice[weapon][wWeaponMat];
			
			WeaponGiveWeapon(celpont, weapon, .maxweapon = 0);
			
			if(weapontipus == 1) PlayerInfo[playerid][pCarSkill] += 1;
			if(weapontipus == 2) PlayerInfo[playerid][pCarSkill] += 2;
			if(weapontipus == 3) PlayerInfo[playerid][pCarSkill] += 3;
			if(weapontipus == 4) PlayerInfo[playerid][pCarSkill] += 4;
			if(weapontipus == 5) PlayerInfo[playerid][pCarSkill] += 5;
			
			if(celpont == playerid)
			{
				format(_tmpString, 128, "készített egy %s-t", GunName(weapon)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Készítettél egy %s-t", GunName(weapon));
			}
			else
			{
				format(_tmpString, 128, "készített egy %s-t neki: %s", GunName(weapon), PlayerName(celpont)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Készítettél egy %s-t neki: %s", GunName(weapon), PlayerName(celpont));
				SendFormatMessage(celpont, COLOR_WHITE, "%s készített neked egy %s-t", PlayerName(playerid), GunName(weapon));
			}
		}
		else if(iswep == 0)
		{
			new weapon = GetGunFromString(weaponstr);
			if(weapon < 1 || weapon > MAX_WEAPONS)
				return Msg(playerid, "Ilyen fegyver nem létezik");
			
			if(!WeaponPrice[weapon][wAmmoMat])
				return Msg(playerid, "Ilyen lõszer nem készíthetõ");
			
			if(ammo < 1)
				return Msg(playerid, "Hibás lõszer mennyiség");
				
			new venni = max(0, min(ammo, WeaponMaxAmmo(weapon) - WeaponAmmo(celpont, weapon)));
			if(!venni)
				return Msg(playerid, "Nincs hely lõszernek");
			
			new koltseg = venni * WeaponPrice[weapon][wAmmoMat];
			if(PlayerInfo[playerid][pMats] < koltseg)
				return Msg(playerid, "Nincs ennyi materialod");
				
			PlayerInfo[playerid][pMats] -= koltseg;
			
			WeaponGiveAmmo(celpont, weapon, venni);
			
			if(celpont == playerid)
			{
				format(_tmpString, 128, "készített némi %s lõszert", GunName(weapon)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Készítettél %ddb %s lõszert", venni, GunName(weapon));
			}
			else
			{
				format(_tmpString, 128, "készített némi %s lõszert neki: %s", GunName(weapon), PlayerName(celpont)), Cselekves(playerid, _tmpString);
				SendFormatMessage(playerid, COLOR_WHITE, "Készítettél %ddb %s lõszert neki: %s", venni, GunName(weapon), PlayerName(celpont));
				SendFormatMessage(celpont, COLOR_WHITE, "%s készített neked %ddb %s lõszert", PlayerName(playerid), venni, GunName(weapon));
			}
		}
		else
			Msg(playerid, "Hibás opció (fegyver / lõszer)");
	}
	else if(egyezik(func, "átad") || egyezik(func, "atad"))
	{
		if(Paintballozik[playerid])
			return Msg(playerid, "Paintball alatt nem lehetséges");
			
		new celpont, weaponstr[32], ammo;
		if(!param2[0] || sscanf(params, "{s[32] s[32] }rs[32] I(0)", celpont, weaponstr, ammo))
			return
				SendClientMessage(playerid, COLOR_YELLOW, "Használat: /f átad fegyver [játékos név / ID] [fegyvernév / ID]"),
				SendClientMessage(playerid, COLOR_YELLOW, "Használat: /f átad lõszer [játékos név / ID] [fegyvernév / ID] [mennyiség]")
			;
		
		if(celpont == INVALID_PLAYER_ID)
			return Msg(playerid, "Nem létezõ játékos");
		
		if(GetDistanceBetweenPlayers(playerid, celpont) > 2)
			return Msg(playerid, "Õ nincs a közeledben");
		
		if(PlayerState[playerid] != PLAYER_STATE_ONFOOT || PlayerState[celpont] != PLAYER_STATE_ONFOOT)
			return Msg(playerid, "Kocsiban nem lehet");

		if(Szint(playerid) < WEAPON_MIN_LEVEL || Szint(celpont) < WEAPON_MIN_LEVEL)
			return Msg(playerid, "Túl kicsi a szinted vagy az õ szintje a fegyverhasználathoz");
		
		if(PlayerInfo[playerid][pFegyverTiltIdo] > 0 || PlayerInfo[celpont][pFegyverTiltIdo] > 0 )
			return Msg(playerid, "Egyikõtõk el van tiltva a fegyvertõl!");
		
		new weapon = GetGunFromString(weaponstr);
		if(weapon < 1 || weapon > MAX_WEAPONS)
			return Msg(playerid, "Ilyen fegyver nem létezik");
		
		if(egyezik(param2, "fegyver"))
		{
			if((weapon == WEAPON_CHAINSAW || weapon == WEAPON_FIREEXTINGUISHER) && !LMT(celpont, FRAKCIO_TUZOLTO))
				return Msg(playerid, "Poroltó és láncfûrész nem adható át, csak tûzoltónak!");
			
			if(WeaponHaveWeapon(playerid, weapon) < 0)
				return Msg(playerid, "Nincs ilyen fegyvered");
			
			if(WeaponCanHoldWeapon(celpont, weapon, 0) < 0)
				return Msg(playerid, "Nincs hely a fegyvernek");
			
			WeaponTakeWeapon(playerid, weapon);
			WeaponGiveWeapon(celpont, weapon, 0);
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Átadtál neki egy %s-t", GunName(weapon));
			SendFormatMessage(celpont, COLOR_LIGHTBLUE, "Átadtak neked egy %s-t", GunName(weapon));
			
			OnePlayAnim(playerid, "GANGS", "shake_cara", 4.0, 0, 0, 0, 0, 0);
			OnePlayAnim(celpont, "GANGS", "shake_cara", 4.0, 0, 0, 0, 0, 0);
			
			if(!PlayerInfo[playerid][pMember])
				if(!PlayerInfo[celpont][pMember])
					format(_tmpString, 128, "[Átad][Civil]%s átadott neki: [Civil]%s, egy %s-t", PlayerName(playerid), PlayerName(celpont), GunName(weapon)), Log("Fegyver", _tmpString);
				else
					format(_tmpString, 128, "[Átad][Civil]%s átadott neki: [%s]%s, egy %s-t", PlayerName(playerid), Szervezetneve[ PlayerInfo[celpont][pMember] - 1 ], PlayerName(celpont), GunName(weapon)), Log("Fegyver", _tmpString);
			else
				if(!PlayerInfo[celpont][pMember])
					format(_tmpString, 128, "[Átad][%s]%s átadott neki: [Civil]%s, egy %s-t", Szervezetneve[ PlayerInfo[playerid][pMember] - 1 ], PlayerName(playerid), PlayerName(celpont), GunName(weapon)), Log("Fegyver", _tmpString);
				else
					format(_tmpString, 128, "[Átad][%s]%s átadott neki: [%s]%s, egy %s-t", Szervezetneve[ PlayerInfo[playerid][pMember] - 1 ], PlayerName(playerid), Szervezetneve[ PlayerInfo[celpont][pMember] - 1 ], PlayerName(celpont), GunName(weapon)), Log("Fegyver", _tmpString);
		}
		else if(egyezik(param2, "lõszer") || egyezik(param2, "loszer"))
		{
			if(ammo < 1)
				return Msg(playerid, "Hibás lõszer mennyiség");
			
			new atadni = max(0, min(ammo, min(WeaponAmmo(playerid, weapon), WeaponMaxAmmo(weapon) - WeaponAmmo(celpont, weapon))));
			if(!atadni)
				return Msg(playerid, "Nincs hely nála");
			
			if(WeaponAmmo(playerid, weapon) < 0)
				return Msg(playerid, "Nincs ilyen fegyvered");
			
			if(WeaponCanHoldWeapon(celpont, weapon, 0) < 0)
				return Msg(playerid, "Nincs hely a fegyvernek");
			
			WeaponGiveAmmo(playerid, weapon, -atadni);
			WeaponGiveAmmo(celpont, weapon, atadni);
			SendFormatMessage(playerid, COLOR_LIGHTBLUE, "Átadtál neki egy %ddb %s lõszert", atadni, GunName(weapon));
			SendFormatMessage(celpont, COLOR_LIGHTBLUE, "%s átadott neked %ddb %s lõszert", PlayerName(playerid), atadni, GunName(weapon));
			
			OnePlayAnim(playerid, "GANGS", "shake_cara", 4.0, 0, 0, 0, 0, 0);
			OnePlayAnim(celpont, "GANGS", "shake_cara", 4.0, 0, 0, 0, 0, 0);
			
			if(!PlayerInfo[playerid][pMember])
				if(!PlayerInfo[celpont][pMember])
					format(_tmpString, 128, "[Átad][Civil]%s átadott neki: [Civil]%s, %ddb %s lõszert", PlayerName(playerid), PlayerName(celpont), atadni, GunName(weapon)), Log("Fegyver", _tmpString);
				else
					format(_tmpString, 128, "[Átad][Civil]%s átadott neki: [%s]%s, %ddb %s lõszert", PlayerName(playerid), Szervezetneve[ PlayerInfo[celpont][pMember] - 1 ], PlayerName(celpont), atadni, GunName(weapon)), Log("Fegyver", _tmpString);
			else
				if(!PlayerInfo[celpont][pMember])
					format(_tmpString, 128, "[Átad][%s]%s átadott neki: [Civil]%s, %ddb %s lõszert", Szervezetneve[ PlayerInfo[playerid][pMember] - 1 ], PlayerName(playerid), PlayerName(celpont), atadni, GunName(weapon)), Log("Fegyver", _tmpString);
				else
					format(_tmpString, 128, "[Átad][%s]%s átadott neki: [%s]%s, %ddb %s lõszert", Szervezetneve[ PlayerInfo[playerid][pMember] - 1 ], PlayerName(playerid), Szervezetneve[ PlayerInfo[celpont][pMember] - 1 ], PlayerName(celpont), atadni, GunName(weapon)), Log("Fegyver", _tmpString);
		}
	}
	
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

ALIAS(t2rfigyel6):terfigyelo;
CMD:terfigyelo(playerid, params[])
{
	if(!IsACop(playerid))
		return 1;

	new sub[32], subparams[64];
	if(sscanf(params, "s[32]S()[64]", sub, subparams))
		return SendClientMessage(playerid, COLOR_WHITE, "Használata: /térfigyelõ [jelzések / jelzés / térkép / utolsópozíció]");
	
	if(egyezik(sub, "jelzes") || egyezik(sub, "jelzés"))
	{
		new jelzes;
		if(sscanf(subparams, "i", jelzes))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /térfigyelõ jelzés [jelzés szint]");
			SendClientMessage(playerid, COLOR_WHITE, "Jelzések: 0 = kikapcsolva, 1 = fegyverviselés, 2 = célzás + fegyverviselés, stb.");
			SendClientMessage(playerid, COLOR_WHITE, "Jelzések megtekinthetõek a wikipédián: classrpg.net/Térfigyelõ");
			return 1;
		}
		
		if(jelzes < 0 || jelzes > PLAYER_MARKER_MKILL)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Jelzés: Minimum 0, maximum 5");
			
		PlayerInfo[playerid][pJelzes] = jelzes;
		
		switch(jelzes)
		{
			case PLAYER_MARKER_WEAPONHOLD: Msg(playerid, "Jelzések: fegyverviselés, fenyegetés, testisértés, emberölés, többszörös emberölés");
			case PLAYER_MARKER_TARGET: Msg(playerid, "Jelzések: fenyegetés, testisértés, emberölés, többszörös emberölés");
			case PLAYER_MARKER_SHOOT: Msg(playerid, "Jelzések: testisértés, emberölés, többszörös emberölés");
			case PLAYER_MARKER_KILL: Msg(playerid, "Jelzések: emberölés, többszörös emberölés");
			case PLAYER_MARKER_MKILL: Msg(playerid, "Jelzések: többszörös emberölés");
			default: Msg(playerid, "Jelzés kikapcsolva - most már nem fogja chatben írni az új bûnözõket");
		}
	}
	elseif(egyezik(sub, "terkep") || egyezik(sub, "térkép"))
	{
		new jelzes;
		if(sscanf(subparams, "i", jelzes))
		{
			SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /térfigyelõ térkép [jelzés szint]");
			SendClientMessage(playerid, COLOR_WHITE, "Jelzések: 0 = kikapcsolva, 1 = fegyverviselés, 2 = célzás + fegyverviselés, stb.");
			SendClientMessage(playerid, COLOR_WHITE, "Jelzések megtekinthetõek a wikipédián: classrpg.net/Térfigyelõ");
			return 1;
		}
		
		if(jelzes < 0 || jelzes > PLAYER_MARKER_MKILL)
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Jelzés: Minimum 0, maximum 5");
			
		PlayerInfo[playerid][pJelzesTerkep] = jelzes;
		
		switch(jelzes)
		{
			case PLAYER_MARKER_WEAPONHOLD: Msg(playerid, "Térkép jelzések: fegyverviselés, fenyegetés, testisértés, emberölés, többszörös emberölés");
			case PLAYER_MARKER_TARGET: Msg(playerid, "Térkép jelzések: fenyegetés, testisértés, emberölés, többszörös emberölés");
			case PLAYER_MARKER_SHOOT: Msg(playerid, "Térkép jelzések: testisértés, emberölés, többszörös emberölés");
			case PLAYER_MARKER_KILL: Msg(playerid, "Térkép jelzések: emberölés, többszörös emberölés");
			case PLAYER_MARKER_MKILL: Msg(playerid, "Térkép jelzések: többszörös emberölés");
			default: Msg(playerid, "Jelzés kikapcsolva - most már nem fogja chatben írni az új bûnözõket");
		}
		
		MarkerAction(playerid, PLAYER_MARKER_ON_REFRESH);
	}
	elseif(egyezik(sub, "utolsopozicio") || egyezik(sub, "utolsópozíció"))
	{
		new bid;
		if(sscanf(subparams, "i", bid))
			return SendClientMessage(playerid, COLOR_LIGHTRED, "Használata: /térfigyelõ utolsópozíció [egyedi ID (pl.: 1234)]");
		
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
			return Msg(playerid, "Utolsó pozíció nem ismert");
			
		SetPlayerCheckpoint(playerid, ArrExt(PlayerMarker[player][mLastPos]), 3.0);
		SendFormatMessage(playerid, COLOR_LIGHTRED, "Térfigyelõ: %d jelezve a térképen", PlayerInfo[player][pBID]);
	}
	elseif(egyezik(sub, "jelzesek") || egyezik(sub, "jelzések"))
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
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_WEAPONHOLD, "[Térfigyelõ: fegyverviselés] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
					case PLAYER_MARKER_TARGET:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_TARGET, "[Térfigyelõ: célzás] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
					case PLAYER_MARKER_SHOOT:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_SHOOT, "[Térfigyelõ: testisértés] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
					case PLAYER_MARKER_KILL:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_KILL, "[Térfigyelõ: emberölés] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
					case PLAYER_MARKER_MKILL:
						SendFormatMessage(playerid, PLAYER_MARKER_COLOR_MKILL, "[Térfigyelõ: többszörös emberölés] #%d - %dmp", PlayerInfo[p][pBID], PlayerMarker[p][mTime]);
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
ALIAS(sajt4):sajto;
CMD:sajto(playerid, params[])
{
	if(!LMT(playerid, FRAKCIO_RIPORTER)) return Msg(playerid, "Nem vagy riporter!");
	if(PlayerInfo[playerid][pNewsSkill] < 101) return Msg(playerid, "A parancs használatához minimum 3-as ripoter skill szükséges");
	if(IsValidDynamic3DTextLabel(SajtoIgazolvany[playerid]))
	{
		DestroyDynamic3DTextLabel(SajtoIgazolvany[playerid]), SajtoIgazolvany[playerid] = INVALID_3D_TEXT_ID;
		Cselekves(playerid, "levette a nyakából a sajtóigazolványt.");
	}
	else
	{
		SajtoIgazolvany[playerid] = CreateDynamic3DTextLabel("Sajtó", COLOR_DYELLOW, 0.0, 0.0, 0.25, 10.0, playerid, INVALID_VEHICLE_ID, 1);
		Cselekves(playerid, "felrakta a nyakába a sajtóigazolványt.");
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

ALIAS(ter8let):terulet;
CMD:terulet(playerid, params[])
{
	if(!PlayerInfo[playerid][pLeader])
		return Msg(playerid, "Ezt a parancsot csak leader használhatja");
	
	new func[32];
	if(sscanf(params, "s[32] ", func))
		return Msg(playerid, "Használata: /terület átad [játékos]");
	
	if(egyezik(func, "átad") || egyezik(func, "atad"))
	{
		new player;
		if(sscanf(params, "{s[32]}r", player) || player == INVALID_PLAYER_ID)
			return Msg(playerid, "Használat: /terület átad [játékos]");
		
		if(!PlayerInfo[player][pMember] || PlayerInfo[player][pMember] == PlayerInfo[playerid][pMember] || LegalisSzervezetTagja(player) || Civil(player))
			return Msg(playerid, "Neki nem adhatod át");
		
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
			return Msg(playerid, "A területre kell menned, hogy átadhasd");
		
		if(TeruletInfo[area][tTulaj] != PlayerInfo[playerid][pLeader])
			return Msg(playerid, "Ez nem a ti területetek");
			
		if(db >= TERULET_FRAKCIO_LIMIT)
			return Msg(playerid, "Nekik már túl sok területük van");
		
		FrakcioInfo[PlayerInfo[playerid][pMember]][fPenz] -= 1000000;
		TeruletInfo[area][tTulaj] = PlayerInfo[player][pMember];
		TeruletUpdate(area, TERULET_Tulaj);
		TeruletFrissites();
		
		new msg1[128], msg2[128];
		format(msg1, 128, "<< Átadtátok a %s területet nekik: %s, az átruházási díj 1.000.000 Ft volt >>", TeruletInfo[area][tNev], Szervezetneve[ PlayerInfo[player][pMember] - 1][2]);
		format(msg2, 128, "<< Megkaptátok a %s területet tõlük: %s >>", TeruletInfo[area][tNev], Szervezetneve[ PlayerInfo[playerid][pLeader] - 1][2]);
		foreach(Jatekosok, p)
		{
			if(PlayerInfo[p][pMember] == PlayerInfo[playerid][pMember])
				SendClientMessage(p, COLOR_YELLOW, msg1);
			else if(PlayerInfo[p][pMember] == PlayerInfo[player][pMember])
				SendClientMessage(p, COLOR_YELLOW, msg2);
		}
		format(_tmpString, 200, "[%s]%s átadta a %s területet nekik: %s", Szervezetneve[ PlayerInfo[playerid][pLeader] - 1][2], PlayerName(playerid), TeruletInfo[area][tNev], Szervezetneve[ PlayerInfo[player][pMember] - 1][2]), Log("Egyeb", _tmpString);
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
						SendFormatMessage(playerid, COLOR_GREEN, "[Info]: A kapu jelszava a következõ: %d | {FF0000}Ha visszaélsz vele a büntetés nem marad el!", Kapu[k][kKod]);
						SendClientMessage(playerid, COLOR_LIGHTRED, "[Info]: Ha a kapu nem a te tulajdonodban áll, a jelszavát nem mondhatod el senkinek se!");
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
		// nem csinál semmit
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
	//vége
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
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy autószerelõ!");
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
		    SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy rendõr.");
	}
//SWAT1
	else if(PlayerToPoint(20, playerid, 1626.2834472656, -1856.1879882813, 12.547634124756))
	{
	    if(PlayerInfo[playerid][pSwattag] == 1 || IsAdmin(playerid))
		{
	    	MoveDynamicObject(swatkapu1,1621.47375, -1856.35315, 8.78574, 3);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy a SWAT Egység tagja!");
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

			SendMessage(SEND_MESSAGE_RADIO, "FBI HQ: Figyelem minden egység! Illetéktelen behatolási kísérlet!", COLOR_RED, FRAKCIO_FBI);
			
			Fbibelepes = 1;
			HolTart[playerid] = NINCS;
			return 1;
		
		}
	}
	else
		SendClientMessage(playerid, COLOR_RED, "Nem vagy kapu közelében!");

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
				Msg(playerid, "Ezt a kaput nem zárhatod be");

			van = true;
			break;
		}
	}

	if(van)
	{
		// Nem csinál semmit
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
	//vlé
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
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy az Oktatók tagja!");
	}
*/
	else if(PlayerToPoint(7, playerid, -1917.303833, 301.403687, 40.874542))
	{
		if(PlayerInfo[playerid][pSzerelo]>0 || IsAdmin(playerid))
			MoveDynamicObject(AutoSzereloKapu, -1917.303833, 301.403687, 40.874542, 2);
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy autószerelõ!");
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
		    SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy rendõr.");
	}
//SWAT1
	else if(PlayerToPoint(20, playerid, 1626.2834472656, -1856.1879882813, 12.547634124756))
	{
	    if(PlayerInfo[playerid][pSwattag] == 1 || IsAdmin(playerid))
		{
	    	MoveDynamicObject(swatkapu1,1621.47375, -1856.35315, 16.36366, 3);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem vagy a SWAT Egység tagja!");
	}

	else if(PlayerToPoint(10, playerid, -1696.796997, 22.362562, 3.554687))
	{
	    if(PlayerInfo[playerid][pAutoker]>0 || IsAdmin(playerid))
		{
	    	MoveDynamicObject(KereskedoKapu, -1697.0, 23.0, 5.3280787467957, 2);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem zárhatod be ezt a kaput!");
	}

	else if(PlayerToPoint(5, playerid, -2017.732178, -261.280273, 37.093704))
	{
	    if(PlayerInfo[playerid][pPhousekey] == 171)
		{
	    	MoveDynamicObject(KereskedoKapuHQn, -2017.732178, -261.280273, 37.093704, 2);
		}
		else
			SendClientMessage(playerid, COLOR_YELLOW, "Nem zárhatod be ezt a kaput!");
	}

	else
	    SendClientMessage(playerid, COLOR_RED, "Nem vagy kapu közelében!");

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
		Msg(playerid, "{6EF83C}((Jelenleg fejlesztés alatt áll! Ötletek ügyében keresd a Scriptereket vagy a biznisz ötletek alfórumot!))");
	}
	return 1;
}