extends Cloneable

var targetrot;
var time = 0
var targetrotthreshold = 0.1;

func _ready():
	super()
	targetrot = randf() - 0.5

func pawMovement(delta):
	if (abs(targetrot-rotation) < targetrotthreshold):
		targetrot = randf() - 0.5
		
	if (rotation - targetrot < 0):
		rotation += delta * 5
	else:
		rotation -= delta * 5
	time += delta
	position.y += cos(time*17)*5
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalOptions.localization == GlobalOptions.Localization.CatSignLanguage and gamestate.catExplain:
		visible = true;
		pawMovement(delta)
	else:
		visible = false;
