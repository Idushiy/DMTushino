// by Xeno
#include "setup.sqf"
perframe_store = "Land_HelipadEmpty_F" createVehicleLocal [0,0,0];
perframe_array = [];

xprevPFrame = -999;

173194 cutRsc ["FrameHandlerRsc","PLAIN"];
// forget onEachFrame. If some addon uses it too one will overwrite the other.
//onEachFrame {call d_fnc_perFrame}; 
diag_log format ["%1 --- per frame handler initialized...",diag_ticktime];