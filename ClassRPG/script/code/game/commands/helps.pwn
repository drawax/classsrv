#if defined __game_commands_helps
	#endinput
#endif
#define __game_commands_helps

/****************************
 *           cmdk           *
 *    á: 1   ó: 4   ú: 7    *
 *    é: 2   ö: 5   ü: 8    *
 *    í: 3   õ: 6   û: 9    *  
 ****************************/
 
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

ALIAS(ah):ahelp;
CMD:ahelp(playerid, params[])
{
	if(!Admin(playerid, 1) && !IsScripter(playerid) && !IsAS(playerid)) return Msg(playerid, "Nem vagy Admin / Adminsegéd.");
	if(IsAS(playerid))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Adminsegéd: /as /tv (vissza) /asayn /warn /vá /cvá /report kick /(u)n(f)reeze /freeze");
		SendClientMessage(playerid, COLOR_YELLOW, "Adminsegéd: TV-zés közben a következõket is használhatod: /set /respawn /vhspawn");
	}
	if(PlayerInfo[playerid][pAdmin] >= 1 || IsScripter(playerid))
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(1): /a(s) /nevek /jail /set /vw /inti /asay(n) /respawn /vhspawn /tele /cheathp /cheatarmor /lista");
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(1): /asegit /cc /rabok /mz /ajailosok /kórházban /admins(egédek) /(b)warn /kick /pacsi /zso /engedély");
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(1): /bid /pmblock /aranks /onduty /get(pos/hp/skin) /arendszám /crs /crsid /ann /setint /setvw /apark");
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(1): /check /up /down /lt /rt /joypad /kivanitt /cnn /rendezvény /carinfo /ash /ondutyskin");
	}
	if(PlayerInfo[playerid][pAdmin] >= 2)
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(2): /ban /iban /kban /skick /auncuff /flymode /fly /flip /skydive /mute /objectinfo /clearplayer /clearvehicle");
	if(PlayerInfo[playerid][pAdmin] >= 3)
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(3): /alefoglal /lenyomoz /fourdive /msg /aunshock");
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(3): /goto /gethere /gotocar /getcar /gotopos /mark /gotomark");
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(3): /ahegy /entercar /goto(ls/sf/lv/in/jet)");
	}
	if(PlayerInfo[playerid][pAdmin] >= 4)
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(4): /engedgoto /alock /noas /atuning /agl /hp /armor /amoney /idgskin /absz /ölésidõ /parkhely");
	if(PlayerInfo[playerid][pAdmin] >= 5)
		    SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(5): /kocsiba /csendvan /válaszok /helper /tvengedély /tiltás /átnéz /setskin /bigears /tûz stop /gun /ammo /fixveh");
	if(PlayerInfo[playerid][pAdmin] >= 6)
	{
		SendClientMessage(playerid, COLOR_NAR, "FõAdminSegéd(6): /race /helper2 /acr(30) /ujbelso /ujbejarat /removecar /house /házasság");
		SendClientMessage(playerid, COLOR_NAR, "FõAdminSegéd(6): /kor /nem /veh /destroycars /statisztika /houseo /abiz");
	}
	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
		SendClientMessage(playerid, COLOR_DARKYELLOW,"FõAdmin(1337): /anév /unbanip /adminálnév(be) /aterület /ujmodel /warvan");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"FõAdmin(1337): /álnév /atuningolás /robbant /pozmentés /noooc /pmek /fa /tod /setweaponskill");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"FõAdmin(1337): /igénytörlése /ujadatok /ház /háztipus /ip /kormány /kocsikulcs töröl /házkulcs töröl");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"FõAdmin(1337): /garázs /asellbiz /edit /munkaid /jármûhp /desync /weather /ppont /szint /óra");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"FõAdmin(1337): /arcmost /startlotto /makeadmin /makeleader /maketagsag /mati /raktár érték");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"FõAdmin(1337): /kocsikulcs /házkulcs /bizniszkulcs /setstat /fuelcar /aopen /npc /szerelõ /autoker /swat");
	}
	if(PlayerInfo[playerid][pAdmin] >= 1338)
	{
		SendClientMessage(playerid, COLOR_ORANGE,"SuperAdmin(1338): /fegyveranticheat /loadversion /object /goingenyles /szerver /újajtó /válaszok törlés");
		SendClientMessage(playerid, COLOR_ORANGE,"SuperAdmin(1338): /asellcar /asellhouse /benzinkút /ajtó /kapu");
	}

	if(PlayerInfo[playerid][pAdmin] >= 1339)
		SendClientMessage(playerid, COLOR_LIGHTGREEN,"AdminController(1339): /resivan /weatherall");
	if(PlayerInfo[playerid][pAdmin] >= 1340)
		SendClientMessage(playerid, COLOR_GREEN,"FõAdminController(1340): /széf érték /swatleader /kapu /object /pickups /rendel /atm /forgalom");

	if(Admin(playerid, 5555) || IsScripter(playerid))
	{
		SendClientMessage(playerid, COLOR_BLUE, "Scripter(5555): /sa /sendrcon /resivan /spawn /debug /betölt /mentés /pickups /méreg /bank /objdel /pickdel");
		SendClientMessage(playerid, COLOR_BLUE, "Scripter(5555): /ujpick /ujgarazs /ujhaz /ujkocsi /lowryder /ujbiznev /ujbizhely /igénylések /sduty");
		SendClientMessage(playerid, COLOR_BLUE, "Scripter(5555): /saveint /deleteint /editint /goint /weatherall /kapu /npc /parancsbetöltés /forgalom /alapkocsi");
	}
	return 1;
}