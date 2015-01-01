#if defined __game_commands_rpalap
	#endinput
#endif
#define __game_commands_rpalap

/****************************
 *           cmdk           *
 *    á: 1   ó: 4   ú: 7    *
 *    é: 2   ö: 5   ü: 8    *
 *    í: 3   õ: 6   û: 9    *  
 ****************************/
 
 
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