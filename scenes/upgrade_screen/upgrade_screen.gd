extends Control


@onready
var prime_tower : AbilityNode = %PrimeTower
@onready
var drop_rate : AbilityNode = %DropRate
@onready
var level_label : Label = %LevelLabel
@onready
var hp_label : Label = %HPLabel
@onready
var drop_rate_label : Label = %DropRateLabel


func _ready() -> void:

	_update_labels()
	SignalBus.ability_updated.connect(_on_ability_updated)


func _on_ability_updated(_ability: Ability) -> void:
	_update_labels()


func _on_take_damage_button_pressed() -> void:
	prime_tower._ability.take_damage(100)


func _update_labels() -> void:
	level_label.text = "Level: %d" % AbilityManager.abilities.get("prime_tower").level
	hp_label.text = "HP: %d" % AbilityManager.abilities.get("prime_tower").hp

	drop_rate_label.text = "Drop Rate: %.2f" % AbilityManager.abilities.get("drop_rate").drop_rate
