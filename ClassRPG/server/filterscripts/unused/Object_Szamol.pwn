//-------------------------------------------------
//
//  Object átlistázó
//  Terno 2012
//
//-------------------------------------------------

#pragma tabsize 0

#include <a_samp>
#include <core>
#include <float>
#include <sscanf2>
#include "../include/gl_common.inc"

forward split(const strsrc[], strdest[][], delimiter);
//-------------------------------------------------

enum Szamolo
{
	oTipus,
	Float:oPosX,
	Float:oPosY,
	Float:oPosZ,
	Float:sPosRX,
	Float:sPosYX,
	Float:sPosZX,
	oid,
}
new OSZAMOL[900][Szamolo];
public split(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
	    if(strsrc[i]==delimiter || i==strlen(strsrc)){
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}
	return 1;
}
stock GetParam(const string[], number)
{
	new kezdes=0, spacevolt=0, szavak=-1, eredmeny[MAX_PLAYER_NAME] = "-1";

	new utolsobetu = strlen(string) - 1;

	for(new x = 0; x < strlen(string); x++)
	{
		if(string[x] <= ' ' || x == utolsobetu)
		{
			if(!spacevolt)
			{
				szavak++;
				if(szavak == number)
				{
					if(x == utolsobetu && string[x] > ' ')
						strmid(eredmeny, string, kezdes, x+1);
					else
						strmid(eredmeny, string, kezdes, x);
				}
			}
			else if(x == utolsobetu)
			{
				if(string[x] > ' ')
				{
					szavak++;
					if(szavak == number)
					{
						strmid(eredmeny, string, x, x+1);
					}
				}
			}

			spacevolt = 1;
		}
		else
		{
			if(spacevolt == 1)
			{
				kezdes = x;
			}
			spacevolt = 0;
		}
	}
	return eredmeny;
}
stock Parameterek(string[])
{
	new volt, szam;
	for(new x = 0; x < strlen(string); x++)
	{
		if(string[x] <= ' ')
		{
			volt = 1;
		}
		else
		{
			if(volt == 1) szam++;
			volt = 0;
		}
	}

	return szam;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	new params = Parameterek(cmdtext);
	new param[10][32];
	new idx;
	if(params > 0)
	{
		new params_szamlalo = 1;
		while(params_szamlalo <= params && params_szamlalo < sizeof(param))
		{
			param[params_szamlalo] = GetParam(cmdtext, params_szamlalo);
			params_szamlalo++;
		}
	}

	new cmd[32]; // parancs
	new pms[128]; // paraméterek

	strtok(cmdtext, idx); sscanf(cmdtext, "s[32]s[128]", cmd, pms);

	if(strcmp(cmd, "/szamol", true) == 0)
	{
		if(params < 7)
			return SendClientMessage(playerid, 0x999900EE,"/szamol [db] [x] [y] [z] [zx] [zy] [zz]");

		new Float:tpos[7];
		new Max= strval(param[1]);	
		tpos[1] = floatstr(param[2]);
		tpos[2] = floatstr(param[3]);
		tpos[3] = floatstr(param[4]);
		tpos[4] = floatstr(param[5]);
		tpos[5] = floatstr(param[6]);
		tpos[6] = floatstr(param[7]);

		//if(Max > 900) return Msg(playerid, "max 900");
		new adatokk[8][128];
		new strFromFile2[256];
		new File: file = fopen("Config/objectatszamol.cfg", io_read);
		new ids = 0;
		
		if (file)
		{
			while (ids < Max)
			{
				fread(file, strFromFile2);
				split(strFromFile2, adatokk, ',');

				OSZAMOL[ids][oTipus]= strval(adatokk[0]);
				OSZAMOL[ids][oPosX] = floatstr(adatokk[1]);
				OSZAMOL[ids][oPosY] = floatstr(adatokk[2]);
				OSZAMOL[ids][oPosZ] = floatstr(adatokk[3]);
				OSZAMOL[ids][sPosRX] = floatstr(adatokk[4]);
				OSZAMOL[ids][sPosYX]= floatstr(adatokk[5]);
				OSZAMOL[ids][sPosZX]= floatstr(adatokk[6]);

				printf("btölt: %d",ids);
				ids++;
			}
			fclose(file);
		}
		ids=0;
		new File: file2;
		new coordsstring[256];
		
		while (ids < Max)
		{
			format(coordsstring, sizeof(coordsstring), "CreateObject(%d,%.4f,%.4f,%.4f,%.4f,%.4f,%.4f);\n",
					OSZAMOL[ids][oTipus],
					OSZAMOL[ids][oPosX]+tpos[1],
					OSZAMOL[ids][oPosY]+tpos[2],
					OSZAMOL[ids][oPosZ]+tpos[3],
					OSZAMOL[ids][sPosRX]+tpos[4],
					OSZAMOL[ids][sPosYX]+tpos[5],
					OSZAMOL[ids][sPosZX]+tpos[6]);

			if(ids == 0)
			{
				file2 = fopen("Config/objectatszamolkesz.cfg", io_write);
			}
			else
			{
				file2 = fopen("Config/objectatszamolkesz.cfg", io_append);
			}

			fwrite(file2, coordsstring);
			ids++;
			printf("ment: %d",ids);
			fclose(file2);
		}
		return 1;
	}

	return 0;
}

//-------------------------------------------------
// EOF


