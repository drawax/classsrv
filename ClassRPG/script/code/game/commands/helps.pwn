#if defined __game_commands_helps
	#endinput
#endif
#define __game_commands_helps

/****************************
 *           cmdk           *
 *    �: 1   �: 4   �: 7    *
 *    �: 2   �: 5   �: 8    *
 *    �: 3   �: 6   �: 9    *  
 ****************************/
 
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

ALIAS(ah):ahelp;
CMD:ahelp(playerid, params[])
{
	if(!Admin(playerid, 1) && !IsScripter(playerid) && !IsAS(playerid)) return Msg(playerid, "Nem vagy Admin / Adminseg�d.");
	if(IsAS(playerid))
	{
		SendClientMessage(playerid, COLOR_YELLOW, "Adminseg�d: /as /tv (vissza) /asayn /warn /v� /cv� /report kick /(u)n(f)reeze /freeze");
		SendClientMessage(playerid, COLOR_YELLOW, "Adminseg�d: TV-z�s k�zben a k�vetkez�ket is haszn�lhatod: /set /respawn /vhspawn");
	}
	if(PlayerInfo[playerid][pAdmin] >= 1 || IsScripter(playerid))
	{
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(1): /a(s) /nevek /jail /set /vw /inti /asay(n) /respawn /vhspawn /tele /cheathp /cheatarmor /lista");
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(1): /asegit /cc /rabok /mz /ajailosok /k�rh�zban /admins(eg�dek) /(b)warn /kick /pacsi /zso /enged�ly");
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(1): /bid /pmblock /aranks /onduty /get(pos/hp/skin) /arendsz�m /crs /crsid /ann /setint /setvw /apark");
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(1): /check /up /down /lt /rt /joypad /kivanitt /cnn /rendezv�ny /carinfo /ash /ondutyskin");
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
		SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(4): /engedgoto /alock /noas /atuning /agl /hp /armor /amoney /idgskin /absz /�l�sid� /parkhely");
	if(PlayerInfo[playerid][pAdmin] >= 5)
		    SendClientMessage(playerid, COLOR_LIGHTRED, "Admin(5): /kocsiba /csendvan /v�laszok /helper /tvenged�ly /tilt�s /�tn�z /setskin /bigears /t�z stop /gun /ammo /fixveh");
	if(PlayerInfo[playerid][pAdmin] >= 6)
	{
		SendClientMessage(playerid, COLOR_NAR, "F�AdminSeg�d(6): /race /helper2 /acr(30) /ujbelso /ujbejarat /removecar /house /h�zass�g");
		SendClientMessage(playerid, COLOR_NAR, "F�AdminSeg�d(6): /kor /nem /veh /destroycars /statisztika /houseo /abiz");
	}
	if(PlayerInfo[playerid][pAdmin] >= 1337)
	{
		SendClientMessage(playerid, COLOR_DARKYELLOW,"F�Admin(1337): /an�v /unbanip /admin�ln�v(be) /ater�let /ujmodel /warvan");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"F�Admin(1337): /�ln�v /atuningol�s /robbant /pozment�s /noooc /pmek /fa /tod /setweaponskill");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"F�Admin(1337): /ig�nyt�rl�se /ujadatok /h�z /h�ztipus /ip /korm�ny /kocsikulcs t�r�l /h�zkulcs t�r�l");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"F�Admin(1337): /gar�zs /asellbiz /edit /munkaid /j�rm�hp /desync /weather /ppont /szint /�ra");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"F�Admin(1337): /arcmost /startlotto /makeadmin /makeleader /maketagsag /mati /rakt�r �rt�k");
		SendClientMessage(playerid, COLOR_DARKYELLOW,"F�Admin(1337): /kocsikulcs /h�zkulcs /bizniszkulcs /setstat /fuelcar /aopen /npc /szerel� /autoker /swat");
	}
	if(PlayerInfo[playerid][pAdmin] >= 1338)
	{
		SendClientMessage(playerid, COLOR_ORANGE,"SuperAdmin(1338): /fegyveranticheat /loadversion /object /goingenyles /szerver /�jajt� /v�laszok t�rl�s");
		SendClientMessage(playerid, COLOR_ORANGE,"SuperAdmin(1338): /asellcar /asellhouse /benzink�t /ajt� /kapu");
	}

	if(PlayerInfo[playerid][pAdmin] >= 1339)
		SendClientMessage(playerid, COLOR_LIGHTGREEN,"AdminController(1339): /resivan /weatherall");
	if(PlayerInfo[playerid][pAdmin] >= 1340)
		SendClientMessage(playerid, COLOR_GREEN,"F�AdminController(1340): /sz�f �rt�k /swatleader /kapu /object /pickups /rendel /atm /forgalom");

	if(Admin(playerid, 5555) || IsScripter(playerid))
	{
		SendClientMessage(playerid, COLOR_BLUE, "Scripter(5555): /sa /sendrcon /resivan /spawn /debug /bet�lt /ment�s /pickups /m�reg /bank /objdel /pickdel");
		SendClientMessage(playerid, COLOR_BLUE, "Scripter(5555): /ujpick /ujgarazs /ujhaz /ujkocsi /lowryder /ujbiznev /ujbizhely /ig�nyl�sek /sduty");
		SendClientMessage(playerid, COLOR_BLUE, "Scripter(5555): /saveint /deleteint /editint /goint /weatherall /kapu /npc /parancsbet�lt�s /forgalom /alapkocsi");
	}
	return 1;
}