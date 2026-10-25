class_name _PauseScreen
extends Node

## True if the game can currently be paused. Set this to enable or disable
## pausing (at least insofar as user-initiated pausing is concerned).
@export var can_pause := true

@export_group("Internal")
@export var _pause_menu: _PauseMenu
@export var _achievements_menu: _AchievementsMenu
@export var _options_menu: _OptionsMenu
@export var _quit_to_menu_prompt: _QuitPrompt
@export var _quit_game_prompt: _QuitPrompt


# Override
func _unhandled_input(event: InputEvent) -> void:
	if not can_pause:
		return
	
	# Uses _unhandled_input so that submenus can prioritise the "ui_cancel"
	# event when they are both bound to ESC.
	if event.is_action_pressed("pause"):
		toggle_pause()


## Pauses the game and shows the pause menu.
func pause() -> void:
	if not can_pause:
		push_error("Attempted to pause, but can_pause is false")
		return
	
	if get_tree().paused:
		push_error("Already paused")
		return
	
	get_tree().paused = true
	_pause_menu.visible = true


## Unpauses the game and hides the pause menu.
func unpause() -> void:
	if not get_tree().paused:
		push_error("Already unpaused")
		return
	
	if _options_menu.visible:
		OptionsSaver.save()
	
	get_tree().paused = false
	_pause_menu.visible = false
	_achievements_menu.visible = false
	_options_menu.visible = false
	_quit_to_menu_prompt.visible = false
	_quit_game_prompt.visible = false


## As [method pause] or [method unpause].
func toggle_pause() -> void:
	if get_tree().paused:
		unpause()
	else:
		pause()


# Signal connection
func _on_pause_menu_resume() -> void:
	unpause()


# Signal connection
func _on_pause_menu_achievements_pressed() -> void:
	_pause_menu.visible = false
	_achievements_menu.visible = true


# Signal connection
func _on_pause_menu_options_pressed() -> void:
	_pause_menu.visible = false
	_options_menu.visible = true


# Signal connection
func _on_pause_menu_quit_to_menu_pressed() -> void:
	_pause_menu.visible = false
	_quit_to_menu_prompt.visible = true


# Signal connection
func _on_pause_menu_quit_game_pressed() -> void:
	_pause_menu.visible = false
	_quit_game_prompt.visible = true


# Signal connection
func _on_achievements_menu_back() -> void:
	_achievements_menu.visible = false
	_pause_menu.visible = true


# Signal connection
func _on_options_menu_back() -> void:
	_options_menu.visible = false
	_pause_menu.visible = true


# Signal connection
func _on_quit_to_menu_prompt_yes_pressed() -> void:
	unpause()
	get_tree().change_scene_to_file.call_deferred("res://ui/title_screen/title_screen.tscn")


# Signal connection
func _on_quit_to_menu_prompt_no_pressed() -> void:
	_quit_to_menu_prompt.visible = false
	_pause_menu.visible = true


# Signal connection
func _on_quit_game_prompt_yes_pressed() -> void:
	unpause()
	OnQuit.invoke_on_quit()
	get_tree().quit()


# Signal connection
func _on_quit_game_prompt_no_pressed() -> void:
	_quit_game_prompt.visible = false
	_pause_menu.visible = true
