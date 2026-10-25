class_name _PauseMenu
extends Control

## Emitted when the player requests to resume the game e.g. by clicking the
## resume button.
signal resume
## Emitted when the achievements button is pressed.
signal achievements_pressed
## Emitted when the options button is pressed.
signal options_pressed
## Emitted when the quit to menu button is pressed.
signal quit_to_menu_pressed
## Emitted when the quit game button is pressed.
signal quit_game_pressed


# Override
func _input(event: InputEvent) -> void:
	if visible:
		if event.is_action_pressed("ui_cancel"):
			resume.emit()
			get_viewport().set_input_as_handled()


# Signal connection
func _on_resume_button_pressed() -> void:
	resume.emit()


# Signal connection
func _on_achievements_button_pressed() -> void:
	achievements_pressed.emit()


# Signal connection
func _on_options_button_pressed() -> void:
	options_pressed.emit()


# Signal connection
func _on_quit_to_menu_button_pressed() -> void:
	quit_to_menu_pressed.emit()


# Signal connection
func _on_quit_game_button_pressed() -> void:
	quit_game_pressed.emit()
