extends Node


var cursor
var canvas
var tiles
var canvas_viewport
var canvas_viewport_texture
var viewport
var canvas_camera = null
var pos_label
var quick_steps_label
var size_label
var color_selector
var grid
var color_picker_panel
var load_pallete_file_dialog
var save_file_dialog
var open_file_dialog
var about_panel
var reference
var new_file_panel
var current_file = null

func update_pos_label(pos):
	pos_label.text = "x: " + str(pos.x) + " y: " + str(pos.y)

func save_img():
	if current_file:
		canvas_viewport_texture.texture.get_data().save_png(current_file)
