class_name Spellgear
extends Ability

@export
var base_hp : int = 1000

var max_hp : int
var hp : int


func level_up() -> void:
	var level_fn: Callable = func ():
		max_hp = base_hp * level
		hp += base_hp


	super._on_level_up(level_fn)


func take_damage(damage: int) -> void:
	hp -= damage
	SignalBus.ability_updated.emit(self)


func _create_instance() -> Resource:
	var instance := super()

	instance.max_hp = base_hp * instance.level
	instance.hp = instance.max_hp

	return instance
