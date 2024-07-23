extends Node

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
