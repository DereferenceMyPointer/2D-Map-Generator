extends Node2D
class_name Grid

## Interfaces with the world grid
# Handles tiles with differing integer scale automatically

@export var size: int = 1
@export var empty: Tile

var grid: Dictionary = {}

func get_tile(x: int, y: int) -> Tile:
	return grid[Vector2i(x, y)]

func add_tile(other: Tile, x: int, y: int) -> bool:
	var pos = Vector2i(x, y)
	if grid.has(pos):
		return false
	for i in other.scale:
		for j in other.scale:
			grid[pos + Vector2i(i, j)] = other
	return true

func display():
	for pos: Vector2i in grid:
		var tile: Tile = grid[pos]
		if tile.scale > 1:
			if grid[pos - Vector2i.LEFT] == tile or grid[pos - Vector2i.UP] == tile:
				pass
		else:
			var instance = tile.scene.instantiate() as Node2D
			add_child(instance)
			instance.position = Vector2i(pos.x, pos.y) * size

func world_to_grid(pos: Vector2) -> Vector2i:
	return Vector2i(floori(pos.x / size), floori(pos.y / size))
