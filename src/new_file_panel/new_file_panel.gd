extends Panel

func _ready():
	pass # Replace with function body.


func _on_OKButton_pressed():
	Global.canvas.layers.get_child(0).queue_free()
	var size = Vector2($VBoxContainer/HBoxContainer/widthSpinBox.value, $VBoxContainer/HBoxContainer2/heightSpinBox2.value)
	Global.grid.size = size
	var layer = Global.canvas.initialize(size)
	var node = Global.canvas_viewport_texture.get_parent()
	node.remove_child(Global.canvas_viewport_texture)
	Global.canvas_viewport_texture.queue_free()
	var new = Sprite.new()
	new.name = "CanvasViewportTexture"
	new.centered = false
	new.texture = Global.canvas_viewport.get_texture()
	new.scale = Vector2(2,2)
	Global.canvas_viewport_texture = new
	node.add_child(new)
	Global.tiles.size = size
	print(Global.tiles)
	Global.tiles.initialize(size)
	Global.canvas_viewport.size = size
	Global.viewport.initialize(size)
	Tools.current_layer = layer
	Global.new_file_panel.visible = false
	Global.cursor.canvas_size = size
	Global.size_label.text = str(size.x) + "x" + str(size.y)


func _on_CancelButton_pressed():
	visible = false
