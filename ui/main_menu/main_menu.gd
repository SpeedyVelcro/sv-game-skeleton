class_name _MainMenu
extends Node
## The game's main menu screen.
##
## This is scene is the first screen the player sees when they start the game
## (barring any pre-menu splashes, launcher-like screens or first-time setup
## screens). It contains an array of sub-menus for configuring or accessing
## various parts of the game.
##
## This scene is more for the management of those submenus than actually being
## a scene with buttons in and of itself. For the first menu the player sees,
## see [_StartPrompt].

@export_group("Internal")
@export var _start_prompt: _StartPrompt
@export var _landing_menu: _LandingMenu


# Signal connection
func _on_start_prompt_pressed() -> void:
	_landing_menu.visible = true


# Signal connection
func _on_landing_menu_play_pressed() -> void:
	pass # TODO


# Signal connection
func _on_landing_menu_achievements_pressed() -> void:
	pass # TODO


# Signal connection
func _on_landing_menu_jukebox_pressed() -> void:
	pass # TODO


# Signal connection
func _on_landing_menu_options_pressed() -> void:
	pass # TODO


# Signal connection
func _on_landing_menu_about_pressed() -> void:
	pass # TODO


# Signal connection
func _on_landing_menu_quit_pressed() -> void:
	if OS.has_feature("web"):
		_landing_menu.visible = false
		_start_prompt.activate()
	else:
		Quitter.quit()
