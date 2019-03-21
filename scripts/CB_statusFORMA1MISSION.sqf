// status byr idea by H5N1, 2008
// rewritten by psycho
#include "setup.sqf"
if (isDedicated) exitWith {};
tcb_status_bar = true;
waitUntil {!isNull player};

/*
tcb_get_most_wanted = {
	private ["_all"];
	_all = [];
	{_all = [_all, [_x,score _x]] call X_fnc_arrayPushStack} forEach units;
	//_all = _all - [0];
	while {count _all > 1} do {
		{
			_check = _x;
			{
				if (_check select 1 < _x select 1) exitWith {
					_all = _all - _check;
				};
			} forEach _all;
			
		} forEach _all;
	};
	_string = if (count _all == 0) then {"Nobody"} else {name ((_all select 0) select 0)};
	_string
};
*/

sleep 0.1;
_anti_camp_message = if (!isNil {player getVariable "tcb_anticamp_wanring"}) then {true} else {false};

while {true} do {
	waituntil {alive player};	 
    if (timelimit > 0 && {timelimit < 100000}) then {
		if (_anti_camp_message && player getVariable "tcb_anticamp_wanring") then {
			hintSilent parsetext format ["<br /><t align='center' color='#fdfae9' size='1.3'>%2</t><br /><br /><t align='center' color='#eaede3' size='1.0'>-----------------------------</t><br /><t align='left' color='#E9FDF9' size='1.0'>До конца раунда:</t><t align='center' color='#C5FEB2' size='1.3'>%1</t><br /><t align='left' color='#E9FDF9' size='1.0'>Убийств: </t><t align='center' color='#C5FEB2' size='1.1'>%3</t><br /><t align='center' color='#dc143c' size='1.5'>Хватит прятаться, сражайся!</t><br />",[(timelimit - time) / 60,"HH:MM"]call bis_fnc_TimeToString, __DM_MISSION_NAME__, score player];
		} else {
			hintSilent parsetext format ["<br /><t align='center' color='#E9FDF9' size='1.8'>%2</t><br /><br /><t align='center' color='#00E500' size='1.0'>--------------------------------------------</t><br /><t align='left' color='#E9FDF9' size='1.0'>До конца раунда:</t><t align='center' color='#C5FEB2' size='1.3'>%1</t><br /><t align='left' color='#E9FDF9' size='1.0'>Убийств: </t><t align='center' color='#C5FEB2' size='1.3'>%3</t><br /><br /><br />",[(timelimit - time) / 60,"HH:MM"]call bis_fnc_TimeToString, __DM_MISSION_NAME__, score player];
		};
		if (time >= timelimit) then {
		    hintSilent parseText "<t align='center' color='#dc143c' size='1.6'>Timelimit reached</t><br />";
		};
	} else {
        hintSilent parsetext format ["<br /><t align='center' color='#E9FDF9' size='1.8'>%2</t><br /><br /><t align='center' color='#00E500' size='1.0'>--------------------------------------------</t><br /><t align='left' color='#E9FDF9' size='1.0'>До конца раунда:</t><t align='center' color='#C5FEB2' size='1.3'>%1</t><br /><t align='left' color='#E9FDF9' size='1.0'>Убийств: </t><t align='center' color='#C5FEB2' size='1.3'>%3</t><br /><br />",objNull, __DM_MISSION_NAME__, score player];
	};
    sleep 1;
};