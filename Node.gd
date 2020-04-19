extends Node

var topone = ""
var temp_m = 9999999
var temp_s = 9999999
var temp_ms = 9999999


func _process(delta):
	var ms  = get_parent().ms
	var s  = get_parent().s
	var m  = get_parent().m
	
	if ms < temp_m:
		temp_m = m
		if s < temp_s:
			temp_s = s
			if s < temp_ms:
				temp_ms = ms
				
	var best_time = str(temp_m)+":"+str(temp_s)+"."+str(temp_ms)
