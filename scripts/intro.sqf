#include "setup.sqf"
//player setpos [(getpos player select 0),(getpos player select 1),(getpos player select 2)+10000];
[0,0,false] spawn BIS_fnc_cinemaBorder;
//waitUntil {sleep 0.112;!isNil "tcb_preloaddone"};
sleep 0.2;

titlecut ["","Black in" ,2];
_camera="camera" camCreate [0,0,0];
_camera cameraEffect ["internal","back"];
//playmusic "intro";

"dynamicblur" ppeffectenable true;
"dynamicblur" ppeffectadjust [0];
"dynamicblur" ppeffectcommit 0;
"dynamicblur" ppeffectadjust [0];
"dynamicblur" ppeffectcommit 0;





sleep 0.5;
[1,nil,false] spawn BIS_fnc_cinemaBorder;
titleCut ["","BLACK OUT", 1];

player setvelocity [0,0,0];
//player setpos [getpos player select 0,getpos player select 1,0];
player setDir (random 360);
player setPos getMarkerPos "respawn_west";
player cameraEffect ["terminate","back"];
camDestroy _camera;
titleCut ["","BLACK IN", 1];


//for anticamp
tcb_intro_out = true;


sleep 1;
TitleRsc ["Mission_Title3","plain",0.2];