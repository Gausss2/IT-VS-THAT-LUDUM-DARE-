extends Area2D

export(String, FILE, "*.tscn") var MenuWorld

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	print(bodies)
	for body in bodies:
		if body.name == "player":
			
			var ms = get_parent().get_parent().get_node("timer")
			get_tree().change_scene(MenuWorld)
