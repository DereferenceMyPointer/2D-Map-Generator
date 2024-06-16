extends Resource
class_name Region

@export var progression_rooms: Array[Tile]
@export var optional_rooms: Array[Tile]
@export var optional_room_spawn_chance: float = 0.5 # 1 / (prob ^ weight)
@export var environment_tiles: Array[Tile]

@export var size_range: Vector2i = Vector2i(20, 30)
@export var progression_width: int = 10
@export var progression_margin: int = 1
@export var progression_direction: int = -1
