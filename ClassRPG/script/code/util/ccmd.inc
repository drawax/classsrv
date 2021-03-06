/*
      # # # #     #             #     #         #     # # # # #
    #             #             #     # #       #         #
    #             #             #     #   #     #         #
    #             #             #     #     #   #         #
    #             #             #     #       # #         #
      # # # #     # # # # #     #     #         #         #
	
	           # # # #     #         #     # # # 
	         #             # #     # #     #     # 
	         #             #   # #   #     #      #
	         #             #    #    #     #      #
	         #             #         #     #     #
	           # # # #     #         #     # # #
				   
	for classrpg.net
	by Clint
	
	Simple command processor
	with hungarian language
	support.
	
	Credits:
	- me (Clint)
*/

#if !defined isnull
	#define isnull(%1) \
				((!(%1[0])) || (((%1[0]) == '\1') && (!(%1[1]))))
#endif

#define MAX_FUNC_NAME_LEN			(32)
#define CMD:%1(%2)					forward cmd_%1(%2);public cmd_%1(%2)
#define ALIAS(%1):%2;				CMD:%1(playerid, params[]){return cmd_%2(playerid, params);}
#define ALIAS2(%1,%2):%0;			ALIAS(%1):%0; ALIAS(%2):%0;
#define ALIAS3(%1,%2,%3):%0;		ALIAS2(%1,%2):%0; ALIAS(%3):%0;
#define ALIAS4(%1,%2,%3,%4):%0;		ALIAS3(%1,%2,%3):%0; ALIAS(%4):%0;
#define ALIAS5(%1,%2,%3,%4,%5):%0	ALIAS4(%1,%2,%3,%4):%0; ALIAS(%5):%0;

#define CMD_STATUS_INVALID		(0)
#define CMD_STATUS_NOT_EXISTS	(1)
#define CMD_STATUS_EXISTS		(2)

forward OnCommandProcess(playerid, cmdtext[], status, response);

public OnPlayerCommandText(playerid, cmdtext[])
{
	if(cmdtext[1] == EOS || !IsPlayerConnected(playerid)) return 1;
	
	new
		pos,
		funcname[MAX_FUNC_NAME_LEN]
	;
	
	funcname = "cmd_";

	while(cmdtext[++pos] != EOS && cmdtext[pos] > ' ' && pos <= MAX_FUNC_NAME_LEN)
	{
		switch(cmdtext[pos])
		{
			case 'a'..'z': funcname[pos+3] = cmdtext[pos];
			case 'A'..'Z': funcname[pos+3] = tolower(cmdtext[pos]);
			case '�', '�': funcname[pos+3] = '1';
			case '�', '�': funcname[pos+3] = '2';
			case '�', '�': funcname[pos+3] = '3';
			case '�', '�': funcname[pos+3] = '4';
			case '�', '�': funcname[pos+3] = '5';
			case '�', '�': funcname[pos+3] = '6';
			case '�', '�': funcname[pos+3] = '7';
			case '�', '�': funcname[pos+3] = '8';
			case '�', '�': funcname[pos+3] = '9';
			default: pos = 0;
		}
		
		if(!pos)
		{
			return CallLocalFunction("OnCommandProcess", "dsd", playerid, cmdtext, CMD_STATUS_INVALID);
		}
	}
	
	if(funcidx(funcname) == -1)
	{
		return CallLocalFunction("OnCommandProcess", "dsd", playerid, cmdtext, CMD_STATUS_NOT_EXISTS);
	}
	else
	{
		while(cmdtext[pos] == ' ') pos++;
		
		if(!cmdtext[pos])
		{
			return CallLocalFunction("OnCommandProcess", "dsd", playerid, cmdtext, CMD_STATUS_EXISTS, CallLocalFunction(funcname, "ds", playerid, "\1"));
		}
		
		return CallLocalFunction("OnCommandProcess", "dsd", playerid, cmdtext, CMD_STATUS_EXISTS, CallLocalFunction(funcname, "ds", playerid, cmdtext[pos]));
	}
}

#if defined _ALS_OnPlayerCommandText
	#undef OnPlayerCommandText
#else
	#define _ALS_OnPlayerCommandText
#endif

#define OnPlayerCommandText ccmd_OnPlayerCommandText
forward ccmd_OnPlayerCommandText(playerid, cmdtext[]);