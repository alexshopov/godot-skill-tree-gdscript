@tool
extends AbilityNode


func _init() -> void:
    _ability = AbilityManager.abilities.get("drop_rate")
