//////////////////////////////////////////////////////////////
// FUNCTIONS FOR MISSION
// MADE BY [DER]Idushiy
// 16.02.2019

//////////////////////////////////////////////////////////////

tequila_clothes = [
	"rhs_uniform_FROG01_wd",
	"rhs_uniform_FROG01_wd"

];

tequila_uniform = tequila_clothes call tcb_fnc_RandomArrayVal;
player adduniform tequila_uniform;

//////////////////////////////////////////////////////////////
mdh_vests = [
	"rhsusf_spc_squadleader",
	"rhsusf_spc_teamleader"
];

tequila_vest = mdh_vests call tcb_fnc_RandomArrayVal;
player addvest tequila_vest;

//////////////////////////////////////////////////////////////

tequila_headgears = [
	"rhsusf_mich_bare_norotos_alt_headset",
	"rhsusf_lwh_helmet_marpatwd_headset"
];

//mdh_headgears = mdh_headgears + mdh_headgearsE;
tequila_head = tequila_headgears call tcb_fnc_RandomArrayVal;
player addheadgear tequila_head;

//////////////////////////////////////////////////////////////



