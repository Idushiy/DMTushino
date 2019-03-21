private ["_a", "_ea"];
_a = switch (_this select 0) do {
	case 0: {true}; // all
	case 1: {if (isServer) then {true} else {false}}; // server only
	case 2: {if (X_Client) then {true} else {false}}; // client only
	case 3: {if (isDedicated) then {true} else {false}}; // dedicated only
	case 4: {if (!isServer) then {true} else {false}}; // client only, 2
};
if (_a) then {
	_ea = x_event_holder getVariable (_this select 1);
	if (isNil "_ea") then {_ea = []};
	_ea set [count _ea, _this select 2];
	x_event_holder setVariable [_this select 1, _ea];
};