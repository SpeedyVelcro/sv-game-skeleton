class_name _JukeboxMenu
extends Control

## Emitted when the user requests to go back e.g. when they hit the back button.
signal back


# Signal connection
func _on_back_button_pressed() -> void:
	back.emit()
