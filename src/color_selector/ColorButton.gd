extends TextureButton

var color = Color(1,1,1,1) setget set_color


func set_color(value: Color):
	color = value
	$TextureRect2.modulate = value


func _on_ColorButton_focus_entered():
	$TextureRect.visible = true


func _on_ColorButton_focus_exited():
	$TextureRect.visible = false
