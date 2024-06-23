
#region window size

window_center();

wph = browser_width / browser_height

// Wider
if wph > 1.78
{
	window_set_size(browser_width, browser_height * (wph / 1.78));
}
// Taller
else if wph < 1.78
{
	window_set_size(browser_width * (1.78 / wph), browser_height);
}
else 
{
	window_set_size(browser_width, browser_height);
}

//show_message(string(window_get_width()) + "  " + string(window_get_height()));

#endregion