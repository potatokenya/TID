extends Node2D

var db
var db_name = "res://database/immuneDefenceDB"
var bruger_id = 1
var spg_id

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
	spg_id = 1
	updateDataInDB(1)


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
	spg_id = 1
	updateDataInDB(2)
	

func _on_timer_1_timeout():
	Q1.show()
	

@onready var ba1 = $Bakterie/AnimationPlayer
@onready var ba2 = $Bakterie2/AnimationPlayer

func _on_q_1q_2_timeout():
	q1q2t.stop()
	ba1.play("ba1")
	ba2.play("ba2")
	
	

#onready var show_data = $ShowData
#onready var test



func insertDataToDB():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	var table_name = "testTable"
	var dict : Dictionary = Dictionary()
	dict["Name"] = $PlayerName.get_text()
	dict["Score"] = $Score.get_text()
	db.insert_row(table_name, dict)
	db.close_db()
	getDataFromDB()
	

func getDataFromDB():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	var table_name = "testTable"
	var dataAll = ""
	
	db.query("select b.ID as b_ID, b.navn, b.password, s.ID as s_ID, s.spgtekst, bss.status from bruger b inner join bruger_spg_status bss on b.ID = bss.bruger_ID inner join spørgsmål s on bss.spg_ID = s.ID;")
	for i in range(0, db.query_result.size()):
		#print(db.query_result.size())
		#dataAll += "Name: " + str(db.query_result[i]["Name"]) + "\t  Score: " + str(db.query_result[i]["Score"]) + "\n"
		print("query results ", db.query_result[i]["spgtekst"])
		print("query results ", db.query_result[i]["status"])
	$ShowData.set_text(dataAll)
	
	db.close_db()
	
func getDataByIDFromDB():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	var table_name = "testTable"
	var dataAll = ""
	
	db.query("select * from " + table_name + " where id = '" + $IDPlayer.get_text() + "';")
	for i in range(0, db.query_result.size()):
		dataAll += "Name: " + str(db.query_result[i]["Name"]) + "\t  Score: " + str(db.query_result[i]["Score"]) + "\n"
		#print("query results ", db.query_result[i]["Name"], db.query_result[i]["Score"])
	$ShowData.set_text(dataAll)
	
	db.close_db()

func updateDataInDB(status):
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	var table_name = "bruger_spg_status"
	#update bruger_spg_status set status = 0 where bruger_ID = 1 and spg_ID = 2;
	
	db.update_rows(table_name, "bruger_id = '" + str(bruger_id) + "' and spg_ID = '" + str(spg_id) + "'", {"status":status})
	db.close_db()
	getDataFromDB()
	

func deleteDataInDB():
	db = SQLite.new()
	db.path = db_name
	db.open_db()
	var table_name = "testTable"
	
	db.delete_rows(table_name, "id = '" + str($IDPlayer.get_text()) + "'")

	db.close_db()
	getDataFromDB()

	

