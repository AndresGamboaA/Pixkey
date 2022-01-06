extends FileDialog


func _ready():
	add_filter("*.png ; PNG Images")


func _on_SaveFileDialog_confirmed():
	Global.current_file = current_path
	Global.save_img()
