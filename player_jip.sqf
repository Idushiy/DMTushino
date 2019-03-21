//by psycho
#include "setup.sqf"
diag_log format ["%1 --- TcB player_jip.sqf startet",diag_ticktime];

#ifndef __DEBUG__
execVM "scripts\intro.sqf";
#endif

#ifdef __DM_SANDSTORM__
[] spawn {
	waituntil {!isnil "bis_fnc_init"};
	[player,-1,0.8,true] call bis_fnc_sandstorm;
};
setWind [1,0.3, false];
#endif

#ifdef __DM_FIRSTPERSON__
[] spawn {
	while {true} do {
		waitUntil {cameraView in ["EXTERNAL", "GROUP"] && {vehicle player == player}};
		vehicle player switchCamera "INTERNAL";
		sleep 0.1;
	};
};
#endif

#ifdef __DM_FORCE_TIME__
[] spawn {
	while {isNil "CB_gaming_over" || !CB_gaming_over} do {
		_date = date;
		sleep 30;
		setDate _date;
	};
};
#endif

player setCaptive true;
player addRating -1000000;
player setDammage 0;

removeVest player;
removeBackpack player;
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
while {count magazines player > 0} do {
	player removeMagazines ((magazines player) select 0);
};

execVM "scripts\clothes.sqf";

if (__DM_RESPAWN_TYPE__ != 0 || __DM_RESPAWN_TYPE__ != 1) then {
	player AddEventHandler ["Respawn",{_this call tcb_fnc_playerRespawn}];
	player AddEventHandler ["killed",{
		_this spawn {
			sleep (__DM_RESPAWN_DELAY__ + random 5);
			deleteVehicle (_this select 0);
		};
	}];
};


[] spawn {
private ["_fog","_list"];
	_fog = fog;
	_list = DM_gaming_areas;
	sleep 20;
	while {true} do {
		waitUntil {!(vehicle player in List DM_area) && !(vehicle player in List DM_area_2)};
		if (alive player) then {
			0 setFog 1;
			titleText ["Вы покидаете место боя!", "PLAIN", 0.5];
		};
		waitUntil {(vehicle player in List DM_area) || (vehicle player in List DM_area_2)};
		0 setFog _fog;
	};
};

deleteVehicle client_jip_init_trigger;

diag_log format ["%1 --- TcB player_jip.sqf processed",diag_ticktime];

