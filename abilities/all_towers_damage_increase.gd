class_name AllTowersDamageIncrease
extends Ability

@export
var base_damage : float = 1.0
@export
var bonus_damage_increase : float = 0.5

var damage_modifier : float = base_damage


func _init() -> void:
	id = "all_towers_damage_increase"


func level_up() -> void:
	var level_fn: Callable = func ():
		damage_modifier += bonus_damage_increase

	super._on_level_up(level_fn)


func _create_instance() -> Resource:
	var instance := super()

	instance.base_damage = base_damage
	instance.bonus_damage_increase = bonus_damage_increase
	instance.damage_modifier = damage_modifier

	return instance
