extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 200
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	var velocity = Vector2()
	$player.play()
	
	
	if Input.is_action_pressed("ui_right"):
		velocity.x+=1
		$player.animation = "right"
	
	elif Input.is_action_pressed("ui_left"):
		velocity.x-=1
		$player.animation = "left"
		
	elif Input.is_action_pressed("ui_up"):
		velocity.y-=1
		$player.animation = "jump"
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
	
	position += velocity * delta
	
	position.x = clamp(position.x, 0, screen_size.x)
	
	position.y = clamp(position.y, 0, screen_size.y)
			
