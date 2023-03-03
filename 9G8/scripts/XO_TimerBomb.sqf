params [
	["_time", ("mission_time" call BIS_fnc_getParamValue)]
];

// 指揮官字幕
playMusic "mission_land";
ula sideChat "著陸點附近有部署幾台車輛可以給你們使用，但千萬要注意槍火，小心傷害到人質。";
sleep 7;
playSound "watchBeep_single";
ula sideChat "我們只有數十分鐘的時間，數十分鐘後，敵人會引爆炸藥，與我們同歸與盡。";

// count time using ParamValue "mission_time"
_time = _time * 60;
_reinfo_time = _time / 2;

// show last time and put reinforcement in specified time.
while {_time > 0 && bomb_unlock == false} do {
	_time = _time - 1;
	hint format ["剩餘時間：%1", [(_time / 60) + .01, "HH:MM"] call BIS_fnc_timetostring];
	sleep 1;

	if (_time == _reinfo_time && task12 == false) then 
	{
		ula sideChat "單位注意！敵方派出增援部隊，加快腳步行動吧！";
		["mehv1", "mehv11", opfor_preset_big, "O_Heli_Light_02_unarmed_F"] execVM "scripts\peckcat\PCAT_infReinforcement.sqf";
	}
};

// Time Out! Kill The Bomb
if (bomb_unlock == false) then {
	bomb_timeout = true;
	bomb setDamage 1;

	["task11" , "FAILED" , true] call BIS_fnc_taskSetState;
	sleep 1;
	["LOSER", false, true] call BIS_fnc_endMission;
}