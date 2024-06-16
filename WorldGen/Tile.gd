extends Resource
class_name Tile

@export var name: String = ''
@export var biome: Biome = Biome.None
@export var weight: int = 1
@export var scale: int = 1
@export var repeat: bool = true
@export var scene: PackedScene = null

enum Biome {
	None,
	Realm_1,
	Realm_2,
	Realm_3,
	Realm_4,
	Realm_5
}
