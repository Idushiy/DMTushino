//by psycho
private ["_startVDistance","_startfog"];
waitUntil {!isNull player};
_startVDistance = Viewdistance;
_startfog = Fog;

[_startVDistance] spawn {
	_vd = _this select 0;
	while {true} do {
		WaitUntil {viewDistance != _vd};
		setViewdistance _vd;
		sleep 1;
	};
};
[_startfog] spawn {
	_sf = _this select 0;
	while {true} do {
		WaitUntil {Fog != _sf};
		if (!isNil "DM_gaming_areas") then {
			if ({player in List _x} forEach DM_gaming_areas) then {0.5 setFog _sf};
			sleep 1;
		};
	};
};

