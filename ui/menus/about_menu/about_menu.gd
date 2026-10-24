class_name _AboutMenu
extends Control

## Emitted when the player requests to go back (e.g. by clicking the back button).
signal back

@export_group("Internal")
@export var _ui_controller: SVAboutUIController


# Signal connection
func _on_visibility_changed() -> void:
	if visible:
		_ui_controller.select_first_entry()


# Signal connection
func _on_back_button_pressed() -> void:
	back.emit()
