#if defined __game_system_system_damage
	#endinput
#endif
#define __game_system_system_damage

new
	Float: Health[MAX_PLAYERS],
	Float: Armour[MAX_PLAYERS],
	//LastVehicleDamage[MAX_PLAYERS],
	LastDamager[MAX_PLAYERS],
	LastDamagerDamage[MAX_PLAYERS],
	LastDamagerType[MAX_PLAYERS],
	LastDamage[MAX_PLAYERS],
	NextAvailableNoDamage[MAX_PLAYERS],
	LabTalalat[MAX_PLAYERS]
	//LastShot[MAX_PLAYERS],
	//LastShotFast[MAX_PLAYERS]
;

// CLIENT HEALTH & ARMOUR //
stock SetClientHealth(playerid, Float: health)
	return SetPlayerHealth(playerid, health);

stock GetClientHealth(playerid, &Float: health)
	return GetPlayerHealth(playerid, health);

stock SetClientArmour(playerid, Float: armour)
	return SetPlayerArmour(playerid, armour);

stock GetClientArmour(playerid, &Float: armour)
	return GetPlayerArmour(playerid, armour);

// SCRIPTED HEALTH //
stock GetPlayerHealth_Ex(playerid, &Float: val)
	return val = Health[playerid], 0;

stock SetPlayerHealth_Ex(playerid, Float: val)
{
	Health[playerid] = val;
	
	if(Health[playerid] < 0.0)
		Health[playerid] = 0.0;
	else if(Health[playerid] > MAXHP)
		Health[playerid] = MAXHP;
		
	SetPlayerHealth(playerid, Health[playerid]);
}
	
stock AddPlayerHealth_Ex(playerid, Float: val)
	return Health[playerid] += val, SetPlayerHealth_Ex(playerid, Health[playerid]);
	
stock SubPlayerHealth_Ex(playerid, Float: hp)
	return Health[playerid] -= val, SetPlayerHealth_Ex(playerid, Health[playerid]);

#define GetPlayerHealth GetPlayerHealth_Ex
#define SetPlayerHealth SetPlayerHealth_Ex
#define AddPlayerHealth AddPlayerHealth_Ex
#define SubPlayerHealth SubPlayerHealth_Ex
	
// SCRIPTED ARMOUR //
stock GetPlayerArmour_Ex(playerid, &Float: val)
	return val = Armour[playerid], 0;

stock SetPlayerArmour_Ex(playerid, Float: val)
{
	Armour[playerid] = val;
	
	if(Armour[playerid] < 0.0)
		Armour[playerid] = 0.0;
	else if(Armour[playerid] > MAXHP)
		Armour[playerid] = MAXHP;
		
	SetPlayerArmour(playerid, Armour[playerid]);
}
	
stock AddPlayerArmour_Ex(playerid, Float: val)
	return Armour[playerid] += val, SetPlayerArmour_Ex(playerid, Armour[playerid]);
	
stock SubPlayerArmour_Ex(playerid, Float: val)
	return Armour[playerid] -= val, SetPlayerArmour_Ex(playerid, Armour[playerid]);
	
#define GetPlayerArmour GetPlayerArmour_Ex
#define SetPlayerArmour SetPlayerArmour_Ex
#define AddPlayerArmour AddPlayerArmour_Ex
#define SubPlayerArmour SubPlayerArmour_Ex

/*#define GetPlayerHealth(%1,%2) (%2=Health[%1],1)
#define SetPlayerHealth(%1,%2) (Health[%1]=%2,SetClientHealth(%1,%2),1)
#define AddPlayerHealth(%1,%2) (Health[%1]+=%2,SetClientHealth(%1,Health[%1]),1)
#define SubPlayerHealth(%1,%2) (Health[%1]-=%2,SetClientHealth(%1,Health[%1]),1)

#define GetPlayerArmour(%1,%2) (%2=Armour[%1],1)
#define SetPlayerArmour(%1,%2) (Armour[%1]=%2,SetClientArmour(%1,%2),1)
#define AddPlayerArmour(%1,%2) (Armour[%1]+=%2,SetClientArmour(%1,Armour[%1]),1)
#define SubPlayerArmour(%1,%2) (Armour[%1]-=%2,SetClientArmour(%1,Armour[%1]),1)*/

#define WEAPON_DAMAGE_TYPES	55
#define DAMAGE_VEHICLE		49
#define DAMAGE_HELICOPTER	50
#define DAMAGE_EXPLOSION	51
#define DAMAGE_DROWN		53
#define DAMAGE_FALL			54

#define DAMAGE_UNKNOWN		-1
#define DAMAGE_DEFAULT		0
#define DAMAGE_OVERWRITE	1
#define DAMAGE_MULTIPLIER	2
#define DAMAGE_NULL			3
#define DAMAGE_NEUTRAL		4

#define LOG_DAMAGE_TAKE		0
#define LOG_DAMAGE_GIVE		1

enum customDamage
{
	wType,
	Float:wDamage
}
new const CustomDamage[WEAPON_DAMAGE_TYPES][customDamage] =
{
	// K�ZELHARCI FEGYVEREK
	{     DAMAGE_DEFAULT,	0.0}, //  0  �k�l
	{     DAMAGE_DEFAULT,	0.0}, //  1  bokszer
	{     DAMAGE_DEFAULT,	0.0}, //  2  golf club
	{     DAMAGE_DEFAULT,	0.0}, //  3  nightstick
	{     DAMAGE_DEFAULT,	0.0}, //  4  k�s
	{     DAMAGE_DEFAULT,	0.0}, //  5  b�zb�z�t�
	{     DAMAGE_DEFAULT,	0.0}, //  6  �s�
	{     DAMAGE_DEFAULT,	0.0}, //  7  d�k�
	{     DAMAGE_DEFAULT,	0.0}, //  8  katana
	{        DAMAGE_NULL,	0.0}, //  9  l�ncf�r�sz
	{     DAMAGE_DEFAULT,	0.0}, // 10  k�tv�g� dildo
	{     DAMAGE_DEFAULT,	0.0}, // 11  dildo
	{     DAMAGE_DEFAULT,	0.0}, // 12  vibr�tor
	{     DAMAGE_DEFAULT,	0.0}, // 13  ez�st vibr�tor
	{     DAMAGE_DEFAULT,	0.0}, // 14  vir�g
	{     DAMAGE_DEFAULT,	0.0}, // 15  bot
	
	// DOB�FEGYVER
	{     DAMAGE_DEFAULT,	0.0}, // 16  gr�n�t
	{     DAMAGE_DEFAULT,	0.0}, // 17  f�stgr�n�t
	{     DAMAGE_DEFAULT,	0.0}, // 18  molotov
	
	// ???
	{     DAMAGE_UNKNOWN,	0.0}, // 19  ?
	{     DAMAGE_UNKNOWN,	0.0}, // 20  ?
	{     DAMAGE_UNKNOWN,	0.0}, // 21  ?
	
	// L�FEGYVEREK - PISZTOLY
	{     DAMAGE_DEFAULT,	0.0}, // 22  colt
	{     DAMAGE_DEFAULT,	0.0}, // 23  silenced
	{  DAMAGE_MULTIPLIER,	1.5}, // 24  deagle
	
	// L�FEGYVEREK - SHOTGUN
	{     DAMAGE_DEFAULT,	0.0}, // 25  shotgun
	{     DAMAGE_DEFAULT,	0.0}, // 26  shawnoff
	{     DAMAGE_DEFAULT,	0.0}, // 27  combat
	
	// L�FEGYVEREK - AUTOMATA
	{     DAMAGE_DEFAULT,	0.0}, // 28  uzi
	{     DAMAGE_DEFAULT,	0.0}, // 29  mp5
	{   DAMAGE_OVERWRITE,  40.0}, // 30  ak47
	{   DAMAGE_OVERWRITE,  20.0}, // 31  m4
	{     DAMAGE_DEFAULT,	0.0}, // 32  tec9
	
	// KARAB�LY
	{     DAMAGE_DEFAULT,	0.0}, // 33  rifle
	{     DAMAGE_DEFAULT,	0.0}, // 34  sniper
	
	// NAGY KALIBER�
	{     DAMAGE_DEFAULT,	0.0}, // 35  rak�ta
	{     DAMAGE_DEFAULT,	0.0}, // 36  h�k�vet� rak�ta
	{     DAMAGE_DEFAULT,	0.0}, // 37  l�ngsz�r�
	{     DAMAGE_DEFAULT,	0.0}, // 38  minigun
	
	// EGY�B
	{     DAMAGE_DEFAULT,	0.0}, // 39  c4
	{     DAMAGE_DEFAULT,	0.0}, // 40  deton�tor
	{     DAMAGE_DEFAULT,	0.0}, // 41  spr�
	{     DAMAGE_DEFAULT,	0.0}, // 42  porolt�
	{     DAMAGE_DEFAULT,	0.0}, // 43  kamera
	{     DAMAGE_DEFAULT,	0.0}, // 44  �jjell�t�
	{     DAMAGE_DEFAULT,	0.0}, // 45  h�l�t�
	{     DAMAGE_DEFAULT,	0.0}, // 46  ejt�erny�
	{     DAMAGE_DEFAULT,	0.0}, // 47  fake pistol (?)
	{     DAMAGE_UNKNOWN,	0.0}, // 48  ?
	
	// SEBZ�ST�PUSOK
	{        DAMAGE_NULL,   0.0}, // 49  j�rm�
	{        DAMAGE_NULL,	0.0}, // 50  helikopter
	{     DAMAGE_DEFAULT,	0.0}, // 51  robban�s
	{     DAMAGE_UNKNOWN,	0.0}, // 52  ?
	{     DAMAGE_NEUTRAL,	0.0}, // 53  fullad�s
	{     DAMAGE_NEUTRAL,	0.0}  // 54  es�s
};

////////////
// CONFIG //
////////////
// fej �s l�bl�v�s, ha a t�madott nem "�rz�keli" vagy �pp godemodeozik / laggol
// akkor biztos�tott a l�b, fejl�v�s, bizonyos mennyis�g ut�n
#define SHOOT_MIN_FEJ 8
#define SHOOT_MIN_LAB 6

stock GetDamageName(id)
{
	new nev[32];
	if(0 <= id < MAX_WEAPONS)
	{
		strmid(nev, aWeaponNames[id], 0, strlen(aWeaponNames[id]));
		return nev;
	}
		
	switch(id)
	{
		case DAMAGE_VEHICLE:
			nev = "Jarmu";
		case DAMAGE_HELICOPTER:
			nev = "Heli";
		case DAMAGE_EXPLOSION:
			nev = "Robbanas";
		case DAMAGE_DROWN:
			nev = "Fulladas";
		case DAMAGE_FALL:
			nev = "Zuhanas";
		default:
			nev = "Ismeretlen";
	}
	return nev;	
}

public OnPlayerTakeDamage(playerid, issuerid, Float: amount, weaponid, bodypart)
{
	OnPlayerHit(playerid, issuerid, weaponid, amount, bodypart);
	return 1;
}

public OnPlayerGiveDamage(playerid, damagedid, Float: amount, weaponid, bodypart)
{
	if(0 <= weaponid < WEAPON_DAMAGE_TYPES) switch(CustomDamage[weaponid][wType])
	{
		case DAMAGE_DEFAULT, DAMAGE_OVERWRITE, DAMAGE_MULTIPLIER:
			LogDamage(LOG_DAMAGE_GIVE, damagedid, playerid, weaponid, amount);
	}
	//OnPlayerHit(damagedid, playerid, weaponid, amount, bodypart);
/*	bodypart = BODY_PART_TORSO;
	
	//SendFormatMessageToAll(COLOR_WHITE, "OPGD(playerid: %d, damagedid: %d, amount: %.2f, weaponid: %d)", playerid, damagedid, amount, playerid);
    if(damagedid != INVALID_PLAYER_ID)
    {
		if(PlayerWeapons[playerid][pArmed] != weaponid)
		{
			if(weaponid)
				WeaponProblem(playerid, WEAPONS_PROBLEM_SHOOT_ARM);
		}
		else if(WeaponData[weaponid][wType] != WEAPON_TYPE_HAND)
		{
			if(PlayerWeaponsAC[playerid][pLastAmmo] == PlayerWeapons[playerid][pAmmo][weaponid] && ++PlayerWeaponsAC[playerid][pLastAmmoTimes] >= 3)
				WeaponProblem(playerid, WEAPONS_PROBLEM_SHOOT_INFINITE);
			else
				PlayerWeaponsAC[playerid][pLastAmmo] = PlayerWeapons[playerid][pAmmo][weaponid], PlayerWeaponsAC[playerid][pLastAmmoTimes] = 0;
		}
		
		new str[200], Float:hp, Float:armor, Float:tav;
		
		GetPlayerHealth(damagedid, hp);
		GetPlayerArmour(damagedid, armor);
		tav = GetDistanceBetweenPlayers(playerid, damagedid);
		
		new testresz[8], esc[10];
		
		switch(bodypart)
		{
			case BODY_PART_HEAD:
			{
				testresz = " (fej)";
				
				if(!Animban[damagedid])
				{
					Shoot2[damagedid][0] += 2;
					if(Shoot2[damagedid][0] >= SHOOT_MIN_FEJ)
					{
						OnPlayerHit(damagedid, playerid, bodypart, weaponid, amount);
						Shoot2[damagedid][0] = 0;
					}
				}
			}
			case BODY_PART_LEFT_LEG, BODY_PART_RIGHT_LEG:
			{
				testresz = " (lab)";
				
				if(!Animban[damagedid])
				{
					Shoot2[damagedid][1] += 2;
					if(Shoot2[damagedid][1] >= SHOOT_MIN_LAB)
					{
						OnPlayerHit(damagedid, playerid, bodypart, weaponid, amount);
						Shoot2[damagedid][1] = 0;
					}
				}
			}
		}
		
		if(SzunetIdo[damagedid])
			format(esc, 10, " (%ds)", SzunetIdo[damagedid]);
		else
			Shoot[damagedid][1]++;
		
		format(str, 200, "%s meglotte ot: %s%s%s | fegyver: %s(%d) | Elet/Pancel: %.0f/%.0f (%.0f) | Tav: %0.1f", Nev(playerid), Nev(damagedid), esc, testresz, GetGunName(weaponid), GetPlayerAmmo(playerid), hp, armor, amount, tav);
		
		Log("Shoot2", str);
    }*/
    return 1;
}

stock LogDamage(type, playerid, attacker, damageType, Float: damage)
{
	new
		Float: cHealth, Float: cArmour
	;
	
	GetPlayerHealth(playerid, cHealth);
	GetPlayerArmour(playerid, cArmour);
	
	if(attacker != INVALID_PLAYER_ID)
		tformat(256, "%s sebzest kapott tole: %s | sebzes: %s (-%.1f) | E/P: %.1f/%.1f (S: %.1f/%.1f) | Tav: %.1f", \
			PlayerName(playerid), PlayerName(attacker), GetDamageName(damageType), damage, cHealth, cArmour, Health[playerid], Armour[playerid], GetDistanceBetweenPlayers(playerid, attacker));
	else
		tformat(256, "%s sebzest kapott | sebzes: %s (-%.1f) | E/P: %.1f/%.1f (S: %.1f/%.1f)", \
			PlayerName(playerid), GetDamageName(damageType), damage, cHealth, cArmour, Health[playerid], Armour[playerid]);
			
	Log( (type == LOG_DAMAGE_TAKE) ? ("Damage") : ("DamageEx"), _tmpString );
}

stock OnPlayerHit(playerid, attacker, damageType, Float:amount, bodypart)
{
	// prevent vehicle damage
	if(damageType == DAMAGE_VEHICLE)
		return 0;
		
	// anti vehicle flood
	/*if(damageType == DAMAGE_VEHICLE)
	{
		if(LastVehicleDamage[playerid] == UnixTime)
			return 0;
		else
			LastVehicleDamage[playerid] = UnixTime;
	}*/
	
	////////////////////
	// PREVENT DAMAGE //
	////////////////////
	if(IsPlayerNPC(playerid) || Ajtozott[playerid] > 0 || AdminDuty[playerid] || ScripterDuty[playerid] || Warozott[playerid] >= UnixTime || NoDamage[playerid] || SpawnVedelem[playerid]
		|| PlayerVehicle[playerid] != NINCS && ArmoredVehicle[PlayerVehicle[playerid]]
		|| attacker != INVALID_PLAYER_ID && ( NemMozoghat(attacker) || AdminDuty[attacker] )
	)
		return 0;
	
	/////////////////////
	// DAMAGE MODIFIER //
	/////////////////////
	new Float:damage;
	if(0 <= damageType < WEAPON_DAMAGE_TYPES) switch(CustomDamage[damageType][wType])
	{
		case DAMAGE_DEFAULT, DAMAGE_NEUTRAL:
			damage = amount;
		case DAMAGE_OVERWRITE:
			damage = CustomDamage[damageType][wDamage];
		case DAMAGE_MULTIPLIER:
			damage = amount * CustomDamage[damageType][wDamage];
		//case DAMAGE_NULL, DAMAGE_NEUTRAL:
		//	damage = 0;
		//default:
		//	damage = 0;
	}
	
/*	///////////////////////
	// BODYPART MODIFIER //
	///////////////////////
	switch(bodypart)
	{
		//////////////
		// HEADSHOT //
		//////////////
		case BODY_PART_HEAD:
		{
			damage *= 2.0;
		}
		
		//////////////
		// ARM SHOT //
		//////////////
		case BODY_PART_LEFT_ARM, BODY_PART_RIGHT_ARM:
			damage *= 0.75;
		
		//////////////
		// LEG SHOT //
		//////////////
		case BODY_PART_LEFT_LEG, BODY_PART_RIGHT_LEG:
		{
			damage *= 0.75;
		}
		
	}

	////////////////////
	// POST MODIFIERS //
	////////////////////
	if(PlayerSkin[playerid] == 285 && Armour[playerid] >= 50.0) // swat
		damage *= 0.5;*/
		
	if(PajzsNala[playerid] && PlayerSkin[playerid] == 285)
		damage *= 0.75;
 
	////////////////////
	// PREVENT DAMAGE //
	////////////////////
	////////////////////
	if(damage <= 0.0) //
		return 0;	  //
	////////////////////
	
	LogDamage(LOG_DAMAGE_TAKE, playerid, attacker, damageType, damage);
	
	if(22 <= damageType <= 38)
	{
		PlayerInfo[playerid][pLoves] = UnixTime + 120;
		PlayerInfo[playerid][pEllatva] = true;
		//Shooted[playerid][issuerid] = UnixTime;
	}
	
	////////////////
	// T�RFIGYEL� //
	////////////////
	if(attacker != INVALID_PLAYER_ID
		&& 22 <= damageType <= 38 && !PLAYER_MARKER_IS_HIDDEN(attacker) && !PlayerMarker[attacker][mHidden] && !IsACop(attacker) && (PlayerInfo[attacker][pHitman] <= 0 && !HitmanDuty[attacker])
		&& PlayerMarker[attacker][mLastShoot] != UnixTime
		&& (PLAYER_MARKER_WEAPONS_SHOOT(attacker)
			|| (WeaponArmed(attacker) == WEAPON_RIFLE || WeaponArmed(attacker) == WEAPON_SNIPER) && GetDistanceBetweenPlayers(attacker, playerid) <= PLAYER_MARKER_RIFLE_DISTANCE)
	)
	{
		PlayerMarker[attacker][mLastShoot] = UnixTime;
		
		switch(PlayerMarker[attacker][mType])
		{
			case PLAYER_MARKER_SHOOT:
			{
				if((PlayerMarker[attacker][mTime] + PLAYER_MARKER_TIME_SHOOT) > PLAYER_MARKER_MTIME_SHOOT)
					PlayerMarker[attacker][mTime] = PLAYER_MARKER_MTIME_SHOOT;
				else
					PlayerMarker[attacker][mTime] += PLAYER_MARKER_TIME_SHOOT;
			}
			case PLAYER_MARKER_KILL:
			{
				if((PlayerMarker[attacker][mTime] + PLAYER_MARKER_TIME_KILL_SHOOT) > PLAYER_MARKER_MTIME_KILL)
					PlayerMarker[attacker][mTime] = PLAYER_MARKER_MTIME_KILL;
				else
					PlayerMarker[attacker][mTime] += PLAYER_MARKER_TIME_KILL_SHOOT;
			}
			case PLAYER_MARKER_MKILL:
			{
				if((PlayerMarker[attacker][mTime] + PLAYER_MARKER_TIME_MKILL_SHOOT) > PLAYER_MARKER_MTIME_MKILL)
					PlayerMarker[attacker][mTime] = PLAYER_MARKER_MTIME_MKILL;
				else
					PlayerMarker[attacker][mTime] += PLAYER_MARKER_TIME_MKILL_SHOOT;
			}
			default:
			{
				MarkerAction(attacker, PLAYER_MARKER_SET, PLAYER_MARKER_SHOOT);
			}
		}
	}
	
	new bool:kikerulve = (random(100)+1) <= Gyemantjai[playerid];
	if(kikerulve)
		return !Msg(playerid, "[Gy�m�nt] H�la az �gyess�gednek, kiker�lt�l egy tal�latot");
		
	///////////////////////////////
	// NEW TAZER SYSTEM BY PEDRO //
	///////////////////////////////
	
	if(IsACop(attacker) && Tazer[attacker] && Sokkolt[attacker] == 0 && (WeaponArmed(attacker) == WEAPON_DEAGLE || WeaponArmed(attacker) == WEAPON_SILENCED) && OnDuty[attacker] && GetPlayerState(attacker) == PLAYER_STATE_ONFOOT)
	{
		new fail, chancetofail = random(100);
		switch(chancetofail)
		{
			case 0..35: fail = 1;
			default: fail = 0;
		}
		if(IsPlayerInWater(attacker) || IsPlayerInWater(playerid)) { Msg(attacker, "V�zben l�v�t akarsz lesokkolni? Az �ram agyon�t titeket!"); fail = 1; }
		if(GetDistanceBetweenPlayers(attacker, playerid) > 25.0 || IsPlayerNPC(playerid)) { Msg(attacker, "Nincs a k�zeledben senki, vagy od�ig nem �r el a sokkol� feje!"); fail = 1; }
		if(fail)
		{
			SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Majdnem lesokkolt egy rend�r! Vigy�zz!");
			SendClientMessage(attacker, COLOR_LIGHTBLUE, "* Nem tudtad lesokkolni a c�lszem�lyt!");
			Cselekves(attacker, "l� a sokkol�val, de nem tudja lesokkolni a c�lszem�lyt", 1);
			GameTextForPlayer(playerid, "~r~Majdnem lesokkoltak!", 2500, 3);
			Sokkolt[attacker] = 5;
			return 1;
		}

		if(Rabol[playerid] == 1) Rabol[playerid] = 0;
		if(Tazer[playerid]) Tazer[playerid] = false;
		SendClientMessage(playerid, COLOR_LIGHTBLUE, "* Lesokkolt egy rend�r, �s 60 m�sodpercig megb�nult�l.");
		SendClientMessage(attacker, COLOR_LIGHTBLUE, "* Lesokkoltad 60 m�sodpercre.");
		Cselekves(attacker, "l� a sokkol�val, �s lesokkolja a c�lszem�lyt", 1);
		GameTextForPlayer(playerid, "~r~Sokkoltak", 2500, 3);
		Bilincs(playerid, 1);
		ApplyAnimation(playerid,"CRACK","crckdeth2",4.1,0,1,1,1,0);
		WeaponArm(playerid);
		Sokkolt[attacker] = 15;
		return 1;
	}
		
	//////////////////////////
	// DEAL THE REAL DAMAGE //
	//////////////////////////
	new Float: newhp = Health[playerid], Float: newarmour = Armour[playerid];
	
	if(attacker != INVALID_PLAYER_ID)
	{
		newarmour -= damage;
		if(newarmour < 0)
		{
			newhp += newarmour;
			newarmour = 0;
		}
	}
	else
		newhp -= damage;
		
	if(!Animban[playerid] && !Paintballozik[playerid] && !Kikepzoben[playerid] && newhp < 15.0 && NextAvailableNoDamage[playerid] < UnixTime && bodypart != BODY_PART_HEAD)
	{
		NoDamage[playerid] = 3;
		newhp = 15.0;
		AnimbaRak(playerid);
		NextAvailableNoDamage[playerid] = UnixTime + 30;
	}
	if(damageType == DAMAGE_FALL && !Animban[playerid] && !Paintballozik[playerid] && !Kikepzoben[playerid] && NextAvailableNoDamage[playerid] < UnixTime && damage >= 15.0)
	{
		NoDamage[playerid] = 3;
		newhp -= 50.0;
		AnimbaRak(playerid);
		NextAvailableNoDamage[playerid] = UnixTime + 30;
	}
	
	SetPlayerHealth(playerid, newhp);
	SetPlayerArmour(playerid, newarmour);
	
	LastDamage[playerid] = UnixTime;
	if(attacker != INVALID_PLAYER_ID)
	{
		ScriptShoot[playerid] = true;
		Shooted[playerid][attacker] = UnixTime;
		LastDamager[playerid] = attacker;
		LastDamagerDamage[playerid] = UnixTime;
		LastDamagerType[playerid] = damageType;
	}
	
	if(PlayerSkin[playerid] == 285 && Armour[playerid] >= 100.0) return 0; //SWAT
	
	////////////
	// SNIPER //
	////////////
	if(damageType == 34 && Armour[playerid] <= 55.0 && !Paintballozik[playerid]) // sniper = 1 l�v�s anim
	{
		SendFormatMessage(playerid, COLOR_LIGHTRED, "S�r�l�s: Sniperrel megl�ttek, ez�rt s�lyosan megs�r�lt�l (#%d)", PlayerInfo[attacker][pBID]);
		Msg(attacker, "Eltal�ltad, ez�rt nem tud mozogni.");
		AnimbaRak(playerid, false);
		new sniplog[128]; format(sniplog, 128, "%s sniperrel megl�tte �t: %s", PlayerName(attacker), PlayerName(playerid)); Log("Kill", sniplog);
		PlayerInfo[playerid][pLoves] = UnixTime + 600;
		PlayerInfo[playerid][pEllatva] = true;
	}
	///////////
	// RIFLE //
	///////////
	else if(damageType == 33 && Armour[playerid] <= 30.0 && !Paintballozik[playerid]) // rifle = 2 l�v�s 10 m�sodpercen bel�l = anim
	{			
		if(RifleTalalat[playerid] > 0)
		{
			SendFormatMessage(playerid, COLOR_LIGHTRED, "S�r�l�s: T�bbsz�r is megl�ttek Riflevel, ez�rt s�lyosan megs�r�lt�l (#%d)", PlayerInfo[attacker][pBID]);
			Msg(attacker, "T�bbsz�r is megl�tted Riflevel, ez�rt s�lyosan megs�r�lt.");
			AnimbaRak(playerid, false);
			new riflelog[128]; format(riflelog, 128, "%s riflevel animba l�tte �t �t: %s", PlayerName(attacker), PlayerName(playerid)); Log("Kill", riflelog);
			PlayerInfo[playerid][pLoves] = UnixTime+300;
			PlayerInfo[playerid][pEllatva] = true;
		}
		RifleTalalat[playerid] = 10;
	}
	else if(bodypart == BODY_PART_HEAD)
	{
		if(Paintballozik[playerid])
		{
			NoDamage[playerid] = 5;
			if(damageType == 22) PlayerInfo[attacker][pFegyverSkillek][0] += PBSKILL_FEJ, SendClientMessage(attacker, COLOR_YELLOW, "A Colt45 skilled emelkedett "#PBSKILL_FEJ" ponttal");
			if(damageType == 23) PlayerInfo[attacker][pFegyverSkillek][1] += PBSKILL_FEJ, SendClientMessage(attacker, COLOR_YELLOW, "A Silenced skilled emelkedett "#PBSKILL_FEJ" ponttal");
			if(damageType == 24) PlayerInfo[attacker][pFegyverSkillek][2] += PBSKILL_FEJ, SendClientMessage(attacker, COLOR_YELLOW, "A Deagle skilled emelkedett "#PBSKILL_FEJ" ponttal");
			if(damageType == 25) PlayerInfo[attacker][pFegyverSkillek][3] += PBSKILL_FEJ, SendClientMessage(attacker, COLOR_YELLOW, "A Shotgun skilled emelkedett "#PBSKILL_FEJ" ponttal");
			if(damageType == 27) PlayerInfo[attacker][pFegyverSkillek][5] += PBSKILL_FEJ, SendClientMessage(attacker, COLOR_YELLOW, "A Combat skilled emelkedett "#PBSKILL_FEJ" ponttal");
			if(damageType == 29) PlayerInfo[attacker][pFegyverSkillek][7] += PBSKILL_FEJ, SendClientMessage(attacker, COLOR_YELLOW, "Az MP5 skilled emelkedett "#PBSKILL_FEJ" ponttal");
			if(damageType == 30) PlayerInfo[attacker][pFegyverSkillek][8] += PBSKILL_FEJ, SendClientMessage(attacker, COLOR_YELLOW, "Az AK47 skilled emelkedett "#PBSKILL_FEJ" ponttal");
			if(damageType == 31) PlayerInfo[attacker][pFegyverSkillek][9] += PBSKILL_FEJ, SendClientMessage(attacker, COLOR_YELLOW, "Az M4 skilled emelkedett "#PBSKILL_FEJ" ponttal");
			FegyverSkillFrissites(attacker);
			Msg(playerid, "Fejen l�ttek, ez�rt kiest�l, hamarosan �jra�ledsz");
			Msg(attacker, "Fejen l�tted, ez�rt kiesett");
			new Float:hp; GetPlayerHealth(attacker, hp);
			SetPlayerHealth(attacker, hp+random(100));
			PlayerPlaySound(attacker, 17802, 0.0, 0.0, 0.0);
			SetPlayerHealth(playerid, 0.0);
			return 0;
		}
		
		if(!Paintballozik[playerid] && !Kikepzoben[playerid] && !Halal[playerid])
		{
			SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: Fejen l�ttek, ez�rt eszm�letedet vesztetted (#%d)", PlayerInfo[attacker][pBID]);
			Msg(attacker, "Fejen l�tted, ez�rt eszm�let�t vesztette.");
			PlayerInfo[playerid][pEllatva] = false;
			/*PlayerInfo[attacker][pOlesIdo] += K_OLES_IDO;
			tformat(128, "%s plusz k�rh�z jail ideje %d m�sodpercre n�tt (+"#K_OLES_IDO"mp)", PlayerName(attacker), PlayerInfo[attacker][pOlesIdo]);
			KillLog(_tmpString, 0);*/
		}
		if(Harcol[playerid])
			HarcKieses(playerid, "Fejen l�tt�k");
		else
			SetPlayerHealth(playerid, 0.0);
		
		tformat(128, "%s fejen l�tte �t: %s", PlayerName(attacker), PlayerName(playerid)); Log("Kill", _tmpString);
	}
	else if(bodypart == BODY_PART_LEFT_LEG || bodypart == BODY_PART_RIGHT_LEG)
	{			
		if(Paintballozik[playerid])
	    {
			NoDamage[playerid] = 5;
			if(damageType == 22) PlayerInfo[attacker][pFegyverSkillek][0] += PBSKILL_LAB, SendClientMessage(attacker, COLOR_YELLOW, "A Colt45 skilled emelkedett "#PBSKILL_LAB" ponttal");
			if(damageType == 23) PlayerInfo[attacker][pFegyverSkillek][1] += PBSKILL_LAB, SendClientMessage(attacker, COLOR_YELLOW, "A Silenced skilled emelkedett "#PBSKILL_LAB" ponttal");
			if(damageType == 24) PlayerInfo[attacker][pFegyverSkillek][2] += PBSKILL_LAB, SendClientMessage(attacker, COLOR_YELLOW, "A Deagle skilled emelkedett "#PBSKILL_LAB" ponttal");
			if(damageType == 25) PlayerInfo[attacker][pFegyverSkillek][3] += PBSKILL_LAB, SendClientMessage(attacker, COLOR_YELLOW, "A Shotgun skilled emelkedett "#PBSKILL_LAB" ponttal");
			if(damageType == 27) PlayerInfo[attacker][pFegyverSkillek][5] += PBSKILL_LAB, SendClientMessage(attacker, COLOR_YELLOW, "A Combat skilled emelkedett "#PBSKILL_LAB" ponttal");
			if(damageType == 29) PlayerInfo[attacker][pFegyverSkillek][7] += PBSKILL_LAB, SendClientMessage(attacker, COLOR_YELLOW, "Az MP5 skilled emelkedett "#PBSKILL_LAB" ponttal");
			if(damageType == 30) PlayerInfo[attacker][pFegyverSkillek][8] += PBSKILL_LAB, SendClientMessage(attacker, COLOR_YELLOW, "Az AK47 skilled emelkedett "#PBSKILL_LAB" ponttal");
			if(damageType == 31) PlayerInfo[attacker][pFegyverSkillek][9] += PBSKILL_LAB, SendClientMessage(attacker, COLOR_YELLOW, "Az M4 skilled emelkedett "#PBSKILL_LAB" ponttal");
			FegyverSkillFrissites(attacker);
			new Float:hp; GetPlayerHealth(attacker, hp);
			SetPlayerHealth(attacker, hp+random(50));
			Msg(playerid,"L�bon l�ttek, ez�rt kiest�l, hamarosan �jra�ledsz");
			Msg(attacker,"L�bon l�tted, ez�rt kiesett");
			SetHealth(playerid, 0.0);
			PlayerPlaySound(attacker, 17802, 0.0, 0.0, 0.0);
			return 0;
		}
		
		LabTalalat[playerid] ++;
		if(LabTalalat[playerid] >= 2)
		{
			SendFormatMessage(playerid, COLOR_LIGHTRED, "ClassRPG: L�bon l�ttek, ez�rt s�lyosan megsebes�lt�l (#%d)", PlayerInfo[attacker][pBID]);
			Msg(attacker, "L�bon l�tted, ez�rt megsebes�lt.");
			if(!AdminDuty[attacker] && ScripterDuty[attacker] && !Harcol[attacker] && !Paintballozik[attacker] && !Kikepzoben[attacker] && !Halal[attacker])
			{
				PlayerInfo[attacker][pOlesIdo] +=K_LAB_IDO;
				tformat(128, "%s plusz k�rh�z jail ideje %d m�sodpercre n�tt (+"#K_LAB_IDO"mp)", PlayerName(attacker), PlayerInfo[attacker][pOlesIdo]);
				KillLog(_tmpString, 0);
			}
			AnimbaRak(playerid, false);
			PlayerInfo[playerid][pLoves] = UnixTime+300;
			PlayerInfo[playerid][pEllatva] = true;
			LabTalalat[playerid] = 0;
			tformat(128, "%s l�bon l�tte �t: %s", PlayerName(attacker), PlayerName(playerid)); Log("Kill", _tmpString);
		}
		//SendFormatMessage(playerid, COLOR_WHITE, "[Debug] L�bon l�ttek, ez a %d. l�btal�latod", LabTalalat[playerid]);
		//SendFormatMessage(attacker, COLOR_WHITE, "[Debug] L�bon l�tted, ez a %d. l�btal�lata", LabTalalat[playerid]);
	}

	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
	/*switch(hittype)
	{
		case BULLET_HIT_TYPE_VEHICLE:
		{
			if(!ArmoredVehicle[hitid])
			{
				new Float: hp;
				GetVehicleHealth(hitid, hp);
				if(hp < 250.0)
					SetVehicleHealth(hitid, 250.0);
				else if(hp > 250.0)
				{
					hp -= 30.0;
				
					if(hp < 250.0)
						SetVehicleHealth(hitid, 250.0);
					else
						SetVehicleHealth(hitid, hp);
				}
			}
			return 0;
		}
	}*/
	return 1;
}

public OnPlayerShootDynamicObject(playerid, weaponid, objectid, Float:x, Float:y, Float:z)
{
	for(new a = 0; a < MAX_DEER; a++)
	{
		if(DeerInfo[a][dObject] != objectid) continue;
		if(weaponid != 25 && weaponid != 33 && weaponid != 34) return 0;
		if(DeerInfo[a][dKilled]) break;
		new Float:pos[3]; new Float:playerpos[3];
		GetPlayerPos(playerid, ArrExt(playerpos));
		GetObjectPos(objectid, ArrExt(pos));
		DeerInfo[a][dDistance] = GetDistanceBetweenPoints(ArrExt(pos), ArrExt(playerpos));
		SetObjectRot(objectid, 90, 0, 0);
		SetObjectPos(objectid, pos[0], pos[1], pos[2]-0.4);
		Msg(playerid, "Eltal�lt�l egy �zet");
		DeerInfo[a][dKilled] = true;
		DeerInfo[a][dSupplied] = false;
		DeerInfo[a][dHealth] = 100;
		DeerInfo[a][dWeaponType] = weaponid;
		DeerInfo[a][dKiller] = ICPlayerName(playerid);
		tformat(128, "[�z] Eg�szs�g: %d sz�zal�k\nMeg�lte: %s (ezzel: %s)\nM�g nincs ell�tva", DeerInfo[a][dHealth], DeerInfo[a][dKiller], GunName(weaponid));
		UpdateDynamic3DTextLabelText(DeerInfo[a][dLabel], 0x8B4513EE, _tmpString);
		break;
	}
	if(Loterben[playerid] != NINCS && LoterInfo[Loterben[playerid]][lTalalt] == false)
	{
		new l = Loterben[playerid], szoveg[200];
		if(LoterInfo[l][lObject] == objectid)
		{
			if(LoterInfo[l][lLoheto] == false)
			{
				SendClientMessage(playerid,COLOR_LIGHTRED,"[L�t�r] R�l�tt�l egy t�szra! [2 HIBAPONT]");
				KillTimer(LoterInfo[l][lObjectTimer]);
				KillTimer(LoterInfo[l][lTimer]);
				format(szoveg,200,"A j�t�kos(%d) r�l�tt a t�szra a l�t�rben(%d)",playerid,l);
				if(IsValidDynamicObject(LoterInfo[l][lObject])) DestroyDynamicObject(LoterInfo[l][lObject]), LoterInfo[l][lObject]=INVALID_OBJECT_ID;
				Streamer_Update(playerid);
				LoterInfo[l][lTalalat] -= 2;
				LoterInfo[l][lObjectTimer] = SetTimerEx("LoterGyakorlat", 1000, false, "dd", l, playerid);
				LoterInfo[l][lTalalt] = true;
			}
			else
			{
				KillTimer(LoterInfo[l][lObjectTimer]);
				KillTimer(LoterInfo[l][lTimer]);
				SendClientMessage(playerid,COLOR_LIGHTGREEN,"[L�t�r] Lel�tt�l egy ellens�get! [1 PONT]");
				format(szoveg,200,"A j�t�kos(%d) lel�tte az ellens�get a l�t�rben(%d)",playerid,l);
				if(IsValidDynamicObject(LoterInfo[l][lObject])) DestroyDynamicObject(LoterInfo[l][lObject]), LoterInfo[l][lObject]=INVALID_OBJECT_ID;
				LoterInfo[l][lTalalat] ++;
				Streamer_Update(playerid);
				LoterInfo[l][lObjectTimer] = SetTimerEx("LoterGyakorlat", 1000, false, "dd", l, playerid);
				LoterInfo[l][lTalalt] = true;
			}
		}
		else
		{
			KillTimer(LoterInfo[l][lObjectTimer]);
			KillTimer(LoterInfo[l][lTimer]);
			SendClientMessage(playerid,COLOR_LIGHTRED,"[L�t�r] Mell� l�tt�l! [1 HIBAPONT]");
			format(szoveg,200,"A j�t�kos(%d) mell� l�tt a l�t�rben(%d)",playerid,l);
			LoterInfo[l][lTalalat] --;
			if(IsValidDynamicObject(LoterInfo[l][lObject])) DestroyDynamicObject(LoterInfo[l][lObject]), LoterInfo[l][lObject]=INVALID_OBJECT_ID;
			Streamer_Update(playerid);
			LoterInfo[l][lObjectTimer] = SetTimerEx("LoterGyakorlat", 1000, false, "dd", l, playerid);
			LoterInfo[l][lTalalt] = true;
		}
		LoterUzenet(szoveg);
	}
	return 1;
}

CMD:godmode(playerid, params[])
{
	if(IsScripter(playerid))
	{
		if(NoDamage[playerid])
			Msg(playerid, "Godmode deaktiv�lva"), NoDamage[playerid] = 0;
		else
			Msg(playerid, "Godmode aktiv�lva"), NoDamage[playerid] = -1;
	}
}

CMD:hpdebug(playerid, params[])
{
	if(IsScripter(playerid))
	{
		new Float:hp, Float:armour;
		if(sscanf(params, "ff", hp, armour))
			SendFormatMessage(playerid, COLOR_WHITE, "hp: %f, armour: %f", Health[playerid], Armour[playerid]);
		else
			Health[playerid] = hp, Armour[playerid] = armour;
	}
}
