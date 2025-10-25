class_name Ability
extends Resource

@export
var id : String
@export
var max_level : int
@export
var level : int


func level_up() -> void:
	pass


func _on_level_up(level_fn: Callable) -> void:
	if level == max_level:
		return

	level += 1
	level_fn.call()

	SignalBus.ability_updated.emit(self)


func _create_instance() -> Resource:
	var instance : Ability = self.duplicate()

	instance.id = id
	instance.max_level = max_level
	instance.level = level

	return instance