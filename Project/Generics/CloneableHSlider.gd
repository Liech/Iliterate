extends HSlider
class_name CloneableHSlider

@export var breaks = false
@export var dormant = false
var isClone = false

func _ready():
	createClickSound()
	if (not isClone):
		add_to_group("Copyable");
		await get_tree().create_timer(0.01).timeout # wait for daddy
		#Phys.physiphy(self,false);
	
func cloneObject(panel, move,ppos):
	var result = self.duplicate();
	result.size  = self.size
	result.theme = self.theme
	result.isClone = true
	panel.add_child(result);
	
	
	if (self.get_parent() is RigidBody2D):
		var col : RigidBody2D = self.get_parent();
		var colpos = col.position
		var colrot = col.rotation
		result.position = colpos
		result.rotation = col.rotation

	
	if (move):
		result.position = result.position - panel.position
	return result

var grounded = false;
func touchedGround():
	grounded = true;

func createClickSound():
	var c1 = AudioStreamPlayer2D.new()
	c1.bus = "Effect"
	c1.stream = load("res://Sound/10 Clicks and Switches/click.3.ogg")
	c1.name = "Click"
	add_child(c1)
	
	pass
