class_name PrimeTower
extends TowerAbility


func _init() -> void:
	id = "prime_tower"


func _create_instance() -> Resource:
	var instance := super()

	instance.unlocks.append("drop_rate")
	instance.unlocks.append("all_towers_damage_increase")
	instance.unlocks.append("rate_of_fire")
	instance.is_active = true

	return instance
