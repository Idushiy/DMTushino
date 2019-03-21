private ["_ea"];
_ea = x_event_holderToClients getVariable (_this select 0);
if (isNil "_ea") then {_ea = []};
_ea set [count _ea, _this select 1];
x_event_holderToClients setVariable [_this select 0, _ea];