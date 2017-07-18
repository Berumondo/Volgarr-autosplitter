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
	// if level is not treasure room, tower entrance, nor loading screen
	if (old.level != 39 && current.level != 19 && old.level != 19 && current.level != 50)
		return current.level != old.level;
}

isLoading
{
	// if level is tresure room or tower entrance
	return current.level == 39 || current.level == 19 || current.level == 50;
}

update
{
	// if (current.level != old.level) {
	// 	print("level : " + current.level.ToString());
	// 	print("old level : " + old.level.ToString());
	// }
}

// tower level order
// 19(entrance) 30 24 23 21 25 26 27 22 28 20 29 31 32(Fafnir)
