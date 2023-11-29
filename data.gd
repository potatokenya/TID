extends Node2D

@onready var save_path = "user://variable.save"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_save_btn_pressed():
	save()

func _on_load_btn_pressed():
	load_data()

func save():
	var file = FileAccess.open(save_path,FileAccess.WRITE)
	file.store_var(variable1)
	file.store_var(variable2)
	file.store_var(variable3)

func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path,FileAccess.READ)
		variable1 = file.get_var(variable1)
		variable2 = file.get_var(variable2)
		variable3 = file.get_var(variable3)
	
	else:
		print("no data has been saved")
		variable1 = 0
		variable2 = 0
		variable3 = 0
