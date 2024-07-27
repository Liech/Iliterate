extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player = get_parent().get_node("Player")
	var dist = player.position.distance_to(position)
	$Hint.visible = dist < 100
	$Hint.text = "Press A/D to Walk left and right"
