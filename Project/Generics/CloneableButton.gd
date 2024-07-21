extends Button
class_name CloneableButton

var isClone = false

var englishText;
var gibberishStarted = false
var shuffleprop = 4
var startShader;

func _ready():
	englishText = text
	startShader = material
	if (not isClone):
		add_to_group("Copyable");

func hasChar(str, char):
	for i in range(len(str)):
		if (str[i] == char):
			return true;
	return false;

	
func shuffleLetter():
	var index = randi()%len(text)
	var n_char = len(GlobalOptions.characters)
	if hasChar(GlobalOptions.characters,text[index]):
		text[index] = GlobalOptions.characters[randi()% n_char]
	
func shuffleAll():
	var word: String
	var n_char = len(GlobalOptions.characters)
	for i in range(len(englishText)):
		if hasChar(GlobalOptions.characters,englishText[i]):
			word += GlobalOptions.characters[randi()% n_char]
		else:
			word+= englishText[i]
	text = word
	
func _process(delta):
	if (GlobalOptions.localization == GlobalOptions.Localization.Gibberish):		
		if (not gibberishStarted):
			shuffleAll();
			gibberishStarted = true
			material = load("res://Art/gibberish.tres")
		if (randi() % 100 < shuffleprop):
			shuffleLetter()
	else:
		text = englishText
		gibberishStarted = false
		material = startShader
	
func cloneObject(panel, move,ppos):
	var result = self.duplicate();
	result.size  = self.size
	result.theme = self.theme
	result.isClone = true
	panel.add_child(result);
	
	if (self.get_parent() is RigidBody2D):
		var col : RigidBody2D = self.get_parent();
		var colpos = col.position
		var colrot = col.rotation
		result.position = colpos
		result.rotation = col.rotation

	
	if (move):
		result.position = global_position - panel.position
	return result

func _on_mouse_entered():
	gamestate.catExplain = true

func _on_mouse_exited():
	gamestate.catExplain = false
