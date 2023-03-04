/// ====================================
/// global variable area
/// ====================================

publicVariable "hostage";
publicVariable "bomb_unlock";
publicVariable "task91";
publicVariable "task92";
publicVariable "task93";

hostage = [];

bomb_unlock = false;

task91 = false;			// Hostage Mission
task92 = false;			// Bomb Mission 
task93 = false;			// Enemy Mission

/// ====================================
/// mission script area
/// ====================================

systemChat "XO > 前置作業開始...";

// Initialize Ace Arsenal Box
systemChat "XO > 軍火庫生成中...";
[] call compileScript ["scripts\preset\XO_ArsenalPreset.sqf"];
[arsenalbox, XO_arsenal_present] call ace_arsenal_fnc_initBox;

systemChat "XO > 人質生成中...";
hostage_count = "hostage_count" call BIS_fnc_getParamValue;
hostage_point = ["mh1", "mh2", "mh3", "mh4", "mh5", "mh6", "mh7", "mh8", "mh9", "mh10", "mh11", "mh12", "mh13", "mh14", "mh15"];

[hostage_point, hostage_count, civilian] call compileFinal preprocessFileLineNumbers "scripts\XO_SpawnHostage.sqf";

systemChat "XO > 敵方單位生成中...";
// OPFOR Spawn & Patrol Point 
opfor_point = ["me1", "me2", "me3", "me4", "me5", "me6", "me7", "me8"];

// OPFOR Group 
[] call compileScript ["scripts\preset\XO_OpforPreset.sqf"];

// 根據遊戲難度切換駐軍單位大小
[switch ("mission_difficulty" call BIS_fnc_getParamValue) do
{
	// easy mode
	case 1:	{ [opfor_point, opfor_preset_small] call compileFinal preprocessFileLineNumbers "scripts\peckcat\PCAT_spawnOpfor.sqf"; };
	// normal mode 
	case 2:	{ [opfor_point, opfor_preset_mid] call compileFinal preprocessFileLineNumbers "scripts\peckcat\PCAT_spawnOpfor.sqf"; };
	// hard mode 
	case 3: { [opfor_point, opfor_preset_big] call compileFinal preprocessFileLineNumbers "scripts\peckcat\PCAT_spawnOpfor.sqf"; };
}];

systemChat "XO > 前置作業完畢...";