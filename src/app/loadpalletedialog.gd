extends FileDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_LoadPalleteDialog_confirmed():
	print("loading " + current_path)
	var pallete = Image.new()
	pallete.load(current_file)
	pallete.lock()
	for i in range(pallete.get_width()):
		Global.color_selector.add_color(pallete.get_pixel(i,0))
	pallete.unlock()
