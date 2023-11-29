extends CharacterBody2D

@onready var dc_ani = $Area2D/AnimationPlayer
@onready var timer = $Timer

func _on_ja_btn_pressed():
	timer.start()
	timer.autostart = false
	timer.one_shot = true
	dc_ani.play("ht")
	


func _on_timer_timeout():
	dc_ani.stop()
