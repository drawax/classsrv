#if defined __game_system_omsz
	#endinput
#endif
#define __game_system_omsz

/****************************
 *           cmdk           *
 *    á: 1   ó: 4   ú: 7    *
 *    é: 2   ö: 5   ü: 8    *
 *    í: 3   õ: 6   û: 9    *  
 ****************************/

CMD:omsz(playerid, params[])
{
	new func[32];

	if(sscanf(params, "s[32]", func)) return Msg(playerid,"/omsz [info/szolgálatban]");

	if(!LMT(playerid, FRAKCIO_MENTO)) return SendClientMessage(playerid, COLOR_GREY, "Nem vagy Mentõs!");
		
	if(egyezik(func,"info"))
	{
		new Melo = PlayerInfo[playerid][pMember];
		new melo = PlayerInfo[playerid][pMember];
		if(LMT(playerid, FRAKCIO_MENTO))
		{
		Msg(playerid, "{FA9600}Diszpécser üzenet: {FFFFFF}Kérem minél rendezettebben és aktívabban dolgozzanak! A város számít magukra.");
		Msg(playerid, "{6EF83C}((Jelenleg fejlesztés alatt áll! Ötletek ügyében keresd a Scriptereket vagy a frakció fórumát!))");
		}
		if(IsSuper(playerid))
		{
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Széf Pénz: %sFt", FormatNumber( FrakcioInfo[Melo][fPenz], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Jelenleg %d rangtól lehet kivenni pénzt a széfbõl.", FrakcioInfo[Melo][fMinrang]);
		SendFormatMessage(playerid, COLOR_WHITE, "Online Mentõsök: %d", FrakcioOnline(melo));
		}
	}
	else if(egyezik(func, "bemosakodás", true))
	{
		if(IsFiredNox(playerid))
		{
			if(PlayerToPoint(100,playerid,1946.4095,-2432.5752,13.5703))
			{
			
				SetPlayerSkin(playerid, 71);
				
				Cselekves(playerid, "felvette a mûtéthez szükséges felszerelést!");
				Medics++;
				if((PlayerInfo[playerid][pKotszer] + 10) < MAXKOTSZER) PlayerInfo[playerid][pKotszer] += 10;
				return 1;
			}
			return 1;
		}
		return 1;
	}
	else if(egyezik(func,"szolgálatban"))
	{
		if(!LMT(playerid, FRAKCIO_MENTO) &&  PlayerInfo[playerid][pAdmin] < 1) return Msg(playerid, "Nem használhatod. Csak mentõsök!");
		new mentosok;

		Msg(playerid, "======================== Szolgálatban lévõ Mentõsök ======================== ", false, COLOR_LIGHTBLUE);

		foreach(Jatekosok, x)
		{
			if(PlayerInfo[x][pMember] != FRAKCIO_MENTO || OnDuty[x] == 0) continue;
			mentosok++;
			
			if(MentoSegit[x] == 0) { SendFormatMessage(playerid, COLOR_GREEN, "{FFFFFF}%s {F81414}(Elérhetõ)", ICPlayerName(x)); }
			else if(MentoSegit[x] == 1) { SendFormatMessage(playerid, COLOR_PIROS, "{FFFFFF}%s {F81414}(Nem elérhetõ)", ICPlayerName(x)); }
		
		}
		if(mentosok < 1) Msg(playerid, "Jelenleg nincsen szolgálatban Mentõs!");
		Msg(playerid, "======================== Szolgálatban lévõ Mentõsök ========================  ", false, COLOR_LIGHTBLUE);
		
		return 1;
	}
	return 1;
}
