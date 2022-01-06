extends Panel

onready var color_button_scene = preload("res://src/color_selector/ColorButton.tscn")
var selected
var selected_i = 0


func _ready():
	visible = false
	var color_black = color_button_scene.instance()
	color_black.color = Color(0,0,0,1)
	$ScrollContainer/VBoxContainer.add_child(color_black)
	var color_white = color_button_scene.instance()
	color_white.color = Color(1,1,1,1)
	$ScrollContainer/VBoxContainer.add_child(color_white)


func _process(delta):
	if Input.is_action_just_pressed("Control"):
		Global.cursor.active = false
		visible = true
		var children_count = $ScrollContainer/VBoxContainer.get_child_count()
		if children_count == 1:
			selected = $ScrollContainer/VBoxContainer.get_child(0)
			selected.grab_focus()
			Tools.current_color = selected.color
			selected_i = 0
		else:
			selected = $ScrollContainer/VBoxContainer.get_child(selected_i)
			selected.grab_focus()
			Tools.current_color = selected.color
	if Input.is_action_just_pressed("down") and Input.is_action_pressed("Control"):
		if selected_i < $ScrollContainer/VBoxContainer.get_child_count()-1:
			selected_i += 1
			$ScrollContainer/VBoxContainer.get_child(selected_i).grab_focus()
			Tools.current_color = $ScrollContainer/VBoxContainer.get_child(selected_i).color
	if Input.is_action_just_pressed("up") and Input.is_action_pressed("Control"):
		if selected_i > 0:
			selected_i -= 1
			$ScrollContainer/VBoxContainer.get_child(selected_i).grab_focus()
			Tools.current_color = $ScrollContainer/VBoxContainer.get_child(selected_i).color		
	if Input.is_action_just_released("Control"):
		visible = false
		Global.cursor.active = true


func add_color(color):
	var button = color_button_scene.instance()
	button.color = color
	$ScrollContainer/VBoxContainer.add_child(button)
