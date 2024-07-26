extends TextureRect

var player;
var interacted = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent().get_node("Player");


func talk():
	if (gamestate.actNumber == 1):
		secondAct();

func secondAct():
	gamestate.popup.open();
	gamestate.popup.setText("Please say Start to start.");
	gamestate.popup.setButton(0,"Close",true);
	gamestate.popup.setButton(1,"Ok",false);
	gamestate.popup.setButton(2,"Ok",false);
	gamestate.popup.get_node("OldMan").visible = false
	gamestate.popup.get_node("RollCreditsAndWinMachine").visible = true
	gamestate.popup.get_node("Title").text = "Roll Credits an Win Motor";
	gamestate.popup.get_node("Title").visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	visible = gamestate.actNumber >= 1;
	if (not visible):
		return;
	var dist = player.position.distance_to(position)
	if (dist < 120):
		if (not interacted):
			interacted = true;
			talk();
	else:
		interacted = false;
