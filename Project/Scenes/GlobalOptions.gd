extends Node

var catPaw = load("res://Art/Menu/CatCursor.png")
var uwuPaw = load("res://Art/Menu/UwUCursor.png")

enum DialogSpeed{Off, Low, High}
enum GraphicsQuality {High, Low, Potato}
enum Localization {English, Gibberish, CatSignLanguage, UwU}

var vsync = true;
var hints = true;
var muteAudio = false;
var dialog = DialogSpeed.Low;
var graphics = GraphicsQuality.High;
var localization = Localization.English;
var brightness = 50
var opacity = 50
var masterAudio = 1
var musicAudio = 1
var effectAudio = 1

var characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'


func setUwU():
	GlobalOptions.localization = GlobalOptions.Localization.UwU;
	Input.set_custom_mouse_cursor(uwuPaw,0,Vector2(19,4))
	
func setEnglish():
	GlobalOptions.localization = GlobalOptions.Localization.English;
	Input.set_custom_mouse_cursor(null)
	
func setGibberish():
	GlobalOptions.localization = GlobalOptions.Localization.Gibberish;
	Input.set_custom_mouse_cursor(null)
	
func setCat():
	GlobalOptions.localization = GlobalOptions.Localization.CatSignLanguage;
	Input.set_custom_mouse_cursor(catPaw,0,Vector2(10,14))
	
