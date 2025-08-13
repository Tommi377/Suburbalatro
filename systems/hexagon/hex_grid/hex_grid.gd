class_name HexGrid
extends Node2D

@onready var tilemap: TileMapLayer = %GroundLayer

var placed_map: Dictionary[Vector2i, HexCell] = {}

func try_place(hex: HexCell, global_pos: Vector2) -> bool:
	var coordinate := global_to_map(global_pos)
	if not try_get(coordinate) and is_ground(coordinate):
		add(hex, coordinate)
		return true
	return false

func remove(hex: HexCell) -> void:
	var key: Variant = placed_map.find_key(hex)
	if key is Vector2i:
		hex.coordinate = Vector2i.MIN
		placed_map.erase(key)
	
func add(hex: HexCell, coordinate: Vector2i) -> void:
	hex.coordinate = coordinate
	placed_map[coordinate] = hex
	hex.global_position = tilemap.to_global(tilemap.map_to_local(coordinate))

func is_ground(coordinate: Vector2i) -> bool:
	return tilemap.get_cell_tile_data(coordinate) != null or placed_map.has(coordinate)

func try_get(coordinate: Vector2i) -> HexCell:
	if not placed_map.has(coordinate):
		return null
	return placed_map[coordinate]

func global_to_map(global_pos: Vector2) -> Vector2i:
	return tilemap.local_to_map(tilemap.to_local(global_pos))

func get_hovered_tile() -> Vector2i:
	return tilemap.local_to_map(tilemap.get_local_mouse_position())
