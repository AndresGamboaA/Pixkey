extends Node2D

var size = Vector2.ZERO

func _draw():
	for r in range(size.y+1):
		draw_line(Vector2(0, r), Vector2(size.x, r), Color(0,0,1,1))
	for c in range(size.x+1):
		draw_line(Vector2(c, 0), Vector2(c, size.y), Color(0,0,1,1))
