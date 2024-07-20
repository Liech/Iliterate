extends Node

enum Scenes {Godot, Triggerwarning, StartScreen}

 
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
		masternode.add_child(currentScene)
		currentSceneName = "Godot";
		return currentScene;
	elif (Scene == Scenes.Triggerwarning):
		var scene = ResourceLoader.load("res://Scenes/TriggerWarning/TriggerWarning.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("TriggerWarning");
		masternode.add_child(currentScene)
		currentSceneName = "TriggerWarning";
		return currentScene;
	elif (Scene == Scenes.StartScreen):
		var scene = ResourceLoader.load("res://Scenes/StartScreen/StartScreeeen.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("StartScreen");
		masternode.add_child(currentScene)
		currentSceneName = "StartScreen";
		return currentScene;


func fadeTo(sceneName : Scenes):
	var tween = create_tween();
	await tween.tween_property(fader,"modulate",Color(0,0,0,100),fadeouttime).finished
	currentScene.queue_free()
	#currentScene.visible = false;
	#currentScene.process_mode = Node.PROCESS_MODE_DISABLED;
	var node = gamestate.startScene(sceneName);
	var tween2 = create_tween();
	await tween2.tween_property(fader,"modulate",Color(0,0,0,0),fadeintime).finished
