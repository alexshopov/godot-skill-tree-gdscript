extends Control

@onready
var clockwork_mainspring: AbilityNode = %ClockworkMainspring
@onready
var level_label : Label = %LevelLabel
@onready
var hp_label : Label = %HPLabel


func _ready() -> void:
	_update_labels(clockwork_mainspring._ability)
	SignalBus.ability_updated.connect(_on_ability_updated)

func _on_ability_updated(ability: Ability) -> void:
	if ability.id == "ClockworkMainspring":
		_update_labels(ability)


func _on_take_damage_button_pressed() -> void:
	clockwork_mainspring._ability.take_damage(100)


func _update_labels(ability: Ability) -> void:
	level_label.text = "Level: %d" % ability.level
	hp_label.text = "HP: %d" % ability.hp
