// execVM "intro.sqf";

/// ====================================
/// player script area
/// ====================================

// remove player items
removeAllItems player;
removeAllWeapons player;

// Set ACE Arsenal Items
[] call compileScript ["scripts\preset\XO_ArsenalPreset.sqf"];
[player, XO_arsenal_present, false] call ace_arsenal_fnc_addVirtualItems;

// Initialize Player Action
systemChat "XO > 玩家清單創建中...";
[] call compileScript ["scripts\XO_ActionsPlayer.sqf"];

systemChat "XO > 物件清單創建中...";
[] call compileScript ["scripts\XO_ActionsItem.sqf"];