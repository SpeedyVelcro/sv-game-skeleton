class_name Quitter
extends Node
## Static helper class for quitting the game manually.
##
## This class should be used instead of get_tree().quit() so that any handling
## in the [_OnQuit] autoload is always called.


## Runs any handling from the [_OnQuit] autoload, then quits the game.
static func quit() -> void:
	OnQuit.invoke_on_quit()
	
	var tree = Engine.get_main_loop()
	if tree is not SceneTree:
		push_error("Could not quit the game because the main loop was not a SceneTree.")
		return
	
	tree.quit()
