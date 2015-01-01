#if defined __game_core_init
	#error Már be van töltve az init.pwn
#endif
#define __game_core_init

#if !defined __classrpg
	#error Rossz fájlt próbálsz compileolni
	#endinput
#endif

// compiler preconfig
#pragma dynamic 800000

/******************************
 *                            *
 *      ----------------      *
 *      |  B  O  O  T  |      *
 *      ----------------      *
 *                            *
 ******************************/
// SAMP
#include <a_samp>
#include <a_http>
#include <global\redefinition_samp.pwn> // MAX_PLAYERS

// PLUGIN :: streamer
#include <plugin\streamer.inc>

// PLUGIN :: mysql
#include <plugin\a_mysql>

// PLUGIN :: sscanf (v2)
#include <plugin\sscanf2>

// PLUGIN :: audio
#if defined PLUGIN_ENABLED_AUDIO
	#include <plugin\audio>
#endif

// PLUGIN :: socket
#include <plugin\socket>

// PLUGIN :: gvar
#include <plugin\gvar>

// FILTERSCRIPT :: junkbuster
#if defined FS_ENABLED_JUNKBUSTER
	#include <filterscript\junkbuster>
#endif

// UTILITY
#include <util\formatnumber>
#include <util\progressbar>
#include <util\mSelection>
#include <util\md5>
#include <util\position>
#include <util\cini>
#include <util\ccmd>
#include <util\utils>
#include <util\Dini>
#include <util\string_stuff>
#include <util\player>
#include <util\seif_walk>
#include <util\vehicle>

// YSI
#include <YSI\y_iterate>

// CLASSRPG :: Core
#include "core\fix.pwn"
#include "core\definition.pwn"
#include "core\definition_util.pwn"
#include "core\colour.pwn"
#include "core\limit.pwn"
#include "core\config.pwn"
#include "core\config_mysql.pwn"
#include "core\enum.pwn"
#include "core\constant.pwn"
#include "core\variable.pwn"
#include "core\redefinition.pwn"

// CLASSRPG :: Systems (before)
#include "system\system_weapons.pwn"
#include "system\system_drop.pwn"
#include "system\system_damage.pwn"
#include "system\system_clothes.pwn"
#include "system\system_fraction_editor.pwn"
#include "system\system_client.pwn"
#include "system\system_pause.pwn"
#include "system\system_donate.pwn"
#include "system\system_tuning.pwn"
#include "system\system_ytplayer.pwn"
#include "system\tablet"
#include "system\teplan.pwn" // Tepi Tõzsde rendszere
#include "system\amos.pwn" // Amikor valamit késleltetni akarok, élesben tesztelés miatt. by Amos

// CLASSRPG :: Functions & hooks
#include "function\hooks.pwn"
#include "function\function_main.pwn"
#include "function\function_player.pwn"
#include "function\function_vehicle.pwn"
#include "function\function_other.pwn"
#include "function\public_player.pwn"
#include "function\public_vehicle.pwn"
#include "function\public_other.pwn"
#include "function\callback.pwn"
#include "function\timer.pwn"
#include "function\uncategorized.pwn"

// CLASSRPG :: Commands (NEW! V3.6 by Amos)
#include "commands\commands.pwn"
#include "commands\helps.pwn"
#include "commands\Admin.pwn"
#include "commands\rpalap.pwn"
//#warning [V3.6] Parancsok kategorizálása elkezdve a könnyebb kezelés érdekében.

// CLASSRPG :: old code
#include "old\old_commands.pwn"
#include "old\old_text.pwn"
