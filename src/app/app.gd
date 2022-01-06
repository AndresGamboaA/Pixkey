extends Node

export var canvas_width := 32
export var canvas_height := 32


func _ready():
#	var img = Image.new()
#	img.load("spritesheet.png")
#	canvas_width = img.get_width()
#	canvas_height = img.get_height()
	var canvas = $CanvasViewport/Canvas
	Global.viewport = $Control/VBoxContainer/ViewportContainer/Viewport
	Global.canvas = canvas
	canvas.initialize(Vector2(canvas_width, canvas_height))
	$Control/VBoxContainer/ViewportContainer/Viewport.initialize(canvas.size)
	Global.tiles = $Control/VBoxContainer/ViewportContainer/Viewport/TiledBackground
	Global.tiles.initialize(canvas.size)
	$CanvasViewport.size = canvas.size
	Global.canvas_viewport = $CanvasViewport
	Global.canvas_viewport_texture = $Control/VBoxContainer/ViewportContainer/Viewport/Node/CanvasViewportTexture
	$Control/VBoxContainer/ViewportContainer/Viewport/Selector.canvas_size = canvas.size
	Global.cursor = $Control/VBoxContainer/ViewportContainer/Viewport/Selector
	Global.canvas_camera = $Control/VBoxContainer/ViewportContainer/Viewport/Camera2D
	Global.pos_label = $Control/VBoxContainer/HBoxContainer/PosLabel
	Global.quick_steps_label = $Control/VBoxContainer/HBoxContainer/QuickStepsLabel
	Global.size_label = $Control/VBoxContainer/HBoxContainer/SizeLabel
	Global.size_label.text = str(canvas_width) + "x" + str(canvas_height)
	Tools.current_layer = canvas.get_node("Layers").get_child(0)
	Global.grid = $Control/VBoxContainer/ViewportContainer/Viewport/Grid
	Global.grid.size = canvas.size
	Global.color_picker_panel = $Control/ColorPickerPanel
	Global.color_selector = $Control/ColorSelector
	Tools.current_color = Color(0,0,0,1)
	Global.load_pallete_file_dialog = $Control/Dialogs/LoadPalleteDialog
	Global.new_file_panel = $Control/Dialogs/NewFilePanel
	Global.open_file_dialog = $Control/Dialogs/OpenFileDialog
	Global.save_file_dialog = $Control/Dialogs/SaveFileDialog
	Global.about_panel = $Control/Dialogs/AboutPanel
	Global.reference = $Control/Dialogs/ReferencePanel
#	var pallete = Image.new()
#	pallete.load("pallete.png")
#	pallete.lock()
#	for i in range(pallete.get_width()):
#		$Control/ColorSelector.add_color(pallete.get_pixel(i,0))
#	pallete.unlock()
	$Control/Dialogs/LoadPalleteDialog.add_filter("*.png ; PNG Images")
#	img.lock()
#	for c in range(canvas_width):
#		for r in range(canvas_height):
#			Tools.current_layer.pixels[r][c] = img.get_pixel(c, r)
#	img.unlock()

func _process(delta):
	if Input.is_action_just_pressed("save"):
		if Global.current_file == null:
			Global.save_file_dialog.visible = true
		else:
			Global.save_img()


func _on_ColorPickerButton_color_changed(color):
	Tools.current_color = color
