extends Node2D

var size := Vector2.ZERO
onready var layers = $Layers

onready var layer_scene = preload("res://src/layer/layer.tscn")


func initialize(_size):
	print("inizialising canvas with size " + str(_size))
	size = _size
	var layer = layer_scene.instance()
	layer.size = size
	$Layers.add_child(layer)
	layer.update()
	return layer
