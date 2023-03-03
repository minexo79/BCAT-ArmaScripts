/// ====================================
/// mission script area
/// ====================================
systemChat "XO > 前置作業開始...";

// Initialize Ace Arsenal Box
systemChat "XO > 軍火庫生成中...";
[] call compileScript ["scripts\preset\XO_ArsenalPreset.sqf"];
[arsenalbox, XO_arsenal_present] call ace_arsenal_fnc_initBox;

systemChat "XO > 人質生成中...";
hostagePoint = ["mh1", "mh2", "mh3", "mh4", "mh5", "mh6", "mh7", "mh8", "mh9", "mh10", "mh11", "mh12", "mh13", "mh14", "mh15"];
[hostagePoint, hostage_count, civilian] call compileFinal preprocessFileLineNumbers "scripts\XO_SpawnHostage.sqf";

systemChat "XO > 敵方單位生成中...";
// OPFOR Spawn & Patrol Point 
opfor_point = ["me1", "me2", "me3", "me4", "me5", "me6", "me7", "me8"];

// OPFOR Group 
[] call compileScript ["scripts\preset\XO_OpforPreset.sqf"];

// 根據遊戲難度切換駐軍單位大小
if (("mission_difficulty" call BIS_fnc_getParamValue) == 1) then {
	[opfor_point, opfor_preset_small] call compileFinal preprocessFileLineNumbers "scripts\peckcat\PCAT_spawnOpfor.sqf";
} else {
	[opfor_point, opfor_preset_big] call compileFinal preprocessFileLineNumbers "scripts\peckcat\PCAT_spawnOpfor.sqf";
};

systemChat "XO > 前置作業完畢...";