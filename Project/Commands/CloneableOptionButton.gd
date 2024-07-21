extends OptionButton
class_name CloneableOptionButton

var isClone = false

var englishTexts;
var gibberishStarted = false
var shuffleprop = 4
var startShader;

func _ready():
	englishTexts = []
	startShader = material
	for i in range(item_count):
		englishTexts.append(get_item_text(i))

	if (not isClone):
		add_to_group("Copyable");
	

func hasChar(str, char):
	for i in range(len(str)):
		if (str[i] == char):
			return true;
	return false;

	
func shuffleLetter():
	for index in range(item_count):
		var pos = randi()%len(englishTexts[index])
		var n_char = len(GlobalOptions.characters)
		var t = get_item_text(index)
		if hasChar(GlobalOptions.characters,t[index]):
			t[pos] = GlobalOptions.characters[randi()% n_char]
		set_item_text(index,t)
	
func shuffleAll():
	var n_char = len(GlobalOptions.characters)
	for index in range(item_count):
		var word: String
		for i in range(len(englishTexts[index])):
			if hasChar(GlobalOptions.characters,englishTexts[index][i]):
				word += GlobalOptions.characters[randi()% n_char]
			else:
				word+=englishTexts[index][i]
		set_item_text(index,word)
	
func _process(delta):
	if (GlobalOptions.localization == GlobalOptions.Localization.Gibberish):		
		if (not gibberishStarted):
			shuffleAll();
			gibberishStarted = true
			material = load("res://Art/gibberish.tres")
		if (randi() % 100 < shuffleprop):
			shuffleLetter()
		
	else:
		for i in range(item_count):
			set_item_text(i, englishTexts[i])
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
