#if defined __game_function_function_player
	#endinput
#endif
#define __game_function_function_player

stock bool:KapuEngedely(playerid, kapu)
{
	if(kapu < 0 || kapu >= MAX_KAPU || !Kapu[kapu][kVan]) return false;
	if(Kapu[kapu][kKod] != NINCS) return true;
 	if(Kapu[kapu][kHasznalo][0] == 0) return false;

	new bool:ok, val;

	for(new h = 0; h < MAX_KAPU_HASZNALO; h++)
	{
		val = Kapu[kapu][kHasznalo][h];
		switch(val)
		{
			// frakciók
			case 1..99: ok = ( PlayerInfo[playerid][pMember] == val );
		}
		if(ok) break;
	}

	return ok;
}

stock OnePlayAnim(playerid,animlib[],animname[], Float:speed, looping, lockx, locky, lockz, lp)
{
    ApplyAnimation(playerid, animlib, animname, speed, looping, lockx, locky, lockz, lp);
}

stock KozelsegEllenoriz(playerid)
{
	if(FlyModeBa[playerid] == true || Tevezik[playerid] != NINCS)
		return 1;

	return 0;
}

stock Beszed(playerid, Float:radi, preuzi[], uzi[], afteruzi[] = "")
{
	new Float:tav, VW = GetPlayerVirtualWorld(playerid), str[128];
	foreach(Jatekosok, player)
	{
		tav = GetDistanceBetweenPlayers(playerid, player);
		if(GetPlayerVirtualWorld(player) != VW || tav > radi) continue;

		if(PlayerInfo[playerid][pANyelv] != 0 && PlayerInfo[player][pNyelv][ PlayerInfo[playerid][pANyelv] ] < 100)
		{
			if(!strlen(afteruzi)) format(str, 128, "%s*** ismeretlen nyelv ***", preuzi);
			else format(str, 128, "%s*** ismeretlen nyelv ***%s", preuzi, afteruzi);
		}
		else
		{
			if(!strlen(afteruzi)) format(str, 128, "%s%s", preuzi, uzi);
			else format(str, 128, "%s%s%s", preuzi, uzi, afteruzi);
		}

		if(radi/16 >= tav) SendClientMessage(player, COLOR_FADE1, str);
		else if(radi/8 >= tav) SendClientMessage(playerid, COLOR_FADE2, str);
		else if(radi/4 >= tav) SendClientMessage(playerid, COLOR_FADE3, str);
		else if(radi/2 >= tav) SendClientMessage(playerid, COLOR_FADE4, str);
		else if(radi >= tav) SendClientMessage(playerid, COLOR_FADE5, str);
	}
}

stock BilincsFel(giveplayerid)
{
	#define RENDOR_BILINCS_SLOT ATTACH_SLOT_ZSAK_PAJZS_BILINCS
	new skin = GetPlayerSkin(giveplayerid);
	if(skin==2 ||skin == 7 || skin == 15 || skin==16 || skin==17 || skin==18 || skin==20) //egy
	{
		SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.004000,0.022000,0.022000,20.399993,-16.300025,-39.599998,1.000000,1.000000,1.000000);
	}
	else if(skin==1) //kettõ
		SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.057000,0.026999,-0.001000,-162.899948,31.000005,50.799995,1.000000,1.000000,1.000000);
	else if(skin==9 || skin==10 || skin==12) //kettõ
		SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,0.030000,0.027999,0.028000,7.900000,-19.400032,-46.099990,1.000000,1.000000,1.000000);
	else if(skin==11 || skin==13)	//három
		SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.063999,-0.048000,0.021000,-162.899948,31.000005,50.799995,1.000000,1.000000,1.000000);
	else if(skin==14) //négy
		SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.004000,0.048999,0.012999,20.899991,-15.000026,-47.199993,1.000000,1.000000,1.000000);
	else if(skin==21 || skin==27 || skin==28 || skin==30 || skin==32 || skin==35 || skin==36 || skin==37 || skin==38 || skin==44 || skin==45 || skin==46 || skin==47 || skin==48 || skin==49 || skin==53 || skin==54 || skin==58 || skin==60 || skin==88 || skin==94 || skin==95 || skin==100 || skin==102 || skin==114 || skin==116 || skin==126 || skin==129 || skin==132 || skin==134 || skin==142 || skin==144 || skin==154 || skin==155 || skin==159 || skin==160 || skin==161 || skin==162)//öt
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.936999,2.262998);
	else if(skin==167 || skin==170 || skin==180 || skin==185 || skin==189 || skin==205 || skin==171 || skin==173 || skin==174 || skin==175 || skin==176 || skin==177 || skin==179 || skin==230 || skin==229 || skin==231 || skin==234 || skin==245 || skin==247 || skin==254 || skin==274 || skin==281 || skin==282 || skin==283 || skin==288 || skin==297 || skin==298)//öt
 		SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,0.000000,0.000000,0.000000,0.000000,0.000000,0.000000,1.000000,0.936999,2.262998);
	else if(skin==22 || skin==66 || skin==67 ||skin==70 || skin==98 ||skin==101 || skin==115)//hat
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.042000,-0.010000,0.020000,5.499993,-4.799993,-52.800006,1.431999,0.877000,2.506999);
	else if(skin==23 || skin==24 ||skin==25 || skin==26 ||skin==29 || skin==34 ||skin==51 || skin==52 ||skin==62 || skin==72 ||skin==73 || skin==96 ||skin==99 || skin==108 ||skin==113 || skin==121 ||skin==122 || skin==128 ||skin==133 || skin==146 ||skin==153 || skin==156 ||skin==158 || skin==181 ||skin==183 || skin==184 ||skin==188 || skin==200 ||skin==206 || skin==217 ||skin==220 || skin==221 ||skin==222 || skin==223 ||skin==250 || skin==252 ||skin==255 || skin==258 ||skin==259)//hét
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.053000,0.035999,0.015000,5.499993,-4.799993,-52.800006,1.422000,0.690000,1.607997);
	else if(skin==286 || skin==292)//hét
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.053000,0.035999,0.015000,5.499993,-4.799993,-52.800006,1.422000,0.690000,1.607997);
	else if(skin==31 || skin==39 ||skin==40 || skin==41 ||skin==43 || skin==49 ||skin==55 || skin==56 ||skin==57 || skin==63 ||skin==64 || skin==69 ||skin==76 || skin==77 ||skin==89 || skin==90 ||skin==91 || skin==92 ||skin==93 || skin==97 ||skin==104 || skin==106 ||skin==107 || skin==109 ||skin==110 || skin==130 ||skin==131 || skin==136 ||skin==137 || skin==138 ||skin==139 || skin==140 ||skin==141 || skin==145 ||skin==148 || skin==150 ||skin==152 || skin==157 ||skin==165)//nyolc
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.038000,-0.021999,0.019000,5.499993,-4.799993,-52.800006,1.101000,0.686000,1.902997);
	else if(skin==166 || skin==169 ||skin==190 || skin==191 ||skin==192 || skin==193 ||skin==194 || skin==195 ||skin==196 || skin==197 ||skin==198 || skin==199 ||skin==201 || skin==207 ||skin==209 || skin==210 ||skin==211 || skin==214 ||skin==215 || skin==216 ||skin==218 || skin==219 ||skin==224 || skin==225 ||skin==226 || skin==227 ||skin==232 || skin==233 ||skin==237 || skin==238 ||skin==239 || skin==243 ||skin==251 || skin==256 ||skin==257 || skin==261)//nyolc
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.038000,-0.021999,0.019000,5.499993,-4.799993,-52.800006,1.101000,0.686000,1.902997);
	else if(skin==275 ||skin==276 || skin==290 ||skin==287 || skin==293 ||skin==294 || skin==299)//kilenc
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.034000,0.010000,0.019000,5.499993,-4.799993,-52.800006,1.101000,0.686000,1.902997);
	else if(skin==277 || skin==278 ||skin==279 || skin==284 ||skin==285 || skin==295)//tíz
	    SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.015000,-0.007999,0.021000,5.499993,-4.799993,-52.800006,1.101000,0.686000,1.902997);
	else if(skin==33)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,0.002999,0.020000,-0.011000,0.000000,0.000000,-53.699966,1.000000,1.000000,1.000000);
	else if(skin==50 || skin==59 ||skin==61 || skin==68 ||skin==112 || skin==135 ||skin==143 || skin==147 ||skin==182 || skin==186 ||skin==187 || skin==203 ||skin==204 || skin==212 ||skin==240 || skin==249 ||skin==260)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,0.008999,0.034000,-0.001000,0.000000,0.000000,-53.699966,1.268000,1.217000,1.461000);
	else if(skin==71 || skin==80 ||skin==81 || skin==124 ||skin==168 || skin==241 ||skin==242)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.028999,0.011999,-0.004000,17.900001,-7.399981,-44.099960,1.268000,1.217000,1.461000);
	else if(skin==75 || skin==117 ||skin==118 || skin==123 ||skin==125 || skin==163 ||skin==164 || skin==213 ||skin==228 || skin==253 ||skin==291)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.012999,0.012999,-0.017000,17.900001,-7.399981,-44.099960,0.772000,1.200999,1.511000);
	else if(skin==78 || skin==79 || skin==83 || skin==84 ||skin==111 || skin==127)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.020999,0.029000,0.003999,17.900001,-7.399981,-44.099960,1.340000,0.973000,2.218001);
	else if(skin==85)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,0.013000,-0.005999,-0.003000,17.900001,-7.399981,-44.099960,1.092000,0.973000,2.218001);
	else if(skin==87)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.015999,-0.017999,-0.018000,17.900001,-7.399981,-44.099960,0.455000,0.973000,1.372000);
	else if(skin==103)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.046999,0.089000,0.013000,17.900001,-7.399981,-44.099960,2.518000,1.169000,2.128000);
	else if(skin==120 || skin==246)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.017999,0.060000,0.013000,17.900001,-7.399981,-44.099960,1.451000,1.169000,1.834000);
	else if(skin==144)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.017999,0.028000,-0.000999,17.900001,-7.399981,-44.099960,1.199000,1.169000,1.834000);
	else if(skin==172 || skin==178)
        SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.017999,0.009000,-0.000999,17.900001,-7.399981,-44.099960,0.834000,1.169000,1.499999);
	else SetPlayerAttachedObject(giveplayerid,RENDOR_BILINCS_SLOT,19418,5,-0.004000,0.022000,0.022000,20.399993,-16.300025,-39.599998,1.000000,1.000000,1.000000);
	#undef RENDOR_BILINCS_SLOT
}

stock GetPlayerTextdrawColour(playerid)
{
	new szin;
	switch(PlayerInfo[playerid][pTextdrawszin])
	{
		case 0: szin = TEXTDRAWBOX_COLOR_BLACK;
		case 1: szin = TEXTDRAWBOX_COLOR_WHITE;
		case 2: szin = TEXTDRAWBOX_COLOR_LBLUE;
		case 3: szin = TEXTDRAWBOX_COLOR_DBLUE;
		case 4: szin = TEXTDRAWBOX_COLOR_LGREEN;
		case 5: szin = TEXTDRAWBOX_COLOR_DGREEN;
		case 6: szin = TEXTDRAWBOX_COLOR_RED;
		case 7: szin = TEXTDRAWBOX_COLOR_YELLOW;
		case 8: szin = TEXTDRAWBOX_COLOR_PINK;
		case 9: szin = TEXTDRAWBOX_COLOR_TRANSPARENT;
		default: szin = TEXTDRAWBOX_COLOR_BLACK;
	}
	if(IsTerno(playerid))
		SendFormatMessage(playerid,szin,"[textddrawszin function_player]%d - %x",PlayerInfo[playerid][pTextdrawszin],szin);
	return szin;
}

stock ShowGyogyszerTaska(playerid, targetid)
{
	//Megjegyzés: bõvítés esetén 1 sorban maximum 5 darab gyógyszer legyen!
	if(!IsPlayerConnected(playerid) && !IsPlayerConnected(targetid)) return false;
	
	new aspirin = PlayerInfo[targetid][pAspirin];
	new cataflan = PlayerInfo[targetid][pCataflan];
	
	SendClientMessage(playerid, COLOR_GREEN, "================================[ Gyógyszertáska tartalma ]================================");
	SendFormatMessage(playerid, COLOR_GRAD1, "Aspirin: %ddb | Cataflan: %ddb", aspirin, cataflan);
	
	return true;
}