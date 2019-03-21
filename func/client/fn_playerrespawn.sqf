//by psycho
diag_log format ["%1 --- TcB respawn function startet",diag_ticktime];
#include "setup.sqf"
private ["_player_obj"];
_player_obj = _this select 0;



// thank you BIS for this new feature! Players will now set in buildings...
// work around:
0 spawn {
	while {((lineIntersectsWith [eyePos player, player modelToWorld [0, 0, (eyePos player select 2) + 10], player]) select 0) isKindOf "House"} do {
		player setPos getMarkerPos "respawn_west";
		sleep 0.05;
	};
};

removeVest player;
removeBackpack player;
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
while {count magazines player > 0} do {
	player removeMagazines ((magazines player) select 0);
};

execVM "scripts\clothes.sqf";

if (tcb_gaming_over) exitWith {
	removeVest player;
	removeBackpack player;
	removeAllWeapons player;
	removeAllItems player;
	removeAllAssignedItems player;
	while {count magazines player > 0} do {
		player removeMagazines ((magazines player) select 0);
	};
};

//////Эфект блюра экрана при перерождении
[] spawn {
	"dynamicblur" ppeffectenable true;
	"dynamicblur" ppeffectadjust [2];
	"dynamicblur" ppeffectcommit 0;
	"dynamicblur" ppeffectadjust [0];
	"dynamicblur" ppeffectcommit 2;
};

#ifdef __DM_BREATH_VISIBLE__
[_player_obj, 0.03] execVM "scripts\foggy_breath.sqf";
#endif

#ifdef __DM_NO_NVG__
player call tcb_fnc_removeNVG;
#endif

player setCaptive true;
player addRating -1000000;
player setDammage 0;




#ifdef __DM_FLEXIBLE_RESPAWNTIME__
if (__DM_RESPAWN_TYPE__ != 0 || __DM_RESPAWN_TYPE__ != 1) then {
	tcb_next_delay = if (isNil "tcb_next_delay") then {(tcb_respawns + 1) * __DM_RESPAWN_DELAY__} else {tcb_next_delay * 2};
	if (tcb_next_delay <= __DM_FLEXIBLE_RESPAWNTIME__) then {
		setPlayerRespawnTime tcb_next_delay;
		#define __DM_RESPAWN_DELAY__ tcb_next_delay
	} else {
		tcb_next_delay = __DM_FLEXIBLE_RESPAWNTIME__;
		setPlayerRespawnTime tcb_next_delay;
		#define __DM_RESPAWN_DELAY__ tcb_next_delay
	};
};
#endif
diag_log format ["%1 --- TcB respawn function processed",diag_ticktime];