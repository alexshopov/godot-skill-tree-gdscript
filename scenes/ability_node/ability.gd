class_name Ability
extends Resource

@export
var is_active : bool
@export
var id : String
@export
var icon : CompressedTexture2D
@export
var max_level : int
@export
var level : int
@export
var unlocks: Array[String] = []


func level_up() -> void:
	pass

func unlock() -> void:
	if is_active: return

	is_active = true


func _on_level_up(level_fn: Callable) -> void:
	if level == max_level:
		return

	level += 1
	level_fn.call()

	SignalBus.ability_updated.emit(self)


func _create_instance() -> Resource:
	var instance : Ability = self.duplicate()

	instance.is_active = false
	instance.id = id
	instance.icon = icon
	instance.max_level = max_level
	instance.level = level

	return instance
