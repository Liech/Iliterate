extends TextureRect

var click1 = preload("res://Sound/10 Clicks and Switches/click.1.ogg")
var click2 = preload("res://Sound/10 Clicks and Switches/click.2.ogg")
var click3 = preload("res://Sound/10 Clicks and Switches/click.3.ogg")
var click4 = preload("res://Sound/10 Clicks and Switches/click.4.ogg")
var click5 = preload("res://Sound/10 Clicks and Switches/click.5.ogg")
var click6 = preload("res://Sound/10 Clicks and Switches/click.6.ogg")
var click7 = preload("res://Sound/10 Clicks and Switches/click.7.ogg")
var click8 = preload("res://Sound/10 Clicks and Switches/click.8.ogg")
var click9 = preload("res://Sound/10 Clicks and Switches/click.9.ogg")
var allclicks;
var streams = [];
var startpos
var jiggling = false

func _ready():
	createClickSound();
	createClickSound();
	createClickSound();
	createClickSound();
	createClickSound();
	createClickSound();
	allclicks = [click1,click2,click3,click4,click5,click6,click7,click8,click9]
	startpos = position

func jiggle():
	jiggling = true
	await get_tree().create_timer(0.8).timeout
	jiggling = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (jiggling):
		position = startpos + Vector2(30.0 * (randi()%30) / 30.0,30.0 * (randi()%30) / 30.0)
		
		if (randi()%100 < 10 or true):
			var strm = streams[randi()%len(streams)]
			if (not strm.playing):
				strm.stream = allclicks[randi()%len(allclicks)]
				strm.volume_db = -randi()%10
				strm.play()



func createClickSound():
	var c1 = AudioStreamPlayer2D.new()
	c1.bus = "Effect"
	c1.stream = load("res://Sound/10 Clicks and Switches/click.1.ogg")
	c1.name = "Click"
	add_child(c1)
	streams.append(c1)
	pass
