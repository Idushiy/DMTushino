// by psycho
#include "setup.sqf"
private ["_victim","_killer","_pos","_deadcam"];
_victim = _this select 0;
_killer = _this select 1;

_pos = [(getPosATL _victim select 0)-(vectorDir _victim select 0)*3,(getPosATL _victim select 1)-(vectorDir _victim select 1)*3,(getPosATL _victim select 2)+1];
titleCut ["","BLACK IN",1];

_deadcam = "Camera" camCreate (position _victim);
_deadcam cameraEffect ["internal","back"];
showCinemaBorder true;
_deadcam camPrepareTarget _victim;
_deadcam camPreparePos _pos;
_deadcam camPrepareFOV 0.7;
_deadcam camCommitPrepared 0;

waitUntil {camCommitted _deadcam};

if (_killer == player || {!alive _killer} || {isNull _killer}) then {
	_deadcam camPrepareTarget _victim;
	_deadcam camsetrelpos [-3, 20, 10];
	_deadcam camPrepareFOV 0.474;
	_deadcam camCommitPrepared 20;
	waitUntil {alive player};
	player cameraEffect ["terminate","back"];
	camDestroy _deadcam;
} else {
	#ifdef __DM_DEADCAM__
	if (isPlayer _killer) then {
		titleText [format ["You were killed from %1",name _killer],"PLAIN DOWN",0.9];
	};
	sleep 1;
	_deadcam camCommand "inertia on";
	_deadcam camPrepareTarget (vehicle _killer);
	_deadcam camsetrelpos [-3, 20, 10];
	_deadcam camPrepareFOV 1;
	_deadcam camCommitPrepared 10;
	#else
	_deadcam camPrepareTarget _victim;
	_deadcam camsetrelpos [-3, 20, 10];
	_deadcam camPrepareFOV 0.474;
	_deadcam camCommitPrepared 20;	
	#endif
	waitUntil {alive player};
	player cameraEffect ["terminate","back"];
	camDestroy _deadcam;
};