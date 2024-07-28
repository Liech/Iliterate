extends CloneableButton

func _ready():
	super()
	createClickSound()

func _on_pressed():
	$Click.play()
	gamestate.dialog.choicePressed(englishText)


func createClickSound():
	var c1 = AudioStreamPlayer2D.new()
	c1.bus = "Effect"
	c1.stream = load("res://Sound/10 Clicks and Switches/click.1.ogg")
	c1.name = "Click"
	add_child(c1)
	
	pass
