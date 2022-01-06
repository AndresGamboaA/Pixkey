extends Node


var current_layer
var current_color = Color(0,0,0,1) setget set_color


func set_color(value):
	current_color = value
	Global.cursor.color = value


func paint_pixel(pos: Vector2):
	print("Tools.current_color: "+ str(current_color))
	current_layer.pixels[pos.y][pos.x] = current_color
	current_layer.update()


func flood_fill(pos):
	var queue = []
	queue.append(pos)
	# first color is the color that has to change to the target color (current_color selected)
	var first_color = current_layer.pixels[pos.y][pos.x]
	# Paint this pixel:
	current_layer.pixels[pos.y][pos.x] = current_color
	
	while queue.size() > 0:
		var current_pixel = queue[queue.size() - 1]
		queue.remove(queue.size() - 1)
		
		var up    = current_pixel + Vector2.UP
		var right = current_pixel + Vector2.RIGHT
		var down  = current_pixel + Vector2.DOWN
		var left  = current_pixel + Vector2.LEFT
		
		if is_valid(up, first_color):
			current_layer.pixels[up.y][up.x] = current_color
			queue.append(up)
		if is_valid(right, first_color):
			current_layer.pixels[right.y][right.x] = current_color
			queue.append(right)
		if is_valid(down, first_color):
			current_layer.pixels[down.y][down.x] = current_color
			queue.append(down)
		if is_valid(left, first_color):
			current_layer.pixels[left.y][left.x] = current_color
			queue.append(left)
	
	current_layer.update()


func is_valid(pos, first_color):
	return pos.x >= 0 and pos.x < current_layer.size.x and pos.y >= 0 and pos.y < current_layer.size.y \
		and current_layer.pixels[pos.y][pos.x] != current_color and current_layer.pixels[pos.y][pos.x] == first_color


func select_color_at(pos: Vector2):
	set_color(current_layer.pixels[pos.y][pos.x])
