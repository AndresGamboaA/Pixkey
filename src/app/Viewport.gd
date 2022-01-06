extends Viewport

var canvas_size := Vector2.ZERO

func _ready():
	get_tree().get_root().connect("size_changed", self, "center_canvas_viewport_texture")


func initialize(size):
	canvas_size = size
	$TiledBackground.initialize(size)
	center_canvas_viewport_texture()


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print(get_viewport().get_mouse_position())
	if Input.is_action_just_pressed("zoom_in"):
		$Camera2D.zoom -= Vector2(0.05, 0.05)
		$Camera2D.position = Global.cursor.position
		print($Camera2D.zoom)
	elif Input.is_action_just_pressed("zoom_out"):
		$Camera2D.zoom += Vector2(0.05, 0.05)
		$Camera2D.position = Global.cursor.position


func center_canvas_viewport_texture():
	$Camera2D.position = (size/2.0)
	$Node/CanvasViewportTexture.position = (size /2.0)
	$Node/CanvasViewportTexture.position -= canvas_size
	$TiledBackground.position = $Node/CanvasViewportTexture.position
	$Grid.position = $Node/CanvasViewportTexture.position
	$Selector.position = $Node/CanvasViewportTexture.position
	$Selector.current_pixel_pos = Vector2(floor(canvas_size.x/2), floor(canvas_size.y/2))
	$Selector.position += $Selector.current_pixel_pos * 2
