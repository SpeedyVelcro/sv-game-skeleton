class_name _QuitPrompt
extends Control

## Emitted when the yes button is pressed.
signal yes_pressed
## Emitted when the no button is pressed.
signal no_pressed


# Signal connection
func _on_yes_button_pressed() -> void:
	yes_pressed.emit()


# Signal connection
func _on_no_button_pressed() -> void:
	no_pressed.emit()
