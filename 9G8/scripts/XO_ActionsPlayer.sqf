params [
    ["_player", player, [objNull]]
];

_player addAction 
[
	"<t color='#ffd700'>-- 開啟軍火庫 --</t>",
	{
		[player, player, false] call ace_arsenal_fnc_openBox; 
	},
	nil,
	-1,
	false,
	true,
	"",
	"
		isNull (objectParent _originalTarget)
		&&
	    ( _originalTarget nearObjects ['B_CargoNet_01_ammo_f', 5] findIf { _x == arsenalbox} ) > -1
	"
];