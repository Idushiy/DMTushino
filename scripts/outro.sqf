#include "setup.sqf"
playmusic "outro";

sleep 0.2;
titlecut ["","Black in" ,2];
[2,0,false] spawn BIS_fnc_cinemaBorder;





sleep 1;
titleText ["Закончили", "Plain"]; titleFadeOut 30;


sleep 6;
["end1",true,false] call BIS_fnc_endMission;
waitUntil {camCommitted _camera};


sleep 1;
titleCut ["","BLACK OUT", 1];

sleep 5;
player cameraEffect ["terminate","back"];
camDestroy _camera;
titleCut ["","BLACK IN", 1];