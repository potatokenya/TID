extends CharacterBody2D
@onready var tca_ani = $AnimationPlayer
@onready var timer = $Timer
	
	


func _on_timer_timeout():
	tca_ani.stop()
	tcs.show()
	tc.hide()


func _on_ja_btn_pressed():
	timer.start()
	timer.autostart = false
	timer.one_shot = true
	tca_ani.play("tca")

@onready var tc = $"T-celle_s"
@onready var tcs = $"t-celle_sick"


