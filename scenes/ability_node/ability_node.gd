class_name AbilityNode
extends Control

const ACTIVE_STYLEBOX : StyleBoxFlat = preload("res://scenes/ability_node/ability_node_stylebox_active.tres")
const INACTIVE_STYLEBOX : StyleBoxFlat = preload("res://scenes/ability_node/ability_node_stylebox_inactive.tres")

@export
var ability_id : String

@onready
var node_body : Panel = $NodeBody
@onready
var level_label : Label = %LevelLabel
@onready
var ability_button : Button = %AbilityButton
@onready
var ability_icon : TextureRect = %AbilityIcon

var _ability : Ability


func _ready():
	_ability = AbilityManager.abilities.get(ability_id)
	if not _ability:
		return

	if not _ability.is_active:
		node_body.hide()

	ability_icon.texture = _ability.icon
	node_body.add_theme_stylebox_override("panel", INACTIVE_STYLEBOX)

	_update_label()
	SignalBus.ability_updated.emit(_ability)


func _draw() -> void:
	if not _ability: return

	for res in _ability.unlocks:
		var target_node := _get_ability_node(res)
		
		if not target_node or not target_node._ability.is_active: continue

		var start = center()
		var end  = target_node.global_position + target_node.center()
		var color = Color.WHITE_SMOKE
		draw_line(start, end - global_position, color, 4)


func unlock() -> void:
	AbilityManager.abilities.get(_ability.id).unlock()
	node_body.show()


func center() -> Vector2:
	return custom_minimum_size / 2


func _on_ability_button_pressed() -> void:
	if _ability.level == _ability.max_level: return

	_ability.level_up()
	if _ability.level == 1:
		node_body.add_theme_stylebox_override("panel", ACTIVE_STYLEBOX)

	_update_label()

	for res in _ability.unlocks:
		var n := _get_ability_node(res)
		if not n: continue

		n.unlock()
		queue_redraw()


func _update_label() -> void:
	level_label.text = "%d / %d" % [_ability.level, _ability.max_level]


func _get_ability_node(id: String) -> AbilityNode:
	for ability_node in get_tree().get_nodes_in_group("ability_nodes"):
		if not ability_node._ability: continue

		if ability_node._ability.id == id:
			return ability_node	

	return null
