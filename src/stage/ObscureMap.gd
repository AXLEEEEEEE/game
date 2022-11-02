extends TileMap

func _ready():
	tile_set.tile_set_modulate(0, Color.black)
	tile_set.tile_set_modulate(1, Color.transparent)

func _physics_process(delta):
	if is_instance_valid(Shared.player):
		modulate.a = lerp(modulate.a, 0.0 if get_cellv(world_to_map(Shared.player.center())) != -1 else 1.0, delta * 10.0)