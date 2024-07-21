extends Cloneable

var targetrot;
var targetrotthreshold = 0.1;

func _ready():
	super()
	targetrot = 0
	
func pawMovement(delta):
	if (abs(targetrot-rotation) < targetrotthreshold):
		targetrot = randf() - 0.5
		
	if (rotation - targetrot < 0):
		rotation += delta * 5
	else:
		rotation -= delta * 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalOptions.localization == GlobalOptions.Localization.CatSignLanguage:
		visible = true;
		if (gamestate.catExplain):
			pawMovement(delta)
		else:
			targetrot= 0
			var diff = abs(targetrot-rotation);
			if (diff < targetrotthreshold*3):
				rotation = 0
			else:
				if (rotation - targetrot < 0):
					rotation += delta * 5
				else:
					rotation -= delta * 5
	else:
		visible = false;
		targetrot = 0
		
		
		
