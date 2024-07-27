extends Label

var fadetime = 0.2

# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.buttonLabel= self
	pass # Replace with function body.

func hasChar(str, char):
	for i in range(len(str)):
		if (str[i] == char):
			return true;
	return false;

func shuffleAll(input):
	var word: String
	var n_char = len(GlobalOptions.characters)
	for i in range(len(input)):
		if hasChar(GlobalOptions.characters,input[i]):
			word += GlobalOptions.characters[randi()% n_char]
		else:
			word+= input[i]
	return word

func flash(t):
	if (GlobalOptions.Localization.Gibberish == GlobalOptions.localization):
		text = shuffleAll(t)
	else:
		text = t;
	modulate.a = 0.01;
	visible = true
	
	var tween = create_tween();
	await tween.tween_property(self,"modulate",Color(1.0,1.0,1.0,1.0),fadetime).finished
	var tween2 = create_tween();
	await tween2.tween_property(self,"modulate",Color(1.0,1.0,1.0,0.0),fadetime).finished
	
	
	visible = false;
