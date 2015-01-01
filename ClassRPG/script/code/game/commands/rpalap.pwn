#if defined __game_commands_rpalap
	#endinput
#endif
#define __game_commands_rpalap

/****************************
 *           cmdk           *
 *    �: 1   �: 4   �: 7    *
 *    �: 2   �: 5   �: 8    *
 *    �: 3   �: 6   �: 9    *  
 ****************************/
 
 
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