extends Control


@export var startscene = "GodotScene";
@export var fadeoutTime = 2;
@export var fadeinTime = 2;

var currentScene = "GodotScene";

# Called when the node enters the scene tree for the first time.
func _ready():
	gamestate.masternode = $ScenePool
	gamestate.fader = $GlobalFader
	gamestate.currentScene = get_node("ScenePool/Godot");
