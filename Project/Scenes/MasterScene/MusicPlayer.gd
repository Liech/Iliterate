extends AudioStreamPlayer2D


var english = preload("res://Sound/A Lucid Dream/A Lucid Dream.ogg")
var gibberish = preload("res://Sound/DarkAmbiennt/Iwan Gabovitch - Dark Ambience Loop.ogg")
var cat = preload("res://Sound/Catsong/music_catsong.ogg")
var uwu = preload("res://Sound/GasmaskLove/gasmask_love_loop.mp3")

var currentStream;

#gamestate.musicPlayer.fadeStreamTo

# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.musicPlayer = self
	self.stream = english
	$Gibberish.stream = gibberish
	$Cat.stream = cat
	$UwU.stream = uwu
	currentStream = self
	
	self.volume_db = -80
	$Gibberish.volume_db = -80
	$Cat.volume_db = -80
	$UwU.volume_db = -80
	
func beginMusic():
	self.play()
	self.volume_db = 0

func fadeStreamTo(lang):
	var newStream;
	if(GlobalOptions.Localization.English == lang):
		newStream = self
	elif(GlobalOptions.Localization.Gibberish == lang):
		newStream = $Gibberish
		if (not $Gibberish.playing):
			$Gibberish.play()
	elif(GlobalOptions.Localization.CatSignLanguage == lang):
		newStream = $Cat
		if (not $Cat.playing):
			$Cat.play()
	elif(GlobalOptions.Localization.UwU == lang):
		newStream = $UwU
		if (not $UwU.playing):
			$UwU.play()
	if (newStream == currentStream):
		return	
	var tween = create_tween();
	tween.set_parallel()
	tween.tween_property(currentStream,"volume_db",-80,1)
	tween.tween_property(newStream,"volume_db",0,1)
	await tween.finished
	currentStream = newStream
