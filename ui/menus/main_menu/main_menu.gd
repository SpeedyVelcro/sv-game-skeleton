class_name _LandingMenu
extends Control
## Landing menu for the main menu.
##
## This is the first submenu the player sees in the main menu (barring the
## start prompt). It is the "main menu of the main menu" if you will. It should
## contain buttons allowing you to navigate to all other parts of the main menu
## - either directly or indirectly - and all other submenus in the main menu
## should be able to send you back to this one.

## Emitted when the play button is pressed.
signal play_pressed
## Emitted when the achievements button is pressed.
signal achievements_pressed
## Emitted when the jukebox button is pressed.
signal jukebox_pressed
## Emitted when the options button is pressed.
signal options_pressed
## Emitted when the about button is pressed.
signal about_pressed
## Emitted when the quit button is pressed.
signal quit_pressed


func _on_play_button_pressed() -> void:
	play_pressed.emit()


func _on_achievements_button_pressed() -> void:
	achievements_pressed.emit()


func _on_jukebox_button_pressed() -> void:
	jukebox_pressed.emit()


func _on_options_button_pressed() -> void:
	options_pressed.emit()


func _on_about_button_pressed() -> void:
	about_pressed.emit()


func _on_quit_button_pressed() -> void:
	quit_pressed.emit()
