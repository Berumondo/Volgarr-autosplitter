// made by berumondo
// berumondosmb@gmail.com
// discord : berumondo#0612
//
// TODO : find IGT address

state("Volgarr")
{
	int level : 0x21d4e4, 0x18;
}

start
{
	return current.level == 1;
}

reset
{
	return current.level == 0;
}

split
{
	// level order (crystal): 0 1 2 39 3 4 39 7 8 39 11 12 39 15 16 39 19 30 24 23 21 25 26 27 22 28 20 19 31 32
	// if level is not treasure room, tower entrance, nor loading screen
	// if (old.level != 39 && current.level != 19 && old.level != 19 && current.level != 50 && (current.level % 2 == 1 && current.level < 19))
	if (current.level <= 19) {
		if (current.level % 2 == 0 || current.level == 39)
			return current.level != old.level;
	}
	else {
		if (current.level != 50 && current.level != 30) {
			return current.level != old.level;
		}
	}
}

isLoading
{
	// if level is tresure room or tower entrance
	return current.level == 39 || current.level == 19 || current.level == 50;
}

update
{
	// print(timer.Run.CategoryName);
	// if (current.level != old.level) {
	// 	print("level : " + current.level.ToString());
	// 	print("old level : " + old.level.ToString());
	// }
}

// tower level order
// 19(entrance) 30 24 23 21 25 26 27 22 28 20 29 31 32(Fafnir)
