extends Node2D


var size = Vector2.ZERO

func initialize(value):
	print("initializing tile")
	size = value
	update()

func _draw():
	print("updating tiel " + str(size))
	var c_count = 0
	var r_count = 0
	var color1 = Color(0.752941,0.752941,0.752941,1)
	var color2 = Color(0.501961,0.501961,0.501961,1)
	var color = color1
	var flag = false
	for c in range(size.x):
		for r in range(size.y):
			var pos = Vector2(c, r)
			if (c%2 == 0 and r%2 == 0) or (c%2 != 0 and r%2 != 0):
				color = color1
			else:
				color = color2
			draw_rect(Rect2(pos, Vector2(1,1)), color, true, 1, false)
#	for c in range(size.x):
#		if ((c) % 1) == 0:
#			flag = not flag
#		for r in range(size.y):
#			var pos = Vector2(c, r)
#			if ((r) % 1) == 0:
#				flag = not flag
#			color = color1 if flag else color2
#			draw_rect(Rect2(pos, Vector2(1,1)), color, true, 1, false)
