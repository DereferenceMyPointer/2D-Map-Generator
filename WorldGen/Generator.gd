extends Node2D
class_name Generator

@export var noise: FastNoiseLite

@export var grid: Grid

# Generate main branch of region w/ full progression tree
func generate_progression(source: Region, start: Vector2):
	
	# Three passes: progression, optional progression, fill-ins
	var used: Array[Tile] = []
	var size: int = randi_range(source.size_range.x, source.size_range.y)
	
	# Place each progression room somewhere on the map in descending y
	var progression_length = source.progression_rooms.size()
	for i in source.progression_rooms.size():
		# Place within appropriate x, y range
		var y_min: int = source.progression_direction * (i * size / progression_length + source.progression_margin)
		var y_max: int = source.progression_direction * ((i + 1) * size / progression_length - source.progression_margin)
		var x = start.x + randi_range(-source.progression_width, source.progression_width)
		var y = start.y + randi_range(y_min, y_max)
		grid.add_tile(source.progression_rooms[i], x, y)
	
	# Optional pass: decide whether or not to spawn, and attempt to spawn randomly anywhere in the progression zone
	# TODO: clarify 'weight' situation and how to generate random chance per tile
	for i in source.optional_rooms.size():
		if randf() < float(source.optional_rooms[i].weight) / source.optional_rooms.size():
			var x = start.x + randi_range(-source.progression_width, source.progression_width)
			var y = start.y + source.progression_direction * randi_range(source.progression_margin, size - source.progression_margin)
			print(y)
			grid.add_tile(source.optional_rooms[i], x, y)
	
	# Environment pass: select environment tiles at (weighted) random and place them in the empty spaces
	# TODO: consult noise map to constuct biome
	for x in range(-size, size):
		for y in size:
			x += start.x
			y += start.y
			grid.add_tile(source.environment_tiles[randi() % source.environment_tiles.size()], x, y)
	
	grid.display()
