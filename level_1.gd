extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer1.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


@onready var teori = $teori
@onready var th = 1

func _on__pressed():
	if th == 1:
		teori.hide()
		th = 0
		print(th)
	
	elif th == 0:
		teori.show()
		th = 1
		print(th)
		

@onready var Q1 = $Q1
@onready var bakterie_nej = $Bakterie2

@onready var labelq1 = $Q1/Q1
@onready var ja_btn = $Q1/ja_btn
@onready var nej_btn = $Q1/nej_btn
@onready var q1_nej = $Q1/Q1_nej
@onready var q1_igen_btn = $Q1/Q1_igen

func _on_button_2_pressed():
	labelq1.hide()
	ja_btn.hide()
	nej_btn.hide()
	q1_nej.show()
	q1_igen_btn.show()
	bakterie_nej.show()


func _on_q_1_igen_pressed():
	labelq1.show()
	ja_btn.show()
	nej_btn.show()
	q1_nej.hide()
	q1_igen_btn.hide()

@onready var BT = $BakterieTaleboble
@onready var q1q2t = $Q1Q2

func _on_ja_btn_pressed():
	Q1.hide()
	BT.show()
	q1q2t.start()
	q1q2t.autostart = false
	q1q2t.one_shot = true
	

func _on_timer_1_timeout():
	Q1.show()
	

@onready var ba1 = $Bakterie/AnimationPlayer
@onready var ba2 = $Bakterie2/AnimationPlayer

func _on_q_1q_2_timeout():
	q1q2t.stop()
	ba1.play("ba1")
	ba2.play("ba2")
