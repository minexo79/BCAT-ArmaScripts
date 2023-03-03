//  ----------------------------------------------------------------------------
//  生成駐軍班
//  Source By Peckcat (Discord: PCAT#3579)
//  Modified By Blackcat (Discord: iblackcat#4119)
//  2023.02.26

params [
	"_opfor_spawnpoint",
	"_opfor_group"
];

// hint format ["%1", _opfor_spawnpoint];
// hint format ["%1", _opfor_group];

for "_i" from 0 to (count _opfor_spawnpoint) do {
    private _grp = [
        (_opfor_spawnpoint select _i) call CBA_fnc_getPos,
        OPFOR,
		_opfor_group
    ] call BIS_fnc_spawnGroup;                   		//  依照參數建立 Group

    _grp deleteGroupWhenEmpty true;              		//  當 Group 全滅為空後，刪除 Group，以避免 Group 數量達到上限
    // _grp setGroupIdGlobal [ format['"Alpha" 1-%1', _i] ];

    [
        getMarkerPos (_opfor_spawnpoint select _i),         //  The building(s) nearest this position are used <POSITION>
        nil,                                     			//  Limit the building search to those type of building <ARRAY>
        units _grp,                              			//  Units that will be garrisoned <ARRAY>
        (getMarkerSize (_opfor_spawnpoint select _i))#0,  	//  Radius to fill building(s) <SCALAR> (default: 0)
		2,                                      			//  0: even filling, 1: building by building, 2: random filling <SCALAR> (default: 0)
        true,                                  			    //  True to fill building(s) from top to bottom <BOOL> (default: false) (note: only works with filling mode 0 and 1)
        true                                    			//  Teleport units <BOOL> (default: false)
    ] call ace_ai_fnc_garrison;

    _grp addEventHandler ["CombatModeChanged", {
        params ["_group", "_newMode"];

        // Pick Time And Wait it.
        _time = selectRandom [5, 10, 20];

        // Using CBA_fnc_waitAndExecute to replace sleep
        [
            {
                params ["_group", "_thisEvent", "_thisEventHandler"];
                _unit = [];

                {
                    if (alive _x) then {
                        _unit pushBack _x;
                    };
                } forEach units _group;                     // Select Alive Unit in Groups  
                
                [_unit] call ace_ai_fnc_ungarrison;

                _group removeEventHandler [_thisEvent, _thisEventHandler];
            },
            [_group, _thisEvent, _thisEventHandler],        // Arguments (Optional)
            _time                                           // Time to Execute
        ] call CBA_fnc_waitAndExecute;          
    }];
};
