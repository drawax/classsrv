#if defined __game_system_omsz
	#endinput
#endif
#define __game_system_omsz

/****************************
 *           cmdk           *
 *    �: 1   �: 4   �: 7    *
 *    �: 2   �: 5   �: 8    *
 *    �: 3   �: 6   �: 9    *  
 ****************************/

CMD:omsz(playerid, params[])
{
	new func[32];

	if(sscanf(params, "s[32]", func)) return Msg(playerid,"/omsz [info/szolg�latban]");

	if(!LMT(playerid, FRAKCIO_MENTO)) return SendClientMessage(playerid, COLOR_GREY, "Nem vagy Ment�s!");
		
	if(egyezik(func,"info"))
	{
		new Melo = PlayerInfo[playerid][pMember];
		new melo = PlayerInfo[playerid][pMember];
		if(LMT(playerid, FRAKCIO_MENTO))
		{
		Msg(playerid, "{FA9600}Diszp�cser �zenet: {FFFFFF}K�rem min�l rendezettebben �s akt�vabban dolgozzanak! A v�ros sz�m�t magukra.");
		Msg(playerid, "{6EF83C}((Jelenleg fejleszt�s alatt �ll! �tletek �gy�ben keresd a Scriptereket vagy a frakci� f�rum�t!))");
		}
		if(IsSuper(playerid))
		{
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "Sz�f P�nz: %sFt", FormatNumber( FrakcioInfo[Melo][fPenz], 0, ',' ));
		SendFormatMessage(playerid, COLOR_LIGHTGREEN, "* Jelenleg %d rangt�l lehet kivenni p�nzt a sz�fb�l.", FrakcioInfo[Melo][fMinrang]);
		SendFormatMessage(playerid, COLOR_WHITE, "Online Ment�s�k: %d", FrakcioOnline(melo));
		}
	}
	else if(egyezik(func, "bemosakod�s", true))
	{
		if(IsFiredNox(playerid))
		{
			if(PlayerToPoint(100,playerid,1946.4095,-2432.5752,13.5703))
			{
			
				SetPlayerSkin(playerid, 71);
				
				Cselekves(playerid, "felvette a m�t�thez sz�ks�ges felszerel�st!");
				Medics++;
				if((PlayerInfo[playerid][pKotszer] + 10) < MAXKOTSZER) PlayerInfo[playerid][pKotszer] += 10;
				return 1;
			}
			return 1;
		}
		return 1;
	}
	else if(egyezik(func,"szolg�latban"))
	{
		if(!LMT(playerid, FRAKCIO_MENTO) &&  PlayerInfo[playerid][pAdmin] < 1) return Msg(playerid, "Nem haszn�lhatod. Csak ment�s�k!");
		new mentosok;

		Msg(playerid, "======================== Szolg�latban l�v� Ment�s�k ======================== ", false, COLOR_LIGHTBLUE);

		foreach(Jatekosok, x)
		{
			if(PlayerInfo[x][pMember] != FRAKCIO_MENTO || OnDuty[x] == 0) continue;
			mentosok++;
			
			if(MentoSegit[x] == 0) { SendFormatMessage(playerid, COLOR_GREEN, "{FFFFFF}%s {F81414}(El�rhet�)", ICPlayerName(x)); }
			else if(MentoSegit[x] == 1) { SendFormatMessage(playerid, COLOR_PIROS, "{FFFFFF}%s {F81414}(Nem el�rhet�)", ICPlayerName(x)); }
		
		}
		if(mentosok < 1) Msg(playerid, "Jelenleg nincsen szolg�latban Ment�s!");
		Msg(playerid, "======================== Szolg�latban l�v� Ment�s�k ========================  ", false, COLOR_LIGHTBLUE);
		
		return 1;
	}
	return 1;
}
