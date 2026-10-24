extends Node
## Game entry point.
##
## This scene is set as the main scene in [ProjectSettings]. You should use
## this for game setup that is only required when running the game normally
## e.g. selecting the first scene. Setup that is required even if you're running
## a specific scene should be relegated to the [_OnAutoloadFinish] autoload.


# Override
func _ready() -> void:
	# TODO: Do any required initial setup.
	
	_change_to_first_scene.call_deferred()


func _change_to_first_scene() -> void:
	get_tree().change_scene_to_file("res://ui/main_menu/main_menu.tscn")
