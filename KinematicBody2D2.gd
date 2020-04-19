extends KinematicBody2D

const speed = 800
const flor = Vector2(0,-1)
var velocity = Vector2()
var jump_h = 300
var direction = 1



func _ready():
	pass


	
func _physics_process(delta):
	var random = randi()%11+1
	var timeout_local  = get_parent().timeout	
	if timeout_local == true:
			
		velocity.x = speed * direction
		velocity.y +=direction*random
		
	
		
		if velocity.x > 0:
			$AnimatedSprite.flip_h = true
		else:
			$AnimatedSprite.flip_h = false
		velocity = move_and_slide(velocity)
		
		if is_on_wall():
			direction = direction*-1
			
		if is_on_floor():
			pass
		print("velocity", velocity)
