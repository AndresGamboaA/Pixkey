extends Node2D

var current_layer
var current_pixel_pos = Vector2.ZERO
var canvas_size = Vector2.ZERO
var fast_steps = 2
var active = true
var color = Color(1,1,1,1) setget set_color


func _process(delta):
	if not active:
		return
	if Input.is_action_just_pressed("two"):
		fast_steps = 2
		Global.tiles.update()
		Global.quick_steps_label.text = "2"
	if Input.is_action_just_pressed("three"):
		fast_steps = 3
		Global.quick_steps_label.text = "3"
	if Input.is_action_just_pressed("four"):
		fast_steps = 4
		Global.quick_steps_label.text = "4"
	if Input.is_action_just_pressed("five"):
		fast_steps = 5
		Global.quick_steps_label.text = "5"
	if Input.is_action_just_pressed("six"):
		fast_steps = 6
		Global.quick_steps_label.text = "6"
	if Input.is_action_just_pressed("seven"):
		fast_steps = 7
		Global.quick_steps_label.text = "7"
	if Input.is_action_just_pressed("eight"):
		fast_steps = 8
		Global.quick_steps_label.text = "8"
	if Input.is_action_just_pressed("nine"):
		fast_steps = 9
		Global.quick_steps_label.text = "9"
	if Input.is_action_just_pressed("right"):
		move_right()
		$WaitToMoveTimer.start()
	if Input.is_action_just_pressed("left"):
		move_left()
		$WaitToMoveTimer.start()
	if Input.is_action_just_pressed("down"):
		move_down()
		$WaitToMoveTimer.start()
	if Input.is_action_just_pressed("up"):
		move_up()
		$WaitToMoveTimer.start()
	
	if Input.is_action_just_pressed("paint_pixel"):
		Tools.paint_pixel(current_pixel_pos)
	
	if (Input.is_action_just_pressed("right") or Input.is_action_just_pressed("left") or Input.is_action_just_pressed("up") or Input.is_action_just_pressed("down")) and Input.is_action_pressed("paint_pixel"):
		Tools.paint_pixel(current_pixel_pos)
	
	if Input.is_action_just_pressed("bucket"):
		Tools.flood_fill(current_pixel_pos)
	
	if Input.is_action_just_pressed("copy"):
		Tools.select_color_at(current_pixel_pos)
	
	if Input.is_action_just_pressed("toggle_grid"):
		Global.grid.visible = not Global.grid.visible


func set_color(value: Color):
	color = value
	$Sprite.modulate = value


func move_right():
	var steps = fast_steps if Input.is_action_pressed("shift") else 1
	if current_pixel_pos.x < canvas_size.x - steps:
		current_pixel_pos.x += steps
		position.x += 2 * steps

		var limit = get_viewport_rect().size
		if get_global_transform_with_canvas().get_origin().x > (limit.x - 50):
			Global.canvas_camera.position.x += 2 * steps
		Global.update_pos_label(current_pixel_pos)


func move_left():
	var steps = fast_steps if Input.is_action_pressed("shift") else 1
	if current_pixel_pos.x >= steps:
		current_pixel_pos.x -= steps
		position.x -= 2 * steps
	
		if get_global_transform_with_canvas().get_origin().x < 50:
			Global.canvas_camera.position.x -= 2 * steps
		Global.update_pos_label(current_pixel_pos)


func move_up():
	var steps = fast_steps if Input.is_action_pressed("shift") else 1
	if current_pixel_pos.y >= steps:
		current_pixel_pos.y -= steps
		position.y -= 2 * steps
	
	if get_global_transform_with_canvas().get_origin().y < 50:
		Global.canvas_camera.position.y -= 2 * steps
	Global.update_pos_label(current_pixel_pos)


func move_down():
	var steps = fast_steps if Input.is_action_pressed("shift") else 1
	if current_pixel_pos.y < canvas_size.y - steps:
		current_pixel_pos.y += steps
		position.y += 2 * steps
		
		var limit = get_viewport_rect().size
		if get_global_transform_with_canvas().get_origin().y > (limit.y - 50):
			Global.canvas_camera.position.y += 2 * steps
		Global.update_pos_label(current_pixel_pos)


func _on_WaitToMoveTimer_timeout():
	if Input.is_action_pressed("right") or Input.is_action_pressed("left") or Input.is_action_pressed("down") or Input.is_action_pressed("up"):
		$MoveEveryXTimer.start()


func _on_MoveEveryXTimer_timeout():
	if Input.is_action_pressed("right"):
		move_right()
	if Input.is_action_pressed("left"):
		move_left()
	if Input.is_action_pressed("down"):
		move_down()
	if Input.is_action_pressed("up"):
		move_up()
		
	if Input.is_action_pressed("right") or Input.is_action_pressed("left") or Input.is_action_pressed("down") or Input.is_action_pressed("up"):
		if Input.is_action_pressed("paint_pixel"):
			Tools.paint_pixel(current_pixel_pos)
		$MoveEveryXTimer.start()
