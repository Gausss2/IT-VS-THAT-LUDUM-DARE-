extends RichTextLabel

var ms = 0
var m = 0
var s = 0

var temp_m = 9999999
var temp_s = 9999999
var temp_ms = 9999999

func _process(delta):
	var timeout_local  = get_parent().timeout	

	if timeout_local == true:			
		if ms > 9:
			s+=1
			ms = 0
		
		if s > 59:
			m+=1
			s = 0

		set_text(str(m) + ":" +str(s) + "."+ str(ms))

		pass



func _on_Timer_timeout():
	var timeout_local  = get_parent().timeout	
	if timeout_local == true:		
		ms+=1
	
