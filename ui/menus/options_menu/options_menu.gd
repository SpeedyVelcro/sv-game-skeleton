class_name _OptionsMenu
extends Control

## Emitted when the player requests to go back (e.g. by pressing the back button).
signal back

@export_group("Internal")
@export var _tab_container: TabContainer
@export var _social_tab: Control


# Override
func _ready() -> void:
	var social_idx := _tab_container.get_tab_idx_from_control(_social_tab)
	_tab_container.set_tab_disabled(social_idx, not OS.has_feature("game_jolt"))
	_tab_container.set_tab_hidden(social_idx, not OS.has_feature("game_jolt"))


# Override
func _input(event: InputEvent) -> void:
	if visible:
		if event.is_action_pressed("ui_cancel"):
			pass # TODO: Go back (only when not focused on something you can back out of) and handle input


# Signal connection
func _on_visibility_changed() -> void:
	if visible:
		_tab_container.current_tab = 0


# Signal connection
func _on_back_button_pressed() -> void:
	OptionsSaver.save()
	back.emit()
