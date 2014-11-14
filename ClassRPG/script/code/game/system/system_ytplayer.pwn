#if defined __game_system_system_ytplayer
	#endinput
#endif
#define __game_system_system_ytplayer

/**	::				::
	:: 	 VÁLTOZÓK	::
	::				::	**/
	
new G_stream, G_title[256], G_duration = 0, G_link[64], RiporterZeneTipus;

/**	::				::
	:: 	 PUBLICOK	::
	::				::	**/

fpublic OnYoutubeResponse(playerid, response_code, data[])
{
	if(response_code == 200)
	{
		new content[3][256],stream[256];
        new hours,minutes,seconds,tmp_seconds[8],tmp_title[64];

		Explode(content,data,"<br />");
		strmid(tmp_title,content[0],7,strlen(content[0]));
		strmid(tmp_seconds,content[1],8,strlen(content[1]));
		strmid(stream,content[2],6,strlen(content[2]));
 
		G_duration = strval(tmp_seconds);
		G_title = tmp_title;
 
		FormatSeconds(G_duration, hours, minutes, seconds);
               
		SendRadioMessageFormat(FRAKCIO_RIPORTER, COLOR_YELLOW, "<< %s bekapcsolta a zene streamelést! (YouTube) >>", ICPlayerName(playerid));
		SendRadioMessageFormat(FRAKCIO_RIPORTER, COLOR_YELLOW, "<< Zene adatok: Név: %s Hosszúság: %02d:%02d:%02d >>", GetVideoTitle(), hours, minutes, seconds);
 
		foreach(Jatekosok, p)
		{
			if(PlayerInfo[p][pRadio] == 1 && Logged(p) && gNews[p] == 0 && Zsebradio[p] == 0 && DiscobanVan{p} == 0)
				PlayAudioStreamForPlayer(p, stream);
		}
		RiporterZeneVan = true;
		RiporterZene = stream;
		RiporterZeneTipus = 1;
               
		G_stream = UnixTime+G_duration;
	}
	else SendFormatMessage(playerid, COLOR_LIGHTRED, "[Hiba Történt] Hibaüzenet: %s | Hibakód: %d",GetError(response_code),response_code);
}

/**	::				::
	:: 	 STOCKOK	::
	::				::	**/

stock PlayYoutubeVideoForPlayer(playerid, url[])
{
	if(strfind(url, "&") != NINCS) strmid(url, url, 0, strfind(url,"&"), 128);
	format(G_link, 64, "%s",url);
	format(url, 128, "youtubeinmp3.com/fetch/?api=advanced&video=%s", G_link);
	HTTP(playerid, HTTP_GET, url, "", "OnYoutubeResponse");
}

stock StopYoutubeVideoForPlayer(playerid)       return StopAudioStreamForPlayer(playerid);
stock ContainsYoutubeURL(string[])              return (strfind(string, "youtube") != 1 && strfind(string, "watch?v=") != 1);
 
stock IsYouTubeVideoPlaying()   return RiporterZeneVan;
stock GetLengthOfVideo()        return G_duration;
stock GetVideoTitle()           return G_title;
stock GetVideoLink()            return G_link;
 
stock GetError(val)
{
	new error[32];
	switch(val)
	{
		case 1: error = "Bad host";
		case 2: error = "No socket";
		case 3: error = "Can't connect";
		case 4: error = "Can't write";
		case 5: error = "Content too big";
		case 6: error = "Malformed response";
		case 300..308: error = "Redirection";
		case 400..499: error = "Client error";
		case 500..599: error = "Server error";
		default: error = "???";
	}
	return error;
}
 
stock FormatSeconds(seconds, &hours_left, &minutes_left, &seconds_left)
{
    hours_left = seconds/60/60;
    minutes_left = (seconds - hours_left*60*60)/60;
    seconds_left = (seconds - hours_left*60*60 - minutes_left*60);
}
 
stock Explode(aExplode[][], const sSource[], const sDelimiter[] = " ", iVertices = sizeof aExplode, iLength = sizeof aExplode[]) // by Westie
{
	new
	iNode,
	iPointer,
	iPrevious = -1,
	iDelimiter = strlen(sDelimiter);

	while(iNode < iVertices)
	{
		iPointer = strfind(sSource, sDelimiter, false, iPointer);
 
		if(iPointer == -1)
		{
			strmid(aExplode[iNode], sSource, iPrevious, strlen(sSource), iLength);
			break;
		}
		else
			strmid(aExplode[iNode], sSource, iPrevious, iPointer, iLength);
 
		iPrevious = (iPointer += iDelimiter);
		++iNode;
	}
 
	return iPrevious;
}

/**	::				::
	:: 	 PARANCSOK	::
	::				::	**/

ALIAS(yt):youtube;
CMD:youtube(playerid, params[])
{
	if(!LMT(playerid, FRAKCIO_RIPORTER) && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "[Hiba]: Te nem vagy Riporter vagy nincs elegendõ rangod!");
			
	if(!Munkarang(playerid, 1) && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_GREY, "Neked nem! (Minimum rang 1)");
				
	if(PlayerInfo[playerid][pNewsSkill] < 401 && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_GREY, "Nem vagy elég tapasztalt! (Minimum skill 5)");
		
	new urlcim[256];
	if(sscanf(params, "s[256]", urlcim))
		return Msg(playerid, "Használat: /youtube [Streamelhetõ Youtube URL cím (pl. https://www.youtube.com/watch?v=z7Bjasi12mE) | Kikapcsolás: /zeneki]");
	
	if(strlen(urlcim) >= 128)
		return Msg(playerid, "Túl hosszú a link!");
		
	if(!ContainsYoutubeURL(urlcim))
		return Msg(playerid, "Ez nem Youtube URL cím! Helyes használathoz példa: https://www.youtube.com/watch?v=z7Bjasi12mE | Kikapcsoláshoz használd a /zeneki parancsot");
	
	new newcar = GetPlayerVehicleID(playerid);
	new kocsi = GetClosestVehicle(playerid);
	if(GetVehicleModel(newcar) == 488 || GetVehicleModel(newcar) == 582 || PlayerToPoint(6, playerid, 1429.8469,-2448.7258,13.5629) || PlayerToPoint(2, playerid, -1821.3152,323.6341,-41.7493) || IsFrakcioKocsi(kocsi) == 9 || Admin(playerid, 6))
		PlayYoutubeVideoForPlayer(playerid, urlcim);
	else return Msg(playerid, "Nem vagy riporter jármû közelében vagy a bázison!");
	return 1;
}
CMD:zene(playerid, params[])
{
	if(!LMT(playerid, FRAKCIO_RIPORTER) && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "[Hiba]: Te nem vagy Riporter vagy nincs elegendõ rangod!");
			
	if(!Munkarang(playerid, 1) && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_GREY, "Neked nem! (Minimum rang 1)");
				
	if(PlayerInfo[playerid][pNewsSkill] < 401 && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_GREY, "Nem vagy elég tapasztalt! (Minimum skill 5)");
		
	new urlcim[256];
	if(sscanf(params, "s[256]", urlcim))
		return Msg(playerid, "Használat: /zene [Streamelhetõ .mp3 vagy .pls URL cím | Kikapcsolás: /zeneki]");
	
	if(strlen(urlcim) >= 128)
		return Msg(playerid, "Túl hosszú a link!");
		
	new newcar = GetPlayerVehicleID(playerid);
	new kocsi = GetClosestVehicle(playerid);
	if(GetVehicleModel(newcar) == 488 || GetVehicleModel(newcar) == 582 || PlayerToPoint(6, playerid, 1429.8469,-2448.7258,13.5629) || PlayerToPoint(2, playerid, -1821.3152,323.6341,-41.7493) || IsFrakcioKocsi(kocsi) == 9 || Admin(playerid, 6))
	{
		RiporterZene = urlcim;
		RiporterZeneTipus = 0;
		foreach(Jatekosok, p)
		{
			if(PlayerInfo[p][pRadio] == 1 && Logged(p) && gNews[p] == 0 && Zsebradio[p] == 0 && DiscobanVan{p} == 0)
				PlayAudioStreamForPlayer(p, RiporterZene);
		}
		RiporterZeneVan = true;
		SendRadioMessageFormat(FRAKCIO_RIPORTER, COLOR_YELLOW, "<< %s bekapcsolta a zene streamelést! (MP3) >>", PlayerName(playerid));
		Msg(playerid, "Zene streamelés mindenkinél elindítva!");
	}
	else return Msg(playerid, "Nem vagy riporter jármû közelében vagy a bázison!");
	return 1;
}

CMD:zeneki(playerid, params[])
{
	if(!LMT(playerid, FRAKCIO_RIPORTER) && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_LIGHTRED, "[Hiba]: Te nem vagy Riporter vagy nincs elegendõ rangod!");
			
	if(!Munkarang(playerid, 1) && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_GREY, "Neked nem! (Minimum rang 1)");
				
	if(PlayerInfo[playerid][pNewsSkill] < 401 && !Admin(playerid, 6))
		return SendClientMessage(playerid, COLOR_GREY, "Nem vagy elég tapasztalt! (Minimum skill 5)");
	
	new newcar = GetPlayerVehicleID(playerid);
	new kocsi = GetClosestVehicle(playerid);
	if(GetVehicleModel(newcar) == 488 || GetVehicleModel(newcar) == 582 || PlayerToPoint(6, playerid, 1429.8469,-2448.7258,13.5629) || PlayerToPoint(2, playerid, -1821.3152,323.6341,-41.7493) || IsFrakcioKocsi(kocsi) == 9 || Admin(playerid, 6))
	{
		foreach(Jatekosok, p)
		{
			if(PlayerInfo[p][pRadio] == 1 && Logged(p) && gNews[p] == 0 && Zsebradio[p] == 0 && DiscobanVan{p} == 0)
				StopYoutubeVideoForPlayer(p);
		}
		RiporterZeneVan = false;
	}
	else return Msg(playerid, "Nem vagy riporter jármû közelében vagy a bázison!");
	return 1;
}

ALIAS(zenec3m):zenecim;
CMD:zenecim(playerid, params[])
{
	if(!IsYouTubeVideoPlaying()) 
		return Msg(playerid, "Jelenleg nem játszanak le zenét a riporterek!");
		
	if(!RiporterZeneTipus)
		return Msg(playerid, "Jelenleg a riporterek nem a YouTube-n keresztül játszák le a zenét!");
		
	if(PlayerInfo[playerid][pTeloEgyenleg] < 25000) 
		return Msg(playerid, "Nem tudod kifizetni a zene adatainak lekérését!");
	
	new hours,minutes,seconds;
	FormatSeconds(G_duration, hours, minutes, seconds);
	
	tformat(256, "Köszönjük, hogy a CCN-t hallgatja!\n\nCím: %s\nHosszúság: %02d:%02d:%02d (%d másodperc)\nYoutube link: %s", GetVideoTitle(), hours, minutes, seconds, GetLengthOfVideo(), GetVideoLink());
	CustomDialog(playerid, D:zenecim, DIALOG_STYLE_MSGBOX, "Class City News", _tmpString, "Rendben", "");
	return 1;
}

/**	::				::
	:: 	  DIALOG	::
	::				::	**/

Dialog:zenecim(playerid, response, listitem, inputtext[])
{
	PlayerInfo[playerid][pTeloEgyenleg] -= 25000;
	FrakcioSzef(FRAKCIO_RIPORTER, 25000, 35);
	SendClientMessage(playerid, COLOR_ORANGE, "CCN - Mert a zene érted szól!");
	return 1;
}