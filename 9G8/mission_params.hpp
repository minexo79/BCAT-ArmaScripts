class Params
{
	class mission_difficulty {
		title = "遊戲難度";
		texts[] = { "簡單 (無增援)", "中等 (含地面增援)", "困難 (含地面 + 空中增援)"};
		values[] = { 1, 2, 3 };
		default = 3;
	};
	class mission_time {
		title = "遊戲時間";
		texts[] = { "30分鐘", "40分鐘", "50分鐘", "60分鐘"};
		values[] = { 30, 40, 50, 60};
		default = 60;
	};
	class hostage_count {
		title = "人質數量";
		texts[] = { "1位", "2位", "3位"};
		values[] = { 1, 2, 3 };
		default = 1;
	};
	class underline1 {
		title = "===============";
		texts[] = {""};
		values[] = {""};
		default = "";
	};
	class about {
		title = "作者：Blackcat";
		texts[] = {""};
		values[] = {""};
		default = "";
	};
}
