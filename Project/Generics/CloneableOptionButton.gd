extends OptionButton
class_name CloneableOptionButton

@export var breaks = false
@export var dormant = false
var isClone = false

var englishTexts;
var gibberishStarted = false
var shuffleprop = 4
var startShader;

var grounded = false;
func touchedGround():
	grounded = true;


func _ready():
	createClickSound()
	adjustPopUp();
	englishTexts = []
	startShader = material
	for i in range(item_count):
		englishTexts.append(get_item_text(i))

	if (not isClone):
		add_to_group("Copyable");
		await get_tree().create_timer(0.01).timeout # wait for daddy
		Phys.physiphy(self,false);
	

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
		if hasChar(GlobalOptions.characters,t[pos]):
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
	
	if (GlobalOptions.localization == GlobalOptions.Localization.CatSignLanguage and not grounded):	
		get_popup().visible = false
	if (GlobalOptions.localization == GlobalOptions.Localization.Gibberish):		
		if (not gibberishStarted):
			shuffleAll();
			gibberishStarted = true
			material = load("res://Art/gibberish.tres")
		if (randi() % 100 < shuffleprop):
			shuffleLetter()
		
	if (GlobalOptions.gibberishStarting):
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
	
	
	if (self.get_parent() is RigidBody2D):
		var col : RigidBody2D = self.get_parent();
		var colpos = col.position
		var colrot = col.rotation
		result.position = colpos
		result.rotation = col.rotation

	
	if (move):
		result.position = result.position - panel.position
	return result

func _on_mouse_entered():
	gamestate.catExplain = true
	#gamestate.snapActive = false

func _on_mouse_exited():
	gamestate.catExplain = false
	#gamestate.snapActive = true

func createClickSound():
	var c1 = AudioStreamPlayer2D.new()
	c1.bus = "Effect"
	c1.stream = load("res://Sound/10 Clicks and Switches/click.4.ogg")
	c1.name = "Click"
	add_child(c1)
	
	pass

func popupClosed():
	gamestate.snapActive = true
	$Click.play()

func popupOpen():
	gamestate.snapActive = false
	$Click.play()

func adjustPopUp():
	var popup = get_popup()
	popup.connect("popup_hide",popupClosed)
	popup.connect("about_to_popup",popupOpen)
	pass
