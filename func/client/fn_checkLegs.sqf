// by psycho
// work around to check brolen legs and prevent for slow moving
private ["_nest_array","_p","_d"];
_nest_array = _this;
{
	_p = _x select 0;
	_selection = _this select 5;
	diag_log format ["%1",_selection];
	if ("legs" in _selection || {"rightupleg" in _selection} || {"leftupleg" in _selection}) then {
		_d = damage _p;
		_p setDamage 0;
		_p setDamage (_d + 0.1);
	};
} forEach _nest_array;