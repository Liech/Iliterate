extends Node

enum Scenes {Godot, Triggerwarning, Ubiscene, StartScreen}

 
var twChoice = "Confusion";
var fadeouttime = 2;
var fadeintime = 2;
var masternode;
var currentSceneName = "Godot";
var currentScene;
var fader;

func startScene(Scene : Scenes):
	if (Scene == Scenes.Godot):
		var scene = ResourceLoader.load("res://Scenes/GodotScreen/GodotScreen.tscn");
		currentScene = scene.instantiate();
		currentScene.set_name("Godot");
	elif (Scene == Scenes.Triggerwarning):
		var scene = ResourceLoader.load("res://Scenes/TriggerWarning/TriggerWarning.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("TriggerWarning");
		currentSceneName = "TriggerWarning";
	elif (Scene == Scenes.Ubiscene):
		var scene = ResourceLoader.load("res://Scenes/Ubiscene/Ubiscene.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("Ubiscene");
		currentSceneName = "Ubiscene";
	elif (Scene == Scenes.StartScreen):
		var scene = ResourceLoader.load("res://Scenes/StartScreen/StartScreeeen.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("StartScreen");
		currentSceneName = "StartScreen";
	masternode.add_child(currentScene)
	return currentScene;


func fadeTo(sceneName : Scenes):
	var tween = create_tween();
	await tween.tween_property(fader,"modulate",Color(0,0,0,100),fadeouttime).finished
	currentScene.queue_free()
	var node = gamestate.startScene(sceneName);
	var tween2 = create_tween();
	await tween2.tween_property(fader,"modulate",Color(0,0,0,0),fadeintime).finished
