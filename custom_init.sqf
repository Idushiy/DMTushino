// by psycho
#include "setup.sqf"
__cppfln(barrelfun,scripts\barrelfun.sqf);


if (local player) then {
	player addEventHandler ["Hit", {
		private "_p";
		_p = _this select 0;
		_dam = _this select 2;
		if (_dam > 0.2) then {
			_doit = ceil random 10;
			if (_doit > 8) then {
				_ran = ["s1","s2","s3","s4","s5","s6"] call tcb_fnc_RandomArrayVal;

				["say3D", [_p,_ran]] call tcb_fnc_NetCallEvent;
			};
		};
	}];
};