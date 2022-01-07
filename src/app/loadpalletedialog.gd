extends FileDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func load_pallete():
	print("loading " + current_path)
	var pallete = Image.new()
	pallete.load(current_path)
	pallete.lock()
	for i in range(pallete.get_width()):
		Global.color_selector.add_color(pallete.get_pixel(i,0))
	pallete.unlock()


func _on_LoadPalleteDialog_confirmed():
	load_pallete()


func _on_LoadPalleteDialog_file_selected(path):
	load_pallete()
