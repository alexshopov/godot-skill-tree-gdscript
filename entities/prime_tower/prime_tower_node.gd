@tool
extends AbilityNode


func _init() -> void:
    _ability = AbilityManager.abilities.get("prime_tower")
