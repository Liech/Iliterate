extends TextureRect

func _ready():
	add_to_group("Copyable");
	
func cloneObject():
	var result = self.duplicate();
	result.size  = self.size
	result.theme = self.theme
	return result
