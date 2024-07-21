extends CheckBox
class_name CloneableCheckBox

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
	
	
func shuffleLetter():
	var index = randi()%len(text)
	var n_char = len(GlobalOptions.characters)
	text[index] = GlobalOptions.characters[randi()% n_char]
	
func shuffleAll():
	var word: String
	var n_char = len(GlobalOptions.characters)
	for i in range(len(englishText)):
		word += GlobalOptions.characters[randi()% n_char]
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
	if (move):
		result.position = result.position - panel.position
	return result
