extends Node

var catPaw = load("res://Art/Menu/CatCursor.png")
var uwuPaw = load("res://Art/Menu/UwUCursor.png")

enum DialogSpeed{Off, Low, High}
enum GraphicsQuality {High, Low, Potato}
enum Localization {English, Gibberish, CatSignLanguage, UwU}

var vsync = false;
var hints = true;
var muteAudio = false;
var dialog = DialogSpeed.Low;
var graphics = GraphicsQuality.High;
var localization = Localization.English;
var gibberishStarting = false;
var brightness = 50
var opacity = 50
var masterAudio = 100
var musicAudio = 80
var effectAudio = 100
var jumpKey = "None"

var characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'

func isJumpPressed():
	if (jumpKey == "W"):
		return Input.is_key_pressed(KEY_W)
	if (jumpKey == "E"):
		return Input.is_key_pressed(KEY_E)
	if (jumpKey == "Q"):
		return Input.is_key_pressed(KEY_Q)
	
	return false

func setUwU():
	GlobalOptions.localization = GlobalOptions.Localization.UwU;
	gibberishStarting = false;
	Input.set_custom_mouse_cursor(uwuPaw,0,Vector2(19,4))
	
func setEnglish():
	GlobalOptions.localization = GlobalOptions.Localization.English;
	gibberishStarting = false;
	Input.set_custom_mouse_cursor(null)
	
func setGibberish():
	GlobalOptions.localization = GlobalOptions.Localization.Gibberish;
	GlobalOptions.gibberishStarting = true
	Input.set_custom_mouse_cursor(null)
	
func setCat():
	gibberishStarting = false;
	GlobalOptions.localization = GlobalOptions.Localization.CatSignLanguage;
	Input.set_custom_mouse_cursor(catPaw,0,Vector2(10,14))
	
