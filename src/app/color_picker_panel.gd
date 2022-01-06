extends Panel


func _process(delta):
	if Input.is_action_just_pressed("toggle_color_picker"):
		visible = not visible

func _on_ColorPicker_color_changed(color):
	Tools.current_color = color


func _on_ColorPicker_preset_added(color):
	Global.color_selector.add_color(color)

func _on_ColorPicker_preset_removed(color):
	pass # Replace with function body.
