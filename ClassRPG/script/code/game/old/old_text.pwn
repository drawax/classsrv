#if defined __game_old_old_text
	#endinput
#endif
#define __game_old_old_text

public OnPlayerText(playerid, text[]) //opt
{
	if(!IsPlayerConnected(playerid)) return 0;
	if(IsPlayerNPC(playerid)) { NPC_Uzenet(playerid, text); return 0; }
	if(Csendvan && PlayerInfo[playerid][pAdmin] == 0)
	{
		Msg(playerid, "Most nem besz�lhetsz!");
		return 0;
	}
	if(Alszik[playerid] != 0) return !Msg(playerid, "Alszol, ilyenkor nem besz�lhetsz!");
	AFKIdo[playerid] = 0;
	//new giver[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new tmp[256];
	new string[256];
	//new giveplayerid;
	
	if(KorhazIdo[playerid] > 0) return !Msg(playerid, "Most nem besz�lhetsz!");

	if(PlayerInfo[playerid][pMuted] == 1)
	{
		SendClientMessage(playerid, TEAM_CYAN_COLOR, "A hangsz�laiddal j�tszanak, ilyenkor neh�z!");
		return 0;
	}
	if(PlayerCuffed[playerid] == 1)
		return !Msg(playerid, "Sokkolva vagy, nem tudsz besz�lni!");
	if(Leutve[playerid])
	{
		Msg(playerid, "El vagy �julva ember �n nem besz�ln�k a helyedben..");
		return 0;
	}
	if(AFK[playerid] == 1)
	{
		if(strcmp(text, "classrpg", true) == 0)
		{
			AFK[playerid] = 0;
			SendClientMessage(playerid, COLOR_LIGHTRED, "===============[AFK]===============");
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Mostm�r nem vagy AFK!");
			SendClientMessage(playerid, COLOR_LIGHTRED, "===============[AFK]===============");
			TogglePlayerControllable(playerid, true);
			InvisibleColor(playerid);
			return 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "Ha szeretn�l visszat�rni az AFKb�l �rd be, hogy \"ClassRPG\"");
			return 0;
		}
	}
	if(Belepve[playerid] == 1)
	{
		new idx;
	    tmp = strtok(text, idx);
		if(egyezik(tmp, "�ln�v") || egyezik(tmp, "alnev"))
		{
			if(!Munkarang(playerid, 2) && !FBIAlnev) return !Msg(playerid, "Access Denied. 2-es rang sz�ks�ges.");
			
			new length = strlen(text);
			while ((idx < length) && (text[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[MAX_PLAYER_NAME];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = text[idx];
				idx++;
			}
			result[idx - offset] = EOS;

			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] == 0)
			{
				Msg(playerid,"Haszn�lat: �lnev [�jn�v]");
				return 0;
			}
			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] != 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "�jra a r�gi neved van!");
				PlayerInfo[playerid][pHamisNev] = 0;
				return 0;
			}

			if(strlen(result) > MAX_PLAYER_NAME)
			{
				SendFormatMessage(playerid, COLOR_GRAD1, "Maximum %d karakter!", MAX_PLAYER_NAME);
				return 0;
			}
			PlayerInfo[playerid][pHamisNev] = result;
			format(string, sizeof(string), "Az �j �lneved mostant�l %s!", result);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 0;
		}
		else if(egyezik(tmp, "banksz�mla") || egyezik(tmp, "bankszamla"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "banksz�mla [sz�mlasz�m/n�v]");
			//new uzenet[100];
			new bsz = strval(tmp);
			new player;
			if(BankSzamla(bsz) != NINCS) 
				player = BankSzamla(bsz);
			else
				player=ReturnUser(tmp);
			
			if(player == INVALID_PLAYER_ID)
				return Msg(playerid, "Nincs ilyen banksz�mlasz�m/n�v");
			
			if(PlayerInfo[player][pZarolva] == 1)
			{
				Msg(playerid, "Feloldottad a z�rol�st a sz�ml�r�l.");
				//ormat(uzenet, "PDA �zenet: %s feloldotta a z�rol�st egy banksz�ml�r�l(Sz�mlasz�m: %d)", PlayerName(playerid), bsz);
				SendRadioMessageFormat(FRAKCIO_FBI, Pink, "PDA �zenet: %s feloldotta a z�rol�st egy banksz�ml�r�l(Sz�mlasz�m: %d)", ICPlayerName(playerid), bsz);
				PlayerInfo[player][pZarolva] = 0;
				Msg(player, "Az FBI feloldotta a z�rol�st a sz�ml�dr�l.");
				return 0;
			}
			if(PlayerInfo[player][pZarolva] == 0)
			{
				Msg(playerid, "Lez�roltad a sz�ml�t.");
				//Format(uzenet, "PDA �zenet: %s lez�rt egy sz�ml�t(Sz�mlasz�m: %d)", PlayerName(playerid), bsz);
				SendRadioMessageFormat(FRAKCIO_FBI, Pink, "PDA �zenet: %s lez�rt egy sz�ml�t(Sz�mlasz�m: %d)", ICPlayerName(playerid), bsz);
				PlayerInfo[player][pZarolva] = 1;
				Msg(player, "Az FBI lez�rolta a sz�ml�d.");
				return 0;
			}
		}
		else if(egyezik(tmp, "be�p�l�s") || egyezik(tmp, "beepules"))
		{
			tmp = strtok(text, idx);
			if(!Munkarang(playerid, 3) && !FBIBeepules) return !Msg(playerid, "Access Denied. 3as rang sz�ks�ges.");
			if(!strlen(tmp)) return !Msg(playerid, "be�p�l�s [ruha]");
			new ruha = strval(tmp);
			new kocsi = GetClosestVehicle(playerid);
			if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 3.0) return !Msg(playerid, "Csak Szolg�lati J�rm� mellet.");
			if(!IsValidSkin(ruha)) return !Msg(playerid, "Nincs ilyen ruha!");
			SetPlayerSkin(playerid, ruha);
			SendClientMessage(playerid, Pink, "Be�p�l�s Sikeres.");
			//new uzi[128];
			//Format(uzi, "PDA �zenet: %s felvett egy �lruh�t.", PlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_FBI, Pink, "PDA �zenet: %s felvett egy �lruh�t.", ICPlayerName(playerid));
			return 0;
		}
		else if(egyezik(tmp, "deaktiv�l�s") || egyezik(tmp, "deaktivalas"))
		{
			if(Fbibelepes != 1 && Fbibelepes != 3) return !Msg(playerid, "Nem volt Behatol�s/ A rendszer nincs Aktiv�lva.");
			Fbibelepes = 0;
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 9.00000, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 5.00000, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 5.33860, 4);
			if(Fbibelepes == 1)
			{
				//format(string, sizeof(string), "PDA �zenet: System Deactivated!");
				SendMessage(SEND_MESSAGE_RADIO, "PDA �zenet: System Deactivated!", Pink, FRAKCIO_FBI);
			}
			Msg(playerid, "System Deactivated.");
			return 0;
		}
		else if(egyezik(tmp, "aktiv�l�s") || egyezik(tmp, "aktivalas"))
		{
			if(Fbibelepes == 3) return !Msg(playerid, "A rendszer aktiv�lva van.");
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 12.78430, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 12.33860, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 12.33860, 4);
			Fbibelepes = 3;
			Msg(playerid, "System Activated");
			return 0;
		}
		else if(egyezik(tmp, "rend�rfelf�ggeszt�s") || egyezik(tmp, "rendorfelfuggesztes"))
		{
			tmp = strtok(text, idx);
			if(!Munkarang(playerid, 5)) return !Msg(playerid, "Access Denied. 6os rang sz�ks�ges.");
			if(!strlen(tmp)) return !Msg(playerid, "Rend�rfelf�ggeszt�s [N�v/ID]");
			new zseka = ReturnUser(tmp);
			if(zseka == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(!IsACop(zseka)) return !Msg(playerid, "A J�t�kos nem Rend�r!");
			SendClientMessage(zseka, COLOR_LIGHTBLUE, "Az FBI felf�ggesztett! Ism�t civil vagy.");
			PlayerInfo[zseka][pLeader] = 0;
			PlayerInfo[zseka][pMember] = 0;
			PlayerInfo[zseka][pRank] = 0;
			PlayerInfo[zseka][pChar] = 0;
			PlayerInfo[zseka][pSwattag] = 0;
			PlayerInfo[zseka][pSwatRang] = 0;

			strcpy(PlayerInfo[zseka][pFrakcioTiltOk], "Felf�ggeszt�s hat�s�g �ltal", 64);
         	PlayerInfo[zseka][pFrakcioTiltIdo]=25;

			new rand = random(sizeof(CIV));
			SetSpawnInfo(zseka, SPAWNID, PlayerInfo[zseka][pModel],0.0,0.0,0.0,0,0,0,0,0,0,0);
			PlayerInfo[zseka][pModel] = CIV[rand];
			
			SpawnPlayer(zseka);
			SendFormatMessage(playerid, Pink, "%s felf�ggesztve!", ICPlayerName(zseka));
			//new uzi[128];
			//Format(uzi, "PDA �zenet: %s felf�ggesztette %s.", PlayerName(playerid), PlayerName(zseka));
			SendRadioMessageFormat(FRAKCIO_FBI, Pink, "PDA �zenet: %s felf�ggesztette %s.", ICPlayerName(playerid), ICPlayerName(zseka));
			return 0;
		}
		else if(egyezik(tmp, "jelsz�") || egyezik(tmp, "jelszo"))
		{
			SendFormatMessage(playerid, Pink, "A jelsz� most %s.", FrakcioInfo[FRAKCIO_FBI][fJelszo]);
			return 0;
		}
		else if(egyezik(tmp, "logout"))
		{
			SendFormatMessage(playerid, Pink, "Server Disconnected. J� munk�t %s �gyn�k.", ICPlayerName(playerid));
			Belepve[playerid] = 0;
			return 0;
		}
		else if(egyezik(tmp, "lenyomoz�s") || egyezik(tmp, "lenyomozas"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Lenyomoz�s [N�v/ID/Kikapcsol]");
			if(egyezik(tmp, "kikapcsol"))
			{
				SendClientMessage(playerid, Pink, "Lenyomoz Kikapcsolva!");
				foreach(Jatekosok, x)
				{
					SetPlayerMarkerForPlayer(playerid, x, COLOR_INVISIBLE);
					Fbicelpont[playerid] = NINCS;
					Fbios[x] = NINCS;
					return 0;
				}
			}
			new player = ReturnUser(tmp);
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(PlayerInfo[player][pPnumber] == 0 && !PlayerInfo[player][pLaptopBe] || !PlayerInfo[player][pLaptop]) return !Msg(playerid, "Nincs telefonja vagy laptopja!");
			new vw = GetPlayerVirtualWorld(player);
			new inti = GetPlayerInterior(player);
			if(vw != 0 || inti != 0)
			{
				if(Hazbanvan[player] == 0)
				{
					if(vw == 104 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly a K�rh�zban van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 1555 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly valamelyik Bankban van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 1555 && inti == 1)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly a San Fierroi Bank h�ts� r�szleg�n van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 143 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly a Katona B�zison van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 108 && inti == 1)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az Olasz Boroz�ban van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 111 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az Oktat�kn�l van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 112 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az Aztecas baseball csapat telephely�n van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 0 && inti == 4)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az �szaki Benzink�ti 24/7-ben van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 18)
					{
						if(vw == 150)
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly a D�li Benzink�ti 24/7-ben van!");
							Fbios[player] = playerid;
							return 0;
						}
						if(vw == 270)
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az LS-SF k�z�tti Benzink�t 24/7-ben van!");
							Fbios[player] = playerid;
							return 0;
						}
						else
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly egy 24/7-ben van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 3)
					{
						if(PlayerToPoint(30, player, 296.919982,-108.071998,1001.515625))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LS GS be van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 384.808624,173.804992,1008.382812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 369.8337,162.5357,1014.1893))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 368.2852,162.4965,1019.9844))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 370.1142,163.1876,1025.7891))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 833.269775,10.588416,1004.179687))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly a Lottoz�ban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 207.054992,-138.804992,1003.507812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly a Bincoban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 288.745971,169.350997,1007.171875))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az FBI HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 1494.325195,1304.942871,1093.289062))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az Oktat� HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 942.171997,-16.542755,1000.929687))
						{
							Msg(playerid, "Adminjail.");
							Fbios[player] = playerid;
							return 0;
						}
						else if(vw == 144)
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az LSPD HQ-n van!");
							Fbios[player] = playerid;
							return 0;	
						}
					}
					else if(inti == 4)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly SF GS be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 5)
					{
						if(PlayerToPoint(50, player, 72.111999,-3.898649,1000.728820))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LS Edz�terembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 373.825653,-117.270904,1001.499511))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az egyik pizz�z�ban van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 6)
					{
						if(PlayerToPoint(50, player, 774.213989,-48.924297,1000.585937))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly Cobra Edz�terembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 246.783996,63.900199,1003.640625))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LSPD-n van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 9)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az egyik csirk�sbe van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 10)
					{
						if(PlayerToPoint(50, player, 375.962463,-65.816848,1001.507812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az egyik Burger Shotba van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, -975.975708,1060.983032,1345.671875))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az RC Gyakorlop�ly�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, 246.375991,109.245994,1003.218750))
						{
							if(vw == 20)
							{
								SendClientMessage(playerid, Pink, "C�lszem�ly VPOP HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
							else
							{
								SendClientMessage(playerid, Pink, "C�lszem�ly SFPD HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
						}
					}
					else if(inti == 1)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly a H�sfeldolgoz�ban van!((Valameik Maffia Inti))");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 17)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly Alhambr�ba van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 2)
					{
						Msg(playerid, "Gy�rban van, de csak OOC tudod!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 11)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly Groove Kocsm�ban van!");
						Fbios[player] = playerid;
						return 0;
					}
				}
				else
				{
					SendFormatMessage(playerid, Pink, "C�lszem�ly Class utca %d sz�m alatt tartozkodik!", vw);
					Fbios[player] = playerid;
					return 0;
				}
			}
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(player, X,Y,Z);
			SetPlayerMarkerForPlayer(playerid, player, Pink);
			SendClientMessage(playerid, Pink, "C�lszem�ly Lenyomozva!");
			SendClientMessage(playerid, Pink, "* Kikapcsol�shoz: lenyomoz�s kikapcsol");
			Fbicelpont[playerid] = player;
			Fbios[player] = playerid;
			return 0;
		}
		else if(egyezik(tmp, "lehallgat�s"))
		{
			tmp = strtok(text, idx);
			new Allomas = strval(tmp);
			if(!strlen(tmp)) return !Msg(playerid, "lehallgat�s [r�di��llom�s]");
			if(egyezik(tmp, "kikapcsol") || egyezik(tmp, "off"))
			{
				Msg(playerid, "Kikapcsolva");
				RadioHallgatas[playerid] = NINCS;
				return 0;
			}
			if(Allomas < 1 || Allomas > MAX_FRAKCIO)
			{
				SendFormatMessage(playerid, Pink, "* R�di� �llom�sok: 1-%d", MAX_FRAKCIO);
				return 0;
			}
			RadioHallgatas[playerid] = Allomas;
			SendFormatMessage(playerid, Pink, "* Csatlakoz�s sikeres. �llom�s: %d", Allomas);
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "=============[R�di� Adatok]=============");
			new szneve[32];
			new szam = RadioHallgatas[playerid] - 1;
			szneve = Szervezetneve[szam][0];
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Szervezet Neve: %s", szneve);
			new menyien = 0;
			for(new oj = 0; oj < MAX_PLAYERS; oj++)
			{
				if(PlayerInfo[oj][pMember] == RadioHallgatas[playerid] || PlayerInfo[oj][pLeader] == RadioHallgatas[playerid]) menyien++;
			}
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* A r�di�t %d-an/en hallgatj�k.", menyien);
			SendClientMessage(playerid, Pink, "* Kikapcsol�shoz: lehallgat�s kikapcsol");
			return 0;
		}
		else if(egyezik(tmp, "adatn�z�s") || egyezik(tmp, "adatnezes"))
		{
			tmp = strtok(text, idx);
			new player = ReturnUser(tmp);
			if(!strlen(tmp)) return !Msg(playerid, "Adatn�z�s [N�v/ID]");
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(PlayerInfo[player][pArrested] < 1) return !Msg(playerid, "R�la nincs akta, mivel m�g nem volt lecsukva.");
			Akta(playerid, player);
			return 0;
		}
		else if(egyezik(tmp, "clearplayer"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Clearplayer [N�v/ID]");
			new player = ReturnUser(tmp);
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(player == playerid) return !Msg(playerid, "Magadr�l nem!");
			SendFormatMessage(playerid, Pink, "ClassRPG: Sikeresen t�r�lted %s k�r�z�s�t!", ICPlayerName(player));
			ClearPlayerCrime(player);
			Msg(player, "Az FBI t�r�lte r�lad a k�r�z�st.");
			return 0;
		}
		else if(egyezik(tmp, "clearvehicle"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Clearvehicle [N�v/ID]");
			new car = strval(tmp);
			if(car == INVALID_VEHICLE_ID) return !Msg(playerid, "Hib�s n�v!");
			SendFormatMessage(playerid, Pink, "ClassRPG: Sikeresen t�r�lted a CLS-%d rendsz�m� j�rm� k�r�z�s�t!", car);
			ClearVehicleCrime(car);
			return 0;
		}
		else if(egyezik(tmp, "telefonlehallgat�s"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Telefonlehallgat�s [N�v/ID]");
			new player = ReturnUser(tmp);
			if(egyezik(tmp, "kikapcsol") || egyezik(tmp, "off"))
			{
				Msg(playerid, "Kikapcsolva");
				Lehallgat[playerid] = NINCS;
				return 0;
			}
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(player == playerid) return !Msg(playerid, "-.-'");
			Lehallgat[playerid] = player;
			SendClientMessage(playerid, Pink, "Mostant�l ha telefon�l, hallani fogod!");
			return 0;
		}
		else if(egyezik(tmp, "bezaras") || egyezik(tmp, "bez�r�s"))
		{
			if(!Munkarang(playerid, 10)) return !Msg(playerid, "Access Denied. 10es rang sz�ks�ges.");
			if(Fbibelepes != 0) return !Msg(playerid, "Z�rva van vagy behatol�s t�rt�nt(haszn�ld a deaktiv�l�st).");
			Fbibelepes = 2;
			Msg(playerid, "Bez�rva.");
			return 0;
		}
		else if(egyezik(tmp, "nyitas") || egyezik(tmp, "nyit�s"))
		{
			if(!Munkarang(playerid, 10)) return !Msg(playerid, "Access Denied. 10es rang sz�ks�ges.");
			if(Fbibelepes != 2) return !Msg(playerid, "Nyitva van vagy Behatol�s t�rt�nt(haszn�ld a deaktiv�l�st).");
			Fbibelepes = 0;
			Msg(playerid, "Nyitva.");
			return 0;
		}
		else if(egyezik(tmp, "poloska"))
		{
			tmp = strtok(text, idx);
			new player = ReturnUser(tmp);
			if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang sz�ks�ges.");
			if(player == INVALID_PLAYER_ID || player == playerid) return !Msg(playerid, "Hib�s n�v!");
			if(GetDistanceBetweenPlayers(playerid, player) > 2) return !Msg(playerid, "Nagyon k�zelnek kell lenned a c�lponthoz!");
			if(!strlen(tmp)) return !Msg(playerid, "Poloska [N�v/ID]");
			if(!Poloskazott[player])
			{
				Poloskazott[player] = true;
				Poloskazta[playerid] = player;
				Msg(playerid, "Sikeresen r�raktad a polosk�t a c�lpontra!");
				Cselekves(playerid, "csin�lt valamit...", 1);
			}
			else
			{
				Poloskazott[player] = false;
				Poloskazta[playerid] = NINCS;
				Msg(playerid, "Sikeresen levetted a polosk�t a c�lpontr�l!");
				Cselekves(playerid, "csin�lt valamit...", 1);
			}
			return 0;
		}
		else if(egyezik(tmp, "poloskabe"))
		{
			if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang sz�ks�ges.");
			if(Poloskazta[playerid] == NINCS) return !Msg(playerid, "Senkire sem rakt�l polosk�t!");
			Msg(playerid, "Poloska bekapcsolva!");
			Poloska[playerid] = true;
			return 0;
		}
		else if(egyezik(tmp, "poloskaki"))
		{
			if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang sz�ks�ges.");
			if(Poloskazta[playerid] == NINCS) return !Msg(playerid, "Senkire sem rakt�l polosk�t!");
			Msg(playerid, "Poloska kikapcsolva!");
			Poloska[playerid] = false;
			return 0;
		}
		else
		{
			SendClientMessage(playerid, Pink, "Lehet�s�gek:");
			SendClientMessage(playerid, Pink, "| Clearplayer - Clearvehicle");
			SendClientMessage(playerid, Pink2, "| Aktiv�l�s - Deaktiv�l�s");
			SendClientMessage(playerid, Pink, "| Banksz�mla - Adatn�z�s");
			SendClientMessage(playerid, Pink2, "| Lehallgat�s - Jelsz�");
			SendClientMessage(playerid, Pink, "| Lenyomoz�s - Telefonlehallgat�s");
			if(Munkarang(playerid, 2)) SendClientMessage(playerid, Pink2, "| �ln�v");
			if(Munkarang(playerid, 3))
			{
				SendClientMessage(playerid, Pink, "| Be�p�l�s");
				SendClientMessage(playerid, Pink2, "| Poloska - [be/ki]");
			}
			if(Munkarang(playerid, 6)) SendClientMessage(playerid, Pink, "| Rend�rfelf�ggeszt�s");
			if(Munkarang(playerid, 10)) SendClientMessage(playerid, Pink2, "| Bez�r�s - Nyit�s");
			SendClientMessage(playerid, Pink, "							                Logout					");
			return 0;
		}
	}
	if(CIABelepve[playerid] == 1)
	{
		new idx;
	    tmp = strtok(text, idx);
		if(egyezik(tmp, "�ln�v") || egyezik(tmp, "alnev"))
		{
			//if(!Munkarang(playerid, 2) && !FBIAlnev) return !Msg(playerid, "Access Denied. 2-es rang sz�ks�ges.");
			
			new length = strlen(text);
			while ((idx < length) && (text[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[MAX_PLAYER_NAME];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = text[idx];
				idx++;
			}
			result[idx - offset] = EOS;

			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] == 0)
			{
				Msg(playerid,"Haszn�lat: �lnev [�jn�v]");
				return 0;
			}
			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] != 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "�jra a r�gi neved van!");
				PlayerInfo[playerid][pHamisNev] = 0;
				return 0;
			}

			if(strlen(result) > MAX_PLAYER_NAME)
			{
				SendFormatMessage(playerid, COLOR_GRAD1, "Maximum %d karakter!", MAX_PLAYER_NAME);
				return 0;
			}
			PlayerInfo[playerid][pHamisNev] = result;
			format(string, sizeof(string), "Az �j �lneved mostant�l %s!", result);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 0;
		}
		else if(egyezik(tmp, "banksz�mla") || egyezik(tmp, "bankszamla"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "banksz�mla [sz�mlasz�m/n�v]");
			//new uzenet[100];
			new bsz = strval(tmp);
			new player;
			if(BankSzamla(bsz) != NINCS) 
				player = BankSzamla(bsz);
			else
				player=ReturnUser(tmp);
			
			if(player == INVALID_PLAYER_ID)
				return Msg(playerid, "Nincs ilyen banksz�mlasz�m/n�v");
			
			if(PlayerInfo[player][pZarolva] == 1)
			{
				Msg(playerid, "Feloldottad a z�rol�st a sz�ml�r�l.");
				//ormat(uzenet, "PDA �zenet: %s feloldotta a z�rol�st egy banksz�ml�r�l(Sz�mlasz�m: %d)", PlayerName(playerid), bsz);
				SendRadioMessageFormat(FRAKCIO_CIA, Pink, "PDA �zenet: %s feloldotta a z�rol�st egy banksz�ml�r�l(Sz�mlasz�m: %d)", ICPlayerName(playerid), bsz);
				PlayerInfo[player][pZarolva] = 0;
				Msg(player, "A CIA feloldotta a z�rol�st a sz�ml�dr�l.");
				return 0;
			}
			if(PlayerInfo[player][pZarolva] == 0)
			{
				Msg(playerid, "Lez�roltad a sz�ml�t.");
				//Format(uzenet, "PDA �zenet: %s lez�rt egy sz�ml�t(Sz�mlasz�m: %d)", PlayerName(playerid), bsz);
				SendRadioMessageFormat(FRAKCIO_CIA, Pink, "PDA �zenet: %s lez�rt egy sz�ml�t(Sz�mlasz�m: %d)", ICPlayerName(playerid), bsz);
				PlayerInfo[player][pZarolva] = 1;
				Msg(player, "A CIA lez�rolta a sz�ml�d.");
				return 0;
			}
		}
		else if(egyezik(tmp, "be�p�l�s") || egyezik(tmp, "beepules"))
		{
			tmp = strtok(text, idx);
			//if(!Munkarang(playerid, 3) && !FBIBeepules) return !Msg(playerid, "Access Denied. 3as rang sz�ks�ges.");
			if(!strlen(tmp)) return !Msg(playerid, "be�p�l�s [ruha]");
			new ruha = strval(tmp);
			new kocsi = GetClosestVehicle(playerid);
			if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 3.0) return !Msg(playerid, "Csak Szolg�lati J�rm� mellet.");
			if(!IsValidSkin(ruha)) return !Msg(playerid, "Nincs ilyen ruha!");
			SetPlayerSkin(playerid, ruha);
			SendClientMessage(playerid, Pink, "Be�p�l�s Sikeres.");
			//new uzi[128];
			//Format(uzi, "PDA �zenet: %s felvett egy �lruh�t.", PlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_CIA, Pink, "Laptop �zenet: %s felvett egy �lruh�t.", ICPlayerName(playerid));
			return 0;
		}
		/*else if(egyezik(tmp, "deaktiv�l�s") || egyezik(tmp, "deaktivalas"))
		{
			if(Fbibelepes != 1 && Fbibelepes != 3) return !Msg(playerid, "Nem volt Behatol�s/ A rendszer nincs Aktiv�lva.");
			Fbibelepes = 0;
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 9.00000, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 5.00000, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 5.33860, 4);
			if(Fbibelepes == 1)
			{
				//format(string, sizeof(string), "PDA �zenet: System Deactivated!");
				SendMessage(SEND_MESSAGE_RADIO, "PDA �zenet: System Deactivated!", Pink, FRAKCIO_FBI);
			}
			Msg(playerid, "System Deactivated.");
			return 0;
		}
		else if(egyezik(tmp, "aktiv�l�s") || egyezik(tmp, "aktivalas"))
		{
			if(Fbibelepes == 3) return !Msg(playerid, "A rendszer aktiv�lva van.");
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 12.78430, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 12.33860, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 12.33860, 4);
			Fbibelepes = 3;
			Msg(playerid, "System Activated");
			return 0;
		}*/
		else if(egyezik(tmp, "rend�rfelf�ggeszt�s") || egyezik(tmp, "rendorfelfuggesztes"))
		{
			tmp = strtok(text, idx);
			//if(!Munkarang(playerid, 5)) return !Msg(playerid, "Access Denied. 6os rang sz�ks�ges.");
			if(!strlen(tmp)) return !Msg(playerid, "Rend�rfelf�ggeszt�s [N�v/ID]");
			new zseka = ReturnUser(tmp);
			if(zseka == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(!IsACop(zseka)) return !Msg(playerid, "A J�t�kos nem Rend�r!");
			SendClientMessage(zseka, COLOR_LIGHTBLUE, "A CIA felf�ggesztett! Ism�t civil vagy.");
			PlayerInfo[zseka][pLeader] = 0;
			PlayerInfo[zseka][pMember] = 0;
			PlayerInfo[zseka][pRank] = 0;
			PlayerInfo[zseka][pChar] = 0;
			PlayerInfo[zseka][pSwattag] = 0;
			PlayerInfo[zseka][pSwatRang] = 0;

			strcpy(PlayerInfo[zseka][pFrakcioTiltOk], "Felf�ggeszt�s hat�s�g �ltal", 64);
         	PlayerInfo[zseka][pFrakcioTiltIdo]=25;

			new rand = random(sizeof(CIV));
			SetSpawnInfo(zseka, SPAWNID, PlayerInfo[zseka][pModel],0.0,0.0,0.0,0,0,0,0,0,0,0);
			PlayerInfo[zseka][pModel] = CIV[rand];
			
			SpawnPlayer(zseka);
			SendFormatMessage(playerid, Pink, "%s felf�ggesztve!", ICPlayerName(zseka));
			//new uzi[128];
			//Format(uzi, "PDA �zenet: %s felf�ggesztette %s.", PlayerName(playerid), PlayerName(zseka));
			SendRadioMessageFormat(FRAKCIO_CIA, Pink, "Laptop �zenet: %s felf�ggesztette %s.", ICPlayerName(playerid), ICPlayerName(zseka));
			return 0;
		}
		else if(egyezik(tmp, "jelsz�") || egyezik(tmp, "jelszo"))
		{
			SendFormatMessage(playerid, Pink, "A jelsz� most %s.", FrakcioInfo[FRAKCIO_CIA][fJelszo]);
			return 0;
		}
		else if(egyezik(tmp, "logout"))
		{
			SendFormatMessage(playerid, Pink, "Server Disconnected. J� munk�t %s �gyn�k.", ICPlayerName(playerid));
			CIABelepve[playerid] = 0;
			return 0;
		}
		else if(egyezik(tmp, "lenyomoz�s") || egyezik(tmp, "lenyomozas"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Lenyomoz�s [N�v/ID/Kikapcsol]");
			if(egyezik(tmp, "kikapcsol"))
			{
				SendClientMessage(playerid, Pink, "Lenyomoz Kikapcsolva!");
				foreach(Jatekosok, x)
				{
					SetPlayerMarkerForPlayer(playerid, x, COLOR_INVISIBLE);
					Fbicelpont[playerid] = NINCS;
					Fbios[x] = NINCS;
					return 0;
				}
			}
			new player = ReturnUser(tmp);
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(PlayerInfo[player][pPnumber] == 0 && !PlayerInfo[player][pLaptopBe] || !PlayerInfo[player][pLaptop]) return !Msg(playerid, "Nincs telefonja vagy laptopja!");
			new vw = GetPlayerVirtualWorld(player);
			new inti = GetPlayerInterior(player);
			if(vw != 0 || inti != 0)
			{
				if(Hazbanvan[player] == 0)
				{
					if(inti == 18)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az egyik 24/7 be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 3)
					{
						if(PlayerToPoint(30, player, 296.919982,-108.071998,1001.515625))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LS GS be van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 384.808624,173.804992,1008.382812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 369.8337,162.5357,1014.1893))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 368.2852,162.4965,1019.9844))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 370.1142,163.1876,1025.7891))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 833.269775,10.588416,1004.179687))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly a Lottoz�ban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 207.054992,-138.804992,1003.507812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly a Bincoban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 288.745971,169.350997,1007.171875))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az FBI HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 1494.325195,1304.942871,1093.289062))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az Oktat� HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 942.171997,-16.542755,1000.929687))
						{
							Msg(playerid, "Adminjail.");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 4)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly SF GS be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 5)
					{
						if(PlayerToPoint(50, player, 72.111999,-3.898649,1000.728820))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LS Edz�terembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 373.825653,-117.270904,1001.499511))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az egyik pizz�z�ban van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 6)
					{
						if(PlayerToPoint(50, player, 774.213989,-48.924297,1000.585937))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly Cobra Edz�terembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 246.783996,63.900199,1003.640625))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LSPD-n van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 9)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az egyik csirk�sbe van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 10)
					{
						if(PlayerToPoint(50, player, 375.962463,-65.816848,1001.507812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az egyik Burger Shotba van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, -975.975708,1060.983032,1345.671875))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az RC Gyakorlop�ly�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, 246.375991,109.245994,1003.218750))
						{
							if(vw == 20)
							{
								SendClientMessage(playerid, Pink, "C�lszem�ly VPOP HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
							else
							{
								SendClientMessage(playerid, Pink, "C�lszem�ly SFPD HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
						}
					}
					else if(inti == 1)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly a H�sfeldolgoz�ban van!((Valameik Maffia Inti))");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 17)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly Alhambr�ba van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 2)
					{
						Msg(playerid, "Gy�rban van, de csak OOC tudod!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 11)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly Groove Kocsm�ban van!");
						Fbios[player] = playerid;
						return 0;
					}
				}
				else
				{
					SendFormatMessage(playerid, Pink, "C�lszem�ly Class utca %d sz�m alatt tartozkodik!", vw);
					Fbios[player] = playerid;
					return 0;
				}
			}
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(player, X,Y,Z);
			SetPlayerMarkerForPlayer(playerid, player, Pink);
			SendClientMessage(playerid, Pink, "C�lszem�ly Lenyomozva!");
			SendClientMessage(playerid, Pink, "* Kikapcsol�shoz: lenyomoz�s kikapcsol");
			Fbicelpont[playerid] = player;
			Fbios[player] = playerid;
			return 0;
		}
		else if(egyezik(tmp, "lehallgat�s"))
		{
			tmp = strtok(text, idx);
			new Allomas = strval(tmp);
			if(!strlen(tmp)) return !Msg(playerid, "lehallgat�s [r�di��llom�s]");
			if(egyezik(tmp, "kikapcsol") || egyezik(tmp, "off"))
			{
				Msg(playerid, "Kikapcsolva");
				RadioHallgatas[playerid] = NINCS;
				return 0;
			}
			if(Allomas < 1 || Allomas > MAX_FRAKCIO)
			{
				SendFormatMessage(playerid, Pink, "* R�di� �llom�sok: 1-%d", MAX_FRAKCIO);
				return 0;
			}
			RadioHallgatas[playerid] = Allomas;
			SendFormatMessage(playerid, Pink, "* Csatlakoz�s sikeres. �llom�s: %d", Allomas);
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "=============[R�di� Adatok]=============");
			new szneve[32];
			new szam = RadioHallgatas[playerid] - 1;
			szneve = Szervezetneve[szam][0];
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Szervezet Neve: %s", szneve);
			new menyien = 0;
			for(new oj = 0; oj < MAX_PLAYERS; oj++)
			{
				if(PlayerInfo[oj][pMember] == RadioHallgatas[playerid] || PlayerInfo[oj][pLeader] == RadioHallgatas[playerid]) menyien++;
			}
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* A r�di�t %d-an/en hallgatj�k.", menyien);
			SendClientMessage(playerid, Pink, "* Kikapcsol�shoz: lehallgat�s kikapcsol");
			return 0;
		}
		else if(egyezik(tmp, "adatn�z�s") || egyezik(tmp, "adatnezes"))
		{
			tmp = strtok(text, idx);
			new player = ReturnUser(tmp);
			if(!strlen(tmp)) return !Msg(playerid, "Adatn�z�s [N�v/ID]");
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(PlayerInfo[player][pArrested] < 1) return !Msg(playerid, "R�la nincs akta, mivel m�g nem volt lecsukva.");
			Akta(playerid, player);
			return 0;
		}
		else if(egyezik(tmp, "clearplayer"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Clearplayer [N�v/ID]");
			new player = ReturnUser(tmp);
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(player == playerid) return !Msg(playerid, "Magadr�l nem!");
			SendFormatMessage(playerid, Pink, "ClassRPG: Sikeresen t�r�lted %s k�r�z�s�t!", ICPlayerName(player));
			ClearPlayerCrime(player);
			Msg(player, "A CIA t�r�lte r�lad a k�r�z�st.");
			return 0;
		}
		else if(egyezik(tmp, "clearcar"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Clearcar [N�v/ID]");
			new car = strval(tmp);
			if(car == INVALID_VEHICLE_ID) return !Msg(playerid, "Hib�s n�v!");
			SendFormatMessage(playerid, Pink, "ClassRPG: Sikeresen t�r�lted a CLS-%d rendsz�m� j�rm� k�r�z�s�t!", car);
			ClearVehicleCrime(car);
			return 0;
		}
		else if(egyezik(tmp, "telefonlehallgat�s"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Telefonlehallgat�s [N�v/ID]");
			new player = ReturnUser(tmp);
			if(egyezik(tmp, "kikapcsol") || egyezik(tmp, "off"))
			{
				Msg(playerid, "Kikapcsolva");
				Lehallgat[playerid] = NINCS;
				return 0;
			}
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(player == playerid) return !Msg(playerid, "-.-'");
			Lehallgat[playerid] = player;
			SendClientMessage(playerid, Pink, "Mostant�l ha telefon�l, hallani fogod!");
			return 0;
		}
		/*else if(egyezik(tmp, "bezaras") || egyezik(tmp, "bez�r�s"))
		{
			if(!Munkarang(playerid, 10)) return !Msg(playerid, "Access Denied. 10es rang sz�ks�ges.");
			if(Fbibelepes != 0) return !Msg(playerid, "Z�rva van vagy behatol�s t�rt�nt(haszn�ld a deaktiv�l�st).");
			Fbibelepes = 2;
			Msg(playerid, "Bez�rva.");
			return 0;
		}
		else if(egyezik(tmp, "nyitas") || egyezik(tmp, "nyit�s"))
		{
			if(!Munkarang(playerid, 10)) return !Msg(playerid, "Access Denied. 10es rang sz�ks�ges.");
			if(Fbibelepes != 2) return !Msg(playerid, "Nyitva van vagy Behatol�s t�rt�nt(haszn�ld a deaktiv�l�st).");
			Fbibelepes = 0;
			Msg(playerid, "Nyitva.");
			return 0;
		}*/
		else if(egyezik(tmp, "poloska"))
		{
			tmp = strtok(text, idx);
			new player = ReturnUser(tmp);
			//if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang sz�ks�ges.");
			if(player == INVALID_PLAYER_ID || player == playerid) return !Msg(playerid, "Hib�s n�v!");
			if(GetDistanceBetweenPlayers(playerid, player) > 2) return !Msg(playerid, "Nagyon k�zelnek kell lenned a c�lponthoz!");
			if(!strlen(tmp)) return !Msg(playerid, "Poloska [N�v/ID]");
			if(!Poloskazott[player])
			{
				Poloskazott[player] = true;
				Poloskazta[playerid] = player;
				Msg(playerid, "Sikeresen r�raktad a polosk�t a c�lpontra!");
				Cselekves(playerid, "csin�lt valamit...", 1);
			}
			else
			{
				Poloskazott[player] = false;
				Poloskazta[playerid] = NINCS;
				Msg(playerid, "Sikeresen levetted a polosk�t a c�lpontr�l!");
				Cselekves(playerid, "csin�lt valamit...", 1);
			}
			return 0;
		}
		else if(egyezik(tmp, "poloskabe"))
		{
			//if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang sz�ks�ges.");
			if(Poloskazta[playerid] == NINCS) return !Msg(playerid, "Senkire sem rakt�l polosk�t!");
			Msg(playerid, "Poloska bekapcsolva!");
			Poloska[playerid] = true;
			return 0;
		}
		else if(egyezik(tmp, "poloskaki"))
		{
			//if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang sz�ks�ges.");
			if(Poloskazta[playerid] == NINCS) return !Msg(playerid, "Senkire sem rakt�l polosk�t!");
			Msg(playerid, "Poloska kikapcsolva!");
			Poloska[playerid] = false;
			return 0;
		}
		else
		{
			SendClientMessage(playerid, Pink, "Lehet�s�gek:");
			SendClientMessage(playerid, Pink, "| Clearplayer - Clearcar");
			SendClientMessage(playerid, Pink2, "| Aktiv�l�s - Deaktiv�l�s");
			SendClientMessage(playerid, Pink, "| Banksz�mla - Adatn�z�s");
			SendClientMessage(playerid, Pink2, "| Lehallgat�s - Jelsz�");
			SendClientMessage(playerid, Pink, "| Lenyomoz�s - Telefonlehallgat�s");
			SendClientMessage(playerid, Pink2, "| �ln�v");
			SendClientMessage(playerid, Pink, "| Be�p�l�s");
			SendClientMessage(playerid, Pink2, "| Poloska - [be/ki]");
			SendClientMessage(playerid, Pink, "| Rend�rfelf�ggeszt�s");
			if(Munkarang(playerid, 10)) SendClientMessage(playerid, Pink2, "| Bez�r�s - Nyit�s");
			SendClientMessage(playerid, Pink, "							                Logout					");
			return 0;
		}
	}
	if(Autocp[playerid] == 22)
	{
		if(egyezik(text, "igen"))
		{
			Msg(playerid, "Rendben v�geztetek az �r�val, a tan�tv�ny megkapja a jogos�tv�ny�t.");
			Autocp[playerid] = 0;

			new tanulo = OnlineUID(Jogsineki[playerid]);
			
			if(Vizsgafajta[tanulo] == 5)
			{
				Msg(tanulo, "Gratul�lunk! Megkaptad az Enged�lyed!");
			}
			else
			{
				Msg(tanulo, "Gratul�lunk! Megkaptad a Jogos�tv�nyodat!");
			}
			Autocp[tanulo] = 0;
			VizsgaAjanlat[tanulo] = NINCS;
			TakingLesson[tanulo] = 0;
			Oktat[playerid] = 0;
			if(Vizsgafajta[tanulo] == 1)
			{
				PlayerInfo[tanulo][pCarLic] = JOGSI_AUTO;
			}
			else if(Vizsgafajta[tanulo] == 2)
			{
				PlayerInfo[tanulo][pMotorJogsi] = JOGSI_MOTOR;
			}
			else if(Vizsgafajta[tanulo] == 3)
			{
				PlayerInfo[tanulo][pKamionJogsi] = JOGSI_KAMION;
			}
			else if(Vizsgafajta[tanulo] == 4)
			{
				PlayerInfo[tanulo][pBoatLic] = JOGSI_HAJO;
			}
			else if(Vizsgafajta[tanulo] == 5)
			{
				PlayerInfo[tanulo][pGunLic] = JOGSI_FEGYVER;
				PlayerInfo[playerid][pFegySkill] ++;
			}
			else if(Vizsgafajta[tanulo] == 9)
			{
				PlayerInfo[tanulo][pHeliLic] = JOGSI_REPULO;
			}
			else if(Vizsgafajta[tanulo] == 8)
			{
				PlayerInfo[tanulo][pAdrJogsi] = JOGSI_ADR;
			}
			else if(Vizsgafajta[tanulo] == 7)
			{
				PlayerInfo[tanulo][pFlyLic] = JOGSI_REPULO;
			}
			Vizsgafajta[tanulo] = 0;
			TakingLesson[playerid] = 0;
			return 0;
		}
		else if(egyezik(text, "nem"))
		{
			Msg(playerid, "Rendben v�geztetek az �r�val, a tan�tv�ny nem fog jogos�tv�nyt kapni.");
			Vizsgafajta[playerid] = 0;
			Autocp[playerid] = 0;
			new tanulo = OnlineUID(Jogsineki[playerid]);
			Msg(tanulo, "Sajnos nem ment�l �t a vizsg�n! Legk�zelebb 2 h�nap((�ra)) m�lva vizsg�zhatsz!!");
			strmid(PlayerInfo[tanulo][pJogsiTiltOk], "Oktat�s: vizsg�n val� buk�s", 0, strlen("Oktat�s: vizsg�n val� buk�s"), 128);
			PlayerInfo[tanulo][pJogsiTiltIdo]=2;
			Autocp[tanulo] = 0;
			Oktat[playerid] = 0;
			TakingLesson[tanulo] = 0;
			PlayerInfo[playerid][pAccount] -= Tanulofelpenz[tanulo];
			new uo = (Tanulofelpenz[tanulo] / 2);
			PlayerInfo[tanulo][pAccount] += uo;
			FrakcioInfo[FRAKCIO_OKTATO][fPenz] += uo;
			VizsgaAjanlat[tanulo] = NINCS;
			return 0;

		}
		else
		{
			Msg(playerid, "Mondom igen vagy nem!");
			return 0;
		}
	}
	if(MarriageCeremoney[playerid] > 0)
	{
	    new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("igen", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("igen")))
		{
		    if(GotProposedBy[playerid] < 999)
		    {
			    if(IsPlayerConnected(GotProposedBy[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(GotProposedBy[playerid], giveplayer, sizeof(giveplayer));
				    format(string, sizeof(string), "Pap: %s elfogadod %s-t feles�ged�rt? (�rd 'igen'.", giveplayer,sendername);
					SendClientMessage(GotProposedBy[playerid], COLOR_WHITE, string);
					MarriageCeremoney[GotProposedBy[playerid]] = 1;
					MarriageCeremoney[playerid] = 0;
					GotProposedBy[playerid] = 999;
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        GotProposedBy[playerid] = 999;
			        return 0;
			    }
			}
			else if(ProposedTo[playerid] < 999)
			{
			    if(IsPlayerConnected(ProposedTo[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(ProposedTo[playerid], giveplayer, sizeof(giveplayer));
					if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
						format(string, sizeof(string), "Pap: %s �s %s h�zast�rsaknak nyilv�ny�talak titeket...F�rj & Feles�g, megcs�kolhatod.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Pap: %s �s %s h�zast�rsaknak nyilv�ny�talak titeket...F�rj & Feles�g, megcs�kolhatod.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "H�zass�g: Van egy �j h�zasp�runk, %s & %s �sszeh�zasodott.", sendername, giveplayer);
						SendClientMessageToAll(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 1)
					{
					    format(string, sizeof(string), "Pap: %s �s %s meleg t�rsaknak nyilv�ny�talak titeket...F�rj & F�rj, megcs�kolhatod.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Pap: %s �s %s meleg t�rsaknak nyilv�ny�talak titeket...F�rj & F�rj, megcs�kolhatod.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "H�zass�g: Van egy �j meleg p�runk, %s & %s �sszeh�zasodott.", sendername, giveplayer);
						SendClientMessageToAll(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 2 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
					    format(string, sizeof(string), "Pap: %s �s %s meleg t�rsaknak nyilv�ny�talak titeket...Feles�g & Feles�g, megcs�kolhatod.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Pap: %s �s %s meleg t�rsaknak nyilv�ny�talak titeket...Feles�g & Feles�g, megcs�kolhatod.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "H�zass�g: Van egy �j leszbikus p�rsunk, %s & %s �sszeh�zasodott.", sendername, giveplayer);
						SendClientMessageToAll(COLOR_WHITE, string);
					}
					//MarriageCeremoney[ProposedTo[playerid]] = 1;
					MarriageCeremoney[ProposedTo[playerid]] = 0;
					MarriageCeremoney[playerid] = 0;
					format(string, sizeof(string), "%s", sendername);
					strmid(PlayerInfo[ProposedTo[playerid]][pMarriedTo], string, 0, strlen(string), 255);
					format(string, sizeof(string), "%s", giveplayer);
					strmid(PlayerInfo[playerid][pMarriedTo], string, 0, strlen(string), 255);
					GiveMoney(playerid, - 100000);
					PlayerInfo[playerid][pMarried] = 1;
					PlayerInfo[ProposedTo[playerid]][pMarried] = 1;
					PlayerInfo[ProposedTo[playerid]][pPhousekey] = PlayerInfo[playerid][pPhousekey];
					PlayerInfo[ProposedTo[playerid]][pPbiskey] = PlayerInfo[playerid][pPbiskey];
					ProposedTo[playerid] = 999;
					MarriageCeremoney[playerid] = 0;
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        ProposedTo[playerid] = 999;
			        return 0;
			    }
			}
		}
		else if ((strcmp("nem", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("nem")))
		{
		    if(GotProposedBy[playerid] < 999)
		    {
				if(IsPlayerConnected(GotProposedBy[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(GotProposedBy[playerid], giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "* Nem akarod h�zast�rsul %s, nem 'igen'-t irt�l.",giveplayer);
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    format(string, sizeof(string), "* %s nem akart elvenni, nem 'igen'-t �rt.",sendername);
				    SendClientMessage(GotProposedBy[playerid], COLOR_YELLOW, string);
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        GotProposedBy[playerid] = 999;
			        return 0;
			    }
		    }
		    else if(ProposedTo[playerid] < 999)
			{
			    if(IsPlayerConnected(ProposedTo[playerid]))
				{
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(ProposedTo[playerid], giveplayer, sizeof(giveplayer));
					format(string, sizeof(string), "* Nem akarod h�zast�rsul %s, nem 'igen'-t irt�l.",giveplayer);
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    format(string, sizeof(string), "* %s nem akart elvenni, nem 'igen'-t �rt.",sendername);
				    SendClientMessage(ProposedTo[playerid], COLOR_YELLOW, string);
				    return 1;
			    }
			    else
			    {
			        MarriageCeremoney[playerid] = 0;
			        ProposedTo[playerid] = 999;
			        return 0;
			    }
			}
		}
	    return 0;
	}
	if(ConnectedToPC[playerid] == 255)
	{
		new idx;
	    tmp = strtok(text, idx);
		if(egyezik(tmp, "versenyz�k") || egyezik(tmp, "versenyzok"))
		{
			if(!IsHitman(playerid)) return 1;

			SendFormatMessage(playerid, COLOR_WHITE, "Versenyz�k sz�ma: %d | H�tral�v� id�: %d m�sodperc(%d Perc)", BVJatekosok, BVIdo, BVIdo/60);

			new loszer, weapon[13], ammo[13], Float:elet, Float:pajzs;
			for(new x = 0; x < MAX_PLAYERS; x++)
			{
				if(!IsPlayerConnected(x) || !Logged(x) || IsPlayerNPC(x) || BViadal[x] != 1) continue;

				for(new y = 0; y < 13; y++)
				{
					GetPlayerWeaponData(x, y, weapon[y], ammo[y]);
					if(weapon[y] == GetPlayerWeapon(x))
					{
						loszer = ammo[y];
						break;
					}
				}

				GetPlayerHealth(x, elet);
				GetPlayerArmour(x, pajzs);

				SendFormatMessage(playerid, COLOR_WHITE, "N�v: %s | Fegyver: %s | L�szer: %d | �let: %.1f | Pajzs: %.1f", PlayerName(x), aWeaponNames[GetPlayerWeapon(x)], loszer, elet, pajzs);
			}

			return 0;
		}
	    if(egyezik(tmp, "v�rd�jak") || egyezik(tmp, "verdijak"))
		{
			new fejpenz, emberek, txt[128];
			for(new x = 0; x < MAX_PLAYERS; x++)
			{
				if(x != playerid && IsPlayerConnected(x) && Logged(x) && !IsHitman(x))
				{
					fejpenz = PlayerInfo[x][pHeadValue];
					if(fejpenz > 0)
					{
						emberek++;
						if(emberek % 4 != 0)
						{
							if(emberek % 4 == 1)
								format(txt, sizeof(txt), "%s [%d] OK: %s", PlayerName(x), fejpenz, PlayerInfo[x][pContractOka]);
							else
								format(txt, sizeof(txt), "%s, %s [%d] OK: %s", txt, PlayerName(x), fejpenz, PlayerInfo[x][pContractOka]);
						}
						else
						{
							format(txt, sizeof(txt), "%s, %s [%d] OK: %s", txt, PlayerName(x), fejpenz, PlayerInfo[x][pContractOka]);
							SendClientMessage(playerid, COLOR_GREY, txt);
						}
					}
				}
				if(x == (MAX_PLAYERS - 1) && emberek % 4 != 0)
					SendClientMessage(playerid, COLOR_GREY, txt);
			}
			if(emberek < 1)
				return !Msg(playerid, "Nincs v�rd�j senkin", false, COLOR_GREY);
			return 0;
		}

		if(egyezik(tmp, "cian"))
		{
			Msg(playerid, "Megm�rgezted magad");
			SetHealth(playerid, 0);
			return 0;
		}

		if(egyezik(tmp, "c�lpontok") || egyezik(tmp, "celpontok"))
		{
			new emberek;
			for(new x = 0; x < MAX_PLAYERS; x++)
			{
				if(!IsPlayerConnected(x) || !Logged(x) || IsPlayerNPC(x) || x == playerid) continue;
				if(PlayerInfo[x][pHeadValue] > 0)
				{
					emberek++;
					SetPlayerMarkerForPlayer(playerid, x, 0x00FF00AA);
				}
			}
			if(emberek < 1) SendClientMessage(playerid, COLOR_GREY,"Nincs v�rd�j senkin");
			return 0;
		}

		if(egyezik(tmp, "tagok"))
		{
		    SendClientMessage(playerid, COLOR_WHITE, "=============[Hitman Tagok]=============");
		    for(new x = 0; x < MAX_PLAYERS; x++)
			{
   				if(IsHitman(x))
		    	{
		    	    if(IsDirector(playerid))
			    	{
						new time = UnixTime;
						if(PlayerInfo[x][pHitmanIdo] != 0 && PlayerInfo[x][pHitmanIdo] > time)
							SendFormatMessage(playerid, COLOR_LIGHTRED, "- [%d]%s [%s] - m�g %d �r�ig",x, PlayerName(x), PlayerInfo[x][pHitmanNev], floatround( (PlayerInfo[x][pHitmanIdo] - time ) / 3600 , floatround_ceil));
						else
							SendFormatMessage(playerid, COLOR_LIGHTRED, "- [%d]%s [%s]",x, PlayerName(x), PlayerInfo[x][pHitmanNev]);
					}
					else
					{
					    SendFormatMessage(playerid, COLOR_LIGHTRED, "- %s", PlayerInfo[x][pHitmanNev]);
					}
				}
			}
			SendClientMessage(playerid, COLOR_WHITE, "=============[Hitman Tagok]=============");
			return 0;
		}
		if(egyezik(tmp, "bombatavol"))
		{
		    if(TavoliBomba[playerid]) {
				Msg(playerid, "A bomba hat�stalan�tva");
				TavoliBomba[playerid] = 0;
				return 0;
			}
			new kocsim = GetClosestVehicle(playerid);
			new Float:tav = GetPlayerDistanceFromVehicle(playerid, kocsim);
			if(tav >= 4)
			{
				SendClientMessage(playerid, COLOR_LIGHTRED, "A k�zeledben nincs j�rm�!");
				return 0;
			}
			if(TavoliBomba[playerid] != 0) return !Msg(playerid, "Ebb�l a bomb�b�l csak egyett haszn�lhatsz!");
			Msg(playerid, "Bomba telep�tve! Robbant�shoz /�les�t");
			TavoliBomba[playerid] = kocsim;
			return 0;
		}
		if(egyezik(tmp, "bomba"))
		{
			new kocsim = GetClosestVehicle(playerid);
			new Float:tav = GetPlayerDistanceFromVehicle(playerid, kocsim);
			if(tav >= 4)
			{
			SendClientMessage(playerid, COLOR_LIGHTRED, "A k�zeledben nincs j�rm�!");
			return 0;
			}
			if(VanBombaBenne[kocsim] != NINCS) 
			{
			VanBombaBenne[kocsim] = NINCS;
			return !Msg(playerid, "Bomba hat�stalan�tva!");
			}
			Msg(playerid, "Bomba telep�tve, ha beind�tj�k a motort robban!");
			VanBombaBenne[kocsim] = playerid;
			return 0;
		}

		if(egyezik(tmp, "munka"))
		{
			if(!PlayerToPoint(5.0, playerid, 2576.038, -1280.929, 1065.367))
			{
			SetPlayerCheckpoint(playerid, 2576.038, -1280.929, 1065.367, 5.0);
			Msg(playerid, "Nem vagy a hitman HQ-n.");
			return 0;
			}
			new uzi[128];
			if(HitmanDuty[playerid])
			{
				//hitide
				Format(uzi, "<< %s befejezte a mel�t >>", PlayerInfo[playerid][pHitmanNev]);
				HitmanDuty[playerid] = 0;
				NoName[playerid] = false;
			}
			else
			{
				Format(uzi, "<< %s munk�ba �llt >>", PlayerInfo[playerid][pHitmanNev]);
				HitmanDuty[playerid] = 1;
				NoName[playerid] = true;
			}
			SendMessage(SEND_MESSAGE_HITMAN, uzi, COLOR_YELLOW);
			return 0;
		}


		if(egyezik(tmp, "ruha"))
		{
			new kocsi = GetClosestVehicle(playerid);
			if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 3.0) return !Msg(playerid, "Csak J�rm� mellet.");
			tmp = strtok(text, idx);

			if(!strlen(tmp))
				return !Msg(playerid, "ruha [ruhaid]");

			new skin = strval(tmp);

			if(!IsValidSkin(skin))
				return !Msg(playerid, "Nincs ilyen ruha!");

			SetPlayerSkin(playerid,skin);
			PlayerInfo[playerid][pModel] = skin;

			return 0;
		}

		if(egyezik(tmp, "H�rdet�s") || egyezik(tmp, "Hirdetes"))
		{
		    SendClientMessageToAll(COLOR_LIGHTRED, "Hitman: Gondod van valakivel? Tal�n f�lsz a zsarukt�l? B�zd r�nk! Gyors �s Sp�ci munka!((/contract))");

			return 0;
		}

		if(egyezik(tmp, "alnev") || egyezik(tmp, "�ln�v"))
		{
			new length = strlen(text);
			while ((idx < length) && (text[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[MAX_PLAYER_NAME];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = text[idx];
				idx++;
			}
			result[idx - offset] = EOS;

			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] == 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "Haszn�lat: alnev [�jn�v]");
				return 0;
			}

			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] != 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "�jra a r�gi neved van!");
				PlayerInfo[playerid][pHamisNev] = 0;
				return 0;
			}

			if(strlen(result) > MAX_PLAYER_NAME)
			{
				SendFormatMessage(playerid, COLOR_GRAD1, "Maximum %d karakter!", MAX_PLAYER_NAME);
				return 0;
			}

			PlayerInfo[playerid][pHamisNev] = result;
			format(string, sizeof(string), "Az �j �lneved mostant�l %s!", result);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 0;
		}
		else if(egyezik(tmp, "lenyomoz") || egyezik(tmp, "lenyomozas"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Lenyomoz [N�v/ID/Kikapcsol]");
			if(egyezik(tmp, "kikapcsol"))
			{
				SendClientMessage(playerid, Pink, "Lenyomoz Kikapcsolva!");
				foreach(Jatekosok, x)
				{
					SetPlayerMarkerForPlayer(playerid, x, COLOR_INVISIBLE);
					Fbicelpont[playerid] = NINCS;
					Fbios[x] = NINCS;
					return 0;
				}
			}
			new player = ReturnUser(tmp);
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hib�s n�v!");
			if(PlayerInfo[player][pPnumber] == 0) return !Msg(playerid, "Nincs telefonja!");
			new vw = GetPlayerVirtualWorld(player);
			new inti = GetPlayerInterior(player);
			if(vw != 0 || inti != 0)
			{
				if(Hazbanvan[player] == 0)
				{
					if(inti == 18)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az egyik 24/7 be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 3)
					{
						if(PlayerToPoint(30, player, 296.919982,-108.071998,1001.515625))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LS GS be van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 384.808624,173.804992,1008.382812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 369.8337,162.5357,1014.1893))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 368.2852,162.4965,1019.9844))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 370.1142,163.1876,1025.7891))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly V�rosh�z�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 833.269775,10.588416,1004.179687))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly a Lottoz�ban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 207.054992,-138.804992,1003.507812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly a Bincoban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 288.745971,169.350997,1007.171875))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az FBI HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 1494.325195,1304.942871,1093.289062))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az Oktat� HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 942.171997,-16.542755,1000.929687))
						{
							Msg(playerid, "Adminjail.");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 4)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly SF GS be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 5)
					{
						if(PlayerToPoint(50, player, 72.111999,-3.898649,1000.728820))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LS Edz�terembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 373.825653,-117.270904,1001.499511))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az egyik pizz�z�ban van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 6)
					{
						if(PlayerToPoint(50, player, 774.213989,-48.924297,1000.585937))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly Cobra Edz�terembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 246.783996,63.900199,1003.640625))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly LSPD-n van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 9)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly az egyik csirk�sbe van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 10)
					{
						if(PlayerToPoint(50, player, 375.962463,-65.816848,1001.507812))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az egyik Burger Shotba van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, -975.975708,1060.983032,1345.671875))
						{
							SendClientMessage(playerid, Pink, "C�lszem�ly az RC Gyakorlop�ly�n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, 246.375991,109.245994,1003.218750))
						{
							if(vw == 20)
							{
								SendClientMessage(playerid, Pink, "C�lszem�ly VPOP HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
							else
							{
								SendClientMessage(playerid, Pink, "C�lszem�ly SFPD HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
						}
					}
					else if(inti == 1)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly a H�sfeldolgoz�ban van!((Valameik Maffia Inti))");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 17)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly Alhambr�ba van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 2)
					{
						Msg(playerid, "Gy�rban van, de csak OOC tudod!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 11)
					{
						SendClientMessage(playerid, Pink, "C�lszem�ly Groove Kocsm�ban van!");
						Fbios[player] = playerid;
						return 0;
					}
				}
				else
				{
					SendFormatMessage(playerid, Pink, "C�lszem�ly Class utca %d sz�m alatt tartozkodik!", vw);
					Fbios[player] = playerid;
					return 0;
				}
			}
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(player, X,Y,Z);
			SetPlayerMarkerForPlayer(playerid, player, Pink);
			SendClientMessage(playerid, Pink, "C�lszem�ly Lenyomozva!");
			SendClientMessage(playerid, Pink, "* Kikapcsol�shoz: lenyomoz�s kikapcsol");
			return 0;
		}
		else if ((strcmp("Rendel�s", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Rendel�s")) || (strcmp("Rendeles", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Rendeles")))
		{
			if(!PlayerToPoint(5.0, playerid, 2556.314, -1297.525, 1060.984))
			{
				SetPlayerCheckpoint(playerid, 2556.314, -1297.525, 1060.984, 3);
				Msg(playerid, "Nem vagy a rendel�helyen");
				return 0;
			}
		    tmp = strtok(text, idx);
			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_WHITE, "|__________________ Fegyver csomagok __________________|");
				SendClientMessage(playerid, COLOR_GREY, "|(1) (90,000Ft) K�s, Deagle, MP5, Shotgun");
				SendClientMessage(playerid, COLOR_GREY, "|(2) (125,000Ft) P�nc�l, K�s, Deagle, M4, MP5, Shotgun");
				SendClientMessage(playerid, COLOR_GREY, "|(3) (150,000Ft) P�nc�l, K�s, Deagle, AK47, MP5, Shotgun");
				SendClientMessage(playerid, COLOR_GREY, "|(4) (200,000Ft) P�nc�l, K�s, Deagle, M4, MP5, Shotgun, T�vcs�ves");
				SendClientMessage(playerid, COLOR_GREY, "|(5) (225,000Ft) P�nc�l, K�s, Deagle, AK47, MP5, Shotgun, T�vcs�ves");
				SendClientMessage(playerid, COLOR_GREY, "|(6) (250,000Ft) P�nc�l, K�s, Deagle, M4, MP5, Shotgun, T�vcs�ves");
				SendClientMessage(playerid, COLOR_GREY, "|(7) (275,000Ft) P�nc�l, K�s, Hangtomp�t�s, AK47, MP5, Shotgun, T�vcs�ves");
				SendClientMessage(playerid, COLOR_GREY, "|(8) (300,000Ft) P�nc�l, K�s, Hangtomp�t�s, AK47, Shotgun, T�vcs�ves");
				SendClientMessage(playerid, COLOR_GREY, "|(9) (350,000Ft) P�nc�l, K�s, Hangtomp�t�s, M4, Shotgun, T�vcs�ves");
				SendClientMessage(playerid, COLOR_GREY, "|(10) (400,000Ft) P�nc�l, K�s, Hangtomp�t�s, AK47, T�vcs�ves");
				SendClientMessage(playerid, COLOR_GREY, "|(X) (30000Ft) P�nc�l + Egy�ni fegyver > \"rendel�s x [fegyver]\"");
			    SendClientMessage(playerid, COLOR_WHITE, "|________________________________________________________|");
				return 0;
			}
			new rendeles = strval(tmp);
			switch (rendeles)
			{
				case 1:
				{
					if(GetMoney(playerid) < 90000) return !Msg(playerid, "Ehhez 90,000Ft kell!");

					WeaponGiveWeapon(playerid, 24, 100); WeaponGiveWeapon(playerid, 29, 300); WeaponGiveWeapon(playerid, 25, 100); WeaponGiveWeapon(playerid, 4, 1);
					GiveMoney(playerid, - 90000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 2:
				{
					if(GetMoney(playerid) < 125000) return !Msg(playerid, "Ehhez 125,000Ft kell!");

					SetPlayerArmour(playerid, 150.0);
					WeaponGiveWeapon(playerid, 24, 100); WeaponGiveWeapon(playerid, 29, 300); WeaponGiveWeapon(playerid, 25, 100); WeaponGiveWeapon(playerid, 31, 500); WeaponGiveWeapon(playerid, 4, 1);
					GiveMoney(playerid, - 125000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 3:
				{
					if(GetMoney(playerid) < 150000) return !Msg(playerid, "Ehhez 150,000Ft kell!");

					SetPlayerArmour(playerid, 150.0);
					WeaponGiveWeapon(playerid, 24, 100); WeaponGiveWeapon(playerid, 29, 300); WeaponGiveWeapon(playerid, 25, 100); WeaponGiveWeapon(playerid, 30, 500); WeaponGiveWeapon(playerid, 4, 1);
					GiveMoney(playerid, - 150000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 4:
				{
					if(GetMoney(playerid) < 200000) return !Msg(playerid, "Ehhez 200,000Ft kell!");

					SetPlayerArmour(playerid, 150.0);
					WeaponGiveWeapon(playerid, 24, 100); WeaponGiveWeapon(playerid, 29, 300); WeaponGiveWeapon(playerid, 25, 100); WeaponGiveWeapon(playerid, 31, 500); WeaponGiveWeapon(playerid, 4, 1); WeaponGiveWeapon(playerid, 34, 100);
					GiveMoney(playerid, - 200000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 5:
				{
					if(GetMoney(playerid) < 225000) return !Msg(playerid, "Ehhez 225,000Ft kell!");

					SetPlayerArmour(playerid, 150.0);
					WeaponGiveWeapon(playerid, 24, 100); WeaponGiveWeapon(playerid, 29, 300); WeaponGiveWeapon(playerid, 25, 100); WeaponGiveWeapon(playerid, 30, 500); WeaponGiveWeapon(playerid, 4, 1); WeaponGiveWeapon(playerid, 34, 100);
					GiveMoney(playerid, - 225000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 6:
				{
					if(GetMoney(playerid) < 250000) return !Msg(playerid, "Ehhez 250,000Ft kell!");

					SetPlayerArmour(playerid, 150.0); SetHealth(playerid, MAXHP);
					WeaponGiveWeapon(playerid, 24, 100); WeaponGiveWeapon(playerid, 29, 300); WeaponGiveWeapon(playerid, 27, 100); WeaponGiveWeapon(playerid, 31, 500); WeaponGiveWeapon(playerid, 4, 1); WeaponGiveWeapon(playerid, 34, 100);
					GiveMoney(playerid, - 250000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 7:
				{
					if(GetMoney(playerid) < 275000) return !Msg(playerid, "Ehhez 275,000Ft kell!");

					SetPlayerArmour(playerid, 150.0); SetHealth(playerid, MAXHP);
					WeaponGiveWeapon(playerid, 23, 100); WeaponGiveWeapon(playerid, 29, 300); WeaponGiveWeapon(playerid, 25, 100); WeaponGiveWeapon(playerid, 30, 500); WeaponGiveWeapon(playerid, 4, 1); WeaponGiveWeapon(playerid, 34, 100);
					GiveMoney(playerid, - 275000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 8:
				{
					if(GetMoney(playerid) < 300000) return !Msg(playerid, "Ehhez 300,000 kell!");

					SetPlayerArmour(playerid, 150.0); SetHealth(playerid, MAXHP);
					WeaponGiveWeapon(playerid, 23, 100); WeaponGiveWeapon(playerid, 25, 10); WeaponGiveWeapon(playerid, 30, 500); WeaponGiveWeapon(playerid, 4, 1); WeaponGiveWeapon(playerid, 34, 100);
					GiveMoney(playerid, - 300000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 9:
				{
					if(GetMoney(playerid) < 350000) return !Msg(playerid, "Ehhez 350,000 kell!");

					SetPlayerArmour(playerid, 150.0); SetHealth(playerid, MAXHP);
					WeaponGiveWeapon(playerid, 23, 100); WeaponGiveWeapon(playerid, 25, 100); WeaponGiveWeapon(playerid, 31, 500); WeaponGiveWeapon(playerid, 4, 1); WeaponGiveWeapon(playerid, 34, 100);
					GiveMoney(playerid, - 350000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 10:
				{
					if(GetMoney(playerid) < 400000) return !Msg(playerid, "Ehhez 400,000Ft kell!");

					SetPlayerArmour(playerid, 150.0); SetHealth(playerid, MAXHP);
					WeaponGiveWeapon(playerid, 23, 100); WeaponGiveWeapon(playerid, 30, 500); WeaponGiveWeapon(playerid, 4, 1); WeaponGiveWeapon(playerid, 34, 100);
					GiveMoney(playerid, - 400000);
					SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt csomagot!");
				}
				case 0:
				{
					if(GetMoney(playerid) < 30000) return !Msg(playerid, "Ehhez 30,000Ft kell!");

					tmp = strtok(text, idx);
					if(!strlen(tmp))
						return !Msg(playerid, "Haszn�lata: rendel�s 0 [fegyvern�v]");

					new f = NINCS;
					for(new x = 1; x <= 46; x++)
					{
						if(strfind(aWeaponNames[x], tmp, true) != -1)
							f = x;
					}

					new loszer = 1;
					switch(f)
					{
						// Tiltottak
						case NINCS, 18..21, 35..40, 43..45:
							return !SendClientMessage(playerid, COLOR_LIGHTBLUE, "Ilyen fegyver nincs, vagy tiltott!");

						// Gr�n�tok
						case 16, 17: loszer = 15;

						// Pisztolyok
						case 22..24: loszer = 100;

						// Shotgunok, rifle, sniper
						case 25..27, 33, 34: loszer = 100;

						// K�zepes g�pfegyverek (mp5, tec9, uzi)
						case 29: loszer = 300;

						// Nagy g�pfegyverek (m4, ak47)
						case 30, 31: loszer = 500;

						// Sok l�szeresek: spr�, porolt�
						case 41, 42: loszer = 1000;
					}

					SetPlayerArmour(playerid, 150.0); SetHealth(playerid, MAXHP);
					WeaponGiveWeapon(playerid, f, loszer);
					GiveMoney(playerid, - 30000);
					SendFormatMessage(playerid, COLOR_LIGHTBLUE, "* Felvetted a megrendelt fegyvert: %s", aWeaponNames[f]);
				}
				default:
					Msg(playerid, "Nincs ilyen csomag");
			}
			return 0;
		}
		else if((strcmp("Kikapcsol", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Kikapcsol")))
		{
		    SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Kikapcsoltad a laptopodat.");
      		ConnectedToPC[playerid] = 0;
		    return 0;
		}
		else
		{
		    SendClientMessage(playerid, COLOR_WHITE, "====[ Laptop ]====");
			SendClientMessage(playerid, COLOR_YELLOW2, "| - Tagok - H�rdet�s");
			SendClientMessage(playerid, COLOR_YELLOW2, "| - V�rd�jak  - Ruha - cian");
			SendClientMessage(playerid, COLOR_YELLOW2, "| - C�lpontok - lenyomoz - �ln�v");
			SendClientMessage(playerid, COLOR_YELLOW2, "| - Rendel�s - Bilincs - bombatavol");
			SendClientMessage(playerid, COLOR_YELLOW2, "| - Bomba - Munka - lenyomoz");
		    return 0;
		}

	}
	if(CallLawyer[playerid] == 111)
	{
	    new idx;
	    tmp = strtok(text, idx);
	    if ((strcmp("yes", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("yes")))
		{
		    GetPlayerName(playerid, sendername, sizeof(sendername));
		    format(string, sizeof(string), "** %s �gyv�det h�vott.", sendername);
	    	SendMessage(SEND_MESSAGE_JOB, string, TEAM_AZTECAS_COLOR, 2);
	    	SendMessage(SEND_MESSAGE_JOB, "* Menj a rend�rs�gre �s besz�lj egy rend�rrel!", TEAM_AZTECAS_COLOR, 2);
	    	SendClientMessage(playerid, COLOR_LIGHTRED, "�zeneted tov�bb�tottuk az �gyv�deknek!");
	    	WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
	    	return 0;
		}
		else
		{
		    SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs �gyv�d, b�ntet�s let�lt�se...");
		    WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
		    return 0;
		}
	}
	if(TalkingLive[playerid] != 255)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(RiporterAlive[playerid] ==1){sendername="N�vtelen";}
	    format(string, sizeof(string), "~~~ *�L�* %s: %s ~~~", sendername, text);
		SendMessage(SEND_MESSAGE_OOCNEWS, string, COLOR_Live);
		return 0;
	}
	if(Mobile[playerid] != 255)
	{
		//telefon besz�d
		new idx;
		tmp = strtok(text, idx);
		GetPlayerName(playerid, sendername, sizeof(sendername));
		format(string, sizeof(string), "[Telefon] Valaki (%s) mondja: %s", NemVizsgalat(PlayerInfo[playerid][pSex]), text);
		ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
		foreach(Jatekosok, p)
		{
			if(Poloska[p] && Poloskazott[playerid] && Poloskazta[p] == playerid)
				SendFormatMessage(p, COLOR_DORANGE, "<< Poloska (telefon): %s: %s >>", sendername, text);
		}

		if(Mobile[playerid] == 1004)
		{
			strmid(Mento[playerid], text, 0, strlen(text), 64);
			SendClientMessage(playerid, COLOR_ALLDEPT, "Ment�szolg�lat: K�rem r�viden mondja el, hogy hol t�rt�nt az eset!");
			Mobile[playerid] = 1041;
			return 0;
		}
		if(Mobile[playerid] == 1041)
		{
			strmid(MentoHelyszin[playerid], text, 0, strlen(text), 64);
			SendClientMessage(playerid, COLOR_ALLDEPT, "Ment�szolg�lat: Sz�ks�ge van l�giegys�gre? [igen]");
			Mobile[playerid] = 1042;
			return 0;
		}
		if(Mobile[playerid] == 1042)
		{
			if(egyezik(text, "igen")) MentoLegi[playerid] = 1;
			else if(egyezik(text, "nem")) MentoLegi[playerid] = 2;
			else
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "Ment�szolg�lat: Igen vagy nem?");
				return 0;
			}
			SendRadioMessageFormat(FRAKCIO_MENTO, TEAM_AZTECAS_COLOR, "** %s ment�t h�vott - Ahhoz hogy elfogadd, /accept medic %d", ICPlayerName(playerid), playerid);
			new szoveg[6];
			if(MentoLegi[playerid] == 2) szoveg = " nem ";
			SendRadioMessageFormat(FRAKCIO_MENTO, TEAM_AZTECAS_COLOR, "** Inform�ci�k: L�giegys�g: %skell  T�rt�nt: %s Helysz�n: %s   ", szoveg, Mento[playerid], MentoHelyszin[playerid]);
			if(OnlineTagok(FRAKCIO_MENTO) < 1)
			{
				tformat(128, "** %s ment�t h�vott - Ahhoz hogy elfogadd, /accept medic %d", ICPlayerName(playerid), playerid); 
				SendMessage(SEND_MESSAGE_ONKENTES, _tmpString, TEAM_BLUE_COLOR);
				tformat(128, "** Inform�ci�k: L�giegys�g: %skell  T�rt�nt: %s Helysz�n: %s   ", szoveg, Mento[playerid], MentoHelyszin[playerid]); 
				SendMessage(SEND_MESSAGE_ONKENTES, _tmpString, TEAM_BLUE_COLOR);
			}
			Mobile[playerid] = 255;
			SendClientMessage(playerid, COLOR_ALLDEPT, "Ment�szolg�lat: Azonnal indulunk! ((V�rj t�relmesen, ha m�r nem kell ment� akkor pedig /cancel medic ))");
			SendClientMessage(playerid, COLOR_GRAD2, "Lerakt�k.");
			MentoHivas[playerid] = 1;
			return 0;
		}


		if(Mobile[playerid] == 1005)
		{
			strmid(CallTuzOk[playerid], text, 0, strlen(text), 128);
			SendRadioMessageFormat(FRAKCIO_TUZOLTO, TEAM_AZTECAS_COLOR, "** %s t�zolt�t h�vott, l�tod a radaron!", ICPlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_TUZOLTO, TEAM_AZTECAS_COLOR, "** Oka: %s", CallTuzOk[playerid]);

			foreach(Jatekosok, x)
				if(LMT(x, FRAKCIO_TUZOLTO)) SetPlayerMarkerForPlayer(x, playerid, COLOR_LIGHTGREEN);

			//SendClientMessage(playerid, COLOR_LIGHTBLUE, "* H�vt�l ment�t, v�rj a v�laszra.");
			Mobile[playerid] = 255;
			CallTuz[playerid] = 300;
			SendClientMessage(playerid, COLOR_ALLDEPT, "T�zolt�k: Azonnal indulunk!");
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* H�vt�l t�zolt�t, v�rj a v�laszra.");
			SendClientMessage(playerid, COLOR_GRAD2, "Lerakt�k.");
			return 0;
		}
		
		if(Mobile[playerid] == 1003 && OnAirID == playerid)
		{
			if(SzovegEllenorzes(playerid, text, "/news", ELLENORZES_HIRDETES)) return 0;
		
			if(strcmp(RadioMusorNev,"NINCS") == 0)
				format(_tmpString, sizeof(_tmpString), "Betelefon�l� %s: %s", ICPlayerName(playerid), text);
			else
				format(_tmpString, sizeof(_tmpString), "%s - Betelefon�l� %s: %s", RadioMusorNev, ICPlayerName(playerid), text);
			SendMessage(SEND_MESSAGE_OOCNEWS, _tmpString, COLOR_NEWS);
			return 0;
		}


		if(Mobile[playerid] == 912)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "911: Eln�z�st de nem �rtem.");
				return 0;
			}
			strmid(Bejelent[playerid], text, 0, strlen(text), 255);
			SendClientMessage(playerid, COLOR_DBLUE, "Rend�rs�g: Tudja az elk�vet� nev�t? Ha nem csak mondja: ''nem''.");
			Mobile[playerid] = 913;
			return 0;
		}

		if(Mobile[playerid] == 913)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "Rend�rs�g: Sajn�lom... nem �rtem");
				return 0;
			}

			//new wanted[128];

			if(strcmp("nem", tmp, true) == 0)
			{
				new turner[MAX_PLAYER_NAME];
				GetPlayerName(playerid, turner, sizeof(turner));
				SendClientMessage(playerid, COLOR_DBLUE, "Rend�rs�g: Minden egys�g riasztva. K�sz�nj�k bejelent�s�t!");

				CopMsg(COLOR_DBLUE, "=========== BEJELENT�S ===========");
				if(TelefonTipus[playerid]==1)
				{
					turner="Ny�lv�nos telefon";
					CopMsgFormat(COLOR_DBLUE, "HQ: Minden egys�gnek! Bejelent�: %s | Tettes: Ismeretlen",turner);
				}
				else
				{
					CopMsgFormat(COLOR_DBLUE, "HQ: Minden egys�gnek! Bejelent�: %s | Tettes: Ismeretlen",turner);
				}
				
				CopMsgFormat(COLOR_DBLUE, "HQ: B�ncselekm�ny: %s",Bejelent[playerid]);
				SendClientMessage(playerid, COLOR_GRAD2, "Lerakt�k.");
				
				Mobile[playerid] = 255;
				return 0;
			}
			new badguy;

			badguy = ReturnUser(tmp);
			if (IsPlayerConnected(badguy))
			{
			    if(badguy != INVALID_PLAYER_ID)
			    {
					SendClientMessage(playerid, COLOR_DBLUE, "Rend�rs�g: Minden egys�g riasztva. K�sz�nj�k bejelent�s�t!");


					CopMsg(COLOR_DBLUE, "=========== BEJELENT�S ===========");
					if(TelefonTipus[playerid]==1)
					{
						CopMsgFormat(COLOR_DBLUE, "HQ: Minden egys�gnek! Bejelent�: Ny�lv�nos telefon | Tettes: %s",ICPlayerName(badguy));
					}
					else
					{
						CopMsgFormat(COLOR_DBLUE, "HQ: Minden egys�gnek! Bejelent�: %s | Tettes: %s", ICPlayerName(playerid), ICPlayerName(badguy));
					}

					CopMsgFormat(COLOR_DBLUE, "HQ: B�ncselekm�ny: %s",Bejelent[playerid]);
					
					
					if(!egyezik(Bejelent[playerid],"Hackerked�s!") &&  !egyezik(Bejelent[playerid],"Els�fok� Gyilkos"))
						SetPlayerCriminal(badguy,playerid,Bejelent[playerid]);

					SendClientMessage(playerid, COLOR_GRAD2, "Lerakt�k.");
					Mobile[playerid] = 255;
					return 0;
				}//invalid id
				return 0;
			}//not connected
			else
			{
				SendFormatMessage(playerid, COLOR_DBLUE, "Rend�rs�g: Sajn�lom, nincs inform�ci�nk err�l a szem�lyr�l: %s. Biztos j� n�v?", tmp);
				return 0;
			}
		}

		if(IsPlayerConnected(Mobile[playerid]))
		{
		    if(Mobile[Mobile[playerid]] == playerid)
			{
				SendClientMessage(Mobile[playerid], COLOR_YELLOW,string);
				new szoveg[300];
				format(szoveg,sizeof(szoveg),"[TELEFON]%s mondja %s-nek: %s",PlayerName(playerid),PlayerName(Mobile[playerid]),text);
				Log("Chat", szoveg);
			}	
			foreach(Jatekosok, x)
			{
				if(Lehallgat[x] == playerid)
				{
					new idx2;
					tmp = strtok(text, idx2);
					SendFormatMessage(x, COLOR_LIGHTBLUE,"[Lehallgatott Telefon(%s)] Valaki mondja: %s", FormatNumber(PlayerInfo[x][pPnumber], 0, '-' ),text);
				}
				if(Lehallgat[x] == Mobile[playerid])
				{
					new idx3;
					tmp = strtok(text, idx3);
					SendFormatMessage(x, COLOR_LIGHTBLUE,"[Lehallgatott Telefon(%s)] Valaki mondja: %s",FormatNumber(PlayerInfo[x][pPnumber], 0, '-' ),text);
				}
			}
		}

		else
			SendClientMessage(playerid, COLOR_YELLOW,"Nincs senki a vonalban...((kil�pet nem online))");
		return 0;
	}

	if(PlayerRaceInfo[playerid][xEpites] != NINCS)
	{
		new params = Parameterek(text);
		new param[3][32];
		new idx;

		if(params > 0)
		{
			new params_szamlalo = 1;
			while(params_szamlalo <= params && params_szamlalo < sizeof(param))
			{
				param[params_szamlalo] = GetParam(text, params_szamlalo);
				params_szamlalo++;
			}
		}

		new funkcio[32];
		funkcio = strtok(text, idx);

		new slot = PlayerRaceInfo[playerid][xEpites];

		if(egyezik(funkcio, "start"))
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			SetPlayerRaceCheckpoint(playerid, 2, x, y, z, 0.0, 0.0, 0.0, RACECPMERETB);
			RaceStart[slot][0] = x;
			RaceStart[slot][1] = y;
			RaceStart[slot][2] = z;

			Msg(playerid, "Start checkpoint lerakva", false);
		}
		else if(egyezik(funkcio, "finish"))
		{
			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			SetPlayerRaceCheckpoint(playerid, 2, x, y, z, 0.0, 0.0, 0.0, RACECPMERETB);
			RaceCel[slot][0] = x;
			RaceCel[slot][1] = y;
			RaceCel[slot][2] = z;

			Msg(playerid, "Finish checkpoint lerakva", false);
		}
		/*else if(egyezik(funkcio, "CP"))
		{
			if(params < 1)
			{
				Msg(playerid, "Haszn�lata: cp [sz�m]", false);
				return 0;
			}

			new cp = strval(param[1]);
			if(cp < 0 || cp >= RACEMAXCP)
				Msg(playerid, "Nincs ilyen CP!", false);

			PlayerRaceInfo[playerid][xEpitesCP] = cp;
			SendFormatMessage(playerid, COLOR_LIGHTRED, "Az �p�t�s a %d CPt�l folytat�dik", cp);
		}*/
		else if(egyezik(funkcio, "next"))
		{
			if(PlayerRaceInfo[playerid][xEpitesCP] >= RACEMAXCP)
			{
				Msg(playerid, "El�rted a maxim�lis CP sz�m�t! Rakd le a Finish-t!", false);
				return 0;
			}

			new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			SetPlayerRaceCheckpoint(playerid, 2, x, y, z, 0.0, 0.0, 0.0, RACECPMERETB);

			PlayerRaceInfo[playerid][xEpitesCP]++;
			new cp = PlayerRaceInfo[playerid][xEpitesCP];
			RaceCP[slot][cp][0] = x;
			RaceCP[slot][cp][1] = y;
			RaceCP[slot][cp][2] = z;

			SendFormatMessage(playerid, COLOR_LIGHTRED, "Ez volt a %d. CP, m�g %d CP-t rakhatsz le!", cp, (RACEMAXCP - cp));
		}
		else if(egyezik(funkcio, "back"))
		{
			new cp = PlayerRaceInfo[playerid][xEpitesCP];
			if(cp == 0)
			{
				Msg(playerid, "Hova akarsz m�r visszamenni? Ez a nulladik... -.-\"", false);
				return 0;
			}
			new Float:x, Float:y, Float:z;
			x = RaceCP[slot][cp-1][0];
			y = RaceCP[slot][cp-1][1];
			z = RaceCP[slot][cp-1][2];

			SetPlayerRaceCheckpoint(playerid, 2, x, y, z, 0.0, 0.0, 0.0, RACECPMERETB);
			PlayerRaceInfo[playerid][xEpitesCP] = cp - 1;
			SendFormatMessage(playerid, COLOR_LIGHTRED, "Visszaugrott�l a %d. CPre", (cp-1));
		}
		/*else if(egyezik(funkcio, "save"))
		{
			if(RaceStart[slot][0] == 0.0 || RaceStart[slot][1] == 0.0 || RaceStart[slot][2] == 0.0 || RaceCel[slot][0] == 0.0 || RaceCel[slot][1] == 0.0 || RaceCel[slot][2] == 0.0)
			{
				Msg(playerid, "Nincs megadva Start vagy C�l poz�ci�!", false);
				return 0;
			}

			if(!strlen(RaceInfo[slot][rNev]))
			{
				Msg(playerid, "A Racenek nincs neve, adnod kell egy nevet neki > nev [n�v]", false);
				return 0;
			}

			if(params < 1)
			{
				Msg(playerid, "Haszn�lata: save [saven�v] - NEM tartalmazhat space-t!", false);
				return 0;
			}

			new snev[32], where[64];
			snev = strtok(text, idx);
			strmid(snev, param[1], 0, strlen(param[1]), 40);

			new query[350], setdata[40], start[40], cel[40];
			Format(start, "%.2f,%.2f,%.2f", RaceStart[slot][0], RaceStart[slot][1], RaceStart[slot][2]);
			Format(cel, "%.2f,%.2f,%.2f", RaceCel[slot][0], RaceCel[slot][1], RaceCel[slot][2]);

			Format(where, "SNev='%s'", snev);
			if(Mysql_Num(SQL_DB_Verseny, where) < 1)
				Format(query, "INSERT INTO %s (SNev, Nev, Start, Cel) VALUES('%s', '%s', '%s', '%s')", SQL_DB_Verseny, snev, RaceInfo[slot][rNev], start, cel);
			else
				Format(query, "UPDATE %s SET SNev='%s', Nev='%s', Start='%s', Cel='%s' WHERE %s", SQL_DB_Verseny, snev, RaceInfo[slot][rNev], start, cel, where);

			doQuery( query );

			new cp;
			for(new x = 0; x < RACEMAXCP; x++)
			{
				if(RaceCP[slot][x][0] == 0.0 || RaceCP[slot][x][1] == 0.0 || RaceCP[slot][x][2] == 0.0) continue;

				Format(setdata, "%f,%f,%f", RaceCP[slot][x][0], RaceCP[slot][x][1], RaceCP[slot][x][2]);
				Format(query, "UPDATE %s SET CK%d = '%s' WHERE %s", SQL_DB_Verseny, cp, setdata, where);
				doQuery( query );
				cp++;
			}
			Format(query, "UPDATE %s SET Checkpointok='%d' WHERE %s", SQL_DB_Verseny, cp, where);
			doQuery( query );

			SendFormatMessage(playerid, COLOR_YELLOW, "%s mentve - CPk sz�ma %d", snev, cp);
			Msg(playerid, "A race-t ujra kell loadolnod, ha �jra szerkeszteni szeretn�d v. ind�tani", false);
			RaceInfo[slot][rStatusz] = RACE_NINCS;
			PlayerRaceInfo[playerid][xEpites] = NINCS;
			DisablePlayerRaceCheckpoint(playerid);
		}*/
		else if(egyezik(funkcio, "nev"))
		{
			new length = strlen(text);
			while ((idx < length) && (text[idx] <= ' '))
			{
				idx++;
			}
			new offset = idx;
			new result[64];
			while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
			{
				result[idx - offset] = text[idx];
				idx++;
			}
			result[idx - offset] = EOS;

			if(!strlen(result))
			{
				Msg(playerid, "Haszn�lata: nev [n�v]", false);
				return 0;
			}

			strmid(RaceInfo[slot][rNev], result, 0, strlen(result), 60);
			SendFormatMessage(playerid, COLOR_LIGHTRED, "A Race neve be�ll�tva: %s", result);
		}
		else
		{
			Msg(playerid, "Funkci�k: start, finish, next, back, save", false);
			Msg(playerid, "Info: Start > start poz�ci� lerak�sa | Finish > c�l poz�c�� megad�sa | Nev [n�v] > A race neve", false);
			Msg(playerid, "Info: Next > Lerakja a k�vetkez� CP-t | Back > Egy CPvel visszamegy | Save [n�v] > Ment�s", false);
		}

		return 0;
	}

	if(realchat)
	{
	    if(gPlayerLogged[playerid] == 0)
	    {
	        return 0;
      	}
		GetPlayerName(playerid, sendername, sizeof(sendername));

		if(!gBooc[playerid])
		{
			if(SzajBekotve[playerid] == 1)
				return !Msg(playerid, "A sz�d bevan k�tve, �gy nem tudsz besz�lni.");
				
			if(strfind(text, ":D", true) != -1 || strfind(text, "xD", true) != -1)
			{
				ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);

				Cselekves(playerid, "nevet.");
				return 0;
			}

			if(strfind(text, ":)", true) != -1)
				return !Cselekves(playerid, "mosolyog.");

			if(strfind(text, ":(", true) != -1)
				return !Cselekves(playerid, "szomor�.");

			if(strfind(text, ":P", true) != -1)
				return !Cselekves(playerid, "nyelvet �lt.");

			if(strfind(text, ";)", true) != -1)
				return !Cselekves(playerid, "kacsint.");

			if(strfind(text, ":@", true) != -1)
				return !Cselekves(playerid, "ideges.");

			if(strfind(text, ":O", true) != -1)
				return !Cselekves(playerid, "csod�lkozik.");

			if(strfind(text, ":S", true) != -1)
				return !Cselekves(playerid, "rosszul van.");

			if(strfind(text, ":$", true) != -1)
				return !Cselekves(playerid, "elpirul.");
		}



		if(!gBooc[playerid])
		{
			if(SzovegEllenorzes(playerid, text, "IC", ELLENORZES_HIRDETES))
				return 0;
			
			strrep(sendername, '_', ' '); // IC �zenetben nem jelenik meg als�vonal

			foreach(Jatekosok, p)
			{
				if(Poloska[p] && Poloskazott[playerid] && Poloskazta[p] == playerid)
					SendFormatMessage(p, COLOR_DORANGE, "<< Poloska: %s: %s >>", sendername, text);
			}

			new kocsiszoveg, kocsi;
			kocsi = GetPlayerVehicleID(playerid);
			if(IsPlayerInAnyVehicle(playerid) && !IsABicikli(kocsi) && !Bikes(kocsi) && !IsAMotor(kocsi))
			{
				if(!AblakLent[kocsi]) kocsiszoveg = 1;
				else kocsiszoveg = 2;
			}
			if(Szajkendo[playerid] || Maszk[playerid])
				kocsiszoveg = 3;

			if(!PlayerInfo[playerid][pANyelv])
			{
				if(PlayerInfo[playerid][pHamisNev] == 0)
				{
					switch(kocsiszoveg)
					{
						case 1: format(string, 128, "[J�rm�ben] %s mondja: %s", sendername, text);
						case 2: format(string, 128, "[J�rm�b�l] %s mondja: %s", sendername, text);
						case 3: format(string, 128, "[Kend�/Maszk]IDK: %d mondja: %s", PlayerInfo[playerid][pBID], text);
						default: format(string, 128, "%s mondja: %s", sendername, text);
					}

					ChatLog(string);
				}
				else
				{
					format(string, sizeof(string), "[%s]%s mondja: %s", sendername, PlayerInfo[playerid][pHamisNev], text);
					ChatLog(string);

					switch(kocsiszoveg)
					{
						case 1: format(string, 128, "[J�rm�ben] %s mondja: %s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]), text);
						case 2: format(string, 128, "[J�rm�b�l] %s mondja: %s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]), text);
						case 3: format(string, 128, "[Kend�/Maszk]IDK: %d mondja: %s", PlayerInfo[playerid][pBID], text);
						default: format(string, 128, "%s mondja: %s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]), text);
					}
				}
				ProxDetector(20.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, (kocsiszoveg == 1) ? true : false);
				SetPlayerChatBubble(playerid, text, COLOR_WHITE, 5, 5000);
			}
			else
			{
				if(PlayerInfo[playerid][pHamisNev] == 0)
				{
					switch(kocsiszoveg)
					{
						case 1: format(string, 128, "[J�rm�ben] %s mondja%%s: %%s", sendername);
						case 2: format(string, 128, "[J�rm�b�l] %s mondja%%s: %%s", sendername);
						case 3: format(string, 128, "[Kend�/Maszk]IDK: %d mondja%%s: %%s", PlayerInfo[playerid][pBID]);
						default: format(string, 128, "%s mondja%%s: %%s", sendername);
					}

					ChatLog(string);
				}
				else
				{
					format(string, sizeof(string), "[%s]%s mondja: %s", sendername, PlayerInfo[playerid][pHamisNev], text);
					ChatLog(string);

					switch(kocsiszoveg)
					{
						case 1: format(string, 128, "[J�rm�ben] %s mondja%%s: %%s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]));
						case 2: format(string, 128, "[J�rm�b�l] %s mondja%%s: %%s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]));
						case 3: format(string, 128, "[Kend�/Maszk]IDK: %d mondja%%s: %%s", PlayerInfo[playerid][pBID]);
						default: format(string, 128, "%s mondja%%s: %%s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]));
					}
				}
				ProxDetector(20.0, playerid, string, COLOR_FADE1, COLOR_FADE2, COLOR_FADE3, COLOR_FADE4, COLOR_FADE5, (kocsiszoveg == 1) ? true : false, text);
			}
		}
		else
		{
			if(SzovegEllenorzes(playerid, text, "IC(OOC)", ELLENORZES_MINDKETTO))
				return 0;

			if(FloodCheck(playerid) && !Admin(playerid, 4)) return 0;
			if(PlayerInfo[playerid][pHamisNev] == 0)
			{
				format(string, sizeof(string), "%s mondja OOC: (( %s ))", sendername, text);
				ChatLog(string);
			}
			else
			{
				format(string, sizeof(string), "[%s]%s mondja OOC: (( %s ))", sendername, PlayerInfo[playerid][pHamisNev], text);
				ChatLog(string);
				format(string, sizeof(string), "%s mondja OOC: (( %s ))", PlayerInfo[playerid][pHamisNev], text);
			}
			ProxDetector(20.0, playerid, string,COLOR_FADE1,COLOR_FADE2,COLOR_FADE3,COLOR_FADE4,COLOR_FADE5);
			//SetPlayerChatBubble(playerid, text, COLOR_WHITE, 5, 5000);
		}
		return 0;
	}
	return 1;
} //optveg