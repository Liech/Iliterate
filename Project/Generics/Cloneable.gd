extends TextureRect
class_name Cloneable

@export var breaks = false
@export var physify = false
@export var dormant = false

var isClone = false

func _ready():
	if (not isClone):	
		if(not dormant):
			add_to_group("Copyable");
		if (physify):
			await get_tree().create_timer(0.01).timeout # wait for daddy
			Phys.physiphy(self,false);

	
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
