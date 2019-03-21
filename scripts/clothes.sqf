
//////////////////////////////////////////////////////////////
// CLOTHES FOR MISSION DMT
// MADE BY [DER]Idushiy
// 16.02.2019

//////////////////////////////////////////////////////////////



_unit = player;


//////////////////// Вписать Форму
clothes = [
	"rhs_uniform_emr_patchless",
	"rhs_uniform_FROG01_wd",
	"rhs_uniform_msv_emr",
	"LOP_U_CDF_Fatigue_01",
	"PBW_Uniform3K_fleck",
	"rhsgref_uniform_altis_lizard",
	"usm_bdu_w",
	"TRYK_U_B_NATO_OCPD_CombatUniform",
	"rhsgref_uniform_3color_desert",
	"rhs_uniform_FROG01_d",
	"LOP_U_AM_Fatigue_01",
	"LOP_U_TKA_Fatigue_02",
	"rhs_uniform_acu_ucp"
];


////////////////// Рандомит форму из списка
dm_uniform = clothes call tcb_fnc_RandomArrayVal;
player adduniform dm_uniform;


//////////////// Выдаёт всем норму медицины
for "_i" from 1 to 2 do {player addItemToUniform "ACE_morphine";};
for "_i" from 1 to 4 do {player addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 3 do {player addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 1 do {player addItemToUniform "ACE_epinephrine";};



/////////////////////В соответсвии с формой выдаёт экипировку под неё
if (dm_uniform == "rhs_uniform_emr_patchless") then {
    _unit addVest "rhs_6b23_6sh116";
    _unit addHeadgear "rhs_Booniehat_digi";
    _unit addBackpack "tf_mr3000_rhs";

    _unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";
    _unit addItemToVest "16Rnd_9x21_Mag";

    _unit addWeapon "rhs_weap_ak74mr";
    _unit addPrimaryWeaponItem "rhs_acc_tgpa";
    _unit addPrimaryWeaponItem "RH_eotech553mag";
    _unit addWeapon "hgun_Rook40_F";
    _unit addHandgunItem "muzzle_snds_L";
    _unit addWeapon "rhs_pdu4";

    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemRadio";
    _unit linkItem "ItemGPS";
    _unit linkItem "ACE_NVG_Wide";

    _unit addItemToUniform "ACE_Flashlight_KSF1";
    _unit addItemToBackpack "rhs_6b47";
    for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
    for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_7N22_AK";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
};

///////////////Если форма одна а экипировка разная, запускаем рандом
if (dm_uniform == "rhs_uniform_FROG01_wd") then {
        _ran = ceil random 3;
        	if (_ran > 1) then {
        	    _unit addVest "rhsusf_spc_rifleman";
                _unit addHeadgear "rhsusf_lwh_helmet_marpatwd_headset";

                _unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";

                _unit addWeapon "rhs_weap_m16a4_carryhandle";
                _unit addPrimaryWeaponItem "rhsusf_acc_SFMB556";
                _unit addPrimaryWeaponItem "rhsusf_acc_eotech_552";
                _unit addWeapon "rhs_weap_M136";

                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemRadio";
                _unit linkItem "rhsusf_ANPVS_14";

                _unit addItemToVest "rhsusf_acc_anpeq15A";
                for "_i" from 1 to 6 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
                for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
                for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
                for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};

        	}
    	    else {
                _unit addVest "rhsusf_spc_squadleader";
                _unit addBackpack "tfw_ilbe_wd";
                _unit addHeadgear "rhsusf_mich_bare_norotos_alt_headset";

                _unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";
                _unit addItemToVest "RH_7Rnd_45cal_m1911";

                _unit addWeapon "rhs_weap_m4a1_blockII_KAC_wd";
                _unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
                _unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side_bk";
                _unit addPrimaryWeaponItem "rhsusf_acc_SpecterDR_OD";
                _unit addWeapon "RH_kimber";
                _unit addHandgunItem "RH_osprey";

                _unit linkItem "ItemMap";
                _unit linkItem "ItemCompass";
                _unit linkItem "ItemRadio";
                _unit linkItem "ItemGPS";
                _unit addWeapon "ACE_Vector";
                _unit linkItem "rhsusf_ANPVS_15";

                for "_i" from 1 to 2 do {_unit addItemToVest "RH_7Rnd_45cal_m1911";};
                for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
                for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
                for "_i" from 1 to 5 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
                for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red";};
                }
};

////
if (dm_uniform == "rhsgref_uniform_3color_desert") then {

    _unit addHeadgear "ssh68_camo_yel";
    _unit addGoggles "rhsusf_shemagh2_tan";
    _unit addVest "FGN_RU_V95_Kamysh_2";

    _unit addItem "rhs_30Rnd_762x39mm_polymer";
    _unit addWeapon "rhs_weap_ak103";
    _unit addPrimaryWeaponItem "rhs_acc_pbs1";
    _unit addPrimaryWeaponItem "rhs_acc_ekp8_02";

    _unit addItem "rhs_acc_dtk";

    for "_i" from 1 to 4 do {_unit addItem "rhs_30Rnd_762x39mm_polymer";};
    for "_i" from 1 to 2 do {_unit addItem "rhs_30Rnd_762x39mm_polymer_tracer";};
    _unit addItem "rhsusf_ANPVS_14";


    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemWatch";
    _unit linkItem "tf_fadak";
};

///
if (dm_uniform == "rhs_uniform_msv_emr") then {
    _unit addVest "rhs_6b23_digi_6sh92";
    _unit addHeadgear "rhs_6b27m_digi";

    _unit addItemToVest "rhs_30Rnd_545x39_7n10_AK";

    _unit addWeapon "rhs_weap_ak74m";
    _unit addPrimaryWeaponItem "rhs_acc_dtk";

    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemRadio";

    for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_7n10_AK";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK_green";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
};

///
if (dm_uniform == "LOP_U_CDF_Fatigue_01") then {
    _unit addVest "LOP_V_6B23_CDF";
    for "_i" from 1 to 2 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
    _unit addBackpack "BWA3_Kitbag_Tropen";

    _unit addWeapon "rhs_weap_ak74";
    _unit addPrimaryWeaponItem "rhs_acc_dtk1983";
    _unit addWeapon "rhssaf_zrak_rd7j";
    for "_i" from 1 to 3 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rdg2_white";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_mag_rgd5";};
    for "_i" from 1 to 2 do {_unit addItemToBackpack "rhs_30Rnd_545x39_AK_green";};
    _unit addHeadgear "LOP_H_6B27M_ess_CDF";

    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "tf_microdagr";
    _unit linkItem "ItemRadio";
};


///
if (dm_uniform == "PBW_Uniform3K_fleck") then {
    _unit addVest "pbw_splitter_schtz";
    _unit addBackpack "BWA3_Carryall_Fleck";
    _unit addHeadgear "PBW_Helm1_fleck_HBOD";

    _unit addItemToBackpack "BWA3_Pzf3_IT";
    for "_i" from 1 to 6 do {_unit addItemToVest "BWA3_30Rnd_556x45_G36";};
    _unit addWeapon "BWA3_G36";
    _unit addPrimaryWeaponItem "rhsusf_acc_compm4";
    _unit addPrimaryWeaponItem "BWA3_acc_VarioRay_laser";
    _unit addWeapon "BWA3_Pzf3";

    _unit linkItem "ItemMap";
    _unit linkItem "ItemCompass";
    _unit linkItem "ItemRadio";
    _unit linkItem "NVGoggles_INDEP";


    for "_i" from 1 to 2 do {_unit addItemToVest "BWA3_30Rnd_556x45_G36_Tracer";};
    for "_i" from 1 to 2 do {_unit addItemToVest "BWA3_DM51A1";};
    for "_i" from 1 to 4 do {_unit addItemToVest "BWA3_DM25";};
    _unit addItemToBackpack "BWA3_Pzf3_IT";
};

////
if (dm_uniform == "rhsgref_uniform_altis_lizard") then {

_unit addVest "TRYK_V_harnes_od_L";
_unit addBackpack "tf_bussole";
_unit addHeadgear "rhsgref_helmet_pasgt_altis_lizard";

_unit addItemToVest "hlc_20rnd_762x51_b_G3";

_unit addWeapon "hlc_rifle_g3a3ris";
_unit addPrimaryWeaponItem "BWA3_optic_RSAS";
_unit addWeapon "Binocular";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";


for "_i" from 1 to 6 do {_unit addItemToVest "hlc_20rnd_762x51_b_G3";};
for "_i" from 1 to 2 do {_unit addItemToVest "hlc_20rnd_762x51_t_G3";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};

};

///
if (dm_uniform == "usm_bdu_w") then {
_unit addBackpack "B_Carryall_Base";
_unit addItem "rhs_100Rnd_762x54mmR";

_unit addWeapon "rhs_weap_pkm";
removeBackpack _unit;
_unit addVest "LOP_V_6B23_6Sh92_OLV";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_100Rnd_762x54mmR";};

_unit addItemToVest "rhs_mag_rgd5";
_unit addItemToVest "rhs_mag_rdg2_white";

_unit addHeadgear "LOP_H_6B27M_WDL";
_unit addGoggles "TRYK_Shemagh";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
_unit linkItem "tf_microdagr";
};

////
if (dm_uniform == "TRYK_U_B_NATO_OCPD_CombatUniform") then {

for "_i" from 1 to 2 do {_unit addItemToUniform "RH_7Rnd_45cal_m1911";};
_unit addVest "rhsusf_spcs_ocp_medic";
for "_i" from 1 to 7 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_PMAG";};

_unit addHeadgear "rhsusf_opscore_mar_ut_pelt";
_unit addGoggles "rhsusf_oakley_goggles_clr";

for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_an_m8hc";};

_unit addItemToUniform "ACE_bodyBag";

_unit addWeapon "rhs_weap_mk18";
_unit addPrimaryWeaponItem "rhsusf_acc_nt4_tan";
_unit addPrimaryWeaponItem "rhsusf_acc_anpeq15";
_unit addPrimaryWeaponItem "RH_t1";
_unit addPrimaryWeaponItem "rhsusf_acc_grip2";
_unit addWeapon "RH_kimber_nw";


_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "tf_microdagr";
_unit linkItem "tf_anprc148jem_1";
_unit linkItem "A3_GPNVG18_F";
_unit linkItem "ItemGPS";

_unit addItemToUniform "ACE_Flashlight_MX991";
};

///
if (dm_uniform == "rhs_uniform_FROG01_d") then {
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_elasticBandage";};
_unit addVest "CUP_V_BAF_Osprey_Mk2_DDPM_Soldier1";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_red";};
_unit addItemToVest "rhsusf_200Rnd_556x45_box";
_unit addItemToVest "rhsusf_200rnd_556x45_mixed_box";
_unit addBackpack "B_Kitbag_tan";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_200Rnd_556x45_box";};
_unit addItemToBackpack "rhsusf_200rnd_556x45_mixed_box";
_unit addHeadgear "rhsusf_lwh_helmet_marpatd_headset";

_unit addWeapon "rhs_weap_m249";

_unit linkItem "ItemMap";
_unit linkItem "ItemWatch";
_unit linkItem "ItemCompass";
_unit linkItem "ItemRadio";
};

if (dm_uniform == "LOP_U_AM_Fatigue_01") then {

for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_elasticBandage";};
_unit addVest "V_BandollierB_rgr";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
for "_i" from 1 to 4 do {_unit addItemToVest "rhs_mag_9x18_8_57N181S";};
_unit addBackpack "B_FieldPack_cbr";
for "_i" from 1 to 15 do {_unit addItemToBackpack "rhs_10Rnd_762x54mmR_7N1";};
_unit addHeadgear "H_ShemagOpen_khk";

_unit addWeapon "rhs_weap_svdp_wd";
_unit addPrimaryWeaponItem "rhs_acc_pso1m2";
_unit addWeapon "rhs_weap_makarov_pm";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
};

///
if (dm_uniform == "LOP_U_TKA_Fatigue_02") then {
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addItemToUniform "ACE_MapTools";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_packingBandage";};
_unit addItemToUniform "ACE_EarPlugs";
_unit addItemToUniform "ACE_tourniquet";
_unit addVest "V_TacVest_oli";
for "_i" from 1 to 5 do {_unit addItemToVest "rhs_30Rnd_545x39_7N10_desert_AK";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rgd5";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_rdg2_white";};
_unit addItemToVest "rhs_30Rnd_545x39_AK_plum_green";
_unit addBackpack "tf_mr3000_bwmod";
_unit addHeadgear "rhssaf_bandana_smb";

_unit addWeapon "rhs_weap_ak74m_desert";
_unit addPrimaryWeaponItem "rhs_acc_dtk1983";
_unit addPrimaryWeaponItem "rhs_acc_pkas";
_unit addWeapon "Binocular";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
};


///
if (dm_uniform == "rhs_uniform_acu_ucp") then {
_unit forceAddUniform "rhs_uniform_acu_ucp";
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_packingBandage";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_fieldDressing";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_elasticBandage";};
for "_i" from 1 to 3 do {_unit addItemToUniform "ACE_quikclot";};
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_morphine";};
_unit addItemToUniform "ACE_tourniquet";
for "_i" from 1 to 2 do {_unit addItemToUniform "ACE_epinephrine";};
_unit addVest "rhsusf_iotv_ucp_Rifleman";
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m18_red";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhs_mag_m67";};
for "_i" from 1 to 2 do {_unit addItemToVest "rhsusf_200Rnd_556x45_box";};
_unit addBackpack "B_Kitbag_rgr";
for "_i" from 1 to 2 do {_unit addItemToBackpack "rhsusf_200Rnd_556x45_box";};
_unit addItemToBackpack "rhsusf_200rnd_556x45_mixed_box";
_unit addHeadgear "rhsusf_ach_helmet_headset_ucp";;

_unit addWeapon "hlc_m249_pip4";
_unit addPrimaryWeaponItem "rhsusf_acc_ARDEC_M240";
_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";

_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";
_unit linkItem "ItemGPS";
};