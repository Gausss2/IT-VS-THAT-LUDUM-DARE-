extends KinematicBody2D

# guarda valor de x e y
var motion = Vector2()

const UP = Vector2(0,-1)

const gravity = 18

const speed = 200

const max_speed = 300
const jump_height = -340

func _physics_process(delta):

	motion.y += gravity
	var friction = false

	if Input.is_action_pressed("ui_right"):
	
		
		motion.x = min(motion.x+speed, max_speed)
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		
		motion.x = max(motion.x-speed, -max_speed)
		$AnimatedSprite.play("walk")
		$AnimatedSprite.flip_h = true
			
	else:
		motion.x = lerp(motion.x, 0, 0.2)
		friction = true
		
		$AnimatedSprite.play("default")


	if is_on_floor():
		print('on the floor')
		if Input.is_action_pressed('ui_up') :
			
			motion.y = jump_height
			$"jump-sound".play()
			print('animation')
			
		
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)		
	else:
		
		if friction == true:
					
			motion.x = lerp(motion.x, 0, 0.05)		
		print('in the air')
		if motion.y < 0:
			$AnimatedSprite.play("jump")
		else:
			$AnimatedSprite.play('fall')
		
	print(motion)		
	motion = move_and_slide(motion, UP)
	pass
