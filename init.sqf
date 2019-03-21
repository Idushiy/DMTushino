//by psycho
diag_log format ["%1 --- Executing TcB init.sqf",diag_ticktime];
#include "setup.sqf"
if (!isNil "tcb_init_started") exitWith {
	diag_log format ["%1 --- TcB init.sqf executed more than once",diag_ticktime];
};
tcb_init_started = true;

enableSaving [false,false];
enableTeamSwitch false;
titleCut ["","Black in" ,999];
#ifdef __DEBUG__
titleCut ["","black in", 0];R
tcb_intro_out = true;
#endif


__ccppfln(func\common\net\x_netinit.sqf);

X_INIT = false;X_Server = isServer; X_Client = !isDedicated; X_JIP = false;X_SPE = false;X_MP = isMultiplayer;

#define __waitpl 0 spawn {scriptName "spawn_WaitForNotIsNullPlayer";waitUntil {!isNull player};X_INIT = true}
if (isServer) then {
	if (!isDedicated) then {
		X_SPE = true;
	};
	X_INIT = true;
} else {
	if (isNull player) then {
		X_JIP = true;
		__waitpl;
	} else {
		X_INIT = true;
	};
};

if (X_Client) then {
	if (isMultiplayer) then {
		0 spawn {
			scriptName "spawn_WaitForX_INIT";
			waitUntil {X_INIT};
		};
	};
};

if (isServer) then {
#include "i_server.sqf"
};

if (!isDedicated) then {
#include "i_client.sqf"
};


//place a trigger on a map to define the gaming location and write the name of it in the array - you can define more than one trigger
//example: DM_gaming_areas = [DM_area1, DM_area2, ....];
DM_gaming_areas = [DM_area,DM_area_2];


tcb_init_processed = true;
#include "custom_init.sqf"
diag_log format ["%1 --- TcB init.sqf is processed",diag_ticktime];