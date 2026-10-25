class_name _GameJoltMenu
extends Control

## Emitted when player requests to close this menu either by continuing or
## skipping.
signal close

const _CONTINUE_BUTTON_TEXT = "Continue"
const _SKIP_BUTTON_TEXT = "Skip"

## Automatically requests a close (see [signal close]) of the menu when a login
## is successful.
@export var auto_continue_on_login := false

@export_group("Internal")
@export var _continue_button: Button


func _close() -> void:
	close.emit()


# Signal connection
func _on_continue_button_pressed():
	_close()


func _on_game_jolt_login_showing_login() -> void:
	_continue_button.text = _CONTINUE_BUTTON_TEXT


func _on_game_jolt_login_showing_logout() -> void:
	_continue_button.text = _SKIP_BUTTON_TEXT
	if auto_continue_on_login:
		_close()
