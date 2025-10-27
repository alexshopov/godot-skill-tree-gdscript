class_name RateOfFire
extends Ability

@export
var base_rate_of_fire : float = 2.0
@export
var bonus_rate_of_fire: float = 0.5

var rate_of_fire_modifier : float = base_rate_of_fire


func _init() -> void:
	id = "rate_of_fire"


func level_up() -> void:
	var level_fn: Callable = func ():
		rate_of_fire_modifier *= bonus_rate_of_fire

	super._on_level_up(level_fn)


func _create_instance() -> Resource:
	var instance := super()

	instance.base_rate_of_fire = base_rate_of_fire
	instance.bonus_rate_of_fire = bonus_rate_of_fire
	instance.rate_of_fire_modifier = rate_of_fire_modifier

	return instance
