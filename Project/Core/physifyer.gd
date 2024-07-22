extends Node

func physiphy(target, toss):
	if (target.get_parent() != gamestate.currentScene):
		return; # no work needed
	var col = RigidBody2D.new();
	var shp = CollisionShape2D.new()
	var rect = RectangleShape2D.new()
	rect.size = target.size
	col.add_child(shp)
	
	if (target.breaks):
		col.set_script(load("res://Core/Breaker.gd"));
		col.selfconnect();
	
	shp.shape = rect
	shp.position = target.size/2.0
	col.position = target.position
	col.rotation = target.rotation
	col.contact_monitor = true
	col.max_contacts_reported = 1
	gamestate.currentScene.add_child(col)
	target.get_parent().remove_child(target)
	col.add_child(target)
	target.position = Vector2(0,0)
	target.rotation = 0
	if (toss):
		col.angular_velocity = (randf() -0.5) * 9
		col.linear_velocity = Vector2((randf() -0.5) * 8,(randf() -0.5) * 8)
	else:
		col.freeze =true
		col.collision_layer = 2
	
	
