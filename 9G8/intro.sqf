TitleText[" ", "BLACK FADED", 0];
sleep 1;
disableUserInput true;
diwako_dui_main_toggled_off = true;

TitleText["任務準備中，請稍後...", "BLACK FADED", 0];
disableUserInput false;
playMusic "mission_intro";
TitleText["任務取材自2022-2023柬埔寨人口販賣事件\n遊戲內容如有雷同純屬巧合。 -- 黑貓", "BLACK FADED", 0];
sleep 5;
TitleText["  ", "BLACK IN", 6];

// 小女孩murmur
["艾希", "我小的時候，爸爸告訴我：以後長大了不要做壞事，要為自己負責。"] spawn BIS_fnc_showSubtitle;
sleep 8.5;
["艾希", "現在的我，真的會是這樣嗎？"] spawn BIS_fnc_showSubtitle;
sleep 5;

// 顯示任務說明
["行動代號：9G8","扮演角色：中華民國特殊作戰部隊" , "作者：Blackcat"] spawn BIS_fnc_infoText;
diwako_dui_main_toggled_off = false;
sleep 3;
// 指揮官
playMusic "mission_brief";
ula sideChat "這次的目標，是國際上大名鼎鼎的人蛇販賣集團。他們利用高薪求職的方式，讓國人沒入被販賣的陷阱。";
sleep 8.5;
ula sideChat "記住！我們的目的不是要大開殺戒。一定要善用手上智慧的武器，來探取敵方的動向。";
sleep 2;
