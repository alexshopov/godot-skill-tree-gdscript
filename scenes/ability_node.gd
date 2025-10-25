class_name AbilityNode
extends PanelContainer

@export
var ability_resrouce : Ability

@onready
var level_label : Label = %LevelLabel

var _ability : Ability

func _ready():
	_ability = ability_resrouce._create_instance()
	_update_label()
	SignalBus.ability_updated.emit(_ability)


func _on_ability_button_pressed() -> void:
	_ability.level_up()
	_update_label()


func _update_label() -> void:
	level_label.text = "%d / %d" % [_ability.level, _ability.max_level]
