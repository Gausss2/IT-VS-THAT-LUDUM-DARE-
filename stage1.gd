extends Node

var timeout = false	

func countdown():

	print(3)
	yield(get_tree().create_timer(1.0), "timeout")
	print(2)
	yield(get_tree().create_timer(1.0), "timeout")
	print(1)
	yield(get_tree().create_timer(1.0), "timeout")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$that/AnimatedSprite.play("off")

	$count.play()
	$countdown.play("3")
	
	yield(get_tree().create_timer(1.0), "timeout")
	$count.play()
	$countdown.play("2")
	yield(get_tree().create_timer(1.0), "timeout")
	$count.play()
	$countdown.play("1")
	yield(get_tree().create_timer(1.0), "timeout")
	$countdown.play("default")
	timeout = true
	$that/AnimatedSprite.play("on")
	
	 # Replace with function body.



