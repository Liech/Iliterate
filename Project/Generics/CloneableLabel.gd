extends Label
class_name CloneableLabel

@export var breaks = false
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
		await get_tree().create_timer(0.01).timeout # wait for daddy
		Phys.physiphy(self,false);

func hasChar(str, char):
	for i in range(len(str)):
		if (str[i] == char):
			return true;
	return false;

	
func shuffleLetter():
	if (len(text) > 0):
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
	
	var result : Label = self.duplicate();
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

func _on_mouse_exited():
	gamestate.catExplain = false


func breakApart():
	var c1 = Label.new()
	var c2 = Label.new()
	add_child(c2)
	add_child(c1)
	var half = len(text)/2
	c1.text = text.substr(0,half);
	c2.text = text.substr(half);
	c1.position = Vector2(0,0);
	c2.position = Vector2(size.x/2,0);
	c1.size = Vector2(size.x/2,size.y)
	c2.size = Vector2(size.x/2,size.y)
	c1.theme = theme
	c2.theme = theme
	c1.set_script(load("res://Generics/CloneableLabel.gd"))
	c2.set_script(load("res://Generics/CloneableLabel.gd"))

	var i = get_child_count()-1
	var col : RigidBody2D = self.get_parent();
	var cumulativeSize = 0
	while(i >= 0):
		var c = get_child(i)
		c.visible = true
		remove_child(c)
		gamestate.currentScene.add_child(c)
		var colpos = col.position
		var colrot = col.rotation
		c.position = colpos + Vector2(cos(colrot),sin(colrot))*cumulativeSize
		c.rotation = col.rotation
		cumulativeSize += c.size.x
		Phys.physiphy(c,true);
		
		i = i-1;
