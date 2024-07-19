extends ColorRect

@export var fadetime = 5.0
@export var startdelay = 1



# Called when the node enters the scene tree for the first time.
func _ready():
	#https://www.reddit.com/r/godot/comments/17xsbne/help_tweening_transparency_ie_modulatea_to_create/
	# Built in Godots Colors (There's a lot to choose from)
	await get_tree().create_timer(startdelay).timeout
	var tween = get_tree().create_tween();
	await tween.tween_property(self,"modulate:a",0,fadetime).finished
	self.queue_free()
