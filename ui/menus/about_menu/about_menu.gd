class_name _AboutMenu
extends Control

## Emitted when the player requests to go back (e.g. by clicking the back button).
signal back

@export_group("Internal")
@export var _ui_controller: SVAboutUIController


# Override
func _input(event: InputEvent) -> void:
	if visible:
		if event.is_action_pressed("ui_cancel"):
			back.emit()
			get_viewport().set_input_as_handled()


# Signal connection
func _on_visibility_changed() -> void:
	if visible:
		_ui_controller.select_first_entry()


# Signal connection
func _on_back_button_pressed() -> void:
	back.emit()
