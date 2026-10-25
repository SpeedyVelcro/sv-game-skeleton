class_name _TitleScreen
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
@export var _main_menu: _MainMenu
@export var _achievements_menu: _AchievementsMenu
@export var _jukebox_menu: _JukeboxMenu
@export var _options_menu: _OptionsMenu
@export var _about_menu: _AboutMenu


# Signal connection
func _on_start_prompt_pressed() -> void:
	_main_menu.visible = true


# Signal connection
func _on_main_menu_play_pressed() -> void:
	pass # TODO


# Signal connection
func _on_main_menu_achievements_pressed() -> void:
	_main_menu.visible = false
	_achievements_menu.visible = true


# Signal connection
func _on_main_menu_jukebox_pressed() -> void:
	_main_menu.visible = false
	_jukebox_menu.visible = true


# Signal connection
func _on_main_menu_options_pressed() -> void:
	_main_menu.visible = false
	_options_menu.visible = true


# Signal connection
func _on_main_menu_about_pressed() -> void:
	_main_menu.visible = false
	_about_menu.visible = true


# Signal connection
func _on_main_menu_quit_pressed() -> void:
	if OS.has_feature("web"):
		_main_menu.visible = false
		_start_prompt.activate()
	else:
		Quitter.quit()


# Signal connection
func _on_options_menu_back() -> void:
	_options_menu.visible = false
	_main_menu.visible = true


# Signal connection
func _on_about_menu_back() -> void:
	_about_menu.visible = false
	_main_menu.visible = true


# Signal connection
func _on_achievements_menu_back() -> void:
	_achievements_menu.visible = false
	_main_menu.visible = true


# Signal connection
func _on_jukebox_menu_back() -> void:
	_jukebox_menu.visible = false
	_main_menu.visible = true
