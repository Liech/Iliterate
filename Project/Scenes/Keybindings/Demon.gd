extends TextureRect

const keyW = preload("res://Art/Keycaps/KeycapW.png")
const keyWUwU = preload("res://Art/Keycaps/KeycapUwW.png")
const keyE = preload("res://Art/Keycaps/KeycapE.png")
const keyEUwU = preload("res://Art/Keycaps/KeycapEUwU.png")
const keyQ = preload("res://Art/Keycaps/KeycapQ.png")
const keyQUwU = preload("res://Art/Keycaps/KeycapQUwU.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (GlobalOptions.jumpKey == "W" and get_parent().choseKey.get_item_text(get_parent().choseKey.selected) == "W"):
		visible = true
		texture = keyWUwU
	elif(get_parent().choseKey.get_item_text(get_parent().choseKey.selected) == "W"):
		visible = true
		texture = keyW
	elif (GlobalOptions.jumpKey == "E" and get_parent().choseKey.get_item_text(get_parent().choseKey.selected) == "E"):
		visible = true
		texture = keyEUwU
	elif(get_parent().choseKey.get_item_text(get_parent().choseKey.selected) == "E"):
		visible = true
		texture = keyE
	elif (GlobalOptions.jumpKey == "Q" and get_parent().choseKey.get_item_text(get_parent().choseKey.selected) == "Q"):
		visible = true
		texture = keyQUwU
	elif(get_parent().choseKey.get_item_text(get_parent().choseKey.selected) == "Q"):
		visible = true
		texture = keyQ
	else:
		visible = false
		
