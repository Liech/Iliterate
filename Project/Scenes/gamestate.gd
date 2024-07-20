extends Node

enum Scenes {Godot, Triggerwarning, Ubiscene, Credits, StartScreen, MainMenu, LooseScreen}

 
var twChoice = "Confusion";
var fadeouttime = 2;
var fadeintime = 2;
var masternode;
var currentSceneName = "Godot";
var currentScene;
var fader;
var nextScene = Scenes.MainMenu;

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
		var scene = ResourceLoader.load("res://Scenes/StartScreen/StartScreen.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("StartScreen");
		currentSceneName = "StartScreen";
	elif (Scene == Scenes.Credits):
		var scene = ResourceLoader.load("res://Scenes/Credits/Credits.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("Credits");
		currentSceneName = "Credits";
	elif (Scene == Scenes.MainMenu):
		var scene = ResourceLoader.load("res://Scenes/MainMenu/MainMenu.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("MainMenu");
		currentSceneName = "MainMenu";
	elif (Scene == Scenes.LooseScreen):
		var scene = ResourceLoader.load("res://Scenes/LooseScreen/LooseScreen.tscn")
		currentScene = scene.instantiate();
		currentScene.set_name("LooseScreen");
		currentSceneName = "LooseScreen";
	masternode.add_child(currentScene)
	return currentScene;


func fadeTo(sceneName : Scenes):
	var tween = create_tween();
	await tween.tween_property(fader,"modulate",Color(0,0,0,100),fadeouttime).finished
	currentScene.queue_free()
	var node = gamestate.startScene(sceneName);
	var tween2 = create_tween();
	await tween2.tween_property(fader,"modulate",Color(0,0,0,0),fadeintime).finished
