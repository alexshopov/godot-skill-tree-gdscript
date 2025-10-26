class_name DropRateAbility
extends Ability

@export
var base_drop_rate : float = 1.0
@export
var bonus_drop_rate : float = 0.25

var drop_rate : float = base_drop_rate


func level_up() -> void:
	var level_fn: Callable = func ():
		drop_rate += bonus_drop_rate

	super._on_level_up(level_fn)


func _create_instance() -> Resource:
	var instance := super()

	instance.base_drop_rate = base_drop_rate
	instance.bonus_drop_rate = bonus_drop_rate
	instance.drop_rate = base_drop_rate

	return instance