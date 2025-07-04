@tool
class_name BoardCreator
extends Node

@export var width: int = 10
@export var depth: int = 10
@export var height: int = 8
@export var pos: Vector2i
var _oldPos: Vector2i
var tiles = {}

var tileViewPrefab = preload("res://Prefabs/Tile.tscn")
var tileSelectionIndicatorPrefab = preload("res://Prefabs/TileIndicator.tscn")
var marker

func Clear():
	for key in tiles:
		tiles[key].free()
	tiles.clear()

func _GetOrCreate(p: Vector2i):
	if tiles.has(p):
		return tiles[p]
	
	var t: Tile = _Create()
	t.Load(p, 0)
	tiles[p] = t
	
	return t

func _Create():
	var instance = tileViewPrefab.instantiate()
	add_child(instance)
	return instance

func _GrowSingle(p: Vector2i):
	var t: Tile = _GetOrCreate(p)
	if t.height < height:
		t.Grow()
		_UpdateMarker()
func _ShrinkSingle(p: Vector2i):
	if not tiles.has(p):
		return
	
	var t: Tile = tiles[p]
	t.Shrink()
	_UpdateMarker()
	
	if t.height <= 0:
		tiles.erase(p)
		t.free()

func Grow():
	_GrowSingle(pos)
func Shrink():
	_ShrinkSingle(pos)

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




func _ready():
	marker = tileSelectionIndicatorPrefab.instantiate()
	add_child(marker)
	
	pos = Vector2i(0,0)
	_oldPos = pos

func _process(delta):
	if pos != _oldPos:
		_oldPos = pos
		_UpdateMarker()


func _UpdateMarker():
	if tiles.has(pos):
		var t: Tile = tiles[pos]
		marker.position = t.center()
	else:
		marker.position = Vector3(pos.x, 0, pos.y)
