// by psycho
// not activated yet - locking for sounds that fit to the situation
private ["_tracker","_score","_soundPath","_soundToPlay"];
_soundPath = [(str missionConfigFile), 0, -15] call BIS_fnc_trimString;
_soundToPlay = _soundPath + "sounds\some_sound_file.ogg";


while {!tcb_gaming_over} do {
	_tracker = 0;
	_score = _score player;
	waitUntil {_score != score player || {!alive player}};
	
	if (score player > _score && {alive player}) then {
		_tracker = _tracker + 1;
		if (_tracker == 3) then {
			playSound3D [_soundToPlay, player, false, position player, 1, 1, 30]; //Volume db+10, volume drops off to 0 at 50 meters from _sourceObject
		};
	};
};