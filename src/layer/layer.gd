extends Node2D

var pixels := []
var size := Vector2(0,0) setget set_size


func _draw():
	print("painting")
	for c in range(size.x):
		for r in range(size.y):
			var pos = Vector2(c, r)
			var color = pixels[r][c]
			if color != null:
				draw_rect(Rect2(pos, Vector2(1,1)), color, true, 1, false)


func set_size(value: Vector2):
	size = value
	pixels = create_grid(size.y, size.x)
	for c in range(size.x):
		for r in range(size.y):
			pixels[r][c] = null


func get_size():
	return size


func create_grid(r, c):
	var arr = []
	for x in range(r):
		arr.append([])
		arr[x]=[]
		for y in range(c):
			arr[x].append([])
			arr[x][y] = null
	return arr
