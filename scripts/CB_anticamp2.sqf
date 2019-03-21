//by psycho																				////
//version: 1.03		little performance tweak 27.10.2013												////
//																						////
//	                                                        CB-anticamp - script											////
//	how to use:																			////
//	put in the init.sqf the following lines for individual usage of this script:								////	
//																						////
//	minmial:																				////												
//				---> 	_psy = [player] execVM "CB_anticamp.sqf";									////
//	set campertimeout in seconds, if not stadet script will set the time to 30 seconds:						////
//				--->   _psy = [player,40] execVM "CB_anticamp.sqf";									////
//	set a warningtime in seconds, if not stadet script will set the time to 2/3 of campertimeout:				////
//				--->   _psy = [player,40,30] execVM "CB_anticamp.sqf";								////
//																						////
//	if you use an intro-sequence, make sure you set the following variable to "true" at the end of the intro		////
//	and define the var in the init.sqf to "false" bevor the mission is starting:								////
//	var: 		tcb_intro_out																	////
//																						////
//	if you use an outro-sequence, make sure you set following variable to "true" at the end of the outro			////
//	and define the var in the init.sqf to "false" bevor the mission is starting:								////
//	var:		tcb_gaming_over																////
//																						////
//bugreport: icq 	312378263																////
/////////////////////////////////////////////////////////////////////////////////////////////////////////
private ["_timeout","_towalk","_longfact","_pos1","_pos2","_stepper","_anothertime","_camper_found"];
if (isDedicated) exitWith {};

_timeout = if (count _this > 1) then {_this select 1} else {40};
_mindist = 8;
_longfact = 2.5;
_pos1 = position objNull;
_pos2 = position objNull;
_stepper = 0;

_CLY_kneelanims = ["amovpknlmstpsraswnondnon","amovpknlmstpsraswrfldnon","amovpknlmstpsraswpstdnon","amovpknlmstpsraswpstdnon","amovpknlmstpsraswlnrdnon","amovpercmstpsraswrfldnon"];
_CLY_proneanims = ["amovppnemstpsraswnondnon","amovppnemstpsraswrfldnon","amovppnemstpsraswpstdnon","amovppnemsprslowwrfldl","amovppnemsprslowwrfldr","amovppnemrunslowwrfldb","amovppnemsprslowwrfldf","amovppnemstpsraswrfldnon_aadjppnemstpsraswrflddown","amovppnemstpsraswrfldnon_amovppnemevaslowwrfldl","amovppnemstpsraswrfldnon_amovppnemevaslowwrfldr"];

_div = (25.5 / _timeout);
_counter = round (2 * _timeout);
_warningtime = if (count _this > 2) then {_this select 2} else {round ((_counter / 3)*2)};
_anothertime = false;
player setVariable ["tcb_anticamp_wanring", false];
// skip intro time:
waitUntil {!isNil "tcb_intro_out" || time > 90};			//var: tcb_intro_out  <---set this var true at the end of intro-sequences if existing

if (isNil "tcb_gaming_over") then {tcb_gaming_over=false};	//var: CB_Gaming_over  <---set this var true at the begining of outro-sequences if existing
CB_camper = "";
_nameego = name player;



//-----------------------------mainloop
while {!tcb_gaming_over} do {
	_loop = 1;
	_newloop = 1;
	player setVariable ["tcb_anticamp_wanring", false];
	waitUntil {alive player};
	waitUntil {!(primaryweapon player == "")};

	
		//---------------------------------------------------secondary loop
		for [{_loop=1}, {_loop<= _counter}, {_loop=_loop+1}] do {
			_pos1 = getPos player;
			if (vehicle player != player || {surfaceIsWater _pos1}) then {
				_timeout = _timeout * _longfact; _anothertime = true;
			};
			if ((vehicle player == player || !surfaceIsWater _pos1) && {_anothertime}) then {
				_timeout = _timeout / _longfact; _anothertime = false;
			};
			_stepper = (_timeout * _div);
			sleep _stepper;

			if (primaryweapon player == "" || {!alive player}) then {_loop = _counter + 1};
			

			//------------------------------------------------------croushing?
			if (!canStand player && {alive player}) then {
				player setHit ["legs", 0];
				player playMove (_CLY_kneelanims select getNumber (configFile/'CfgWeapons'/(currentWeapon player)/'type'));
				if (getNumber (configFile/'CfgWeapons'/(currentWeapon player)/'type') in [0,4]) then {
					player playMove 'amovppnemstpsnonwnondnon_amovpknlmstpsnonwnondnon';
				};
				titleText [format["Move %1",name player],"plain down",0.3];
			};
			_anim = animationState player;                                              // hint format ["%1",_loop];
			
			if (_anim in _CLY_proneanims && {canStand player}) then {
				titlecut ["","Black out" ,4.5];
				titletext ["Засыпаю от скуки" ,"plain" ,2];
				waitUntil {!(animationState player in _CLY_proneanims)};
				diag_log format ["%1",animationState player];
				titlecut ["","Black in" ,1];
				titletext ["Ооо.. понеслась:)" ,"plain" ,0.2];
				"dynamicblur" ppeffectenable true;
				"dynamicblur" ppeffectadjust [5];
				"dynamicblur" ppeffectcommit 0;
				"dynamicblur" ppeffectadjust [0];
				"dynamicblur" ppeffectcommit 2;
			};


			//----------------------------------------------------camping?	
			if (_newloop <= _loop && {!tcb_gaming_over}) then {
				_newloop = _newloop + 6;
				_pos2 = getPos player;
			};
			if (((_pos1 distance _pos2) > _mindist) && {!tcb_gaming_over}) then {
				_loop = 1;
				_newloop = _loop;
				if (player getVariable "tcb_anticamp_wanring") then {
					player setVariable ["tcb_anticamp_wanring", false];
					titletext ["Thats the spirit!" ,"plain" ,0.2];
				};
			};
			if (_warningtime == _loop && {!tcb_gaming_over}) then {
				player setVariable ["tcb_anticamp_wanring", true];
				if (isNil "tcb_status_bar") then {
					titletext ["Хватит прятаться, сражайся!" ,"plain" ,0.3];
				};
			};
			if (_loop == _counter && {!tcb_gaming_over}) then {
				removeallweapons player;
				titletext ["Ну возможно так тебе будет интерестней!" ,"plain" ,0.5];
			};
		};
		
		
	sleep 2;
	if (tcb_gaming_over) exitWith {};
};