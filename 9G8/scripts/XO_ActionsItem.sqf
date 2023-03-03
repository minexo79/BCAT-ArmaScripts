// Timer Bomb
bomb addAction 
[
	"<t color='#ff0000'>-- 拆除炸彈 --</t>",
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		sleep 1;
		playSound "watchBeep_off";
		bomb_unlock = true;
		task11 = true;
		["task11" , "SUCCEEDED" , true] call BIS_fnc_taskSetState;

		ula sideChat "漂亮，炸藥拆除之後，敵人就沒有自毀的餘地了。";

		bomb removeAction _actionId;
	}
];