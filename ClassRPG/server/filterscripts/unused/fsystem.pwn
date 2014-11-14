#include <a_samp>
#define FILTERSCRIPT
#include <zcmd>
#include <mysql>
#include <streamer>
#include <formatnumber>
#include <sscanf2>

#define MAXHAZ 		600
#define MAXBUTOR	25
#define MAXBUTORSZAM	MAXHAZ * MAXBUTOR

#define DIALOG_BUTOR			9878
#define DIALOG_SZABAD_BUTOROK 	9879
#define DIALOG_BUTOR_VETEL	 	9880
#define	DIALOG_BUTOR_SZERKESZTES	9881
#define DIALOG_BUTOR_KATEGORIA		9882
#define DIALOG_BUTOR_ASZTAL			9883
#define DIALOG_SZABAD_BUTOROK_LISTA	9884
#define DIALOG_BUTOR_MEGVETEL		9885
#define DIALOG_BUTOR_TORLES			9886

#define MYSQL_HOST				"localhost"
#define MYSQL_USER				"seosee"
#define MYSQL_PW				"seeseo"
#define MYSQL_DB				"seosee"

#define COL_LILA 		"{A000FA}"//	   |
#define COL_PIROS 		"{F81414}"//	   |
#define COL_VPIROS		"{FF6347}"//   	   |
#define COL_VKEK 		"{00C0FF}"//	   |
#define COL_VZOLD 		"{6EF83C}"//	   |
#define COL_FEHER 		"{FFFFFF}"//	   |
#define COL_NARANCS 	"{FA9600}"//	   |
#define COL_CITROM 		"{FAE600}"//	   |
#define COL_PINK 		"{F814E6}"//	   |
#define COL_SKEK 		"{1466F8}"//	   |
#define COL_SZURKE 		"{757167}"//	   |
#define COL_VPINK 		"{FF3E98}"//	   |
#define COL_NZOLD 		"{22F710}"//	   |
#define COL_FEKETE		"{000000}"//	   |

enum butorInfo
{
	Float:butorPosX,
	Float:butorPosY,
	Float:butorPosZ,
	Float:butorPosRX,
	Float:butorPosRY,
	Float:butorPosRZ,
	butorModel,
	butorVW,
	butorInterior,
	bool:butorHasznalva,
	bool:butorMegveve,
	butorObject,
	butorTipus,
	butorListitem
}

new ButorInfo[MAXHAZ * MAXBUTOR][butorInfo];

new
	ButorKategoria[MAX_PLAYERS],
	SzerkesztesButor[MAX_PLAYERS];

enum butorEnum {
    butorID,
    butorNEV[48],
    butorAR
}

new Butor_Asztal[][butorEnum] =
{
	{2357,		"Négyszögletes hosszú asztal",				12500},
	{2119,		"Kerekített végû asztal",					7500},
	{2762,		"Négyszögletes középhosszú asztal (piros)",	6000},
	{2763,		"Négyszögletes kocka alakú (piros)",		6000},
	{2764,		"Négyszögletes kockaterítõs asztal",		10000},
	{2118,		"Ovális márvány asztal",					18000},
	{2117,		"Négyszögletes asztal",						16000},
	{2116,		"Négyszögletes asztal (világos barna)",		12000},
	{2115,		"Négyszögletes asztal (világos barna)",		12000},
	{2110,		"Kerekített talpú szögletes asztal",		7000},
	{2109,		"Barna asztal",								10000},
	{2032,		"Sötét barna asztal",						10000},
	{2031,		"Ovális asztal",							10000},
	{2030,		"Kerek márvány asztal",						30000},
	{2029,		"Szögletes vastaglábú",						15000},
	{1770,		"Kerekített talpú szögletes",				7000},
	{1737,		"Szögletes asztal",							15000},
	{1814,		"Szögletes TV asztal",						15000},
	{1815,		"Kör alakú",								7600},
	{1817,		"Üveglapos szögletes asztal",				22000},
	{1818,		"Kicsi TV asztal",							7600},
	{1819,		"Kerek asztal",								7000},
	{1820,		"Kicsi kerek",								5000},
	{1822,		"Kerek üveglapos",							12500},
	{1823,		"Szögletes asztal (kicsi)",					5000},
	{2126,		"Kerekített üveglapos",						8000},
	{2112,		"Négyzet",									7000},
	{2111,		"Kerek",									7000},
	{2236,		"Szögletes",								7000},
	{1433,		"Szögletes",								7000},
	{1516,		"Szögletes vékony lábakkal",				7000},
	{2311,		"Szögletes hosszú",							7000},
	{2315,		"Szögletes hosszú",							7000},
	{2321,		"Szögletes hosszú",							7000},
	{2370,		"Négyzet",									10000}
};

new Butor_Ulogarnitura[][butorEnum] =
{
	{2290,		"Három személyes hosszú",					40000},
	{1768,		"Hosszú",									25000},
	{1766,		"Két részes",								15000},
	{1764,		"Három személyes",							15000},
	{1763,		"Közepes 3 személyes",						15000},
	{1761,		"Három személyes",							15000},
	{1760,		"Három személyes mintás",					15000},
	{1757,		"Levél mintázatú",							15000},
	{1756,		"Három személyes",							15000},
	{1753,		"Három személyes (barna)",					50000},
	{1713,		"Kettõ személyes (szürke)",					45000},
	{1712,		"Kettõ személyes (világos barna)", 			35000},
	{1710,		"Négy személyes (világos barna)", 			58000},
	{1709,		"Kerekített hat személyes (világos barna)",	96500},
	{1706,		"Két személyes (lila)",						19500},
	{1703,		"Három személyes (fekete)",					25000},
	{1702,		"Három személyes (barna)",					25000},
	{1723,		"Három személyes (fekete)",					25000},
	{1726,		"Három személyes (fekete)",					25000},
	{1728,		"Három személyes (világos barna)",			25000}
};

new Butor_Kepek[][butorEnum] =
{
	{2255,		"Múzsa", 				15000},
	{2256,		"Pálma fa", 			7000},
	{2257,		"Absztrakt", 			19000},
	{2258,		"Látkép", 				7000},
	{2259,		"Bowling pálya", 		8000},
	{2260,		"Folyó", 				8000},
	{2261,		"Híd", 					7500},
	{2262,		"Belváros", 			5800},
	{2263,		"Dokk", 				5000},
	{2264,		"Tengerpart", 			6000},
	{2265,		"Sivatagi hõség", 		7500},
	{2266,		"Belváros", 			11500},
	{2267,		"Teherhajó", 			13500},
	{2268,		"Macska", 				11500},
	{2269,		"Dombok", 				5000},
	{2270,		"Levelek hullása", 		14500},
	{2271,		"Csendélet", 			5000},
	{2272,		"Természet lágyöle",	6500},
	{2273,		"Virágok Illata", 		14600},
	{2274,		"Rózsa", 				14500},
	{2275,		"Gyümölcstál", 			10000},
	{2276,		"Lánc-híd", 			10000},
	{2277,		"Macska", 				16000},
	{2278,		"Kirakodás", 			12500},
	{2279,		"Zord sziklák", 		10000},
	{2280,		"Tengerpart", 			10000},
	{2281,		"Izzó parázs", 			6000},
	{2282,		"Sárga villanás", 		7600},
	{2283,		"Absztrakt", 			20500},
	{2284,		"Bazilika", 			16500},
	{2285,		"Földrengés", 			12500},
	{2286,		"Teherhajó", 			16500}
};


new Butor_Lampak[][butorEnum] =
{
	{2239,		"Kiállító termi lámpa", 12890},
	{2238,		"Láva lámpa", 			3600},
	{2196,		"Asztali lámpa", 		3000},
	{2108,		"Nappali lámpa", 		12800},
	{2106,		"Éjjeli lámpa", 		5000},
	{2105,		"Éjjeli lámpa", 		7000},
	{2069,		"Éjjeli lámpa", 		9000}
};

new Butor_TV[][butorEnum] =
{
	{14772,		"Kis TV", 			35000},
	{14604,		"TV Videóval", 		40000},
	{1429,		"Kis TV", 			35000},
	{1518,		"Közepes TV", 		38000},
	{1717,		"TV Álvánnyal", 	30000},
	{1747,		"Kis TV", 			25000},
	{1748,		"Kis TV", 			25000},
	{1749,		"Közepes TV", 		19800},
	{1750,		"Közepes TV", 		19800},
	{1751,		"Közepes TV", 		19500},
	{1752,		"Közepes TV", 		19800},
	{1781,		"Kis TV", 			30000},
	{1786,		"Nagy TV", 			68500},
	{1791,		"Közepes TV", 		50000},
	{1792,		"Nagy TV", 			49500},
	{2224,		"Lámpabúrás TV", 	35000},
	{2296,		"TV Szekrénnyel", 	95000},
	{2297,		"TV Videóval", 		115000},
	{2312,		"Nagy TV", 			68500},
	{2316,		"Közepes TV", 		65000},
	{2595,		"TV Videóval", 		50600},
	{2596,		"Sarok TV", 		45600},
	{2700,		"Sarok TV", 		45600}
};

new Butor_DVDHiFi[][butorEnum] =
{
	{1719,		"Nintendo",				19500},
	{1782,		"Videó lejátszó",		35000},
	{1783,		"Videó lejátszó",		35000},
	{1785,		"Videó lejátszó",		35000},
	{1787,		"Videó lejátszó",		35000},
	{1788,		"Videó lejátszó",		35000},
	{1790,		"Videó lejátszó",		35000},
	{1809,		"HiFi",					76500},
	{1839,		"HiFi",					76500},
	{2099,		"HiFi hangfallal",		95600},
	{2100,		"HiFi hangfallal",		95600},
	{2227,		"HiFi álványon",		60000},
	{2226,		"Magnó",				35600},
	{2225,		"Két HiFi álványon",	46800}
};

new Butor_Hangfal[][butorEnum] =
{
	{2229,		"Magas Hangfal", 			40000},
	{2230,		"Fakeretes hangfal", 		38000},
	{2231,		"Fakeretes kis hangfal", 	28000},
	{2232,		"Fekete nagy hangfal", 		46000},
	{2233,		"Álványos hangfal", 		35600},
	{1840,		"Kis Hangfal", 				26000}
};

new Butor_Szekreny[][butorEnum] =
{
	{936,		"Konyha Szekrény", 			90500},
	{937,		"Konyha Szekrény", 			80500},
	{1416,		"Fa szekrény", 				60000},
	{1417,		"Kis Gardrób", 				59500},
	{1741,		"Alsónemûs szekrény", 		58000},
	{1743,		"Aolsónemûs szekrény", 		58000},
	{2000,		"Irat Szekrény", 			30000},
	{2007,		"Dupla Irat Szekrény", 		40000},
	{2025,		"Gardrób", 					60000},
	{2078,		"Pohár szekrény", 			98500},
	{2094,		"Alsónemûs szekrény", 		30000},
	{2095,		"Kis Szekrény", 			20000},
	{2161,		"Könyves Szekrény", 		42500},
	{2162,		"Könyves Szekrény", 		42500},
	{2163,		"Dupla Szekrény", 			50000},
	{2164,		"Könyves Szekrény", 		60000},
	{2167,		"Gardrób", 					50000},
	{2191,		"Könyves Szekrény", 		56000},
	{2199,		"Szekrény", 				75000},
	{2200,		"Dupla Gardrób", 			40000},
	{2204,		"Szekrény", 				56500},
	{2307,		"Kabát Szekrény", 			15000},
	{2576,		"Gardrób alsónemûtartóval", 65000},
	{2610,		"Irat Szekrény", 			30000},
	{1742,		"Könyves Szekrény", 		22000}
};

new Butor_Fotel[][butorEnum] =
{
	{1754,		"Barna kis fotel", 				16500},
	{1755,		"Mintás fotel", 				16500},
	{1758,		"Levél mintázatú fotel", 		14500},
	{1759,		"Csíkos fotel", 				12000},
	{1762,		"Mintás barna fotel", 			16500},
	{1765,		"Kockás fotel", 				16500},
	{1767,		"Mintás fotel", 				16500},
	{1769,		"Kék fa kartámlás fotel", 		16500},
	{2292,		"Sarok barna fotel", 			18560},
	{2295,		"Barna Puff", 					12500},
	{1704,		"Fekete fa kartámlás fotel", 	26500},
	{1705,		"Barna fa kartámlás fotel", 	26500},
	{1708,		"Fekete fotel", 				22500},
	{1711,		"Barna fotel", 					11500},
	{1724,		"Fekete fa kartámlás fotel", 	26500},
	{1727,		"Fekete fotel", 				24600},
	{1729,		"Barna fotel", 					12500},
	{1735,		"Virágmintázatú fotel", 		20000}
};

new Butor_Konyhabutor[][butorEnum] =
{
	{2128,		"Piros konyha szekrény",				35000},
	{2129,		"Piros konyha asztal szekrénnyel",		35000},
	{2133,		"Fehér konyha szekrény",				28600},
	{2137,		"Márványos konyha asztal szekrénnyel",	69500},
	{2138,		"Márványos konyha asztal szekrénnyel",	69500},
	{2139,		"Márványos konyha asztal",				49200},
	{2140,		"Konyha szekrény", 						42000},
	{2142,		"Konyha asztal",						32500},
	{2145,		"Keskeny konyha szekrény",				29600},
	{2157,		"Konyha asztal", 						26000},
	{2158,		"Konyha szekrény",  					26000},
	{2160,		"Mosdó",								50200},
	{15036,		"Fa szett",								760500}
};

new Butor_Huto[][butorEnum] =
{
	{2533,		"Üdítõs",		49980},
	{2534,		"Fa hûtõ",		49980},
	{2452,		"Üdítõs",		89600}
};

new
	Butor_Szamitogep[][butorEnum] =
{
	{2190,		"Commondore '64",		60000}
};

new Butor_Ajto[][butorEnum] =
{
	{1491,		"Fa lengõ ajtó négyzetekkel",	40000},
	{1502,		"Fa lengõ ajtó",				60000},
	{1523,		"Lengõ ajtó üveggel",			70000}
};

new Butor_Mosogep[][butorEnum] =
{
	{1208,		"Forgó dobos",		99500}
};

new Butor_Nyomtato[][butorEnum] =
{
	{2186,		"Nyomtató fénymásolóval",	128200},
	{2202,		"Nyomtató fénymásolóval",	128000}
};

new Butor_Agy[][butorEnum] =
{
	{1793,		"Matrac csíkokkal",						32000},
	{1794,		"Két személyes barna kocka mintával",	120000},
	{1795,		"Két személyes fa alapon",				60500},
	{1796,		"Egy személyes kocka mintával",			40900},
	{1797,		"Két személyes csíkos mintával",		99500},
	{1798,		"Két személyes csíkos mintával",		49500},
	{1799,		"Két személyes barna mintás",			49500},
	{1800,		"Matrac fém kerettel",					16500},
	{1801,		"Két személyes fém kerettel",			30500},
	{1802,		"Két személyes fa kerettel",			35000},
	{1803,		"Két személyes fa kerettel",			52000},
	{1812,		"Matrac",								12000},
	{2090,		"Két személyes vonalas",				35600},
	{2301,		"Két személyes szekrénnyel",			56900},
	{2302,		"Csíkos huzatos",						25000},
	{14446,		"Zebra mintás",							260500}
};

new Butor_WC[][butorEnum] =
{
	{2514,		"Fehér kerámia", 				16500},
	{2525,		"Fehér kerámia kiegészítõkkel", 18000},
	{2528,		"Fehér kerámia talppal", 		25500}
};

new Butor_Zuhanyzo[][butorEnum] =
{
	{2516,		"Zuhanytálca", 					25000},
	{2517,		"Modern zuhanykabin", 			120000},
	{2519,		"Fehér zuhanytálca", 			25000},
	{2520,		"Fém hatású zuhanykabin", 		125000},
	{2526,		"Fa berakású kád", 				65400},
	{2527,		"Függönyös csempe tálcával",	35650}
};

new Butor_Mosdo[][butorEnum] =
{
	{2515,		"Egyszerû két csapos",	15000},
	{2518,		"Szifonos porcelán",	22000},
	{2523,		"Talpas modern",		22500}
};

new Butor_Szonyeg[][butorEnum] =
{
	{2815,		"Lila, téglalapokkal",			25600},
	{2817,		"Zöldes kék, körökkel",			25600},
	{2818,		"Egyszerû kockás",				19500},
	{2833,		"Díszes okker színekkel",		35000},
	{2835,		"Okker szíbû kerek",			30500},
	{2836,		"Okker színû pöttyös",			28500},
	{2841,		"Kerek kék kockás",				19600},
	{2842,		"Hangulatos lila mintás",		20000},
	{2847,		"Hangulatos perzsa narancs",	32400}
};

new Butor_Szek[][butorEnum] =
{
	{1671,		"Hivatali fekete fém",				15600},
	{1714,		"Elegáns fekete szövetû",			35000},
	{1715,		"Fém szerkezetes bõr",				19500},
	{1720,		"Kicsi fehér háttámlával",			25000},
	{1805,		"Sámli piros ülõfelülettel",		7500},
	{1806,		"Szögletes, forgó, kék huzallat",	16500},
	{1810,		"Összecsukható",					3500},
	{1811,		"Praktikus fém vázas",				15000},
	{2120,		"Egyszerû bõr ülõfelülettel",		21500},
	{2123,		"Elegáns fehér",					32500},
	{2124,		"Piros párnás fa",					29500},
	{2356,		"Kék huzat, forgószék",				16500}
};

new Butor_Iroasztal[][butorEnum] =
{
	{1963,		"Nagy, talpas, fiókkal",	36500},
	{2166,		"Sarok asztal fém vázzal",	40000},
	{2169,		"Fehér oldalú fa",			26500},
	{2173,		"Fémvázas fa lappal",		22500},
	{2180,		"Három oldalú fa",			12500},
	{2205,		"Egyszerû nagy barna",		26500},
	{2206,		"Egyszerû barna",			19500},
	{2607,		"Fehér két lábú",			19500}
};

new Butor_Fal[][butorEnum] =
{
	{19353,		"Fehér és piros fal",				200000},
	{19354,		"Rombusz mintás fal",				200000},
	{19355,		"Szürke kõ fal",					200000},
	{19356,		"Fa mintás fal",					200000},
	{19357,		"Szürke fal",						200000},
	{19358,		"Szürke csíkozott fal",				200000},
	{19359,		"Szürke fal",						200000},
	{19360,		"Fa fal",							200000},
	{19361,		"Narancssárga, és barna fal",		200000},
	{19362,		"Szürkés fal",						200000},
	{19363,		"Barna fal",						200000},
	{19364,		"Fehér tégla fal",					200000},
	{19365,		"Szürke fal",						200000},
	{19366,		"Fa fal",							200000},
	{19367,		"Kék mintás fal",					200000},
	{19368,		"Barna mintás fal",					200000},
	{19369,		"Szürke mintás fal",				200000},
	{19370,		"Fa fal",							200000},
	{19371,		"Szürke fal",						200000},
	{19372,		"Barna mintás fal",					200000},
	{19373,		"Zöld mintás fal",					200000},
	{19383,		"Fehér és piros ajtós fal",			200000},
	{19384,		"Rombusz mintázatú ajtós fal",		200000},
	{19386,		"Fa mintás ajtós fal",				200000},
	{19387,		"Szürke ajtós fal",					200000},
	{19388,		"Szürke csíkozott ajtós fal",		200000},
	{19389,		"Szürke ajtós fal",					200000},
	{19390,		"Narancssárga és vörös ajtós fal",	200000},
	{19391,		"Szürke ajtós fal",					200000},
	{19392,		"Barna ajtós fal",					200000},
	{19393,		"Szürke téglás ajtós fal",			200000},
	{19394,		"Szürke ajtós fal",					200000},
	{19395,		"Szürkés kék mintás ajtós fal",		200000},
	{19396,		"Szürkés vörös mintás ajtós fal",	200000},
	{19397,		"Világos barna mintás ajtós fal",	200000},
	{19398,		"Szürke kõ ajtós fal",				200000}
};

#define MAX_QUERY 1000
enum qInfo
{
	bool:qBusy,
	qType,
	qParam,
	qParam2,
	qParam3
}
new SQL[ MAX_QUERY ][ qInfo ], bool: sqlResultStored;

public OnFilterScriptInit()
{
	print("Bútor rendszer betöltve!");
	print("---------------------------------------------------\n\n");
	print("MySQL: Kapcsolódás a MySQL-hez!");

	mysql_init(LOG_ALL);
	mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PW, MYSQL_DB);

 	print("MySQL: Kapcsolat sikeresen létrejött!");
 	print("---------------------------------------------------\n\n");

	new x = -1;

	for( ;++x < MAXBUTORSZAM; )
	{
		ButorInfo[x][butorPosX] = 0.0;
		ButorInfo[x][butorPosY] = 0.0;
		ButorInfo[x][butorPosZ] = 0.0;
		ButorInfo[x][butorPosRX] = 0.0;
		ButorInfo[x][butorPosRY] = 0.0;
		ButorInfo[x][butorPosRZ] = 0.0;
		ButorInfo[x][butorModel] = 0;
		ButorInfo[x][butorVW] = 0;
		ButorInfo[x][butorInterior] = 0;
		ButorInfo[x][butorHasznalva] = false;
		ButorInfo[x][butorMegveve] = false;
		ButorInfo[x][butorObject] = 0;
		ButorInfo[x][butorTipus] = -1;
		ButorInfo[x][butorListitem] = -1;
	}

	new querycske[1024],fetchline[1024];
	format(querycske, sizeof(querycske), "SELECT * FROM `butorok`");
	mysql_query(querycske);
	mysql_store_result();
	new butordat, Float:butorpos[6], butormodel, butorvw, butorinterior, butortipus, butorlistitem, szamozas = 0;
	if(mysql_num_rows())
	{
		while(mysql_fetch_row(fetchline))
		{
			sscanf(fetchline, "p<|>dffffffddddd", butordat, butorpos[0], butorpos[1], butorpos[2], butorpos[3], butorpos[4], butorpos[5], butormodel, butorvw, butorinterior, butortipus, butorlistitem);
			ButorInfo[butordat][butorPosX] = butorpos[0];
			ButorInfo[butordat][butorPosY] = butorpos[1];
			ButorInfo[butordat][butorPosZ] = butorpos[2];
			ButorInfo[butordat][butorPosRX] = butorpos[3];
			ButorInfo[butordat][butorPosRY] = butorpos[4];
			ButorInfo[butordat][butorPosRZ] = butorpos[5];
			ButorInfo[butordat][butorModel] = butormodel;
			ButorInfo[butordat][butorVW] = butorvw;
			ButorInfo[butordat][butorInterior] = butorinterior;
			ButorInfo[butordat][butorHasznalva] = true;
			ButorInfo[butordat][butorMegveve] = true;
			ButorInfo[butordat][butorTipus] = butortipus;
			ButorInfo[butordat][butorListitem] = butorlistitem;
			ButorInfo[butordat][butorObject] = CreateDynamicObject(butormodel, butorpos[0], butorpos[1], butorpos[2], butorpos[3], butorpos[4], butorpos[5], butorvw, butorinterior);
			szamozas++;
		}
	}
	return true;
}

public OnFilterScriptExit()
{
	mysql_close();
	return true;
}

stock JatekosVehetButort(playerid)
{
	/*if(NincsHaza(playerid))
		return -2;
	if(HazabanVan(playerid) == -1)
		return -1;*/

	new
		i = -1,
		butorszam = ButorSzam(playerid),
		//hazszam = HazabanVan(playerid)
		hazszam = 0
	;

	if(butorszam == MAXBUTOR)
	{
		return true;
	}

	return false;
}

stock ButorSzam(playerid)
{
	/*if(NincsHaza(playerid))
		return -2;
	if(HazabanVan(playerid) == -1)
		return -1;*/

	new
		i = -1,
		szamlalas = 0,
		//hazszam = HazabanVan(playerid);
		hazszam = 0
	;

	for(;++i < MAXBUTORSZAM;)
	{
		if((ButorInfo[i][butorHasznalva] == true) && (ButorInfo[i][butorVW] == hazszam))
		{
			szamlalas++;
		}
	}
	return szamlalas;
}

/*
14493 - kanapé
2573 - szekrény
2574 - szekrény
1819 - asztal
*/

CMD:butor(playerid, params[])
{
	new butorszam = ButorSzam(playerid);
	if(butorszam == -2)
		return SendClientMessage(playerid, -1, "Sajnos neked nincs házad!");
	if(butorszam == -1)
		return SendClientMessage(playerid, -1, "Sajnos ez nem a te házad!");
	if(butorszam == MAXBUTOR)
		return SendClientMessage(playerid, -1, "Sajnos te már nem vehetsz bútort!");

	ShowPlayerDialog(playerid, DIALOG_BUTOR, DIALOG_STYLE_LIST, #COL_FEHER"Bútor", "Bútor vétel\nBútor szerkesztés\nBútor lista\nSzabad bútorok", "Mehet!", "Mégse!");

	return true;
}

stock ButorObjectID(objectid)
{
	new i = -1,visszateres = -1;
	for(;++i < MAXBUTORSZAM;)
	{
		if(ButorInfo[i][butorHasznalva])
		{
			if(ButorInfo[i][butorObject] == objectid)
			{
				visszateres = i;
				break;
			}
		}
	}
	return visszateres;
}

stock SzabadButorID()
{
	new visszateres = -1,i = -1;
	for(;++i < MAXBUTORSZAM;)
	{
		if(!ButorInfo[i][butorHasznalva])
		{
			visszateres = i;
			break;
		}
	}
	return visszateres;
}

stock Tab(text[], text2[], tabcount = 0)
{
		new tab_[16] = "\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t",out[128];
		if((tabcount = (((tabcount + 1) * 8) - strlen(text) - 1) / 8) < 0
		|| tabcount >= sizeof tab_) tabcount = 0;
		format(out, sizeof out, "%s%s%s", text, tab_[(sizeof(tab_) - 1) - tabcount], text2);
		return out;
}

stock GetXButor(playerid, szam)
{
	new
		visszateres = -1,
		i = -1,
		szamlalas = 0,
		hazszam = 0;
		//hazszam = HazabanVan(playerid);
	//printf("Szám: %d", szam);
	for(;++i < MAXBUTORSZAM;)
	{
		if(ButorInfo[i][butorVW] == hazszam && ButorInfo[i][butorHasznalva])
		{
			szamlalas++;
			if(szamlalas == szam)
			{
				visszateres = i;
				//printf("Visszatérés: %d", visszateres);
				break;
			}
		}
	}
	return visszateres;
}

public OnPlayerConnect(playerid)
{
	ButorKategoria[playerid] = -1;
	SzerkesztesButor[playerid] = -1;
	return true;
}

public OnPlayerDisconnect(playerid, reason)
{
	ButorKategoria[playerid] = -1;
	SzerkesztesButor[playerid] = -1;
	return true;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	switch(dialogid)
	{
		case DIALOG_BUTOR_TORLES:
		{
			if(!response)
			{
				SzerkesztesButor[playerid] = -1;
				return SendClientMessage(playerid, -1, "Visszamondva!");
			}

			new
				querycske[512],
				butorszam = SzerkesztesButor[playerid];

			format(querycske, sizeof(querycske), "DELETE FROM `butorok` WHERE id = '%d'", butorszam);
			mysql_query(querycske);

			ButorInfo[butorszam][butorPosX] = 0.0;
			ButorInfo[butorszam][butorPosY] = 0.0;
			ButorInfo[butorszam][butorPosZ] = 0.0;
			ButorInfo[butorszam][butorPosRX] = 0.0;
			ButorInfo[butorszam][butorPosRY] = 0.0;
			ButorInfo[butorszam][butorPosRZ] = 0.0;
			ButorInfo[butorszam][butorModel] = 0;
			ButorInfo[butorszam][butorVW] = 0;
			ButorInfo[butorszam][butorInterior] = 0;
			ButorInfo[butorszam][butorHasznalva] = false;
			ButorInfo[butorszam][butorMegveve] = false;
			DestroyDynamicObject(ButorInfo[butorszam][butorObject]);
			ButorInfo[butorszam][butorTipus] = -1;
			ButorInfo[butorszam][butorListitem] = -1;

			SendClientMessage(playerid, -1, "Bútor sikeresen törölve!");

		}
		case DIALOG_BUTOR_MEGVETEL:
		{
			new
				penz;

			if(!response)
			{
				NULLAZAS:
				ButorInfo[SzerkesztesButor[playerid]][butorPosX] = 0.0;
				ButorInfo[SzerkesztesButor[playerid]][butorPosY] = 0.0;
				ButorInfo[SzerkesztesButor[playerid]][butorPosZ] = 0.0;
				ButorInfo[SzerkesztesButor[playerid]][butorPosRX] = 0.0;
				ButorInfo[SzerkesztesButor[playerid]][butorPosRY] = 0.0;
				ButorInfo[SzerkesztesButor[playerid]][butorPosRZ] = 0.0;
				ButorInfo[SzerkesztesButor[playerid]][butorVW] = 0;
				ButorInfo[SzerkesztesButor[playerid]][butorInterior] = 0;
				ButorInfo[SzerkesztesButor[playerid]][butorHasznalva] = false;
				ButorInfo[SzerkesztesButor[playerid]][butorTipus] = -1;
				ButorInfo[SzerkesztesButor[playerid]][butorListitem] = -1;
				ButorInfo[SzerkesztesButor[playerid]][butorModel] = 0;
				ButorInfo[SzerkesztesButor[playerid]][butorPosRX] = 0.0;
				ButorInfo[SzerkesztesButor[playerid]][butorPosRY] = 0.0;
				ButorInfo[SzerkesztesButor[playerid]][butorPosRZ] = 0.0;
				DestroyDynamicObject(ButorInfo[SzerkesztesButor[playerid]][butorObject]);
				return SendClientMessage(playerid, -1, "Bútor visszamondva!");
			}
			printf("Bútor típus: %d", ButorInfo[SzerkesztesButor[playerid]][butorTipus]);
			switch(ButorInfo[SzerkesztesButor[playerid]][butorTipus])
			{
				case 1:
					penz = Butor_Asztal[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 2:
					penz = Butor_Ulogarnitura[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 3:
					penz = Butor_Kepek[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 4:
					penz = Butor_Lampak[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 5:
					penz = Butor_TV[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 6:
					penz = Butor_DVDHiFi[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 7:
					penz = Butor_Hangfal[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 8:
					penz = Butor_Szekreny[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 9:
					penz = Butor_Fotel[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 10:
					penz = Butor_Konyhabutor[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 11:
					penz = Butor_Huto[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 12:
					penz = Butor_Szamitogep[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 13:
					penz = Butor_Ajto[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 14:
					penz = Butor_Mosogep[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 15:
					penz = Butor_Nyomtato[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 16:
					penz = Butor_Agy[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 17:
					penz = Butor_WC[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 18:
					penz = Butor_Zuhanyzo[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 19:
					penz = Butor_Mosdo[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 20:
					penz = Butor_Szonyeg[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 21:
					penz = Butor_Szek[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 22:
					penz = Butor_Iroasztal[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
				case 23:
					penz = Butor_Fal[ButorInfo[SzerkesztesButor[playerid]][butorListitem]][butorAR];
			}
			//printf("Pénz: %d", penz);
			if(GetPlayerMoney(playerid) < penz)
			{
				SendClientMessage(playerid, -1, "Sajnos ehhez már nincs pénzed!");
				goto NULLAZAS;
			}

			new
				querycske[1024];

			format(querycske, sizeof(querycske), "INSERT INTO `butorok` VALUES (");
			format(querycske, sizeof(querycske), "%s'%d', ", querycske, SzerkesztesButor[playerid]);
			format(querycske, sizeof(querycske), "%s'%.2f', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorPosX]);
			format(querycske, sizeof(querycske), "%s'%.2f', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorPosY]);
			format(querycske, sizeof(querycske), "%s'%.2f', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorPosZ]);
			format(querycske, sizeof(querycske), "%s'%.2f', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorPosRX]);
			format(querycske, sizeof(querycske), "%s'%.2f', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorPosRY]);
			format(querycske, sizeof(querycske), "%s'%.2f', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorPosRZ]);
			format(querycske, sizeof(querycske), "%s'%d', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorModel]);
			format(querycske, sizeof(querycske), "%s'%d', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorVW]);
			format(querycske, sizeof(querycske), "%s'%d', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorInterior]);
			format(querycske, sizeof(querycske), "%s'%d', ", querycske, ButorInfo[SzerkesztesButor[playerid]][butorTipus]);
			format(querycske, sizeof(querycske), "%s'%d')", querycske, ButorInfo[SzerkesztesButor[playerid]][butorListitem]);
			mysql_query(querycske);

			ButorInfo[SzerkesztesButor[playerid]][butorMegveve] = true;

			GivePlayerMoney(playerid, -penz);

			SendClientMessage(playerid, -1, "Sikeresen megvetted!");
			SzerkesztesButor[playerid] = -1;
		}
		case DIALOG_SZABAD_BUTOROK_LISTA:
		{
			if(!response)
				return SendClientMessage(playerid, -1, "Várunk vissza!");

			new butorszam = ButorSzam(playerid);

			if(butorszam >= listitem + 1)
			{
				new butorindex = GetXButor(playerid, listitem + 1);

				SzerkesztesButor[playerid] = butorindex;
				ShowPlayerDialog(playerid, DIALOG_BUTOR_SZERKESZTES, DIALOG_STYLE_LIST, #COL_FEHER"Bútor "#COL_VKEK"szerkesztés", "Bútor mozgatása\nBútor törlése", "Mehet!", "Mégse!");
			} else
				ShowPlayerDialog(playerid, DIALOG_BUTOR_KATEGORIA, DIALOG_STYLE_LIST, #COL_FEHER"Válassz "#COL_VKEK"kategóriát!", "Asztal\nÜlõgarnitúra\nFestmények, képek\nLámpák\nTV-k\nDVD-k, HiFi-k\nHangfal\nSzekrény\nFotel\nKonyhabútor\nHûtõ\nSzámítógép\nAjtó\nMosógép\nNyomtató\nÁgy\nWC\nZuhanyzó\nMosdó\nSzõnyeg\nSzék\nÍróasztal\nFal", "Mehet!", "Mégse!");
			return true;
		}
		case DIALOG_BUTOR:
		{
			if(!response)
				return SendClientMessage(playerid, -1, "Várunk vissza!");
			switch(listitem)
			{
				case 0:
				{
					ShowPlayerDialog(playerid, DIALOG_BUTOR_KATEGORIA, DIALOG_STYLE_LIST, #COL_FEHER"Válassz "#COL_VKEK"kategóriát!", "Asztal\nÜlõgarnitúra\nFestmények, képek\nLámpák\nTV-k\nDVD-k, HiFi-k\nHangfal\nSzekrény\nFotel\nKonyhabútor\nHûtõ\nSzámítógép\nAjtó\nMosógép\nNyomtató\nÁgy\nWC\nZuhanyzó\nMosdó\nSzõnyeg\nSzék\nÍróasztal\nFal", "Mehet!", "Mégse!");
					return true;
				}
				case 1:
				{
					SendClientMessage(playerid, -1, "Kattints egy tetszõleges bútorra!");
					SelectObject(playerid);
					return true;
				}
				case 2:
				{
					new
						i = -1,
						butorok[2048],
						butorfo[128],
						sorozat = 0,
						butornev[48],
						Float:tavolsag,
						hazszam = 0
						//hazszam = HazabanVan(playerid)
					;
					for(;++i < MAXBUTORSZAM;)
					{
						if(ButorInfo[i][butorVW] == hazszam && ButorInfo[i][butorHasznalva])
						{
							switch(ButorInfo[i][butorTipus])
							{
								case 1:
									format(butornev, sizeof(butornev), Butor_Asztal[ButorInfo[i][butorListitem]][butorNEV]);
								case 2:
									format(butornev, sizeof(butornev), Butor_Ulogarnitura[ButorInfo[i][butorListitem]][butorNEV]);
								case 3:
									format(butornev, sizeof(butornev), Butor_Kepek[ButorInfo[i][butorListitem]][butorNEV]);
								case 4:
									format(butornev, sizeof(butornev), Butor_Lampak[ButorInfo[i][butorListitem]][butorNEV]);
								case 5:
									format(butornev, sizeof(butornev), Butor_TV[ButorInfo[i][butorListitem]][butorNEV]);
								case 6:
									format(butornev, sizeof(butornev), Butor_DVDHiFi[ButorInfo[i][butorListitem]][butorNEV]);
								case 7:
									format(butornev, sizeof(butornev), Butor_Hangfal[ButorInfo[i][butorListitem]][butorNEV]);
								case 8:
									format(butornev, sizeof(butornev), Butor_Szekreny[ButorInfo[i][butorListitem]][butorNEV]);
								case 9:
									format(butornev, sizeof(butornev), Butor_Fotel[ButorInfo[i][butorListitem]][butorNEV]);
								case 10:
									format(butornev, sizeof(butornev), Butor_Konyhabutor[ButorInfo[i][butorListitem]][butorNEV]);
								case 11:
									format(butornev, sizeof(butornev), Butor_Huto[ButorInfo[i][butorListitem]][butorNEV]);
								case 12:
									format(butornev, sizeof(butornev), Butor_Szamitogep[ButorInfo[i][butorListitem]][butorNEV]);
								case 13:
									format(butornev, sizeof(butornev), Butor_Ajto[ButorInfo[i][butorListitem]][butorNEV]);
								case 14:
									format(butornev, sizeof(butornev), Butor_Mosogep[ButorInfo[i][butorListitem]][butorNEV]);
								case 15:
									format(butornev, sizeof(butornev), Butor_Nyomtato[ButorInfo[i][butorListitem]][butorNEV]);
								case 16:
									format(butornev, sizeof(butornev), Butor_Agy[ButorInfo[i][butorListitem]][butorNEV]);
								case 17:
									format(butornev, sizeof(butornev), Butor_WC[ButorInfo[i][butorListitem]][butorNEV]);
								case 18:
									format(butornev, sizeof(butornev), Butor_Zuhanyzo[ButorInfo[i][butorListitem]][butorNEV]);
								case 19:
									format(butornev, sizeof(butornev), Butor_Mosdo[ButorInfo[i][butorListitem]][butorNEV]);
								case 20:
									format(butornev, sizeof(butornev), Butor_Szonyeg[ButorInfo[i][butorListitem]][butorNEV]);
								case 21:
									format(butornev, sizeof(butornev), Butor_Szek[ButorInfo[i][butorListitem]][butorNEV]);
								case 22:
									format(butornev, sizeof(butornev), Butor_Iroasztal[ButorInfo[i][butorListitem]][butorNEV]);
								case 23:
									format(butornev, sizeof(butornev), Butor_Fal[ButorInfo[i][butorListitem]][butorNEV]);
							}
							tavolsag = GetPlayerDistanceFromPoint(playerid, ButorInfo[i][butorPosX], ButorInfo[i][butorPosY], ButorInfo[i][butorPosZ]);
							format(butorfo, sizeof(butorfo), #COL_FEHER"Slot %d: "#COL_VPIROS"%s "#COL_FEHER"("#COL_VKEK"%fm"#COL_FEHER")\n", sorozat + 1, butornev, tavolsag);
							strins(butorok, butorfo, strlen(butorok));
							sorozat++;
						}
					}
					i = -1;
					for(; ++i < MAXBUTOR - sorozat;)
					{
						format(butorfo, sizeof(butorfo), #COL_FEHER"Slot %d: "#COL_VZOLD"Szabad\n", i + sorozat + 1, butornev, tavolsag);
						strins(butorok, butorfo, strlen(butorok));
					}
					ShowPlayerDialog(playerid, DIALOG_SZABAD_BUTOROK_LISTA, DIALOG_STYLE_LIST, #COL_FEHER"Bútor "#COL_VKEK"lista", butorok, "Értettem!", "Mégse!");
					return true;
				}
				case 3:
				{
					new
						i = -1,
						butorok[2048],
						butorfo[128],
						butorszam = ButorSzam(playerid);
					for(;++i < MAXBUTOR;)
					{
						format(butorfo, sizeof(butorfo), #COL_FEHER"Slot %d: %s%s", i + 1, (butorszam > i ? (#COL_VPIROS"Foglalt") : (#COL_VZOLD"Szabad")), (i % 2 ? ("\n") : ("\t\t\t")));
						strins(butorok, butorfo, strlen(butorok));
					}
					ShowPlayerDialog(playerid, DIALOG_SZABAD_BUTOROK, DIALOG_STYLE_MSGBOX, #COL_FEHER"Bútor "#COL_VKEK"statisztika", butorok, "Értettem", "");
					return true;
				}
			}
		}
		case DIALOG_BUTOR_VETEL:
		{
			if(!response)
				return ShowPlayerDialog(playerid, DIALOG_BUTOR_KATEGORIA, DIALOG_STYLE_LIST, #COL_FEHER"Válassz "#COL_VKEK"kategóriát!", "Asztal\nÜlõgarnitúra\nFestmények, képek\nLámpák\nTV-k\nDVD-k, HiFi-k\nHangfal\nSzekrény\nFotel\nKonyhabútor\nHûtõ\nSzámítógép\nAjtó\nMosógép\nNyomtató\nÁgy\nWC\nZuhanyzó\nMosdó\nSzõnyeg\nSzék\nÍróasztal\nFal", "Mehet!", "Mégse!");

			new
				Float:playerposok[4],
				szabadbutor = SzabadButorID();

			GetPlayerPos(playerid, playerposok[0], playerposok[1], playerposok[2]);

			switch(ButorKategoria[playerid])
			{
				case 1:
					ButorInfo[szabadbutor][butorModel] = Butor_Asztal[listitem][butorID];
				case 2:
					ButorInfo[szabadbutor][butorModel] = Butor_Ulogarnitura[listitem][butorID];
				case 3:
					ButorInfo[szabadbutor][butorModel] = Butor_Kepek[listitem][butorID];
				case 4:
					ButorInfo[szabadbutor][butorModel] = Butor_Lampak[listitem][butorID];
				case 5:
					ButorInfo[szabadbutor][butorModel] = Butor_TV[listitem][butorID];
				case 6:
					ButorInfo[szabadbutor][butorModel] = Butor_DVDHiFi[listitem][butorID];
				case 7:
					ButorInfo[szabadbutor][butorModel] = Butor_Hangfal[listitem][butorID];
				case 8:
					ButorInfo[szabadbutor][butorModel] = Butor_Szekreny[listitem][butorID];
				case 9:
					ButorInfo[szabadbutor][butorModel] = Butor_Fotel[listitem][butorID];
				case 10:
					ButorInfo[szabadbutor][butorModel] = Butor_Konyhabutor[listitem][butorID];
				case 11:
					ButorInfo[szabadbutor][butorModel] = Butor_Huto[listitem][butorID];
				case 12:
					ButorInfo[szabadbutor][butorModel] = Butor_Szamitogep[listitem][butorID];
				case 13:
					ButorInfo[szabadbutor][butorModel] = Butor_Ajto[listitem][butorID];
				case 14:
					ButorInfo[szabadbutor][butorModel] = Butor_Mosogep[listitem][butorID];
				case 15:
					ButorInfo[szabadbutor][butorModel] = Butor_Nyomtato[listitem][butorID];
				case 16:
					ButorInfo[szabadbutor][butorModel] = Butor_Agy[listitem][butorID];
				case 17:
					ButorInfo[szabadbutor][butorModel] = Butor_WC[listitem][butorID];
				case 18:
					ButorInfo[szabadbutor][butorModel] = Butor_Zuhanyzo[listitem][butorID];
				case 19:
					ButorInfo[szabadbutor][butorModel] = Butor_Mosdo[listitem][butorID];
				case 20:
					ButorInfo[szabadbutor][butorModel] = Butor_Szonyeg[listitem][butorID];
				case 21:
					ButorInfo[szabadbutor][butorModel] = Butor_Szek[listitem][butorID];
				case 22:
					ButorInfo[szabadbutor][butorModel] = Butor_Iroasztal[listitem][butorID];
				case 23:
					ButorInfo[szabadbutor][butorModel] = Butor_Fal[listitem][butorID];
			}

			ButorInfo[szabadbutor][butorPosX] = playerposok[0];
			ButorInfo[szabadbutor][butorPosY] = playerposok[1];
			ButorInfo[szabadbutor][butorPosZ] = playerposok[2];
			ButorInfo[szabadbutor][butorPosRX] = 0.0;
			ButorInfo[szabadbutor][butorPosRY] = 0.0;
			ButorInfo[szabadbutor][butorPosRZ] = 0.0;
			ButorInfo[szabadbutor][butorVW] = GetPlayerVirtualWorld(playerid);
			ButorInfo[szabadbutor][butorInterior] = GetPlayerInterior(playerid);
			ButorInfo[szabadbutor][butorHasznalva] = true;
			ButorInfo[szabadbutor][butorTipus] = ButorKategoria[playerid];
			ButorInfo[szabadbutor][butorListitem] = listitem;

			ButorInfo[szabadbutor][butorObject] = CreateDynamicObject(ButorInfo[szabadbutor][butorModel], playerposok[0] + 3.0, playerposok[1] + 3.0, playerposok[2], 0.0, 0.0, 0.0, GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid));

			//GivePlayerMoney(playerid, -Butor_Asztal[listitem][butorAR]);

			Streamer_Update(playerid);
			SzerkesztesButor[playerid] = szabadbutor;
			//SendClientMessage(playerid, -1, "Sikeresen megvetted!");

			//new
				//querycske[1024];

			/*format(querycske, sizeof(querycske), "INSERT INTO `butorok` VALUES ('%d', '%.2f', '%.2f', '%.2f', '%.2f', '%.2f', '%.2f', '%d', '%d', '%d', '%d', '%d')",\
			szabadbutor, playerposok[0] + 3.0, playerposok[1] + 3.0, playerposok[2], 0.0, 0.0, 0.0, ButorInfo[szabadbutor][butorModel], GetPlayerVirtualWorld(playerid), GetPlayerInterior(playerid), ButorKategoria[playerid], listitem);
			mysql_query(querycske);*/

			EditDynamicObject(playerid, ButorInfo[szabadbutor][butorObject]);
			ButorKategoria[playerid] = 0;
		}
		case DIALOG_BUTOR_SZERKESZTES:
		{
			if(!response)
				return SendClientMessage(playerid, -1, "Viszlát késõbb!");

			switch(listitem)
			{
				case 0:
				{
					EditDynamicObject(playerid, ButorInfo[SzerkesztesButor[playerid]][butorObject]);
					SzerkesztesButor[playerid] = -1;
				}
				case 1:
				{
					new
						formatalunk[512],
						nev[48],
						kategoria[32],
						butorszam = SzerkesztesButor[playerid];

					switch(ButorInfo[butorszam][butorTipus])
					{
						case 1:
						{
							kategoria = "Asztal";
							format(nev, sizeof(nev), Butor_Asztal[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 2:
						{
							kategoria = "Ülõgarnitúra";
							format(nev, sizeof(nev), Butor_Ulogarnitura[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 3:
						{
							kategoria = "Festmények, képek";
							format(nev, sizeof(nev), Butor_Kepek[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 4:
						{
							kategoria = "Lámpák";
							format(nev, sizeof(nev), Butor_Lampak[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 5:
						{
							kategoria = "TV-k";
							format(nev, sizeof(nev), Butor_TV[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 6:
						{
							kategoria = "DVD-k, HiFi-k";
							format(nev, sizeof(nev), Butor_DVDHiFi[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 7:
						{
							kategoria = "Hangfal";
							format(nev, sizeof(nev), Butor_Hangfal[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 8:
						{
							kategoria = "Szekrény";
							format(nev, sizeof(nev), Butor_Szekreny[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 9:
						{
							kategoria = "Fotel";
							format(nev, sizeof(nev), Butor_Fotel[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 10:
						{
							kategoria = "Konyhabútor";
							format(nev, sizeof(nev), Butor_Konyhabutor[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 11:
						{
							kategoria = "Hûtõ";
							format(nev, sizeof(nev), Butor_Huto[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 12:
						{
							kategoria = "Számítógép";
							format(nev, sizeof(nev), Butor_Szamitogep[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 13:
						{
							kategoria = "Ajtó";
							format(nev, sizeof(nev), Butor_Ajto[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 14:
						{
							kategoria = "Mosógép";
							format(nev, sizeof(nev), Butor_Mosogep[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 15:
						{
							kategoria = "Nyomtató";
							format(nev, sizeof(nev), Butor_Nyomtato[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 16:
						{
							kategoria = "Ágy";
							format(nev, sizeof(nev), Butor_Agy[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 17:
						{
							kategoria = "WC";
							format(nev, sizeof(nev), Butor_WC[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 18:
						{
							kategoria = "Zuhanyzó";
							format(nev, sizeof(nev), Butor_Zuhanyzo[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 19:
						{
							kategoria = "Mosdó";
							format(nev, sizeof(nev), Butor_Mosdo[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 20:
						{
							kategoria = "Szõnyeg";
							format(nev, sizeof(nev), Butor_Szonyeg[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 21:
						{
							kategoria = "Szék";
							format(nev, sizeof(nev), Butor_Szek[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 22:
						{
							kategoria = "Íróasztal";
							format(nev, sizeof(nev), Butor_Iroasztal[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
						case 23:
						{
							kategoria = "Fal";
							format(nev, sizeof(nev), Butor_Fal[ButorInfo[butorszam][butorListitem]][butorNEV]);
						}
					}

					format(formatalunk, sizeof(formatalunk), #COL_FEHER"Biztos, hogy törölni akarod a következõ bútort?\n\n\n"#COL_VKEK"Bútor kategóriája: "#COL_FEHER"%s\n"#COL_VKEK"Bútor neve: "#COL_FEHER"%s", kategoria, nev);
					ShowPlayerDialog(playerid, DIALOG_BUTOR_TORLES, DIALOG_STYLE_MSGBOX, #COL_FEHER"Bútor "#COL_VKEK"törlése", formatalunk, "Biztos!", "Mégse!");

					/*format(querycske, sizeof(querycske), "DELETE FROM `butorok` WHERE id = '%d'", butorszam);
					mysql_query(querycske);

					ButorInfo[butorszam][butorPosX] = 0.0;
					ButorInfo[butorszam][butorPosY] = 0.0;
					ButorInfo[butorszam][butorPosZ] = 0.0;
					ButorInfo[butorszam][butorPosRX] = 0.0;
					ButorInfo[butorszam][butorPosRY] = 0.0;
					ButorInfo[butorszam][butorPosRZ] = 0.0;
					ButorInfo[butorszam][butorModel] = 0;
					ButorInfo[butorszam][butorVW] = 0;
					ButorInfo[butorszam][butorInterior] = 0;
					ButorInfo[butorszam][butorHasznalva] = false;
					DestroyDynamicObject(ButorInfo[butorszam][butorObject]);
					ButorInfo[butorszam][butorTipus] = -1;
					ButorInfo[butorszam][butorListitem] = -1;

					SendClientMessage(playerid, -1, "Bútor sikeresen törölve!");*/
				}
			}
			return true;
		}
		case DIALOG_BUTOR_KATEGORIA:
		{
			if(!response)
				return SendClientMessage(playerid, -1, "Várunk vissza!");

			new
				butorstr[3000],
				butorformat[128],
				butorformat2[32],
				i = -1;

			//printf("Listitem: %d", listitem);
			switch(listitem)
			{
				case 0:
				{
					ButorKategoria[playerid] = 1;

					for(;++i != sizeof(Butor_Asztal);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Asztal[i][butorID], (GetPlayerMoney(playerid) < Butor_Asztal[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Asztal[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Asztal[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Asztal", butorstr, "Mehet!", "Vissza!");
					return true;
				}
				case 1:
				{
					ButorKategoria[playerid] = 2;

					for(;++i != sizeof(Butor_Ulogarnitura);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Ulogarnitura[i][butorID], (GetPlayerMoney(playerid) < Butor_Ulogarnitura[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Ulogarnitura[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Ulogarnitura[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Ülõgarnitúra", butorstr, "Mehet!", "Vissza!");
				}
				case 2:
				{
					ButorKategoria[playerid] = 3;

					for(;++i != sizeof(Butor_Kepek);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Kepek[i][butorID], (GetPlayerMoney(playerid) < Butor_Kepek[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Kepek[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Kepek[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Festmények, képek", butorstr, "Mehet!", "Vissza!");
				}
				case 3:
				{
					ButorKategoria[playerid] = 4;

					for(;++i != sizeof(Butor_Lampak);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Lampak[i][butorID], (GetPlayerMoney(playerid) < Butor_Lampak[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Lampak[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Lampak[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Lámpák", butorstr, "Mehet!", "Vissza!");
				}
				case 4:
				{
					ButorKategoria[playerid] = 5;

					for(;++i != sizeof(Butor_TV);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_TV[i][butorID], (GetPlayerMoney(playerid) < Butor_TV[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_TV[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_TV[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"TV-k", butorstr, "Mehet!", "Vissza!");
				}
				case 5:
				{
					ButorKategoria[playerid] = 6;

					for(;++i != sizeof(Butor_DVDHiFi);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_DVDHiFi[i][butorID], (GetPlayerMoney(playerid) < Butor_DVDHiFi[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_DVDHiFi[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_DVDHiFi[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"DVD-k, HiFi-k", butorstr, "Mehet!", "Vissza!");
				}
				case 6:
				{
					ButorKategoria[playerid] = 7;

					for(;++i != sizeof(Butor_Hangfal);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Hangfal[i][butorID], (GetPlayerMoney(playerid) < Butor_Hangfal[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Hangfal[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Hangfal[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Hangfal", butorstr, "Mehet!", "Vissza!");
					return true;
				}
				case 7:
				{
					ButorKategoria[playerid] = 8;

					for(;++i != sizeof(Butor_Szekreny);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Szekreny[i][butorID], (GetPlayerMoney(playerid) < Butor_Szekreny[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Szekreny[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Szekreny[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Szekrény", butorstr, "Mehet!", "Vissza!");
				}
				case 8:
				{
					ButorKategoria[playerid] = 9;

					for(;++i != sizeof(Butor_Fotel);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Fotel[i][butorID], (GetPlayerMoney(playerid) < Butor_Fotel[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Fotel[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Fotel[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Fotel", butorstr, "Mehet!", "Vissza!");
				}
				case 9:
				{
					ButorKategoria[playerid] = 10;

					for(;++i != sizeof(Butor_Konyhabutor);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Konyhabutor[i][butorID], (GetPlayerMoney(playerid) < Butor_Konyhabutor[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Konyhabutor[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Konyhabutor[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Konyhabútor", butorstr, "Mehet!", "Vissza!");
				}
				case 10:
				{
					ButorKategoria[playerid] = 11;

					for(;++i != sizeof(Butor_Huto);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Huto[i][butorID], (GetPlayerMoney(playerid) < Butor_Huto[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Huto[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Huto[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Hûtõ", butorstr, "Mehet!", "Vissza!");
				}
				case 11:
				{
					ButorKategoria[playerid] = 12;

					for(;++i != sizeof(Butor_Szamitogep);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Szamitogep[i][butorID], (GetPlayerMoney(playerid) < Butor_Szamitogep[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Szamitogep[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Szamitogep[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Számítógép", butorstr, "Mehet!", "Vissza!");
				}
				case 12:
				{
					ButorKategoria[playerid] = 13;

					for(;++i != sizeof(Butor_Ajto);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Ajto[i][butorID], (GetPlayerMoney(playerid) < Butor_Ajto[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Ajto[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Ajto[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Ajtó", butorstr, "Mehet!", "Vissza!");
					return true;
				}
				case 13:
				{
					ButorKategoria[playerid] = 14;

					for(;++i != sizeof(Butor_Mosogep);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Mosogep[i][butorID], (GetPlayerMoney(playerid) < Butor_Mosogep[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Mosogep[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Mosogep[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Mosógép", butorstr, "Mehet!", "Vissza!");
				}
				case 14:
				{
					ButorKategoria[playerid] = 15;

					for(;++i != sizeof(Butor_Nyomtato);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Nyomtato[i][butorID], (GetPlayerMoney(playerid) < Butor_Nyomtato[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Nyomtato[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Nyomtato[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Nyomtató", butorstr, "Mehet!", "Vissza!");
				}
				case 15:
				{
					ButorKategoria[playerid] = 16;

					for(;++i != sizeof(Butor_Agy);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Agy[i][butorID], (GetPlayerMoney(playerid) < Butor_Agy[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Agy[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Agy[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Ágy", butorstr, "Mehet!", "Vissza!");
				}
				case 16:
				{
					ButorKategoria[playerid] = 17;

					for(;++i != sizeof(Butor_WC);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_WC[i][butorID], (GetPlayerMoney(playerid) < Butor_WC[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_WC[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_WC[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"WC", butorstr, "Mehet!", "Vissza!");
				}
				case 17:
				{
					ButorKategoria[playerid] = 18;

					for(;++i != sizeof(Butor_Zuhanyzo);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Zuhanyzo[i][butorID], (GetPlayerMoney(playerid) < Butor_Zuhanyzo[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Zuhanyzo[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Zuhanyzo[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Zuhanyzó", butorstr, "Mehet!", "Vissza!");
				}
				case 18:
				{
					ButorKategoria[playerid] = 19;

					for(;++i != sizeof(Butor_Mosdo);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Mosdo[i][butorID], (GetPlayerMoney(playerid) < Butor_Mosdo[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Mosdo[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Mosdo[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Mosdó", butorstr, "Mehet!", "Vissza!");
					return true;
				}
				case 19:
				{
					ButorKategoria[playerid] = 20;

					for(;++i != sizeof(Butor_Szonyeg);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Szonyeg[i][butorID], (GetPlayerMoney(playerid) < Butor_Szonyeg[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Szonyeg[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Szonyeg[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Szõnyeg", butorstr, "Mehet!", "Vissza!");
				}
				case 20:
				{
					ButorKategoria[playerid] = 21;

					for(;++i != sizeof(Butor_Szek);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Szek[i][butorID], (GetPlayerMoney(playerid) < Butor_Szek[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Szek[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Szek[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Szék", butorstr, "Mehet!", "Vissza!");
				}
				case 21:
				{
					ButorKategoria[playerid] = 22;

					for(;++i != sizeof(Butor_Iroasztal);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Iroasztal[i][butorID], (GetPlayerMoney(playerid) < Butor_Iroasztal[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Iroasztal[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Iroasztal[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 2), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Íróasztal", butorstr, "Mehet!", "Vissza!");
				}
				case 22:
				{
					ButorKategoria[playerid] = 23;

					for(;++i != sizeof(Butor_Fal);)
					{
						format(butorformat, sizeof(butorformat), #COL_FEHER"[ID: %d] %s%s", Butor_Fal[i][butorID], (GetPlayerMoney(playerid) < Butor_Fal[i][butorAR] ? (#COL_VPIROS) : (#COL_VZOLD)), Butor_Fal[i][butorNEV]);
						format(butorformat2, sizeof(butorformat2), "[%sFt]\n", FormatNumber(Butor_Fal[i][butorAR], 0, ','));
						strins(butorstr, Tab(butorformat, butorformat2, 1), strlen(butorstr));
					}
					ShowPlayerDialog(playerid, DIALOG_BUTOR_VETEL, DIALOG_STYLE_LIST, #COL_FEHER"Kategória: "#COL_VKEK"Fal", butorstr, "Mehet!", "Vissza!");
				}
			}
		}
	}
	return false;
}

public OnPlayerEditDynamicObject(playerid, objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	//printf("Meghívódott!");
	//printf("Response: %d", response);
	if(response == EDIT_RESPONSE_FINAL)
	{
		new
			querycske[1024],
			formatalunk[512],
			kategoria[48],
			penz,
			nev[48],
			butorszam = ButorObjectID(objectid);
			//hazszam = HazabanVan(playerid);

		if(!ButorInfo[butorszam][butorMegveve])
		{
			switch(ButorInfo[butorszam][butorTipus])
			{
				case 1:
				{
					kategoria = "Asztal";
					penz = Butor_Asztal[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Asztal[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 2:
				{
					kategoria = "Ülõgarnitúra";
					penz = Butor_Ulogarnitura[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Ulogarnitura[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 3:
				{
					kategoria = "Festmények, képek";
					penz = Butor_Kepek[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Kepek[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 4:
				{
					kategoria = "Lámpák";
					penz = Butor_Lampak[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Lampak[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 5:
				{
					kategoria = "TV-k";
					penz = Butor_TV[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_TV[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 6:
				{
					kategoria = "DVD-k, HiFi-k";
					penz = Butor_DVDHiFi[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_DVDHiFi[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 7:
				{
					kategoria = "Hangfal";
					penz = Butor_Hangfal[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Hangfal[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 8:
				{
					kategoria = "Szekrény";
					penz = Butor_Szekreny[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Szekreny[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 9:
				{
					kategoria = "Fotel";
					penz = Butor_Fotel[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Fotel[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 10:
				{
					kategoria = "Konyhabútor";
					penz = Butor_Konyhabutor[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Konyhabutor[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 11:
				{
					kategoria = "Hûtõ";
					penz = Butor_Huto[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Huto[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 12:
				{
					kategoria = "Számítógép";
					penz = Butor_Szamitogep[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Szamitogep[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 13:
				{
					kategoria = "Ajtó";
					penz = Butor_Ajto[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Ajto[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 14:
				{
					kategoria = "Mosógép";
					penz = Butor_Mosogep[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Mosogep[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 15:
				{
					kategoria = "Nyomtató";
					penz = Butor_Nyomtato[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Nyomtato[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 16:
				{
					kategoria = "Ágy";
					penz = Butor_Agy[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Agy[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 17:
				{
					kategoria = "WC";
					penz = Butor_WC[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_WC[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 18:
				{
					kategoria = "Zuhanyzó";
					penz = Butor_Zuhanyzo[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Zuhanyzo[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 19:
				{
					kategoria = "Mosdó";
					penz = Butor_Mosdo[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Mosdo[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 20:
				{
					kategoria = "Szõnyeg";
					penz = Butor_Szonyeg[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Szonyeg[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 21:
				{
					kategoria = "Szék";
					penz = Butor_Szek[ButorInfo[butorszam][butorListitem]][butorNEV];
					format(nev, sizeof(nev), Butor_Szek[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 22:
				{
					kategoria = "Íróasztal";
					penz = Butor_Iroasztal[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Iroasztal[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
				case 23:
				{
					kategoria = "Fal";
					penz = Butor_Fal[ButorInfo[butorszam][butorListitem]][butorAR];
					format(nev, sizeof(nev), Butor_Fal[ButorInfo[butorszam][butorListitem]][butorNEV]);
				}
			}

			ButorInfo[butorszam][butorPosX] = x;
			ButorInfo[butorszam][butorPosY] = y;
			ButorInfo[butorszam][butorPosZ] = z;
			ButorInfo[butorszam][butorPosRX] = rx;
			ButorInfo[butorszam][butorPosRY] = ry;
			ButorInfo[butorszam][butorPosRZ] = rz;

			SzerkesztesButor[playerid] = butorszam;
			format(formatalunk, sizeof(formatalunk), #COL_FEHER"Biztos, hogy megakarod venni a következõ bútort?\n\n\n"#COL_VKEK"Bútor kategóriája: "#COL_FEHER"%s\n"#COL_VKEK"Bútor neve: "#COL_FEHER"%s\n"#COL_VKEK"Bútor ára: "#COL_FEHER"%dFt", kategoria, nev, penz);
			ShowPlayerDialog(playerid, DIALOG_BUTOR_MEGVETEL, DIALOG_STYLE_MSGBOX, #COL_FEHER"Bútor "#COL_VKEK"megvétele", formatalunk, "Biztos!", "Mégse!");
			return true;
		}
		//UPDATE `"#MYSQL_JATEKOS_TABLA"` SET pnem = '%d' WHERE nev = '%s'", listitem + 1, JatekosNev(playerid));
		format(querycske, sizeof(querycske), "UPDATE `butorok` SET butorPosX = '%.2f', butorPosY = '%.2f', butorPosZ = '%.2f', butorPosRX = '%.2f', butorPosRY = '%.2f', butorPosRZ = '%.2f' WHERE id = '%d'", x, y, z, rx, ry, rz, butorszam);
		mysql_query(querycske);

		SendClientMessage(playerid, -1, "Floppyra mentél!");
	}

	if(response == EDIT_RESPONSE_CANCEL)
	{
		new
			Float:objectpos[6],
			butorszam = ButorObjectID(objectid);
			//hazszam = HazabanVan(playerid);

		if(ButorInfo[butorszam][butorMegveve])
		{
			GetDynamicObjectPos(ButorInfo[butorszam][butorObject], objectpos[0], objectpos[1], objectpos[2]);
			GetDynamicObjectRot(ButorInfo[butorszam][butorObject], objectpos[3], objectpos[4], objectpos[5]);

			SetDynamicObjectPos(ButorInfo[butorszam][butorObject], objectpos[0], objectpos[1], objectpos[2]);
			SetDynamicObjectPos(ButorInfo[butorszam][butorObject], objectpos[3], objectpos[4], objectpos[5]);
		} else {
			ButorInfo[butorszam][butorPosX] = 0.0;
			ButorInfo[butorszam][butorPosY] = 0.0;
			ButorInfo[butorszam][butorPosZ] = 0.0;
			ButorInfo[butorszam][butorPosRX] = 0.0;
			ButorInfo[butorszam][butorPosRY] = 0.0;
			ButorInfo[butorszam][butorPosRZ] = 0.0;
			ButorInfo[butorszam][butorVW] = 0;
			ButorInfo[butorszam][butorInterior] = 0;
			ButorInfo[butorszam][butorHasznalva] = false;
			ButorInfo[butorszam][butorMegveve] = false;
			ButorInfo[butorszam][butorTipus] = -1;
			ButorInfo[butorszam][butorListitem] = -1;
			ButorInfo[butorszam][butorModel] = 0;
			ButorInfo[butorszam][butorPosRX] = 0.0;
			ButorInfo[butorszam][butorPosRY] = 0.0;
			ButorInfo[butorszam][butorPosRZ] = 0.0;
			DestroyDynamicObject(ButorInfo[butorszam][butorObject]);
		}
	}
	MoveDynamicObject(objectid, x, y, z, 10.0, rx, ry, rz);
	return true;
}

public OnPlayerSelectDynamicObject(playerid, objectid, modelid, Float:x2, Float:y2, Float:z2)
{
	new butorid = ButorObjectID(objectid);

	if(butorid == -1)
		return SendClientMessage(playerid, -1, "Drága tezsvírem ne vidd el a tartó gerendát!");


    //EditDynamicObject(playerid, objectid);
	SzerkesztesButor[playerid] = butorid;
	ShowPlayerDialog(playerid, DIALOG_BUTOR_SZERKESZTES, DIALOG_STYLE_LIST, #COL_FEHER"Bútor "#COL_VKEK"szerkesztés", "Bútor mozgatása\nBútor törlése", "Mehet!", "Mégse!");

	CancelEdit(playerid);
	return true;
}

stock GenQuerySlot( &id )
{
	id = -1;
 	do
	{
		id++;

		if( !SQL[ id ][ qBusy ] )
			break;
	}
	while( id != (MAX_QUERY - 1) );
}

stock SQLResult( bool: store )
{
	if(store)
	{
		if(MySQLDebug)
			printf("[SQL] Storing result...");

		if(sqlResultStored) mysql_free_result(), print("SQL-STORE");
		mysql_store_result();
		sqlResultStored = true;
	}
	else if( sqlResultStored )
	{
		if(MySQLDebug)
			printf("[SQL] Freeing result...");

		mysql_free_result();
		sqlResultStored = false;
	}
}

forward OnMysqlQuery(resultid);
public OnMysqlQuery(resultid) //, spareid, MySQL:handle)
{
	/*if(resultid != -1)
	{
		SQLResult( true );

		ProcessSQL( resultid );
		SQL[ resultid ][ qBusy ] = false;

		SQLResult( false );
	}*/

	return 1;
}
