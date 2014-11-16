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
		Msg(playerid, "Most nem beszélhetsz!");
		return 0;
	}
	if(Alszik[playerid] != 0) return !Msg(playerid, "Alszol, ilyenkor nem beszélhetsz!");
	AFKIdo[playerid] = 0;
	//new giver[MAX_PLAYER_NAME];
	new sendername[MAX_PLAYER_NAME];
	new giveplayer[MAX_PLAYER_NAME];
	new tmp[256];
	new string[256];
	//new giveplayerid;
	
	if(KorhazIdo[playerid] > 0) return !Msg(playerid, "Most nem beszélhetsz!");

	if(PlayerInfo[playerid][pMuted] == 1)
	{
		SendClientMessage(playerid, TEAM_CYAN_COLOR, "A hangszálaiddal játszanak, ilyenkor nehéz!");
		return 0;
	}
	if(PlayerCuffed[playerid] == 1)
		return !Msg(playerid, "Sokkolva vagy, nem tudsz beszélni!");
	if(Leutve[playerid])
	{
		Msg(playerid, "El vagy ájulva ember én nem beszélnék a helyedben..");
		return 0;
	}
	if(AFK[playerid] == 1)
	{
		if(strcmp(text, "classrpg", true) == 0)
		{
			AFK[playerid] = 0;
			SendClientMessage(playerid, COLOR_LIGHTRED, "===============[AFK]===============");
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "Mostmár nem vagy AFK!");
			SendClientMessage(playerid, COLOR_LIGHTRED, "===============[AFK]===============");
			TogglePlayerControllable(playerid, true);
			InvisibleColor(playerid);
			return 0;
		}
		else
		{
			SendClientMessage(playerid, COLOR_WHITE, "Ha szeretnél visszatérni az AFKból írd be, hogy \"ClassRPG\"");
			return 0;
		}
	}
	if(Belepve[playerid] == 1)
	{
		new idx;
	    tmp = strtok(text, idx);
		if(egyezik(tmp, "álnév") || egyezik(tmp, "alnev"))
		{
			if(!Munkarang(playerid, 2) && !FBIAlnev) return !Msg(playerid, "Access Denied. 2-es rang szükséges.");
			
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
				Msg(playerid,"Használat: álnev [újnév]");
				return 0;
			}
			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] != 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "Újra a régi neved van!");
				PlayerInfo[playerid][pHamisNev] = 0;
				return 0;
			}

			if(strlen(result) > MAX_PLAYER_NAME)
			{
				SendFormatMessage(playerid, COLOR_GRAD1, "Maximum %d karakter!", MAX_PLAYER_NAME);
				return 0;
			}
			PlayerInfo[playerid][pHamisNev] = result;
			format(string, sizeof(string), "Az új álneved mostantól %s!", result);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 0;
		}
		else if(egyezik(tmp, "bankszámla") || egyezik(tmp, "bankszamla"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "bankszámla [számlaszám/név]");
			//new uzenet[100];
			new bsz = strval(tmp);
			new player;
			if(BankSzamla(bsz) != NINCS) 
				player = BankSzamla(bsz);
			else
				player=ReturnUser(tmp);
			
			if(player == INVALID_PLAYER_ID)
				return Msg(playerid, "Nincs ilyen bankszámlaszám/név");
			
			if(PlayerInfo[player][pZarolva] == 1)
			{
				Msg(playerid, "Feloldottad a zárolást a számláról.");
				//ormat(uzenet, "PDA Üzenet: %s feloldotta a zárolást egy bankszámláról(Számlaszám: %d)", PlayerName(playerid), bsz);
				SendRadioMessageFormat(FRAKCIO_FBI, Pink, "PDA Üzenet: %s feloldotta a zárolást egy bankszámláról(Számlaszám: %d)", ICPlayerName(playerid), bsz);
				PlayerInfo[player][pZarolva] = 0;
				Msg(player, "Az FBI feloldotta a zárolást a számládról.");
				return 0;
			}
			if(PlayerInfo[player][pZarolva] == 0)
			{
				Msg(playerid, "Lezároltad a számlát.");
				//Format(uzenet, "PDA Üzenet: %s lezárt egy számlát(Számlaszám: %d)", PlayerName(playerid), bsz);
				SendRadioMessageFormat(FRAKCIO_FBI, Pink, "PDA Üzenet: %s lezárt egy számlát(Számlaszám: %d)", ICPlayerName(playerid), bsz);
				PlayerInfo[player][pZarolva] = 1;
				Msg(player, "Az FBI lezárolta a számlád.");
				return 0;
			}
		}
		else if(egyezik(tmp, "beépülés") || egyezik(tmp, "beepules"))
		{
			tmp = strtok(text, idx);
			if(!Munkarang(playerid, 3) && !FBIBeepules) return !Msg(playerid, "Access Denied. 3as rang szükséges.");
			if(!strlen(tmp)) return !Msg(playerid, "beépülés [ruha]");
			new ruha = strval(tmp);
			new kocsi = GetClosestVehicle(playerid);
			if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 3.0) return !Msg(playerid, "Csak Szolgálati Jármû mellet.");
			if(!IsValidSkin(ruha)) return !Msg(playerid, "Nincs ilyen ruha!");
			SetPlayerSkin(playerid, ruha);
			SendClientMessage(playerid, Pink, "Beépülés Sikeres.");
			//new uzi[128];
			//Format(uzi, "PDA Üzenet: %s felvett egy álruhát.", PlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_FBI, Pink, "PDA Üzenet: %s felvett egy álruhát.", ICPlayerName(playerid));
			return 0;
		}
		else if(egyezik(tmp, "deaktiválás") || egyezik(tmp, "deaktivalas"))
		{
			if(Fbibelepes != 1 && Fbibelepes != 3) return !Msg(playerid, "Nem volt Behatolás/ A rendszer nincs Aktiválva.");
			Fbibelepes = 0;
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 9.00000, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 5.00000, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 5.33860, 4);
			if(Fbibelepes == 1)
			{
				//format(string, sizeof(string), "PDA Üzenet: System Deactivated!");
				SendMessage(SEND_MESSAGE_RADIO, "PDA Üzenet: System Deactivated!", Pink, FRAKCIO_FBI);
			}
			Msg(playerid, "System Deactivated.");
			return 0;
		}
		else if(egyezik(tmp, "aktiválás") || egyezik(tmp, "aktivalas"))
		{
			if(Fbibelepes == 3) return !Msg(playerid, "A rendszer aktiválva van.");
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 12.78430, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 12.33860, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 12.33860, 4);
			Fbibelepes = 3;
			Msg(playerid, "System Activated");
			return 0;
		}
		else if(egyezik(tmp, "rendõrfelfüggesztés") || egyezik(tmp, "rendorfelfuggesztes"))
		{
			tmp = strtok(text, idx);
			if(!Munkarang(playerid, 5)) return !Msg(playerid, "Access Denied. 6os rang szükséges.");
			if(!strlen(tmp)) return !Msg(playerid, "Rendõrfelfüggesztés [Név/ID]");
			new zseka = ReturnUser(tmp);
			if(zseka == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(!IsACop(zseka)) return !Msg(playerid, "A Játékos nem Rendõr!");
			SendClientMessage(zseka, COLOR_LIGHTBLUE, "Az FBI felfüggesztett! Ismét civil vagy.");
			PlayerInfo[zseka][pLeader] = 0;
			PlayerInfo[zseka][pMember] = 0;
			PlayerInfo[zseka][pRank] = 0;
			PlayerInfo[zseka][pChar] = 0;
			PlayerInfo[zseka][pSwattag] = 0;
			PlayerInfo[zseka][pSwatRang] = 0;

			strcpy(PlayerInfo[zseka][pFrakcioTiltOk], "Felfüggesztés hatóság által", 64);
         	PlayerInfo[zseka][pFrakcioTiltIdo]=25;

			new rand = random(sizeof(CIV));
			SetSpawnInfo(zseka, SPAWNID, PlayerInfo[zseka][pModel],0.0,0.0,0.0,0,0,0,0,0,0,0);
			PlayerInfo[zseka][pModel] = CIV[rand];
			
			SpawnPlayer(zseka);
			SendFormatMessage(playerid, Pink, "%s felfüggesztve!", ICPlayerName(zseka));
			//new uzi[128];
			//Format(uzi, "PDA Üzenet: %s felfüggesztette %s.", PlayerName(playerid), PlayerName(zseka));
			SendRadioMessageFormat(FRAKCIO_FBI, Pink, "PDA Üzenet: %s felfüggesztette %s.", ICPlayerName(playerid), ICPlayerName(zseka));
			return 0;
		}
		else if(egyezik(tmp, "jelszó") || egyezik(tmp, "jelszo"))
		{
			SendFormatMessage(playerid, Pink, "A jelszó most %s.", FrakcioInfo[FRAKCIO_FBI][fJelszo]);
			return 0;
		}
		else if(egyezik(tmp, "logout"))
		{
			SendFormatMessage(playerid, Pink, "Server Disconnected. Jó munkát %s Ügynök.", ICPlayerName(playerid));
			Belepve[playerid] = 0;
			return 0;
		}
		else if(egyezik(tmp, "lenyomozás") || egyezik(tmp, "lenyomozas"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Lenyomozás [Név/ID/Kikapcsol]");
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
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(PlayerInfo[player][pPnumber] == 0 && !PlayerInfo[player][pLaptopBe] || !PlayerInfo[player][pLaptop]) return !Msg(playerid, "Nincs telefonja vagy laptopja!");
			new vw = GetPlayerVirtualWorld(player);
			new inti = GetPlayerInterior(player);
			if(vw != 0 || inti != 0)
			{
				if(Hazbanvan[player] == 0)
				{
					if(vw == 104 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "Célszemély a Kórházban van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 1555 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "Célszemély valamelyik Bankban van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 1555 && inti == 1)
					{
						SendClientMessage(playerid, Pink, "Célszemély a San Fierroi Bank hátsó részlegén van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 143 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "Célszemély a Katona Bázison van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 108 && inti == 1)
					{
						SendClientMessage(playerid, Pink, "Célszemély az Olasz Borozóban van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 111 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "Célszemély az Oktatóknál van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 112 && inti == 0)
					{
						SendClientMessage(playerid, Pink, "Célszemély az Aztecas baseball csapat telephelyén van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(vw == 0 && inti == 4)
					{
						SendClientMessage(playerid, Pink, "Célszemély az Északi Benzinkúti 24/7-ben van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 18)
					{
						if(vw == 150)
						{
							SendClientMessage(playerid, Pink, "Célszemély a Déli Benzinkúti 24/7-ben van!");
							Fbios[player] = playerid;
							return 0;
						}
						if(vw == 270)
						{
							SendClientMessage(playerid, Pink, "Célszemély az LS-SF közötti Benzinkút 24/7-ben van!");
							Fbios[player] = playerid;
							return 0;
						}
						else
						{
							SendClientMessage(playerid, Pink, "Célszemély egy 24/7-ben van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 3)
					{
						if(PlayerToPoint(30, player, 296.919982,-108.071998,1001.515625))
						{
							SendClientMessage(playerid, Pink, "Célszemély LS GS be van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 384.808624,173.804992,1008.382812))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 369.8337,162.5357,1014.1893))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 368.2852,162.4965,1019.9844))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 370.1142,163.1876,1025.7891))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 833.269775,10.588416,1004.179687))
						{
							SendClientMessage(playerid, Pink, "Célszemély a Lottozóban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 207.054992,-138.804992,1003.507812))
						{
							SendClientMessage(playerid, Pink, "Célszemély a Bincoban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 288.745971,169.350997,1007.171875))
						{
							SendClientMessage(playerid, Pink, "Célszemély az FBI HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 1494.325195,1304.942871,1093.289062))
						{
							SendClientMessage(playerid, Pink, "Célszemély az Oktató HQ-n van!");
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
							SendClientMessage(playerid, Pink, "Célszemély az LSPD HQ-n van!");
							Fbios[player] = playerid;
							return 0;	
						}
					}
					else if(inti == 4)
					{
						SendClientMessage(playerid, Pink, "Célszemély SF GS be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 5)
					{
						if(PlayerToPoint(50, player, 72.111999,-3.898649,1000.728820))
						{
							SendClientMessage(playerid, Pink, "Célszemély LS Edzõterembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 373.825653,-117.270904,1001.499511))
						{
							SendClientMessage(playerid, Pink, "Célszemély az egyik pizzázóban van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 6)
					{
						if(PlayerToPoint(50, player, 774.213989,-48.924297,1000.585937))
						{
							SendClientMessage(playerid, Pink, "Célszemély Cobra Edzõterembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 246.783996,63.900199,1003.640625))
						{
							SendClientMessage(playerid, Pink, "Célszemély LSPD-n van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 9)
					{
						SendClientMessage(playerid, Pink, "Célszemély az egyik csirkésbe van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 10)
					{
						if(PlayerToPoint(50, player, 375.962463,-65.816848,1001.507812))
						{
							SendClientMessage(playerid, Pink, "Célszemély az egyik Burger Shotba van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, -975.975708,1060.983032,1345.671875))
						{
							SendClientMessage(playerid, Pink, "Célszemély az RC Gyakorlopályán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, 246.375991,109.245994,1003.218750))
						{
							if(vw == 20)
							{
								SendClientMessage(playerid, Pink, "Célszemély VPOP HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
							else
							{
								SendClientMessage(playerid, Pink, "Célszemély SFPD HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
						}
					}
					else if(inti == 1)
					{
						SendClientMessage(playerid, Pink, "Célszemély a Húsfeldolgozóban van!((Valameik Maffia Inti))");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 17)
					{
						SendClientMessage(playerid, Pink, "Célszemély Alhambrába van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 2)
					{
						Msg(playerid, "Gyárban van, de csak OOC tudod!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 11)
					{
						SendClientMessage(playerid, Pink, "Célszemély Groove Kocsmában van!");
						Fbios[player] = playerid;
						return 0;
					}
				}
				else
				{
					SendFormatMessage(playerid, Pink, "Célszemély Class utca %d szám alatt tartozkodik!", vw);
					Fbios[player] = playerid;
					return 0;
				}
			}
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(player, X,Y,Z);
			SetPlayerMarkerForPlayer(playerid, player, Pink);
			SendClientMessage(playerid, Pink, "Célszemély Lenyomozva!");
			SendClientMessage(playerid, Pink, "* Kikapcsoláshoz: lenyomozás kikapcsol");
			Fbicelpont[playerid] = player;
			Fbios[player] = playerid;
			return 0;
		}
		else if(egyezik(tmp, "lehallgatás"))
		{
			tmp = strtok(text, idx);
			new Allomas = strval(tmp);
			if(!strlen(tmp)) return !Msg(playerid, "lehallgatás [rádióállomás]");
			if(egyezik(tmp, "kikapcsol") || egyezik(tmp, "off"))
			{
				Msg(playerid, "Kikapcsolva");
				RadioHallgatas[playerid] = NINCS;
				return 0;
			}
			if(Allomas < 1 || Allomas > MAX_FRAKCIO)
			{
				SendFormatMessage(playerid, Pink, "* Rádió állomások: 1-%d", MAX_FRAKCIO);
				return 0;
			}
			RadioHallgatas[playerid] = Allomas;
			SendFormatMessage(playerid, Pink, "* Csatlakozás sikeres. Állomás: %d", Allomas);
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "=============[Rádió Adatok]=============");
			new szneve[32];
			new szam = RadioHallgatas[playerid] - 1;
			szneve = Szervezetneve[szam][0];
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Szervezet Neve: %s", szneve);
			new menyien = 0;
			for(new oj = 0; oj < MAX_PLAYERS; oj++)
			{
				if(PlayerInfo[oj][pMember] == RadioHallgatas[playerid] || PlayerInfo[oj][pLeader] == RadioHallgatas[playerid]) menyien++;
			}
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* A rádiót %d-an/en hallgatják.", menyien);
			SendClientMessage(playerid, Pink, "* Kikapcsoláshoz: lehallgatás kikapcsol");
			return 0;
		}
		else if(egyezik(tmp, "adatnézés") || egyezik(tmp, "adatnezes"))
		{
			tmp = strtok(text, idx);
			new player = ReturnUser(tmp);
			if(!strlen(tmp)) return !Msg(playerid, "Adatnézés [Név/ID]");
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(PlayerInfo[player][pArrested] < 1) return !Msg(playerid, "Róla nincs akta, mivel még nem volt lecsukva.");
			Akta(playerid, player);
			return 0;
		}
		else if(egyezik(tmp, "clearplayer"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Clearplayer [Név/ID]");
			new player = ReturnUser(tmp);
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(player == playerid) return !Msg(playerid, "Magadról nem!");
			SendFormatMessage(playerid, Pink, "ClassRPG: Sikeresen törölted %s körözését!", ICPlayerName(player));
			ClearPlayerCrime(player);
			Msg(player, "Az FBI törölte rólad a körözést.");
			return 0;
		}
		else if(egyezik(tmp, "clearvehicle"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Clearvehicle [Név/ID]");
			new car = strval(tmp);
			if(car == INVALID_VEHICLE_ID) return !Msg(playerid, "Hibás név!");
			SendFormatMessage(playerid, Pink, "ClassRPG: Sikeresen törölted a CLS-%d rendszámú jármû körözését!", car);
			ClearVehicleCrime(car);
			return 0;
		}
		else if(egyezik(tmp, "telefonlehallgatás"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Telefonlehallgatás [Név/ID]");
			new player = ReturnUser(tmp);
			if(egyezik(tmp, "kikapcsol") || egyezik(tmp, "off"))
			{
				Msg(playerid, "Kikapcsolva");
				Lehallgat[playerid] = NINCS;
				return 0;
			}
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(player == playerid) return !Msg(playerid, "-.-'");
			Lehallgat[playerid] = player;
			SendClientMessage(playerid, Pink, "Mostantól ha telefonál, hallani fogod!");
			return 0;
		}
		else if(egyezik(tmp, "bezaras") || egyezik(tmp, "bezárás"))
		{
			if(!Munkarang(playerid, 10)) return !Msg(playerid, "Access Denied. 10es rang szükséges.");
			if(Fbibelepes != 0) return !Msg(playerid, "Zárva van vagy behatolás történt(használd a deaktiválást).");
			Fbibelepes = 2;
			Msg(playerid, "Bezárva.");
			return 0;
		}
		else if(egyezik(tmp, "nyitas") || egyezik(tmp, "nyitás"))
		{
			if(!Munkarang(playerid, 10)) return !Msg(playerid, "Access Denied. 10es rang szükséges.");
			if(Fbibelepes != 2) return !Msg(playerid, "Nyitva van vagy Behatolás történt(használd a deaktiválást).");
			Fbibelepes = 0;
			Msg(playerid, "Nyitva.");
			return 0;
		}
		else if(egyezik(tmp, "poloska"))
		{
			tmp = strtok(text, idx);
			new player = ReturnUser(tmp);
			if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang szükséges.");
			if(player == INVALID_PLAYER_ID || player == playerid) return !Msg(playerid, "Hibás név!");
			if(GetDistanceBetweenPlayers(playerid, player) > 2) return !Msg(playerid, "Nagyon közelnek kell lenned a célponthoz!");
			if(!strlen(tmp)) return !Msg(playerid, "Poloska [Név/ID]");
			if(!Poloskazott[player])
			{
				Poloskazott[player] = true;
				Poloskazta[playerid] = player;
				Msg(playerid, "Sikeresen ráraktad a poloskát a célpontra!");
				Cselekves(playerid, "csinált valamit...", 1);
			}
			else
			{
				Poloskazott[player] = false;
				Poloskazta[playerid] = NINCS;
				Msg(playerid, "Sikeresen levetted a poloskát a célpontról!");
				Cselekves(playerid, "csinált valamit...", 1);
			}
			return 0;
		}
		else if(egyezik(tmp, "poloskabe"))
		{
			if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang szükséges.");
			if(Poloskazta[playerid] == NINCS) return !Msg(playerid, "Senkire sem raktál poloskát!");
			Msg(playerid, "Poloska bekapcsolva!");
			Poloska[playerid] = true;
			return 0;
		}
		else if(egyezik(tmp, "poloskaki"))
		{
			if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang szükséges.");
			if(Poloskazta[playerid] == NINCS) return !Msg(playerid, "Senkire sem raktál poloskát!");
			Msg(playerid, "Poloska kikapcsolva!");
			Poloska[playerid] = false;
			return 0;
		}
		else
		{
			SendClientMessage(playerid, Pink, "Lehetõségek:");
			SendClientMessage(playerid, Pink, "| Clearplayer - Clearvehicle");
			SendClientMessage(playerid, Pink2, "| Aktiválás - Deaktiválás");
			SendClientMessage(playerid, Pink, "| Bankszámla - Adatnézés");
			SendClientMessage(playerid, Pink2, "| Lehallgatás - Jelszó");
			SendClientMessage(playerid, Pink, "| Lenyomozás - Telefonlehallgatás");
			if(Munkarang(playerid, 2)) SendClientMessage(playerid, Pink2, "| Álnév");
			if(Munkarang(playerid, 3))
			{
				SendClientMessage(playerid, Pink, "| Beépülés");
				SendClientMessage(playerid, Pink2, "| Poloska - [be/ki]");
			}
			if(Munkarang(playerid, 6)) SendClientMessage(playerid, Pink, "| Rendõrfelfüggesztés");
			if(Munkarang(playerid, 10)) SendClientMessage(playerid, Pink2, "| Bezárás - Nyitás");
			SendClientMessage(playerid, Pink, "							                Logout					");
			return 0;
		}
	}
	if(CIABelepve[playerid] == 1)
	{
		new idx;
	    tmp = strtok(text, idx);
		if(egyezik(tmp, "álnév") || egyezik(tmp, "alnev"))
		{
			//if(!Munkarang(playerid, 2) && !FBIAlnev) return !Msg(playerid, "Access Denied. 2-es rang szükséges.");
			
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
				Msg(playerid,"Használat: álnev [újnév]");
				return 0;
			}
			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] != 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "Újra a régi neved van!");
				PlayerInfo[playerid][pHamisNev] = 0;
				return 0;
			}

			if(strlen(result) > MAX_PLAYER_NAME)
			{
				SendFormatMessage(playerid, COLOR_GRAD1, "Maximum %d karakter!", MAX_PLAYER_NAME);
				return 0;
			}
			PlayerInfo[playerid][pHamisNev] = result;
			format(string, sizeof(string), "Az új álneved mostantól %s!", result);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 0;
		}
		else if(egyezik(tmp, "bankszámla") || egyezik(tmp, "bankszamla"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "bankszámla [számlaszám/név]");
			//new uzenet[100];
			new bsz = strval(tmp);
			new player;
			if(BankSzamla(bsz) != NINCS) 
				player = BankSzamla(bsz);
			else
				player=ReturnUser(tmp);
			
			if(player == INVALID_PLAYER_ID)
				return Msg(playerid, "Nincs ilyen bankszámlaszám/név");
			
			if(PlayerInfo[player][pZarolva] == 1)
			{
				Msg(playerid, "Feloldottad a zárolást a számláról.");
				//ormat(uzenet, "PDA Üzenet: %s feloldotta a zárolást egy bankszámláról(Számlaszám: %d)", PlayerName(playerid), bsz);
				SendRadioMessageFormat(FRAKCIO_CIA, Pink, "PDA Üzenet: %s feloldotta a zárolást egy bankszámláról(Számlaszám: %d)", ICPlayerName(playerid), bsz);
				PlayerInfo[player][pZarolva] = 0;
				Msg(player, "A CIA feloldotta a zárolást a számládról.");
				return 0;
			}
			if(PlayerInfo[player][pZarolva] == 0)
			{
				Msg(playerid, "Lezároltad a számlát.");
				//Format(uzenet, "PDA Üzenet: %s lezárt egy számlát(Számlaszám: %d)", PlayerName(playerid), bsz);
				SendRadioMessageFormat(FRAKCIO_CIA, Pink, "PDA Üzenet: %s lezárt egy számlát(Számlaszám: %d)", ICPlayerName(playerid), bsz);
				PlayerInfo[player][pZarolva] = 1;
				Msg(player, "A CIA lezárolta a számlád.");
				return 0;
			}
		}
		else if(egyezik(tmp, "beépülés") || egyezik(tmp, "beepules"))
		{
			tmp = strtok(text, idx);
			//if(!Munkarang(playerid, 3) && !FBIBeepules) return !Msg(playerid, "Access Denied. 3as rang szükséges.");
			if(!strlen(tmp)) return !Msg(playerid, "beépülés [ruha]");
			new ruha = strval(tmp);
			new kocsi = GetClosestVehicle(playerid);
			if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 3.0) return !Msg(playerid, "Csak Szolgálati Jármû mellet.");
			if(!IsValidSkin(ruha)) return !Msg(playerid, "Nincs ilyen ruha!");
			SetPlayerSkin(playerid, ruha);
			SendClientMessage(playerid, Pink, "Beépülés Sikeres.");
			//new uzi[128];
			//Format(uzi, "PDA Üzenet: %s felvett egy álruhát.", PlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_CIA, Pink, "Laptop Üzenet: %s felvett egy álruhát.", ICPlayerName(playerid));
			return 0;
		}
		/*else if(egyezik(tmp, "deaktiválás") || egyezik(tmp, "deaktivalas"))
		{
			if(Fbibelepes != 1 && Fbibelepes != 3) return !Msg(playerid, "Nem volt Behatolás/ A rendszer nincs Aktiválva.");
			Fbibelepes = 0;
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 9.00000, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 5.00000, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 5.33860, 4);
			if(Fbibelepes == 1)
			{
				//format(string, sizeof(string), "PDA Üzenet: System Deactivated!");
				SendMessage(SEND_MESSAGE_RADIO, "PDA Üzenet: System Deactivated!", Pink, FRAKCIO_FBI);
			}
			Msg(playerid, "System Deactivated.");
			return 0;
		}
		else if(egyezik(tmp, "aktiválás") || egyezik(tmp, "aktivalas"))
		{
			if(Fbibelepes == 3) return !Msg(playerid, "A rendszer aktiválva van.");
			MoveDynamicObject(Fbilezaro1, 1786.58167, -1301.24500, 12.78430, 4);
			MoveDynamicObject(Fbilezaro2, 1790.85022, -1295.70972, 12.33860, 4);
			MoveDynamicObject(Fbilezaro3, 1799.87952, -1295.73022, 12.33860, 4);
			Fbibelepes = 3;
			Msg(playerid, "System Activated");
			return 0;
		}*/
		else if(egyezik(tmp, "rendõrfelfüggesztés") || egyezik(tmp, "rendorfelfuggesztes"))
		{
			tmp = strtok(text, idx);
			//if(!Munkarang(playerid, 5)) return !Msg(playerid, "Access Denied. 6os rang szükséges.");
			if(!strlen(tmp)) return !Msg(playerid, "Rendõrfelfüggesztés [Név/ID]");
			new zseka = ReturnUser(tmp);
			if(zseka == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(!IsACop(zseka)) return !Msg(playerid, "A Játékos nem Rendõr!");
			SendClientMessage(zseka, COLOR_LIGHTBLUE, "A CIA felfüggesztett! Ismét civil vagy.");
			PlayerInfo[zseka][pLeader] = 0;
			PlayerInfo[zseka][pMember] = 0;
			PlayerInfo[zseka][pRank] = 0;
			PlayerInfo[zseka][pChar] = 0;
			PlayerInfo[zseka][pSwattag] = 0;
			PlayerInfo[zseka][pSwatRang] = 0;

			strcpy(PlayerInfo[zseka][pFrakcioTiltOk], "Felfüggesztés hatóság által", 64);
         	PlayerInfo[zseka][pFrakcioTiltIdo]=25;

			new rand = random(sizeof(CIV));
			SetSpawnInfo(zseka, SPAWNID, PlayerInfo[zseka][pModel],0.0,0.0,0.0,0,0,0,0,0,0,0);
			PlayerInfo[zseka][pModel] = CIV[rand];
			
			SpawnPlayer(zseka);
			SendFormatMessage(playerid, Pink, "%s felfüggesztve!", ICPlayerName(zseka));
			//new uzi[128];
			//Format(uzi, "PDA Üzenet: %s felfüggesztette %s.", PlayerName(playerid), PlayerName(zseka));
			SendRadioMessageFormat(FRAKCIO_CIA, Pink, "Laptop Üzenet: %s felfüggesztette %s.", ICPlayerName(playerid), ICPlayerName(zseka));
			return 0;
		}
		else if(egyezik(tmp, "jelszó") || egyezik(tmp, "jelszo"))
		{
			SendFormatMessage(playerid, Pink, "A jelszó most %s.", FrakcioInfo[FRAKCIO_CIA][fJelszo]);
			return 0;
		}
		else if(egyezik(tmp, "logout"))
		{
			SendFormatMessage(playerid, Pink, "Server Disconnected. Jó munkát %s Ügynök.", ICPlayerName(playerid));
			CIABelepve[playerid] = 0;
			return 0;
		}
		else if(egyezik(tmp, "lenyomozás") || egyezik(tmp, "lenyomozas"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Lenyomozás [Név/ID/Kikapcsol]");
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
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(PlayerInfo[player][pPnumber] == 0 && !PlayerInfo[player][pLaptopBe] || !PlayerInfo[player][pLaptop]) return !Msg(playerid, "Nincs telefonja vagy laptopja!");
			new vw = GetPlayerVirtualWorld(player);
			new inti = GetPlayerInterior(player);
			if(vw != 0 || inti != 0)
			{
				if(Hazbanvan[player] == 0)
				{
					if(inti == 18)
					{
						SendClientMessage(playerid, Pink, "Célszemély az egyik 24/7 be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 3)
					{
						if(PlayerToPoint(30, player, 296.919982,-108.071998,1001.515625))
						{
							SendClientMessage(playerid, Pink, "Célszemély LS GS be van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 384.808624,173.804992,1008.382812))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 369.8337,162.5357,1014.1893))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 368.2852,162.4965,1019.9844))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 370.1142,163.1876,1025.7891))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 833.269775,10.588416,1004.179687))
						{
							SendClientMessage(playerid, Pink, "Célszemély a Lottozóban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 207.054992,-138.804992,1003.507812))
						{
							SendClientMessage(playerid, Pink, "Célszemély a Bincoban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 288.745971,169.350997,1007.171875))
						{
							SendClientMessage(playerid, Pink, "Célszemély az FBI HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 1494.325195,1304.942871,1093.289062))
						{
							SendClientMessage(playerid, Pink, "Célszemély az Oktató HQ-n van!");
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
						SendClientMessage(playerid, Pink, "Célszemély SF GS be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 5)
					{
						if(PlayerToPoint(50, player, 72.111999,-3.898649,1000.728820))
						{
							SendClientMessage(playerid, Pink, "Célszemély LS Edzõterembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 373.825653,-117.270904,1001.499511))
						{
							SendClientMessage(playerid, Pink, "Célszemély az egyik pizzázóban van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 6)
					{
						if(PlayerToPoint(50, player, 774.213989,-48.924297,1000.585937))
						{
							SendClientMessage(playerid, Pink, "Célszemély Cobra Edzõterembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 246.783996,63.900199,1003.640625))
						{
							SendClientMessage(playerid, Pink, "Célszemély LSPD-n van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 9)
					{
						SendClientMessage(playerid, Pink, "Célszemély az egyik csirkésbe van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 10)
					{
						if(PlayerToPoint(50, player, 375.962463,-65.816848,1001.507812))
						{
							SendClientMessage(playerid, Pink, "Célszemély az egyik Burger Shotba van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, -975.975708,1060.983032,1345.671875))
						{
							SendClientMessage(playerid, Pink, "Célszemély az RC Gyakorlopályán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, 246.375991,109.245994,1003.218750))
						{
							if(vw == 20)
							{
								SendClientMessage(playerid, Pink, "Célszemély VPOP HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
							else
							{
								SendClientMessage(playerid, Pink, "Célszemély SFPD HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
						}
					}
					else if(inti == 1)
					{
						SendClientMessage(playerid, Pink, "Célszemély a Húsfeldolgozóban van!((Valameik Maffia Inti))");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 17)
					{
						SendClientMessage(playerid, Pink, "Célszemély Alhambrába van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 2)
					{
						Msg(playerid, "Gyárban van, de csak OOC tudod!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 11)
					{
						SendClientMessage(playerid, Pink, "Célszemély Groove Kocsmában van!");
						Fbios[player] = playerid;
						return 0;
					}
				}
				else
				{
					SendFormatMessage(playerid, Pink, "Célszemély Class utca %d szám alatt tartozkodik!", vw);
					Fbios[player] = playerid;
					return 0;
				}
			}
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(player, X,Y,Z);
			SetPlayerMarkerForPlayer(playerid, player, Pink);
			SendClientMessage(playerid, Pink, "Célszemély Lenyomozva!");
			SendClientMessage(playerid, Pink, "* Kikapcsoláshoz: lenyomozás kikapcsol");
			Fbicelpont[playerid] = player;
			Fbios[player] = playerid;
			return 0;
		}
		else if(egyezik(tmp, "lehallgatás"))
		{
			tmp = strtok(text, idx);
			new Allomas = strval(tmp);
			if(!strlen(tmp)) return !Msg(playerid, "lehallgatás [rádióállomás]");
			if(egyezik(tmp, "kikapcsol") || egyezik(tmp, "off"))
			{
				Msg(playerid, "Kikapcsolva");
				RadioHallgatas[playerid] = NINCS;
				return 0;
			}
			if(Allomas < 1 || Allomas > MAX_FRAKCIO)
			{
				SendFormatMessage(playerid, Pink, "* Rádió állomások: 1-%d", MAX_FRAKCIO);
				return 0;
			}
			RadioHallgatas[playerid] = Allomas;
			SendFormatMessage(playerid, Pink, "* Csatlakozás sikeres. Állomás: %d", Allomas);
			SendClientMessage(playerid, COLOR_LIGHTGREEN, "=============[Rádió Adatok]=============");
			new szneve[32];
			new szam = RadioHallgatas[playerid] - 1;
			szneve = Szervezetneve[szam][0];
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Szervezet Neve: %s", szneve);
			new menyien = 0;
			for(new oj = 0; oj < MAX_PLAYERS; oj++)
			{
				if(PlayerInfo[oj][pMember] == RadioHallgatas[playerid] || PlayerInfo[oj][pLeader] == RadioHallgatas[playerid]) menyien++;
			}
			SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* A rádiót %d-an/en hallgatják.", menyien);
			SendClientMessage(playerid, Pink, "* Kikapcsoláshoz: lehallgatás kikapcsol");
			return 0;
		}
		else if(egyezik(tmp, "adatnézés") || egyezik(tmp, "adatnezes"))
		{
			tmp = strtok(text, idx);
			new player = ReturnUser(tmp);
			if(!strlen(tmp)) return !Msg(playerid, "Adatnézés [Név/ID]");
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(PlayerInfo[player][pArrested] < 1) return !Msg(playerid, "Róla nincs akta, mivel még nem volt lecsukva.");
			Akta(playerid, player);
			return 0;
		}
		else if(egyezik(tmp, "clearplayer"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Clearplayer [Név/ID]");
			new player = ReturnUser(tmp);
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(player == playerid) return !Msg(playerid, "Magadról nem!");
			SendFormatMessage(playerid, Pink, "ClassRPG: Sikeresen törölted %s körözését!", ICPlayerName(player));
			ClearPlayerCrime(player);
			Msg(player, "A CIA törölte rólad a körözést.");
			return 0;
		}
		else if(egyezik(tmp, "clearcar"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Clearcar [Név/ID]");
			new car = strval(tmp);
			if(car == INVALID_VEHICLE_ID) return !Msg(playerid, "Hibás név!");
			SendFormatMessage(playerid, Pink, "ClassRPG: Sikeresen törölted a CLS-%d rendszámú jármû körözését!", car);
			ClearVehicleCrime(car);
			return 0;
		}
		else if(egyezik(tmp, "telefonlehallgatás"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Telefonlehallgatás [Név/ID]");
			new player = ReturnUser(tmp);
			if(egyezik(tmp, "kikapcsol") || egyezik(tmp, "off"))
			{
				Msg(playerid, "Kikapcsolva");
				Lehallgat[playerid] = NINCS;
				return 0;
			}
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(player == playerid) return !Msg(playerid, "-.-'");
			Lehallgat[playerid] = player;
			SendClientMessage(playerid, Pink, "Mostantól ha telefonál, hallani fogod!");
			return 0;
		}
		/*else if(egyezik(tmp, "bezaras") || egyezik(tmp, "bezárás"))
		{
			if(!Munkarang(playerid, 10)) return !Msg(playerid, "Access Denied. 10es rang szükséges.");
			if(Fbibelepes != 0) return !Msg(playerid, "Zárva van vagy behatolás történt(használd a deaktiválást).");
			Fbibelepes = 2;
			Msg(playerid, "Bezárva.");
			return 0;
		}
		else if(egyezik(tmp, "nyitas") || egyezik(tmp, "nyitás"))
		{
			if(!Munkarang(playerid, 10)) return !Msg(playerid, "Access Denied. 10es rang szükséges.");
			if(Fbibelepes != 2) return !Msg(playerid, "Nyitva van vagy Behatolás történt(használd a deaktiválást).");
			Fbibelepes = 0;
			Msg(playerid, "Nyitva.");
			return 0;
		}*/
		else if(egyezik(tmp, "poloska"))
		{
			tmp = strtok(text, idx);
			new player = ReturnUser(tmp);
			//if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang szükséges.");
			if(player == INVALID_PLAYER_ID || player == playerid) return !Msg(playerid, "Hibás név!");
			if(GetDistanceBetweenPlayers(playerid, player) > 2) return !Msg(playerid, "Nagyon közelnek kell lenned a célponthoz!");
			if(!strlen(tmp)) return !Msg(playerid, "Poloska [Név/ID]");
			if(!Poloskazott[player])
			{
				Poloskazott[player] = true;
				Poloskazta[playerid] = player;
				Msg(playerid, "Sikeresen ráraktad a poloskát a célpontra!");
				Cselekves(playerid, "csinált valamit...", 1);
			}
			else
			{
				Poloskazott[player] = false;
				Poloskazta[playerid] = NINCS;
				Msg(playerid, "Sikeresen levetted a poloskát a célpontról!");
				Cselekves(playerid, "csinált valamit...", 1);
			}
			return 0;
		}
		else if(egyezik(tmp, "poloskabe"))
		{
			//if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang szükséges.");
			if(Poloskazta[playerid] == NINCS) return !Msg(playerid, "Senkire sem raktál poloskát!");
			Msg(playerid, "Poloska bekapcsolva!");
			Poloska[playerid] = true;
			return 0;
		}
		else if(egyezik(tmp, "poloskaki"))
		{
			//if(!Munkarang(playerid, 2)) return !Msg(playerid, "Access Denied. 2as rang szükséges.");
			if(Poloskazta[playerid] == NINCS) return !Msg(playerid, "Senkire sem raktál poloskát!");
			Msg(playerid, "Poloska kikapcsolva!");
			Poloska[playerid] = false;
			return 0;
		}
		else
		{
			SendClientMessage(playerid, Pink, "Lehetõségek:");
			SendClientMessage(playerid, Pink, "| Clearplayer - Clearcar");
			SendClientMessage(playerid, Pink2, "| Aktiválás - Deaktiválás");
			SendClientMessage(playerid, Pink, "| Bankszámla - Adatnézés");
			SendClientMessage(playerid, Pink2, "| Lehallgatás - Jelszó");
			SendClientMessage(playerid, Pink, "| Lenyomozás - Telefonlehallgatás");
			SendClientMessage(playerid, Pink2, "| Álnév");
			SendClientMessage(playerid, Pink, "| Beépülés");
			SendClientMessage(playerid, Pink2, "| Poloska - [be/ki]");
			SendClientMessage(playerid, Pink, "| Rendõrfelfüggesztés");
			if(Munkarang(playerid, 10)) SendClientMessage(playerid, Pink2, "| Bezárás - Nyitás");
			SendClientMessage(playerid, Pink, "							                Logout					");
			return 0;
		}
	}
	if(Autocp[playerid] == 22)
	{
		if(egyezik(text, "igen"))
		{
			Msg(playerid, "Rendben végeztetek az órával, a tanítvány megkapja a jogosítványát.");
			Autocp[playerid] = 0;

			new tanulo = OnlineUID(Jogsineki[playerid]);
			
			if(Vizsgafajta[tanulo] == 5)
			{
				Msg(tanulo, "Gratulálunk! Megkaptad az Engedélyed!");
			}
			else
			{
				Msg(tanulo, "Gratulálunk! Megkaptad a Jogosítványodat!");
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
			Msg(playerid, "Rendben végeztetek az órával, a tanítvány nem fog jogosítványt kapni.");
			Vizsgafajta[playerid] = 0;
			Autocp[playerid] = 0;
			new tanulo = OnlineUID(Jogsineki[playerid]);
			Msg(tanulo, "Sajnos nem mentél át a vizsgán! Legközelebb 2 hónap((óra)) múlva vizsgázhatsz!!");
			strmid(PlayerInfo[tanulo][pJogsiTiltOk], "Oktatás: vizsgán való bukás", 0, strlen("Oktatás: vizsgán való bukás"), 128);
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
				    format(string, sizeof(string), "Pap: %s elfogadod %s-t feleségedért? (írd 'igen'.", giveplayer,sendername);
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
						format(string, sizeof(string), "Pap: %s és %s házastársaknak nyilványítalak titeket...Férj & Feleség, megcsókolhatod.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Pap: %s és %s házastársaknak nyilványítalak titeket...Férj & Feleség, megcsókolhatod.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Házasság: Van egy új házaspárunk, %s & %s összeházasodott.", sendername, giveplayer);
						SendClientMessageToAll(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 1 && PlayerInfo[ProposedTo[playerid]][pSex] == 1)
					{
					    format(string, sizeof(string), "Pap: %s és %s meleg társaknak nyilványítalak titeket...Férj & Férj, megcsókolhatod.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Pap: %s és %s meleg társaknak nyilványítalak titeket...Férj & Férj, megcsókolhatod.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Házasság: Van egy új meleg párunk, %s & %s összeházasodott.", sendername, giveplayer);
						SendClientMessageToAll(COLOR_WHITE, string);
					}
					else if(PlayerInfo[playerid][pSex] == 2 && PlayerInfo[ProposedTo[playerid]][pSex] == 2)
					{
					    format(string, sizeof(string), "Pap: %s és %s meleg társaknak nyilványítalak titeket...Feleség & Feleség, megcsókolhatod.", sendername, giveplayer);
						SendClientMessage(playerid, COLOR_WHITE, string);
				   		format(string, sizeof(string), "Pap: %s és %s meleg társaknak nyilványítalak titeket...Feleség & Feleség, megcsókolhatod.", giveplayer, sendername);
						SendClientMessage(ProposedTo[playerid], COLOR_WHITE, string);
						format(string, sizeof(string), "Házasság: Van egy új leszbikus pársunk, %s & %s összeházasodott.", sendername, giveplayer);
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
					format(string, sizeof(string), "* Nem akarod házastársul %s, nem 'igen'-t irtál.",giveplayer);
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    format(string, sizeof(string), "* %s nem akart elvenni, nem 'igen'-t írt.",sendername);
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
					format(string, sizeof(string), "* Nem akarod házastársul %s, nem 'igen'-t irtál.",giveplayer);
				    SendClientMessage(playerid, COLOR_YELLOW, string);
				    format(string, sizeof(string), "* %s nem akart elvenni, nem 'igen'-t írt.",sendername);
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
		if(egyezik(tmp, "versenyzõk") || egyezik(tmp, "versenyzok"))
		{
			if(!IsHitman(playerid)) return 1;

			SendFormatMessage(playerid, COLOR_WHITE, "Versenyzõk száma: %d | Hátralévõ idõ: %d másodperc(%d Perc)", BVJatekosok, BVIdo, BVIdo/60);

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

				SendFormatMessage(playerid, COLOR_WHITE, "Név: %s | Fegyver: %s | Lõszer: %d | Élet: %.1f | Pajzs: %.1f", PlayerName(x), aWeaponNames[GetPlayerWeapon(x)], loszer, elet, pajzs);
			}

			return 0;
		}
	    if(egyezik(tmp, "vérdíjak") || egyezik(tmp, "verdijak"))
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
				return !Msg(playerid, "Nincs vérdíj senkin", false, COLOR_GREY);
			return 0;
		}

		if(egyezik(tmp, "cian"))
		{
			Msg(playerid, "Megmérgezted magad");
			SetHealth(playerid, 0);
			return 0;
		}

		if(egyezik(tmp, "célpontok") || egyezik(tmp, "celpontok"))
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
			if(emberek < 1) SendClientMessage(playerid, COLOR_GREY,"Nincs vérdíj senkin");
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
							SendFormatMessage(playerid, COLOR_LIGHTRED, "- [%d]%s [%s] - még %d óráig",x, PlayerName(x), PlayerInfo[x][pHitmanNev], floatround( (PlayerInfo[x][pHitmanIdo] - time ) / 3600 , floatround_ceil));
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
				Msg(playerid, "A bomba hatástalanítva");
				TavoliBomba[playerid] = 0;
				return 0;
			}
			new kocsim = GetClosestVehicle(playerid);
			new Float:tav = GetPlayerDistanceFromVehicle(playerid, kocsim);
			if(tav >= 4)
			{
				SendClientMessage(playerid, COLOR_LIGHTRED, "A közeledben nincs jármû!");
				return 0;
			}
			if(TavoliBomba[playerid] != 0) return !Msg(playerid, "Ebbõl a bombából csak egyett használhatsz!");
			Msg(playerid, "Bomba telepítve! Robbantáshoz /élesít");
			TavoliBomba[playerid] = kocsim;
			return 0;
		}
		if(egyezik(tmp, "bomba"))
		{
			new kocsim = GetClosestVehicle(playerid);
			new Float:tav = GetPlayerDistanceFromVehicle(playerid, kocsim);
			if(tav >= 4)
			{
			SendClientMessage(playerid, COLOR_LIGHTRED, "A közeledben nincs jármû!");
			return 0;
			}
			if(VanBombaBenne[kocsim] != NINCS) 
			{
			VanBombaBenne[kocsim] = NINCS;
			return !Msg(playerid, "Bomba hatástalanítva!");
			}
			Msg(playerid, "Bomba telepítve, ha beindítják a motort robban!");
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
				Format(uzi, "<< %s befejezte a melót >>", PlayerInfo[playerid][pHitmanNev]);
				HitmanDuty[playerid] = 0;
				NoName[playerid] = false;
			}
			else
			{
				Format(uzi, "<< %s munkába állt >>", PlayerInfo[playerid][pHitmanNev]);
				HitmanDuty[playerid] = 1;
				NoName[playerid] = true;
			}
			SendMessage(SEND_MESSAGE_HITMAN, uzi, COLOR_YELLOW);
			return 0;
		}


		if(egyezik(tmp, "ruha"))
		{
			new kocsi = GetClosestVehicle(playerid);
			if(GetPlayerDistanceFromVehicle(playerid, kocsi) > 3.0) return !Msg(playerid, "Csak Jármû mellet.");
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

		if(egyezik(tmp, "Hírdetés") || egyezik(tmp, "Hirdetes"))
		{
		    SendClientMessageToAll(COLOR_LIGHTRED, "Hitman: Gondod van valakivel? Talán félsz a zsaruktól? Bízd ránk! Gyors és Spéci munka!((/contract))");

			return 0;
		}

		if(egyezik(tmp, "alnev") || egyezik(tmp, "álnév"))
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
				SendClientMessage(playerid, COLOR_GRAD1, "Használat: alnev [újnév]");
				return 0;
			}

			if(!strlen(result) && PlayerInfo[playerid][pHamisNev] != 0)
			{
				SendClientMessage(playerid, COLOR_GRAD1, "Újra a régi neved van!");
				PlayerInfo[playerid][pHamisNev] = 0;
				return 0;
			}

			if(strlen(result) > MAX_PLAYER_NAME)
			{
				SendFormatMessage(playerid, COLOR_GRAD1, "Maximum %d karakter!", MAX_PLAYER_NAME);
				return 0;
			}

			PlayerInfo[playerid][pHamisNev] = result;
			format(string, sizeof(string), "Az új álneved mostantól %s!", result);
			SendClientMessage(playerid, COLOR_LIGHTBLUE, string);
			return 0;
		}
		else if(egyezik(tmp, "lenyomoz") || egyezik(tmp, "lenyomozas"))
		{
			tmp = strtok(text, idx);
			if(!strlen(tmp)) return !Msg(playerid, "Lenyomoz [Név/ID/Kikapcsol]");
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
			if(player == INVALID_PLAYER_ID) return !Msg(playerid, "Hibás név!");
			if(PlayerInfo[player][pPnumber] == 0) return !Msg(playerid, "Nincs telefonja!");
			new vw = GetPlayerVirtualWorld(player);
			new inti = GetPlayerInterior(player);
			if(vw != 0 || inti != 0)
			{
				if(Hazbanvan[player] == 0)
				{
					if(inti == 18)
					{
						SendClientMessage(playerid, Pink, "Célszemély az egyik 24/7 be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 3)
					{
						if(PlayerToPoint(30, player, 296.919982,-108.071998,1001.515625))
						{
							SendClientMessage(playerid, Pink, "Célszemély LS GS be van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 384.808624,173.804992,1008.382812))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 369.8337,162.5357,1014.1893))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 368.2852,162.4965,1019.9844))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 370.1142,163.1876,1025.7891))
						{
							SendClientMessage(playerid, Pink, "Célszemély Városházán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 833.269775,10.588416,1004.179687))
						{
							SendClientMessage(playerid, Pink, "Célszemély a Lottozóban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 207.054992,-138.804992,1003.507812))
						{
							SendClientMessage(playerid, Pink, "Célszemély a Bincoban van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 288.745971,169.350997,1007.171875))
						{
							SendClientMessage(playerid, Pink, "Célszemély az FBI HQ-n van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 1494.325195,1304.942871,1093.289062))
						{
							SendClientMessage(playerid, Pink, "Célszemély az Oktató HQ-n van!");
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
						SendClientMessage(playerid, Pink, "Célszemély SF GS be van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 5)
					{
						if(PlayerToPoint(50, player, 72.111999,-3.898649,1000.728820))
						{
							SendClientMessage(playerid, Pink, "Célszemély LS Edzõterembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(50, player, 373.825653,-117.270904,1001.499511))
						{
							SendClientMessage(playerid, Pink, "Célszemély az egyik pizzázóban van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 6)
					{
						if(PlayerToPoint(50, player, 774.213989,-48.924297,1000.585937))
						{
							SendClientMessage(playerid, Pink, "Célszemély Cobra Edzõterembe van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(100, player, 246.783996,63.900199,1003.640625))
						{
							SendClientMessage(playerid, Pink, "Célszemély LSPD-n van!");
							Fbios[player] = playerid;
							return 0;
						}
					}
					else if(inti == 9)
					{
						SendClientMessage(playerid, Pink, "Célszemély az egyik csirkésbe van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 10)
					{
						if(PlayerToPoint(50, player, 375.962463,-65.816848,1001.507812))
						{
							SendClientMessage(playerid, Pink, "Célszemély az egyik Burger Shotba van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, -975.975708,1060.983032,1345.671875))
						{
							SendClientMessage(playerid, Pink, "Célszemély az RC Gyakorlopályán van!");
							Fbios[player] = playerid;
							return 0;
						}
						else if(PlayerToPoint(200, player, 246.375991,109.245994,1003.218750))
						{
							if(vw == 20)
							{
								SendClientMessage(playerid, Pink, "Célszemély VPOP HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
							else
							{
								SendClientMessage(playerid, Pink, "Célszemély SFPD HQ-n van!");
								Fbios[player] = playerid;
								return 0;
							}
						}
					}
					else if(inti == 1)
					{
						SendClientMessage(playerid, Pink, "Célszemély a Húsfeldolgozóban van!((Valameik Maffia Inti))");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 17)
					{
						SendClientMessage(playerid, Pink, "Célszemély Alhambrába van!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 2)
					{
						Msg(playerid, "Gyárban van, de csak OOC tudod!");
						Fbios[player] = playerid;
						return 0;
					}
					else if(inti == 11)
					{
						SendClientMessage(playerid, Pink, "Célszemély Groove Kocsmában van!");
						Fbios[player] = playerid;
						return 0;
					}
				}
				else
				{
					SendFormatMessage(playerid, Pink, "Célszemély Class utca %d szám alatt tartozkodik!", vw);
					Fbios[player] = playerid;
					return 0;
				}
			}
			new Float:X,Float:Y,Float:Z;
			GetPlayerPos(player, X,Y,Z);
			SetPlayerMarkerForPlayer(playerid, player, Pink);
			SendClientMessage(playerid, Pink, "Célszemély Lenyomozva!");
			SendClientMessage(playerid, Pink, "* Kikapcsoláshoz: lenyomozás kikapcsol");
			return 0;
		}
		else if ((strcmp("Rendelés", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Rendelés")) || (strcmp("Rendeles", tmp, true, strlen(tmp)) == 0) && (strlen(tmp) == strlen("Rendeles")))
		{
			if(!PlayerToPoint(5.0, playerid, 2556.314, -1297.525, 1060.984))
			{
				SetPlayerCheckpoint(playerid, 2556.314, -1297.525, 1060.984, 3);
				Msg(playerid, "Nem vagy a rendelõhelyen");
				return 0;
			}
		    tmp = strtok(text, idx);
			if(!strlen(tmp))
			{
			    SendClientMessage(playerid, COLOR_WHITE, "|__________________ Fegyver csomagok __________________|");
				SendClientMessage(playerid, COLOR_GREY, "|(1) (90,000Ft) Kés, Deagle, MP5, Shotgun");
				SendClientMessage(playerid, COLOR_GREY, "|(2) (125,000Ft) Páncél, Kés, Deagle, M4, MP5, Shotgun");
				SendClientMessage(playerid, COLOR_GREY, "|(3) (150,000Ft) Páncél, Kés, Deagle, AK47, MP5, Shotgun");
				SendClientMessage(playerid, COLOR_GREY, "|(4) (200,000Ft) Páncél, Kés, Deagle, M4, MP5, Shotgun, Távcsöves");
				SendClientMessage(playerid, COLOR_GREY, "|(5) (225,000Ft) Páncél, Kés, Deagle, AK47, MP5, Shotgun, Távcsöves");
				SendClientMessage(playerid, COLOR_GREY, "|(6) (250,000Ft) Páncél, Kés, Deagle, M4, MP5, Shotgun, Távcsöves");
				SendClientMessage(playerid, COLOR_GREY, "|(7) (275,000Ft) Páncél, Kés, Hangtompítós, AK47, MP5, Shotgun, Távcsöves");
				SendClientMessage(playerid, COLOR_GREY, "|(8) (300,000Ft) Páncél, Kés, Hangtompítós, AK47, Shotgun, Távcsöves");
				SendClientMessage(playerid, COLOR_GREY, "|(9) (350,000Ft) Páncél, Kés, Hangtompítós, M4, Shotgun, Távcsöves");
				SendClientMessage(playerid, COLOR_GREY, "|(10) (400,000Ft) Páncél, Kés, Hangtompítós, AK47, Távcsöves");
				SendClientMessage(playerid, COLOR_GREY, "|(X) (30000Ft) Páncél + Egyéni fegyver > \"rendelés x [fegyver]\"");
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
						return !Msg(playerid, "Használata: rendelés 0 [fegyvernév]");

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

						// Gránátok
						case 16, 17: loszer = 15;

						// Pisztolyok
						case 22..24: loszer = 100;

						// Shotgunok, rifle, sniper
						case 25..27, 33, 34: loszer = 100;

						// Közepes gépfegyverek (mp5, tec9, uzi)
						case 29: loszer = 300;

						// Nagy gépfegyverek (m4, ak47)
						case 30, 31: loszer = 500;

						// Sok lõszeresek: spré, poroltó
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
			SendClientMessage(playerid, COLOR_YELLOW2, "| - Tagok - Hírdetés");
			SendClientMessage(playerid, COLOR_YELLOW2, "| - Vérdíjak  - Ruha - cian");
			SendClientMessage(playerid, COLOR_YELLOW2, "| - Célpontok - lenyomoz - Álnév");
			SendClientMessage(playerid, COLOR_YELLOW2, "| - Rendelés - Bilincs - bombatavol");
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
		    format(string, sizeof(string), "** %s ügyvédet hívott.", sendername);
	    	SendMessage(SEND_MESSAGE_JOB, string, TEAM_AZTECAS_COLOR, 2);
	    	SendMessage(SEND_MESSAGE_JOB, "* Menj a rendõrségre és beszélj egy rendõrrel!", TEAM_AZTECAS_COLOR, 2);
	    	SendClientMessage(playerid, COLOR_LIGHTRED, "Üzeneted továbbítottuk az ügyvédeknek!");
	    	WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
	    	return 0;
		}
		else
		{
		    SendClientMessage(playerid, COLOR_LIGHTRED, "Nincs Ügyvéd, büntetés letöltése...");
		    WantLawyer[playerid] = 0;
			CallLawyer[playerid] = 0;
		    return 0;
		}
	}
	if(TalkingLive[playerid] != 255)
	{
		GetPlayerName(playerid, sendername, sizeof(sendername));
		if(RiporterAlive[playerid] ==1){sendername="Névtelen";}
	    format(string, sizeof(string), "~~~ *ÉLÕ* %s: %s ~~~", sendername, text);
		SendMessage(SEND_MESSAGE_OOCNEWS, string, COLOR_Live);
		return 0;
	}
	if(Mobile[playerid] != 255)
	{
		//telefon beszéd
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
			SendClientMessage(playerid, COLOR_ALLDEPT, "Mentõszolgálat: Kérem röviden mondja el, hogy hol történt az eset!");
			Mobile[playerid] = 1041;
			return 0;
		}
		if(Mobile[playerid] == 1041)
		{
			strmid(MentoHelyszin[playerid], text, 0, strlen(text), 64);
			SendClientMessage(playerid, COLOR_ALLDEPT, "Mentõszolgálat: Szüksége van légiegységre? [igen]");
			Mobile[playerid] = 1042;
			return 0;
		}
		if(Mobile[playerid] == 1042)
		{
			if(egyezik(text, "igen")) MentoLegi[playerid] = 1;
			else if(egyezik(text, "nem")) MentoLegi[playerid] = 2;
			else
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "Mentõszolgálat: Igen vagy nem?");
				return 0;
			}
			SendRadioMessageFormat(FRAKCIO_MENTO, TEAM_AZTECAS_COLOR, "** %s mentõt hívott - Ahhoz hogy elfogadd, /accept medic %d", ICPlayerName(playerid), playerid);
			new szoveg[6];
			if(MentoLegi[playerid] == 2) szoveg = " nem ";
			SendRadioMessageFormat(FRAKCIO_MENTO, TEAM_AZTECAS_COLOR, "** Információk: Légiegység: %skell  Történt: %s Helyszín: %s   ", szoveg, Mento[playerid], MentoHelyszin[playerid]);
			if(OnlineTagok(FRAKCIO_MENTO) < 1)
			{
				tformat(128, "** %s mentõt hívott - Ahhoz hogy elfogadd, /accept medic %d", ICPlayerName(playerid), playerid); 
				SendMessage(SEND_MESSAGE_ONKENTES, _tmpString, TEAM_BLUE_COLOR);
				tformat(128, "** Információk: Légiegység: %skell  Történt: %s Helyszín: %s   ", szoveg, Mento[playerid], MentoHelyszin[playerid]); 
				SendMessage(SEND_MESSAGE_ONKENTES, _tmpString, TEAM_BLUE_COLOR);
			}
			Mobile[playerid] = 255;
			SendClientMessage(playerid, COLOR_ALLDEPT, "Mentõszolgálat: Azonnal indulunk! ((Várj türelmesen, ha már nem kell mentõ akkor pedig /cancel medic ))");
			SendClientMessage(playerid, COLOR_GRAD2, "Lerakták.");
			MentoHivas[playerid] = 1;
			return 0;
		}


		if(Mobile[playerid] == 1005)
		{
			strmid(CallTuzOk[playerid], text, 0, strlen(text), 128);
			SendRadioMessageFormat(FRAKCIO_TUZOLTO, TEAM_AZTECAS_COLOR, "** %s tûzoltót hívott, látod a radaron!", ICPlayerName(playerid));
			SendRadioMessageFormat(FRAKCIO_TUZOLTO, TEAM_AZTECAS_COLOR, "** Oka: %s", CallTuzOk[playerid]);

			foreach(Jatekosok, x)
				if(LMT(x, FRAKCIO_TUZOLTO)) SetPlayerMarkerForPlayer(x, playerid, COLOR_LIGHTGREEN);

			//SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Hívtál mentõt, várj a válaszra.");
			Mobile[playerid] = 255;
			CallTuz[playerid] = 300;
			SendClientMessage(playerid, COLOR_ALLDEPT, "Tûzoltók: Azonnal indulunk!");
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Hívtál tûzoltót, várj a válaszra.");
			SendClientMessage(playerid, COLOR_GRAD2, "Lerakták.");
			return 0;
		}
		
		if(Mobile[playerid] == 1003 && OnAirID == playerid)
		{
			if(SzovegEllenorzes(playerid, text, "/news", ELLENORZES_HIRDETES)) return 0;
		
			if(strcmp(RadioMusorNev,"NINCS") == 0)
				format(_tmpString, sizeof(_tmpString), "Betelefonáló %s: %s", ICPlayerName(playerid), text);
			else
				format(_tmpString, sizeof(_tmpString), "%s - Betelefonáló %s: %s", RadioMusorNev, ICPlayerName(playerid), text);
			SendMessage(SEND_MESSAGE_OOCNEWS, _tmpString, COLOR_NEWS);
			return 0;
		}


		if(Mobile[playerid] == 912)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "911: Elnézést de nem értem.");
				return 0;
			}
			strmid(Bejelent[playerid], text, 0, strlen(text), 255);
			SendClientMessage(playerid, COLOR_DBLUE, "Rendõrség: Tudja az elkövetõ nevét? Ha nem csak mondja: ''nem''.");
			Mobile[playerid] = 913;
			return 0;
		}

		if(Mobile[playerid] == 913)
		{
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COLOR_ALLDEPT, "Rendõrség: Sajnálom... nem értem");
				return 0;
			}

			//new wanted[128];

			if(strcmp("nem", tmp, true) == 0)
			{
				new turner[MAX_PLAYER_NAME];
				GetPlayerName(playerid, turner, sizeof(turner));
				SendClientMessage(playerid, COLOR_DBLUE, "Rendõrség: Minden egység riasztva. Köszönjük bejelentését!");

				CopMsg(COLOR_DBLUE, "=========== BEJELENTÉS ===========");
				if(TelefonTipus[playerid]==1)
				{
					turner="Nyílvános telefon";
					CopMsgFormat(COLOR_DBLUE, "HQ: Minden egységnek! Bejelentõ: %s | Tettes: Ismeretlen",turner);
				}
				else
				{
					CopMsgFormat(COLOR_DBLUE, "HQ: Minden egységnek! Bejelentõ: %s | Tettes: Ismeretlen",turner);
				}
				
				CopMsgFormat(COLOR_DBLUE, "HQ: Bûncselekmény: %s",Bejelent[playerid]);
				SendClientMessage(playerid, COLOR_GRAD2, "Lerakták.");
				
				Mobile[playerid] = 255;
				return 0;
			}
			new badguy;

			badguy = ReturnUser(tmp);
			if (IsPlayerConnected(badguy))
			{
			    if(badguy != INVALID_PLAYER_ID)
			    {
					SendClientMessage(playerid, COLOR_DBLUE, "Rendõrség: Minden egység riasztva. Köszönjük bejelentését!");


					CopMsg(COLOR_DBLUE, "=========== BEJELENTÉS ===========");
					if(TelefonTipus[playerid]==1)
					{
						CopMsgFormat(COLOR_DBLUE, "HQ: Minden egységnek! Bejelentõ: Nyílvános telefon | Tettes: %s",ICPlayerName(badguy));
					}
					else
					{
						CopMsgFormat(COLOR_DBLUE, "HQ: Minden egységnek! Bejelentõ: %s | Tettes: %s", ICPlayerName(playerid), ICPlayerName(badguy));
					}

					CopMsgFormat(COLOR_DBLUE, "HQ: Bûncselekmény: %s",Bejelent[playerid]);
					
					
					if(!egyezik(Bejelent[playerid],"Hackerkedés!") &&  !egyezik(Bejelent[playerid],"Elsõfokú Gyilkos"))
						SetPlayerCriminal(badguy,playerid,Bejelent[playerid]);

					SendClientMessage(playerid, COLOR_GRAD2, "Lerakták.");
					Mobile[playerid] = 255;
					return 0;
				}//invalid id
				return 0;
			}//not connected
			else
			{
				SendFormatMessage(playerid, COLOR_DBLUE, "Rendõrség: Sajnálom, nincs információnk errõl a személyrõl: %s. Biztos jó név?", tmp);
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
			SendClientMessage(playerid, COLOR_YELLOW,"Nincs senki a vonalban...((kilépet nem online))");
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
				Msg(playerid, "Használata: cp [szám]", false);
				return 0;
			}

			new cp = strval(param[1]);
			if(cp < 0 || cp >= RACEMAXCP)
				Msg(playerid, "Nincs ilyen CP!", false);

			PlayerRaceInfo[playerid][xEpitesCP] = cp;
			SendFormatMessage(playerid, COLOR_LIGHTRED, "Az építés a %d CPtõl folytatódik", cp);
		}*/
		else if(egyezik(funkcio, "next"))
		{
			if(PlayerRaceInfo[playerid][xEpitesCP] >= RACEMAXCP)
			{
				Msg(playerid, "Elérted a maximális CP számát! Rakd le a Finish-t!", false);
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

			SendFormatMessage(playerid, COLOR_LIGHTRED, "Ez volt a %d. CP, még %d CP-t rakhatsz le!", cp, (RACEMAXCP - cp));
		}
		else if(egyezik(funkcio, "back"))
		{
			new cp = PlayerRaceInfo[playerid][xEpitesCP];
			if(cp == 0)
			{
				Msg(playerid, "Hova akarsz már visszamenni? Ez a nulladik... -.-\"", false);
				return 0;
			}
			new Float:x, Float:y, Float:z;
			x = RaceCP[slot][cp-1][0];
			y = RaceCP[slot][cp-1][1];
			z = RaceCP[slot][cp-1][2];

			SetPlayerRaceCheckpoint(playerid, 2, x, y, z, 0.0, 0.0, 0.0, RACECPMERETB);
			PlayerRaceInfo[playerid][xEpitesCP] = cp - 1;
			SendFormatMessage(playerid, COLOR_LIGHTRED, "Visszaugrottál a %d. CPre", (cp-1));
		}
		/*else if(egyezik(funkcio, "save"))
		{
			if(RaceStart[slot][0] == 0.0 || RaceStart[slot][1] == 0.0 || RaceStart[slot][2] == 0.0 || RaceCel[slot][0] == 0.0 || RaceCel[slot][1] == 0.0 || RaceCel[slot][2] == 0.0)
			{
				Msg(playerid, "Nincs megadva Start vagy Cél pozíció!", false);
				return 0;
			}

			if(!strlen(RaceInfo[slot][rNev]))
			{
				Msg(playerid, "A Racenek nincs neve, adnod kell egy nevet neki > nev [név]", false);
				return 0;
			}

			if(params < 1)
			{
				Msg(playerid, "Használata: save [savenév] - NEM tartalmazhat space-t!", false);
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

			SendFormatMessage(playerid, COLOR_YELLOW, "%s mentve - CPk száma %d", snev, cp);
			Msg(playerid, "A race-t ujra kell loadolnod, ha újra szerkeszteni szeretnéd v. indítani", false);
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
				Msg(playerid, "Használata: nev [név]", false);
				return 0;
			}

			strmid(RaceInfo[slot][rNev], result, 0, strlen(result), 60);
			SendFormatMessage(playerid, COLOR_LIGHTRED, "A Race neve beállítva: %s", result);
		}
		else
		{
			Msg(playerid, "Funkciók: start, finish, next, back, save", false);
			Msg(playerid, "Info: Start > start pozíció lerakása | Finish > cél pozícíó megadása | Nev [név] > A race neve", false);
			Msg(playerid, "Info: Next > Lerakja a következõ CP-t | Back > Egy CPvel visszamegy | Save [név] > Mentés", false);
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
				return !Msg(playerid, "A szád bevan kötve, így nem tudsz beszélni.");
				
			if(strfind(text, ":D", true) != -1 || strfind(text, "xD", true) != -1)
			{
				ApplyAnimation(playerid, "RAPPING", "Laugh_01", 4.0, 0, 0, 0, 0, 0);

				Cselekves(playerid, "nevet.");
				return 0;
			}

			if(strfind(text, ":)", true) != -1)
				return !Cselekves(playerid, "mosolyog.");

			if(strfind(text, ":(", true) != -1)
				return !Cselekves(playerid, "szomorú.");

			if(strfind(text, ":P", true) != -1)
				return !Cselekves(playerid, "nyelvet ölt.");

			if(strfind(text, ";)", true) != -1)
				return !Cselekves(playerid, "kacsint.");

			if(strfind(text, ":@", true) != -1)
				return !Cselekves(playerid, "ideges.");

			if(strfind(text, ":O", true) != -1)
				return !Cselekves(playerid, "csodálkozik.");

			if(strfind(text, ":S", true) != -1)
				return !Cselekves(playerid, "rosszul van.");

			if(strfind(text, ":$", true) != -1)
				return !Cselekves(playerid, "elpirul.");
		}



		if(!gBooc[playerid])
		{
			if(SzovegEllenorzes(playerid, text, "IC", ELLENORZES_HIRDETES))
				return 0;
			
			strrep(sendername, '_', ' '); // IC Üzenetben nem jelenik meg alsóvonal

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
						case 1: format(string, 128, "[Jármûben] %s mondja: %s", sendername, text);
						case 2: format(string, 128, "[Jármûbõl] %s mondja: %s", sendername, text);
						case 3: format(string, 128, "[Kendõ/Maszk]IDK: %d mondja: %s", PlayerInfo[playerid][pBID], text);
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
						case 1: format(string, 128, "[Jármûben] %s mondja: %s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]), text);
						case 2: format(string, 128, "[Jármûbõl] %s mondja: %s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]), text);
						case 3: format(string, 128, "[Kendõ/Maszk]IDK: %d mondja: %s", PlayerInfo[playerid][pBID], text);
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
						case 1: format(string, 128, "[Jármûben] %s mondja%%s: %%s", sendername);
						case 2: format(string, 128, "[Jármûbõl] %s mondja%%s: %%s", sendername);
						case 3: format(string, 128, "[Kendõ/Maszk]IDK: %d mondja%%s: %%s", PlayerInfo[playerid][pBID]);
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
						case 1: format(string, 128, "[Jármûben] %s mondja%%s: %%s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]));
						case 2: format(string, 128, "[Jármûbõl] %s mondja%%s: %%s", ICPlayerNameString(PlayerInfo[playerid][pHamisNev]));
						case 3: format(string, 128, "[Kendõ/Maszk]IDK: %d mondja%%s: %%s", PlayerInfo[playerid][pBID]);
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