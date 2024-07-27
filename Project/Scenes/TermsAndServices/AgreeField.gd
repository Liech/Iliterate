extends TextEdit

var shuffleprop = 4
var englishText;
var gibberishStarted = false
var startShader;
func hasChar(str, char):
	for i in range(len(str)):
		if (str[i] == char):
			return true;
	return false;
	
	
func _ready():
	englishText = text
	startShader = material
			
func shuffleLetter():
	if (len(placeholder_text) == 0):
		return;
	var index = randi()%len(placeholder_text)
	var n_char = len(GlobalOptions.characters)
	if hasChar(GlobalOptions.characters,placeholder_text[index]):
		placeholder_text[index] = GlobalOptions.characters[randi()% n_char]
	
func shuffleAll():
	var word: String
	var n_char = len(GlobalOptions.characters)
	for i in range(len(englishText)):
		if hasChar(GlobalOptions.characters,englishText[i]):
			word += GlobalOptions.characters[randi()% n_char]
		else:
			word+= englishText[i]
	placeholder_text = word
	
func _process(delta):
	if (GlobalOptions.localization == GlobalOptions.Localization.Gibberish):		
		if (not gibberishStarted):
			shuffleAll();
			gibberishStarted = true
			material = load("res://Art/gibberish.tres")
		if (randi() % 100 < shuffleprop):
			shuffleLetter()
	if (GlobalOptions.gibberishStarting):
		gibberishStarted = true
		if (randi() % 100 < shuffleprop):
			shuffleLetter()
	else:
		placeholder_text = englishText
		gibberishStarted = false
		material = startShader
