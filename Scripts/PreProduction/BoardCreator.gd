@tool
class_name BoardCreator
extends Node

func Clear():
	print("Clear Pressed")

func Grow():
	print("Grow Pressed")

func Shrink():
	print("Shrink Pressed")

func GrowArea():
	print("GrowArea Pressed")

func ShrinkArea():
	print("ShrinkArea Pressed")

func Save():
	print("Save Pressed")

func Load():
	print("Load Pressed")

func SaveJSON():
	print("SaveJSON Pressed")

func LoadJSON():
	print("LoadJSON Pressed")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
