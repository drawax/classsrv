/* ================ *\
    ClassRPG - NPC
\* ================ */

#include <a_npc>

#define NPC_AKCIO_START (1)
#define NPC_AKCIO_SZUNET (2)
#define NPC_AKCIO_FOLYTAT (3) 

main(){}
public OnNPCSpawn()
{
	SetMyPos(328.6727,133.1192,1007.9657);
	SetMyFacingAngle(159.7350);

	return 1;
}

public OnClientMessage(color, text[])
{
	if(strcmp("NPCSPAWN ", text, false, 11)) return 1;
	
	new akcio;
	new darab[3][64];
	new felvetel[128];
	
	split(text, darab, ' ');
	if(!strlen(darab[1])) return 1;

	akcio = strval(darab[1]);
	felvetel = darab[2];
	
	if(strlen(felvetel))
		Akcio(akcio, felvetel);
	else
		Akcio(akcio);
	
	return 1;
}

stock Akcio(akcio, extra[] = "")
{
	switch(akcio)
	{
		case NPC_AKCIO_START: StartRecordingPlayback(1, extra);
		case NPC_AKCIO_SZUNET: PauseRecordingPlayback();
		case NPC_AKCIO_FOLYTAT: ResumeRecordingPlayback();
	}
	return 1;
}


split(const strsrc[], strdest[][], delimiter)
{
	new i, li,aNum,len;
	while(i <= strlen(strsrc))
	{
	    if(strsrc[i]==delimiter || i==strlen(strsrc))
		{
	        len = strmid(strdest[aNum], strsrc, li, i, 128);
	        strdest[aNum][len] = 0;
	        li = i+1;
	        aNum++;
		}
		i++;
	}
	return aNum;
}

stock strtok(const string[], &index)
{
	new length = strlen(string);
	while ((index < length) && (string[index] <= ' '))
	{
		index++;
	}

	new offset = index;
	new result[64];
	while ((index < length) && (string[index] > ' ') && ((index - offset) < (sizeof(result) - 1)))
	{
		result[index - offset] = string[index];
		index++;
	}
	result[index - offset] = EOS;
	return result;
}