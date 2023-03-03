// Select Random Room To Spawn Hostage 

params [
	"_hostage_point",
	"_hostage_count",
	"_side"
];

hostageUnit = ["C_Man_Casual_7_F", "C_Man_Casual_8_F", "C_Man_Casual_9_F"];
grp = createGroup _side;

for "_i" from 0 to _hostage_count - 1 do 
{
	_rp = selectRandom _hostage_point;
	_rh = selectRandom hostageUnit;

	hap = grp createUnit [_rh, getMarkerPos _rp, [], 0, "NONE"];

	hostage pushBack hap;
};

// Set Hostage To Handcuff And Set Event Handler
{
    [_x, true] call ace_captives_fnc_setHandcuffed;

    _x addEventHandler ["Killed", 
	{
		_hcount = { alive _x } count hostage;

		if (_hcount == 0) then 
		{
			["task12" , "FAILED" , true] call BIS_fnc_taskSetState;
			sleep 1;
			["LOSER", false, true] call BIS_fnc_endMission;
		}
	}];

} forEach hostage;