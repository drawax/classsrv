#if defined __game_system_system_weapons
	#endinput
#endif
#define __game_system_system_weapons

/*
	WeaponArm(playerid, weapon = 0) 							- fegyver elõvétel/elrakás - RETURN: true/false
	WeaponCanHave(playerid, weapon) 							- lehet-e nála ilyen fegyver - RETURN: true/false
	WeaponCanHoldWeapon(playerid, weapon, maxweapon = 1) 		- tudja e viselni a fegyvert (van-e hely, stb.) - RETURN: slot, NINCS vagy ErrorID
	WeaponCanHoldAmmo(playerid, weapon, ammo) 					- van-e hely további tölténynek - RETURN: true/false
	WeaponHaveWeapon(playerid, weapon) 							- van e ilyen fegyvere - RETURN: NINCS vagy pedig slot
	WeaponHaveAmmo(playerid, weapon, ammo) 						- van e annyi lõszere - RETURN: true/false
	WeaponGiveWeapon(playerid, weapon, ammo = 0, maxweapon = 1) - fegyveradás - RETURN: sikeres fegyveradásnál slot vagy pedig HIBA ID
	WeaponGiveAmmo(playerid, weapon, ammo) 						- töltényadás - RETURN: true/false
	WeaponTakeWeapon(playerid, weapon) 							- fegyver elvétel - RETURN: true/false
	WeaponTakeAmmo(playerid, weapon) 							- töltény elvétel - RETURN: true/false
	WeaponResetWeapons(playerid) 								- fegyverek törlése - RETURN: nincs
	WeaponResetAmmos(playerid) 									- töltények törlése - RETURN: nincs
	WeaponResetAll(playerid) 									- fegyverek és töltények törlése - RETURN: nincs
	WeaponRefreshAttachments(playerid) 							- játékoshoz csatolt fegyver objectek frissítése - RETURN: true
	WeaponProblem(playerid, problem) 							- anticheat kérések feldolgozása - RETURN: true/false
	WeaponAmmo(targetid, w)
*/

// attach slots
#define WEAPON_SLOT_MP5			0
#define WEAPON_SLOT_COMBAT		1
#define WEAPON_SLOT_SHOTGUN		2
#define WEAPON_SLOT_RIFLE		3
#define WEAPON_SLOT_SNIPER		4
#define WEAPON_SLOT_M4_AK47		5

#define WEAPON_TYPE_HAND	1
#define WEAPON_TYPE_THROWN	2
#define WEAPON_TYPE_PISTOL	4
#define WEAPON_TYPE_SHOTGUN	8
#define WEAPON_TYPE_SUBGUN	16
#define WEAPON_TYPE_ARIFLE	32
#define WEAPON_TYPE_RIFLE	64
#define WEAPON_TYPE_HEAVY	128

#define MAX_AMMO_TYPES		5
#define AMMO_TYPE_NORMAL	0
#define AMMO_TYPE_EXTRA		1	// +25% sebzés
#define AMMO_TYPE_PENET		2	// pajzsot átüti, azonban csak 25%os életsebzést okoz
#define AMMO_TYPE_BLOOD		3	// találat esetén vérzést okoz, 5 másodpercig 25%/sec
#define AMMO_TYPE_SUPER		4	// +10% sebzés, pajzs átütés (10%os), találat esetén vérzés 3 másodpercig 10%/sec

enum weaponPrice
{
	wWeapon,
	wAmmo,
	wWeaponMat,
	wAmmoMat,
}

new const WeaponPrice[MAX_WEAPONS][weaponPrice] =
{
	{     0,    0,     0,    0}, //  0 - ököl
	{     0,    0,     0,    0}, //  1 - bokszer
	{     0,    0,     0,    0}, //  2 - golfütõ
	{     0,    0,     0,    0}, //  3 - gumibot
	{ 30000,    0,     0,    0}, //  4 - kés
	{ 30000,    0,     0,    0}, //  5 - baseball ütõ
	{     0,    0,     0,    0}, //  6 - ásó
	{     0,    0,     0,    0}, //  7 - dákó
	{ 30000,    0,     0,    0}, //  8 - katana
	{     0,    0,     0,    0}, //  9 - láncfûrész
	{     0,    0,     0,    0}, // 10 - purple dildo
	{     0,    0,     0,    0}, // 11 - short vibrator
	{     0,    0,     0,    0}, // 12 - long vibrator
	{     0,    0,     0,    0}, // 13 - white dildo
	{     0,    0,     0,    0}, // 14 - virág
	{     0,    0,     0,    0}, // 15 - sétabot
	{     0,    0,     0,    0}, // 16 - gránát
	{     0,    0,     0,    0}, // 17 - füstbomba
	{     0,    0,     0,    0}, // 18 - molotov
	{     0,    0,     0,    0}, // 19 - 
	{     0,    0,     0,    0}, // 20 - 
	{     0,    0,     0,    0}, // 21 - 
	{ 65000,  300,  1500,   20}, // 22 - colt
	{ 75000,  300,  1500,   20}, // 23 - silenced
	{ 90000,  500,  1500,   50}, // 24 - deagle
	{150000, 3000,  3000,   75}, // 25 - shotgun
	{     0,    0,     0,    0}, // 26 - sawn-off
	{     0,    0, 20000,  100}, // 27 - combat
	{     0,    0,     0,    0}, // 28 - uzi
	{130000,  100,  2000,   20}, // 29 - mp5
	{     0,    0, 15000,   30}, // 30 - ak47
	{     0,    0, 50000,   50}, // 31 - m4
	{     0,    0,     0,    0}, // 32 - tec9
	{350000, 4000,  5000,  300}, // 33 - rifle
	{     0,    0, 50000, 1000}, // 34 - sniper
	{     0,    0,     0,    0}, // 35 - rakéta
	{     0,    0,     0,    0}, // 36 - hõ rakéta
	{     0,    0,     0,    0}, // 37 - lángszóró
	{     0,    0,     0,    0}, // 38 - minigun
	{     0,    0,     0,    0}, // 39 - c4
	{     0,    0,     0,    0}, // 40 - detonátor
	{     0,    0,     0,    0}, // 41 - spré
	{     0,    0,     0,    0}, // 42 - poroltó
	{     0,    0,     0,    0}, // 43 - kamera
	{     0,    0,     0,    0}, // 44 - éjellátó
	{     0,    0,     0,    0}, // 45 - hõlátó
	{ 10000,    0,   500,    0}  // 46 - ejtõernyõ
};

#define WEAPON_PRICES_CASH	1
#define WEAPON_PRICES_MATS	2
stock WeaponPrices(playerid, type, color)
{
	if(type == WEAPON_PRICES_CASH)
	{
		SendFormatMessage(playerid, color, "[Ütõfegyverek] kés %sFt, baseball ütõ: %sFt, katana: %sFt", \
			FormatInt(WeaponPrice[WEAPON_KNIFE][wWeapon]), FormatInt(WeaponPrice[WEAPON_BAT][wWeapon]), FormatInt(WeaponPrice[WEAPON_KATANA][wWeapon]));
			
		SendFormatMessage(playerid, color, "[Pisztoly] colt: %sFt, silenced: %sFt, deagle: %sFt", \
			FormatInt(WeaponPrice[WEAPON_COLT45][wWeapon]), FormatInt(WeaponPrice[WEAPON_SILENCED][wWeapon]), FormatInt(WeaponPrice[WEAPON_DEAGLE][wWeapon]));
			
		SendFormatMessage(playerid, color, "[Lõfegyver] mp5: %sFt, shotgun: %sFt, rifle: %sFt", \
			FormatInt(WeaponPrice[WEAPON_MP5][wWeapon]), FormatInt(WeaponPrice[WEAPON_SHOTGUN][wWeapon]), FormatInt(WeaponPrice[WEAPON_RIFLE][wWeapon]));
			
		SendFormatMessage(playerid, color, "[Lõszer] colt: %sFt, silenced: %sFt, deagle: %sFt, mp5: %sFt, shotgun: %sFt, rifle: %sFt", \
			FormatInt(WeaponPrice[WEAPON_COLT45][wAmmo]), FormatInt(WeaponPrice[WEAPON_SILENCED][wAmmo]), FormatInt(WeaponPrice[WEAPON_DEAGLE][wAmmo]), \
			FormatInt(WeaponPrice[WEAPON_MP5][wAmmo]), FormatInt(WeaponPrice[WEAPON_SHOTGUN][wAmmo]), FormatInt(WeaponPrice[WEAPON_RIFLE][wAmmo]));
	}
	else if(type == WEAPON_PRICES_MATS)
	{
		SendFormatMessage(playerid, color, "[Pisztoly] colt: %sdb, silenced: %sdb, deagle: %sdb", \
			FormatInt(WeaponPrice[WEAPON_COLT45][wWeaponMat]), FormatInt(WeaponPrice[WEAPON_SILENCED][wWeaponMat]), FormatInt(WeaponPrice[WEAPON_DEAGLE][wWeaponMat]));
			
		SendFormatMessage(playerid, color, "[Lõfegyver] mp5: %sdb, shotgun: %sdb, rifle: %sdb", \
			FormatInt(WeaponPrice[WEAPON_MP5][wWeaponMat]), FormatInt(WeaponPrice[WEAPON_SHOTGUN][wWeaponMat]), FormatInt(WeaponPrice[WEAPON_RIFLE][wWeaponMat]));
			
		SendFormatMessage(playerid, color, "[Lõfegyver] ak47: %sdb, combat: %sdb, m4: %sdb, sniper: %sdb", \
			FormatInt(WeaponPrice[WEAPON_AK47][wWeaponMat]), FormatInt(WeaponPrice[WEAPON_COMBAT][wWeaponMat]), FormatInt(WeaponPrice[WEAPON_M4][wWeaponMat]), \
			FormatInt(WeaponPrice[WEAPON_SNIPER][wWeaponMat]));
			
		SendFormatMessage(playerid, color, "[Lõszer] colt: %sdb, silenced: %sdb, deagle: %sdb, mp5: %sdb, shotgun: %sdb", \
			FormatInt(WeaponPrice[WEAPON_COLT45][wAmmoMat]), FormatInt(WeaponPrice[WEAPON_SILENCED][wAmmoMat]), FormatInt(WeaponPrice[WEAPON_DEAGLE][wAmmoMat]), \
			FormatInt(WeaponPrice[WEAPON_MP5][wAmmoMat]), FormatInt(WeaponPrice[WEAPON_SHOTGUN][wAmmoMat]));
			
		SendFormatMessage(playerid, color, "[Lõszer] rifle: %sdb, ak47: %sdb, combat: %sdb, m4: %sdb, sniper: %sdb", \
			FormatInt(WeaponPrice[WEAPON_RIFLE][wAmmoMat]), FormatInt(WeaponPrice[WEAPON_AK47][wAmmoMat]), FormatInt(WeaponPrice[WEAPON_COMBAT][wAmmoMat]), \
			FormatInt(WeaponPrice[WEAPON_M4][wAmmoMat]), FormatInt(WeaponPrice[WEAPON_SNIPER][wAmmoMat]));
	}
	
	return 1;
}

enum weaponData
{
	wObject,
	wSlot,
	wType,
	wAmmo
}

new const WeaponData[MAX_WEAPONS][weaponData] =
{
	// object, slot, type, maxammo
	{1575,  0, WEAPON_TYPE_HAND,       0}, //  0 - ököl
	{ 331,  0, WEAPON_TYPE_HAND,       0}, //  1 - bokszer
	{ 333,  1, WEAPON_TYPE_HAND,       0}, //  2 - golfütõ
	{ 334,  1, WEAPON_TYPE_HAND,       0}, //  3 - gumibot
	{ 335,  1, WEAPON_TYPE_HAND,       0}, //  4 - kés
	{ 336,  1, WEAPON_TYPE_HAND,       0}, //  5 - baseball ütõ
	{ 337,  1, WEAPON_TYPE_HAND,       0}, //  6 - ásó
	{ 338,  1, WEAPON_TYPE_HAND,       0}, //  7 - dákó
	{ 339,  1, WEAPON_TYPE_HAND,       0}, //  8 - katana
	{ 341,  1, WEAPON_TYPE_HAND,       0}, //  9 - láncfûrész
	{ 321, 10, WEAPON_TYPE_HAND,       0}, // 10 - purple dildo
	{ 322, 10, WEAPON_TYPE_HAND,       0}, // 11 - short vibrator
	{ 323, 10, WEAPON_TYPE_HAND,       0}, // 12 - long vibrator
	{ 324, 10, WEAPON_TYPE_HAND,       0}, // 13 - white dildo
	{ 325, 10, WEAPON_TYPE_HAND,       0}, // 14 - virág
	{ 326, 10, WEAPON_TYPE_HAND,       0}, // 15 - sétabot
	{ 342,  8, WEAPON_TYPE_THROWN,    50}, // 16 - gránát
	{ 343,  8, WEAPON_TYPE_THROWN,    50}, // 17 - füstbomba
	{ 344,  8, WEAPON_TYPE_THROWN,    50}, // 18 - molotov
	{1575,  0, 0, 0}, // 19 - 
	{1575,  0, 0, 0}, // 20 - 
	{1575,  0, 0, 0}, // 21 - 
	{ 346,  2, WEAPON_TYPE_PISTOL,  2000}, // 22 - colt
	{ 347,  2, WEAPON_TYPE_PISTOL,  2000}, // 23 - silenced
	{ 348,  2, WEAPON_TYPE_PISTOL,  2000}, // 24 - deagle
	{ 349,  3, WEAPON_TYPE_SHOTGUN, 2000}, // 25 - shotgun
	{ 350,  3, WEAPON_TYPE_SHOTGUN, 2000}, // 26 - sawn-off
	{ 351,  3, WEAPON_TYPE_SHOTGUN, 2000}, // 27 - combat
	{ 352,  4, WEAPON_TYPE_SUBGUN,  8000}, // 28 - uzi
	{ 353,  4, WEAPON_TYPE_SUBGUN,  8000}, // 29 - mp5
	{ 355,  5, WEAPON_TYPE_ARIFLE,  8000}, // 30 - ak47
	{ 356,  5, WEAPON_TYPE_ARIFLE,  8000}, // 31 - m4
	{ 372,  4, WEAPON_TYPE_SUBGUN,  8000}, // 32 - tec9
	{ 357,  6, WEAPON_TYPE_RIFLE,   2000}, // 33 - rifle
	{ 358,  6, WEAPON_TYPE_RIFLE,   2000}, // 34 - sniper
	{ 359,  7, WEAPON_TYPE_HEAVY,     25}, // 35 - rakéta
	{ 360,  7, WEAPON_TYPE_HEAVY,     25}, // 36 - hõ rakéta
	{ 361,  7, WEAPON_TYPE_HEAVY,      0}, // 37 - lángszóró
	{ 362,  7, WEAPON_TYPE_HEAVY,      0}, // 38 - minigun
	{ 363,  8, WEAPON_TYPE_THROWN,     0}, // 39 - c4
	{ 364, 12, 0, 0}, // 40 - detonátor
	{ 365,  9, WEAPON_TYPE_HAND,    9000}, // 41 - spré
	{ 366,  9, WEAPON_TYPE_HAND,    9000}, // 42 - poroltó
	{ 367,  9, WEAPON_TYPE_HAND,       0}, // 43 - kamera
	{ 368, 11, WEAPON_TYPE_HAND,       0}, // 44 - éjellátó
	{ 369, 11, WEAPON_TYPE_HAND,       0}, // 45 - hõlátó
	{ 371, 11, WEAPON_TYPE_HAND,       0}  // 46 - ejtõernyõ
};

enum weaponOffset
{
	wBone,
	Float:wOff[3],
	Float:wRot[3],
	wIndex
}

new const WeaponOffset[MAX_WEAPONS][weaponOffset] =
{
	// bone, offset, rotation, index
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  0 - ököl
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  1 - bokszer
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  2 - golfütõ
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  3 - gumibot
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  4 - kés
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  5 - baseball ütõ
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  6 - ásó
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  7 - dákó
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  8 - katana
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, //  9 - láncfûrész
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 10 - purple dildo
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 11 - short vibrator
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 12 - long vibrator
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 13 - white dildo
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 14 - virág
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 15 - sétabot
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 16 - gránát
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 17 - füstbomba
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 18 - molotov
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 19 - 
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 20 - 
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 21 - 
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 22 - colt
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 23 - silenced
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 24 - deagle
	{ BONE_SPINE,        { -0.089997, -0.228999,  0.069999}, {   0.000000, 161.199935,   16.000001}, WEAPON_SLOT_SHOTGUN }, // 25 - shotgun
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 26 - sawn-off
	{ BONE_LEFT_THIGHT,  { -0.133000, -0.046999, -0.171998}, { -67.500053,   2.100000,    2.099999}, WEAPON_SLOT_COMBAT }, // 27 - combat
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 28 - uzi
	{ BONE_RIGHT_THIGHT, {  0.000000, -0.119000,  0.174998}, { -93.099990,   0.000000,    6.799998}, WEAPON_SLOT_MP5 }, // 29 - mp5
	{ BONE_SPINE,        {  0.264999, -0.151998,  0.059999}, {  -3.700001, 169.999908,    4.299993}, WEAPON_SLOT_M4_AK47 }, // 30 - ak47
	{ BONE_SPINE,        {  0.264999, -0.151998,  0.059999}, {  -3.700001, 169.999908,    4.299993}, WEAPON_SLOT_M4_AK47 }, // 31 - m4
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 32 - tec9
	{ BONE_SPINE,        {  0.013999, -0.165998, -0.067999}, { 177.099990, 165.899993,    2.299994}, WEAPON_SLOT_RIFLE }, // 33 - rifle
	{ BONE_SPINE,        {  0.232999, -0.162999, -0.076999}, {  -7.199835,  14.199996, -169.800003}, WEAPON_SLOT_SNIPER }, // 34 - sniper
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 35 - rakéta
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 36 - hõ rakéta
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 37 - lángszóró
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 38 - minigun
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 39 - c4
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 40 - detonátor
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 41 - spré
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 42 - poroltó
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 43 - kamera
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 44 - éjellátó
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}, // 45 - hõlátó
	{ 0, {0.0,0.0,0.0}, {0.0,0.0,0.0}, 0}  // 46 - ejtõernyõ
};

// player
#define MAX_PLAYER_WEAPONS 8
enum playerWeapons
{
	pWeapon[MAX_PLAYER_WEAPONS],
	pAmmo[MAX_WEAPONS],
	pArmed,
	pArmedSlot,
	pArmedSafeTime
}
new PlayerWeapons[MAX_PLAYERS][playerWeapons];

enum playerWeaponsAC
{
	pLastProblem,
	pLastAmmo,
	pLastAmmoTimes,
	pLastOpac[3],
	pProblems
}
new PlayerWeaponsAC[MAX_PLAYERS][playerWeaponsAC];

// limit
#define WEAPONS_LIMIT_MEELE		2
#define WEAPONS_LIMIT_GUN		4
#define WEAPONS_LIMIT_ARIFLE	1
#define WEAPONS_LIMIT_PARACHUTE	1

#define WEAPONS_TIME_ARMED			3
#define WEAPONS_TIME_PROBLEM		3
#define WEAPONS_TIME_PROBLEM_KICK	60
#define WEAPONS_LIMIT_PROBLEM_KICK	3

// error ID
#define WEAPONS_CAN_HOLD_WEAPON_MANY	(-1)
#define WEAPONS_CAN_HOLD_WEAPON_FULL	(-2)
#define WEAPONS_CAN_HOLD_WEAPON_NO		(-3)

// anti cheat
#define WEAPONS_PROBLEM_AMMO_ARM		(1001)
#define WEAPONS_PROBLEM_AMMO_MORE		(1002)
#define WEAPONS_PROBLEM_AMMO_INFINITE	(1003)
#define WEAPONS_PROBLEM_SHOOT_ARM		(1004)
#define WEAPONS_PROBLEM_SHOOT_INFINITE	(1005)

// function
#define PlayerWeaponsResetWeapons(%1) PlayerWeapons[%1][pWeapon] = {0,0,0,0,0,0,0,0}
#define PlayerWeaponsResetAmmos(%1) PlayerWeapons[%1][pAmmo] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
#define PlayerWeaponsReset(%1) PlayerWeaponsResetWeapons(%1), PlayerWeaponsResetAmmos(%1)
#define WeaponWeapon(%1,%2) PlayerWeapons[%1][pWeapon][%2]
#define WeaponAmmo(%1,%2) PlayerWeapons[%1][pAmmo][%2]
#define WeaponType(%1) WeaponData[%1][wType]
#define WeaponSlot(%1) WeaponData[%1][wSlot]
#define WeaponMaxAmmo(%1) WeaponData[%1][wAmmo]
#define WeaponObject(%1) WeaponData[%1][wObject]
#define WeaponArmed(%1) PlayerWeapons[%1][pArmed]
#define WeaponArmedSlot(%1) PlayerWeapons[%1][pArmedSlot]

stock WeaponArm(playerid, weapon = 0) // return: true ha sikerült, máskülönben false
{
	if(weapon < 0 || weapon > MAX_WEAPONS)
		return 0;
		
	ResetPlayerWeapons(playerid);
	PlayerWeapons[playerid][pArmed] = 0;
	PlayerWeapons[playerid][pArmedSlot] = NINCS;
	PlayerWeapons[playerid][pArmedSafeTime] = gettime() + WEAPONS_TIME_ARMED;

	if(weapon)
	{
		new slot = WeaponHaveWeapon(playerid, weapon);
		if(slot == NINCS)
			return 0;
			
		/*if(PlayerWeapons[playerid][pAmmo][weapon] > 0)
		{
			PlayerWeapons[playerid][pArmed] = weapon;
			PlayerWeapons[playerid][pArmedSlot] = slot;
			GivePlayerWeapon(playerid, weapon, PlayerWeapons[playerid][pAmmo][weapon]);
		}
		else if(WeaponData[ PlayerWeapons[playerid][pAmmo][weapon] ][wType] == WEAPON_TYPE_HAND)
		{
			PlayerWeapons[playerid][pArmed] = weapon;
			PlayerWeapons[playerid][pArmedSlot] = slot;
			GivePlayerWeapon(playerid, weapon, 1);
		}*/
		
		if(PlayerWeapons[playerid][pAmmo][weapon] > 0)
			GivePlayerWeapon(playerid, weapon, PlayerWeapons[playerid][pAmmo][weapon]);
		else if(WeaponData[ PlayerWeapons[playerid][pAmmo][weapon] ][wType] == WEAPON_TYPE_HAND)
			GivePlayerWeapon(playerid, weapon, 1);
		
		PlayerWeapons[playerid][pArmed] = weapon;
		PlayerWeapons[playerid][pArmedSlot] = slot;
	}
	
	WeaponRefreshAttachments(playerid);
		
	return 1;
}

stock WeaponCanHave(playerid, weapon) // return: true ha tudja viselni, máskülönben false
{
	if(
		Szint(playerid) < WEAPON_MIN_LEVEL || !Logged(playerid) || PlayerInfo[playerid][pFegyverTiltIdo] > 0
		|| (WEAPON_ROCKETLAUNCHER <= weapon <= WEAPON_FLAMETHROWER || WEAPON_CAMERA <= weapon <= WEAPON_THERMAL_GOGGLES || WEAPON_GRENADE <= weapon <= WEAPON_MOLTOV) && !Admin(playerid, 1337)
		|| weapon == WEAPON_FIREEXTINGUISHER && !LMT(playerid, FRAKCIO_TUZOLTO)
		|| weapon == WEAPON_CHAINSAW && !LMT(playerid, FRAKCIO_TUZOLTO) && !AMT(playerid, MUNKA_FAVAGO)
		|| (weapon == WEAPON_SAWEDOFF || weapon == WEAPON_UZI || weapon == WEAPON_TEC9) && !IsHitman(playerid)
	)
		return Admin(playerid, 1337);
		
	return 1;
}

stock WeaponCanHoldWeapon(playerid, weapon, maxweapon = 1) // return: szabad slot, vagy hiba esetén hiba ID
{
	if(weapon < 1 || weapon > MAX_WEAPONS)
		return WEAPONS_CAN_HOLD_WEAPON_FULL;
		
	if(!WeaponCanHave(playerid, weapon))
		return WEAPONS_CAN_HOLD_WEAPON_NO;
		
	new free = NINCS;
	new meele, gun, arifle, parachute, pieces;
	
	for(new i, w; i < MAX_PLAYER_WEAPONS; i++)
	{
		w = PlayerWeapons[playerid][pWeapon][i];
		
		if(!w)
		{
			if(free == NINCS) // szabad slot
				free = i;
			
			continue;
		}
		
		// fegyver számlálás
		if(w == WEAPON_PARACHUTE) parachute++;
		else switch(WeaponData[w][wType])
		{
			case WEAPON_TYPE_HAND: meele++;
			case WEAPON_TYPE_PISTOL, WEAPON_TYPE_SHOTGUN, WEAPON_TYPE_SUBGUN, WEAPON_TYPE_RIFLE: gun++;
			case WEAPON_TYPE_ARIFLE: arifle++;
		}
		
		if(w == weapon) // ugyanolyan fegyverek megszámlálása
			pieces++;
	}
	
	if(maxweapon > 0 && pieces >= maxweapon) // ha megvan határozva a max mennyiség, akkor ellenõrzi és megakadályozza, hogy több legyen
		return WEAPONS_CAN_HOLD_WEAPON_MANY;
	
	if(free == NINCS) // nincs szabad slot?
		return WEAPONS_CAN_HOLD_WEAPON_FULL;
	
	// limit ellenõrzés
	if(weapon == WEAPON_PARACHUTE && parachute >= WEAPONS_LIMIT_PARACHUTE) return WEAPONS_CAN_HOLD_WEAPON_MANY;
	switch(WeaponData[weapon][wType])
	{
		case WEAPON_TYPE_HAND:
			if(meele >= WEAPONS_LIMIT_MEELE)
				return WEAPONS_CAN_HOLD_WEAPON_MANY;
				
		case WEAPON_TYPE_PISTOL, WEAPON_TYPE_SHOTGUN, WEAPON_TYPE_SUBGUN, WEAPON_TYPE_RIFLE:
			if(gun >= WEAPONS_LIMIT_GUN)
				return WEAPONS_CAN_HOLD_WEAPON_MANY;
				
		case WEAPON_TYPE_ARIFLE:
			if(arifle >= WEAPONS_LIMIT_ARIFLE)
				return WEAPONS_CAN_HOLD_WEAPON_MANY;
				
		default:
			return WEAPONS_CAN_HOLD_WEAPON_MANY;
	}
	
	return free;
}

stock WeaponCanHoldAmmo(playerid, weapon, ammo) // return: true ha tud, máskülönben false
{
	if(weapon < 1 || weapon > MAX_WEAPONS || ammo < 1)
		return 0;
		
	return (PlayerWeapons[playerid][pAmmo][weapon] + ammo) <= WeaponMaxAmmo(weapon);
}

stock WeaponHaveWeapon(playerid, weapon) // return: weapon slot, -1 ha nincs
{
	if(weapon < 1 || weapon > MAX_WEAPONS)
		return NINCS;
		
	for(new w = 0; w < MAX_PLAYER_WEAPONS; w++)
		if(PlayerWeapons[playerid][pWeapon][w] == weapon)
			return w;
	
	return NINCS;
}

stock WeaponHaveAmmo(playerid, weapon, ammo) // return: true ha van, máskülönben false
{
	if(weapon < 1 || weapon > MAX_WEAPONS || ammo < 1)
		return 0;
		
	return PlayerWeapons[playerid][pAmmo][weapon] >= ammo;
}

stock WeaponGiveWeapon(playerid, weapon, ammo = 0, maxweapon = 1) // return: sikeres fegyveradásnál slot, hiba esetén hiba ID
{
	// fegyver ellenõrzés és szabad slot lekérés
	new slot = WeaponCanHoldWeapon(playerid, weapon, maxweapon);
	
	if(slot >= 0)
	{
		PlayerWeapons[playerid][pWeapon][slot] = weapon;
		WeaponRefreshAttachments(playerid);
	}
	
	if(ammo > 0)
		WeaponGiveAmmo(playerid, weapon, ammo);
	
	return slot;
}

stock WeaponGiveAmmo(playerid, weapon, ammo) // return: siker esetén true, egyébként false
{
	if(!WeaponData[weapon][wAmmo])
		return 0;
		
	PlayerWeapons[playerid][pAmmo][weapon] = max(0, min(WeaponAmmo(playerid, weapon) + ammo, WeaponMaxAmmo(weapon)));
	
	if(PlayerWeapons[playerid][pArmed] == weapon)
		WeaponArm(playerid, PlayerWeapons[playerid][pAmmo][weapon] ? weapon : 0);
	
	return 1;
}

stock WeaponTakeWeapon(playerid, weapon) // return: siker esetén true, egyébként false
{
	if(weapon < 1 || weapon > MAX_WEAPONS)
		return 0;
		
	for(new w = 0; w < MAX_PLAYER_WEAPONS; w++)
	{
		if(PlayerWeapons[playerid][pWeapon][w] == weapon)
			return
				PlayerWeapons[playerid][pWeapon][w] = 0,
				WeaponRefreshAttachments(playerid),
				(weapon == PlayerWeapons[playerid][pArmed] ? WeaponArm(playerid, 0) : 1),
				1
			;
	}
	
	return 0;
}

stock WeaponTakeAmmo(playerid, weapon) // return: siker esetén true, egyébként false
{
	if(weapon < 1 || weapon > MAX_WEAPONS)
		return 0;
		
	if(PlayerWeapons[playerid][pAmmo][weapon])
		return
			PlayerWeapons[playerid][pAmmo][weapon] = 0,
			(weapon == PlayerWeapons[playerid][pArmed] ? WeaponArm(playerid, 0) : 1),
			1
		;
	
	return 0;
}

stock WeaponResetWeapons(playerid) // return: nincs
{
	PlayerWeaponsResetWeapons(playerid);
	WeaponArm(playerid);
}

stock WeaponResetAmmos(playerid) // return: nincs
{
	PlayerWeaponsResetAmmos(playerid);
	WeaponArm(playerid);
}

stock WeaponResetAll(playerid) // return: nincs
{
	PlayerWeaponsReset(playerid);
	WeaponArm(playerid);
}

stock WeaponRefreshAttachments(playerid, bool:onlyremove = false) // return: true
{
	if(onlyremove)
	{
		RemovePlayerAttachedObject(playerid, WEAPON_SLOT_MP5);
		RemovePlayerAttachedObject(playerid, WEAPON_SLOT_SHOTGUN);
		RemovePlayerAttachedObject(playerid, WEAPON_SLOT_COMBAT);
		RemovePlayerAttachedObject(playerid, WEAPON_SLOT_RIFLE);
		RemovePlayerAttachedObject(playerid, WEAPON_SLOT_SNIPER);
		RemovePlayerAttachedObject(playerid, WEAPON_SLOT_M4_AK47);
		return 1;
	}

	new mp5, shotgun, combat, rifle, sniper, m4, ak47;
	for(new w = 0; w < MAX_PLAYER_WEAPONS; w++)
	{
		if(PlayerWeapons[playerid][pWeapon][w]) switch(PlayerWeapons[playerid][pWeapon][w])
		{
			case WEAPON_MP5: mp5++;
			case WEAPON_SHOTGUN: shotgun++;
			case WEAPON_SHOTGSPA: combat++;
			case WEAPON_RIFLE: rifle++;
			case WEAPON_SNIPER: sniper++;
			case WEAPON_M4: m4++;
			case WEAPON_AK47: ak47++;
		}
	}
	
	if(mp5 && WeaponArmed(playerid) != WEAPON_MP5) SetPlayerAttachedObject(playerid, WeaponOffset[WEAPON_MP5][wIndex], GetWeaponModel(WEAPON_MP5), WeaponOffset[WEAPON_MP5][wBone], ArrExt(WeaponOffset[WEAPON_MP5][wOff]), ArrExt(WeaponOffset[WEAPON_MP5][wRot]));
	else RemovePlayerAttachedObject(playerid, WeaponOffset[WEAPON_MP5][wIndex]);
	
	if(shotgun && WeaponArmed(playerid) != WEAPON_SHOTGUN) SetPlayerAttachedObject(playerid, WeaponOffset[WEAPON_SHOTGUN][wIndex], GetWeaponModel(WEAPON_SHOTGUN), WeaponOffset[WEAPON_SHOTGUN][wBone], ArrExt(WeaponOffset[WEAPON_SHOTGUN][wOff]), ArrExt(WeaponOffset[WEAPON_SHOTGUN][wRot]));
	else RemovePlayerAttachedObject(playerid, WeaponOffset[WEAPON_SHOTGUN][wIndex]);
	
	if(combat && WeaponArmed(playerid) != WEAPON_SHOTGSPA) SetPlayerAttachedObject(playerid, WeaponOffset[WEAPON_SHOTGSPA][wIndex], GetWeaponModel(WEAPON_SHOTGSPA), WeaponOffset[WEAPON_SHOTGSPA][wBone], ArrExt(WeaponOffset[WEAPON_SHOTGSPA][wOff]), ArrExt(WeaponOffset[WEAPON_SHOTGSPA][wRot]));
	else RemovePlayerAttachedObject(playerid, WeaponOffset[WEAPON_SHOTGSPA][wIndex]);
	
	if(rifle && WeaponArmed(playerid) != WEAPON_RIFLE) SetPlayerAttachedObject(playerid, WeaponOffset[WEAPON_RIFLE][wIndex], GetWeaponModel(WEAPON_RIFLE), WeaponOffset[WEAPON_RIFLE][wBone], ArrExt(WeaponOffset[WEAPON_RIFLE][wOff]), ArrExt(WeaponOffset[WEAPON_RIFLE][wRot]));
	else RemovePlayerAttachedObject(playerid, WeaponOffset[WEAPON_RIFLE][wIndex]);
	
	if(sniper && WeaponArmed(playerid) != WEAPON_SNIPER) SetPlayerAttachedObject(playerid, WeaponOffset[WEAPON_SNIPER][wIndex], GetWeaponModel(WEAPON_SNIPER), WeaponOffset[WEAPON_SNIPER][wBone], ArrExt(WeaponOffset[WEAPON_SNIPER][wOff]), ArrExt(WeaponOffset[WEAPON_SNIPER][wRot]));
	else RemovePlayerAttachedObject(playerid, WeaponOffset[WEAPON_SNIPER][wIndex]);
	
	if(m4 && WeaponArmed(playerid) != WEAPON_M4) SetPlayerAttachedObject(playerid, WeaponOffset[WEAPON_M4][wIndex], GetWeaponModel(WEAPON_M4), WeaponOffset[WEAPON_M4][wBone], ArrExt(WeaponOffset[WEAPON_M4][wOff]), ArrExt(WeaponOffset[WEAPON_M4][wRot]));
	else if(ak47 && WeaponArmed(playerid) != WEAPON_AK47) SetPlayerAttachedObject(playerid, WeaponOffset[WEAPON_AK47][wIndex], GetWeaponModel(WEAPON_AK47), WeaponOffset[WEAPON_AK47][wBone], ArrExt(WeaponOffset[WEAPON_AK47][wOff]), ArrExt(WeaponOffset[WEAPON_AK47][wRot]));
	else RemovePlayerAttachedObject(playerid, WeaponOffset[WEAPON_M4][wIndex]);
	
	return 1;
}

stock WeaponProblem(playerid, problem) // return: probléma feldolgozása esetén true, egyébként false
{
	new time = gettime();
	
	if(PlayerWeapons[playerid][pArmedSafeTime] > time || PlayerWeaponsAC[playerid][pLastProblem] > time)
		return 0;
	
	if(PlayerWeaponsAC[playerid][pLastProblem] >= (time - WEAPONS_TIME_PROBLEM_KICK))
	{
		PlayerWeaponsAC[playerid][pLastProblem]++;
		if(PlayerWeaponsAC[playerid][pLastProblem] >= WEAPONS_LIMIT_PROBLEM_KICK)
			return Kick(playerid);
	}
	else
		PlayerWeaponsAC[playerid][pLastProblem] = 1;
	
	PlayerWeaponsAC[playerid][pLastProblem] = time + WEAPONS_TIME_PROBLEM;
	
	new msg[256];
	switch(problem)
	{
		case WEAPONS_PROBLEM_AMMO_ARM:
		{
			if(GetPlayerWeapon(playerid) == WEAPON_PARACHUTE) return 1;
			format(msg, 128, "<< Nem vett elõ fegyvert, mégis van nála: [%d]%s - %s[%d] >>", playerid, PlayerName(playerid), GetGunName(GetPlayerWeapon(playerid)), GetPlayerAmmo(playerid));
			SendMessage(SEND_MESSAGE_ADMIN, msg, COLOR_YELLOW, 1);
			Log("Cheat", msg);
			
			WeaponArm(playerid);
		}
			
		case WEAPONS_PROBLEM_AMMO_MORE:
		{
			format(msg, 128, "<< Több lõszere van a kelleténél: [%d]%s - %s: kellene: %d, van: %d >>", playerid, PlayerName(playerid), GetGunName(PlayerWeapons[playerid][pArmed]), PlayerWeapons[playerid][pAmmo][ PlayerWeapons[playerid][pArmed] ], GetPlayerAmmo(playerid));
			SendMessage(SEND_MESSAGE_ADMIN, msg, COLOR_YELLOW, 1);
			Log("Cheat", msg);
			
			WeaponArm(playerid);
		}
		
		case WEAPONS_PROBLEM_AMMO_INFINITE:
		{
			format(msg, 128, "<< Úgy tûnik végtelen lõszere van: [%d]%s - %s[%d:%d] >>", playerid, PlayerName(playerid), GetGunName(GetPlayerWeapon(playerid)), PlayerWeaponsAC[playerid][pLastOpac][0], PlayerWeaponsAC[playerid][pLastOpac][1]);
			SendMessage(SEND_MESSAGE_ADMIN, msg, COLOR_YELLOW, 1);
			Log("Cheat", msg);
			
			WeaponArm(playerid);
		}
		
		case WEAPONS_PROBLEM_SHOOT_ARM:
		{
			format(msg, 128, "<< Nem azzal a fegyverrel lõ, amit elõvett: [%d]%s, kellene: %s, van: %s >>", playerid, PlayerName(playerid), GetGunName(PlayerWeapons[playerid][pArmed]), GetGunName(GetPlayerWeapon(playerid)));
			SendMessage(SEND_MESSAGE_ADMIN, msg, COLOR_YELLOW, 1);
			Log("Cheat", msg);
			
			WeaponArm(playerid);
		}
		
		case WEAPONS_PROBLEM_SHOOT_INFINITE:
		{
			format(msg, 128, "<< Úgy tûnik végtelen lõszere van: [%d]%s, fegyver: %s[%ddb] >>", playerid, PlayerName(playerid), GetGunName(PlayerWeapons[playerid][pArmed]), PlayerWeapons[playerid][pAmmo][ PlayerWeapons[playerid][pArmed] ]);
			SendMessage(SEND_MESSAGE_ADMIN, msg, COLOR_YELLOW, 1);
			Log("Cheat", msg);
			
			WeaponArm(playerid);
		}
	}
	
	return 1;
}

stock GetWeaponOffset(weaponid)
{
	switch(weaponid)
	{
		case WEAPON_MP5: return WEAPON_SLOT_MP5;
		case WEAPON_SHOTGUN: return WEAPON_SLOT_SHOTGUN;
		case WEAPON_SHOTGSPA: return WEAPON_SLOT_COMBAT;
		case WEAPON_RIFLE: return WEAPON_SLOT_RIFLE;
		case WEAPON_SNIPER: return WEAPON_SLOT_SNIPER;
		case WEAPON_M4, WEAPON_AK47: return WEAPON_SLOT_M4_AK47;
		default: return NINCS;
	}
}

stock GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
	    case 1:
	        return 331;

		case 2..8:
		    return weaponid+331;

        case 9:
		    return 341;

		case 10..15:
			return weaponid+311;

		case 16..18:
		    return weaponid+326;

		case 22..29:
		    return weaponid+324;

		case 30,31:
		    return weaponid+325;

		case 32:
		    return 372;

		case 33..45:
		    return weaponid+324;

		case 46:
		    return 371;
	}
	return 0;
}