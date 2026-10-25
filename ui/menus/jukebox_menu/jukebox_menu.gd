class_name _JukeboxMenu
extends Control

## Emitted when the user requests to go back e.g. when they hit the back button.
signal back


# Override
func _input(event: InputEvent) -> void:
	if visible:
		if event.is_action_pressed("ui_cancel"):
			pass # TODO: Go back (only when not focused on something you can back out of) and handle input


# Signal connection
func _on_back_button_pressed() -> void:
	back.emit()
