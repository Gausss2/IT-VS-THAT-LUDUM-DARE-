extends KinematicBody2D



# guarda valor de x e y
var motion = Vector2()

const UP = Vector2(0,-1)

const gravity = 15

const speed = 50

const max_speed = 200
const jump_height = -330
var random = randi()%3+1
func _physics_process(delta):
	
	print(random)
	motion.y += gravity
	var friction = false

	if random == 1:
	
		
		motion.x = min(motion.x+speed, max_speed)
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
		
	elif random == 2:
		
		motion.x = max(motion.x-speed, -max_speed)
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
			
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		friction = true
		
		$AnimatedSprite.play("default")
	move_and_slide(motion, UP)
