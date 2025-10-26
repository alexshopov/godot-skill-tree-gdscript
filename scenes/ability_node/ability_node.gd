@tool
class_name AbilityNode
extends PanelContainer

const ACTIVE_STYLEBOX : StyleBoxFlat = preload("res://scenes/ability_node/ability_node_stylebox_active.tres")
const INACTIVE_STYLEBOX : StyleBoxFlat = preload("res://scenes/ability_node/ability_node_stylebox_inactive.tres")

@export
var icon : CompressedTexture2D :
	set(value):
		icon = value

		if ability_icon:
			ability_icon.texture = icon	


@onready
var level_label : Label = %LevelLabel
@onready
var ability_button : Button = %AbilityButton
@onready
var ability_icon : TextureRect = %AbilityIcon

var _ability : Ability


func _ready():
	ability_icon.texture = icon
	add_theme_stylebox_override("panel", INACTIVE_STYLEBOX)

	if Engine.is_editor_hint():
		return

	_update_label()
	SignalBus.ability_updated.emit(_ability)

	if not _ability.is_active:
		hide()

	SignalBus.ability_unlocked.connect(_on_ability_unlocked)



func _on_ability_unlocked(ability_id: String) -> void:
	if _ability.id == ability_id:
		AbilityManager.abilities.get(ability_id).unlock()
		show()


func _on_ability_button_pressed() -> void:
	add_theme_stylebox_override("panel", ACTIVE_STYLEBOX)
	
	_ability.level_up()
	_update_label()


func _update_label() -> void:
	level_label.text = "%d / %d" % [_ability.level, _ability.max_level]
