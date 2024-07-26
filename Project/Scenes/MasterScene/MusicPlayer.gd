extends AudioStreamPlayer2D


#var music1 = preload("res://Sound/Music/Music1.wav")
#var music2 = preload("res://Sound/Music/Music2.wav")
#var music3 = preload("res://Sound/Music/Music3.wav")
#var music4 = preload("res://Sound/Music/Music4.wav")
#var music5 = preload("res://Sound/Music/Music5.wav")
var allMusic;
var finishTime;
var finishedPiece = false;
var waitTime;

# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.musicPlayer = self
	
func beginMusic():
	#allMusic  = [music1,music2,music3,music4,music5]
	#self.stream = allMusic[3]
	#self.play()	
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(finishedPiece):
		var time = Time.get_ticks_msec()-finishTime
		if (time > 1000 * (30 + waitTime)):
			startMusic();
	


func startMusic():
	self.stream = allMusic[randi()%len(allMusic)]
	self.play()
	finishedPiece = false

func _on_finished():
	finishTime = Time.get_ticks_msec()
	waitTime = randi()%30
	finishedPiece = true
