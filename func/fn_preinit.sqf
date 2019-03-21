#include "setup.sqf"
diag_log format ["############################# %1 #############################", missionName];
diag_log format ["%1 --- Executing TcB fn_preinit.sqf",diag_ticktime];

if (isNil "paramsArray") then {
	if (isClass (missionConfigFile/"Params")) then {
		_conf = missionConfigFile/"Params";
		for "_i" from 0 to (count _conf - 1) do {
			_paramName = configName (_conf select _i);
			_paramval = getNumber (_conf/_paramName/"default");
			if (_paramval != -99999) then {
				missionNamespace setVariable [_paramName, _paramval];
			};
		};
	};
} else {
	for "_i" from 0 to (count paramsArray - 1) do {
		_paramval = paramsArray select _i;
		if (_paramval != -99999) then {
			missionNamespace setVariable [configName ((missionConfigFile/"Params") select _i), _paramval];
		};
	};
};

#ifdef __DM_VIEWDISTANCE__
setViewDistance __DM_VIEWDISTANCE__;
#endif


/*
tequila_pistols = [
	"RH_g19",
	"rhs_weap_pb_6p9",
	"RH_m1911",
	"RH_mak",
	"rhs_weap_pya",
	"RH_deagle",
	"rhs_weap_pp2000_folded"
];
*/

tequila_sniper = [
  "rhs_weap_m76",
  "rhs_weap_svdp_wd"
];

tequila_lmg = [
    "rhs_weap_pkp",
    "rhs_weap_m240B",
    "hlc_lmg_m60",
    "rhs_weap_pkm",
    "hlc_lmg_MG3",
    "rhs_weap_mg42",
    "rhs_weap_m249_pip_S_vfg",
    "rhs_weap_m249"


];

tequila_assault = [
	"rhs_pzn_weap_rpk74n",
	"rhs_weap_m4a1_carryhandle",
	"rhs_weap_vss_npz",
	"rhs_weap_vss_grip",
	"rhs_weap_aks74u",
	"rhs_pzn_weap_akmsn",
	"rhs_weap_akm",
	"rhs_weap_savz58v_black",
	"rhs_weap_m70ab2",
	"RH_M4A1_ris",
	"rhs_weap_m21a_pr",
	"tu_m16a2",
	"hlc_rifle_g3a3ris",
	"hlc_rifle_G36KA1",
	"hlc_rifle_G36A1",
	"hlc_rifle_g3sg1",
	"BWA3_G38",
	"BWA3_G36KA0",
	"hlc_rifle_FAL5061",
	"hlc_rifle_L1A1SLR",
	"rhs_weap_m38",
	"rhs_30Rnd_545x39_7N10_AK"

];

tequila_sniper_optics = [
    "rhs_acc_pso1m2"
];

tequila_optics = [
	"rhs_acc_ekp1",
	"rhs_acc_pkas",
	"rhs_acc_1p29",
	"rhs_acc_rakursPM",
	"RH_compM2l",
	"rhsusf_acc_T1_high",
	"rhsusf_acc_T1_low",
	"optic_Yorris",
	"optic_ACO_grn",
	"RH_eotech553",
	"RH_eotech553mag",
	"RH_eothhs1",
	"RH_eotexps3",
	"BWA3_optic_EOTech_Mag_Off",
	"rhsusf_acc_g33_xps3",
	"rhsusf_acc_eotech_552",
	"BWA3_optic_RSAS",
	"rhsusf_acc_RX01",
	"RH_shortdot",
	"optic_tws",
	"rhsusf_acc_eotech_xps3",
	"BWA3_optic_ZO4x30",
	"rhs_acc_ekp8_18",
	"rhs_acc_1p63",
	"rhs_acc_1p78",
	"rhs_acc_ekp1",
	"rhs_acc_ekp8_02",
	"rhs_acc_pkas",
	"rhs_acc_pso1m2",
	"rhs_acc_pso1m21",
	"rhsusf_acc_ACOG2",
	"rhsusf_acc_ACOG3",
	"rhs_acc_1pn93_2"
];


switch (tcb_loadoutparam) do {
	case (0) : {tequila_weapons = tequila_assault + tequila_lmg + tequila_sniper };
	case (1) : {tequila_weapons = tequila_assault + tequila_lmg + tequila_sniper};
	case (2) : {tequila_weapons = tequila_assault + tequila_lmg };
	case (3) : {tequila_weapons = tequila_assault};
	case (4) : {tequila_weapons = tequila_sniper};
	case (5) : {tequila_weapons = tequila_lmg};

};

[0, "say3D", {(_this select 0) say3D (_this select 1)}] call tcb_fnc_NetAddEvent;

_trg1 = createTrigger ["EmptyDetector", [0,0,0]];
_trg1 setTriggerArea [0,0,0,false];
_trg1 setTriggerStatements ["timelimit < 100000 && {time >= timelimit}","tcb_gaming_over = true; publicVariable 'tcb_gaming_over'; psy = execVM 'scripts\outro.sqf';",""];


if (!isDedicated) then {
	client_jip_init_trigger = createTrigger ["EmptyDetector", [0,0,0]];
	client_jip_init_trigger setTriggerArea [0,0,0,false];
	client_jip_init_trigger setTriggerActivation ["NONE", "PRESENT", false];
	client_jip_init_trigger setTriggerTimeout [0, 0, 0, false];
	X_INIT = false;
	client_jip_init_trigger setTriggerStatements ["X_INIT && !isNil 'tcb_init_processed'", "diag_log [diag_tickTime, 'Executing local player JIP trigger']; call compile preprocessFileLineNumbers 'player_jip.sqf'", ""];
	onPreloadFinished {tcb_preloaddone = true; onPreloadFinished {}};
};
diag_log format ["%1 --- preinit.sqf is processed",diag_ticktime];