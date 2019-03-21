
diag_log format ["%1 --- TcB i_client.sqf startet",diag_ticktime];
__ccppfln(func\client\perFrame\x_perframe.sqf);
if (isNil "x_global_chat_logic") then {x_global_chat_logic = "Logic" createVehicleLocal [0,0,0]};

#ifdef __DM_BREATH_VISIBLE__
_units = if (!isMultiplayer) then {switchableUnits} else {playableUnits};
{[_x, 0.03] execVM "scripts\foggy_breath.sqf"} foreach _units;
#endif


#ifdef __DM_DEADCAM__
_psy = player addEventHandler ["killed", {_this execVM "scripts\deadcam.sqf"}];
#endif

//anticamp
#ifdef __DM_CAMPERTIME__
if (!isNil "tcb_nocamper") then {
	if (tcb_nocamper == 1) then {[player,__DM_CAMPERTIME__] execVM "scripts\CB_anticamp2.sqf"};
};
#endif

#ifdef __DM_NO_FATIGUE__
execFSM "fsms\noFatigue.fsm";
#endif

#ifdef __DM_NO_BROKENLEGS__
execFSM "fsms\protectLegs.fsm";
#endif

#ifdef __DM_NO_NVG__
player call tcb_fnc_removeNVG;
execFSM "fsms\removeGoggles.fsm";
#endif

#ifdef __DM_STATUSBAR__
execVM "scripts\CB_status.sqf";
#endif



//player addEventHandler ["hitPart",{_this call tcb_fnc_checkLegs}];

execVM "scripts\CB_cheating_is_shit.sqf";
execVM "briefing.sqf";

diag_log format ["%1 --- TcB i_client.sqf processed",diag_ticktime];