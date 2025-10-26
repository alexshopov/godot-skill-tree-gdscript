class_name PrimeTower
extends TowerAbility


func _create_instance() -> Resource:
	var instance := super()

	instance.is_active = true

	return instance
