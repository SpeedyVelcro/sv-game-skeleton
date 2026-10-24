class_name _OptionsMenu
extends Control

## Emitted when the player requests to go back (e.g. by pressing the back button).
signal back

@export_group("Internal")
@export var _tab_container: TabContainer


# Signal connection
func _on_visibility_changed() -> void:
	if visible:
		_tab_container.current_tab = 0


# Signal connection
func _on_back_button_pressed() -> void:
	OptionsSaver.save()
	back.emit()
