class_name _OnQuit
extends Node
## Autoload hook called when the game quits.
##
## This autoload can be used as a single place to gather any handling that needs
## to be done when the game quits. On-quit handling is automatically called for
## all methods of exiting that can be detected through notifications, but you
## will need to call [method invoke_on_quit] if quitting manually through
## [method SceneTree.quit].


# Override
func _notification(what: int) -> void:
	# See https://docs.godotengine.org/en/stable/tutorials/inputs/handling_quit_requests.html
	
	match what:
		NOTIFICATION_WM_CLOSE_REQUEST, NOTIFICATION_APPLICATION_PAUSED, NOTIFICATION_CRASH:
			OptionsSaver.save()
		NOTIFICATION_WM_GO_BACK_REQUEST:
			if ProjectSettings.get_setting_with_override("application/config/quit_on_go_back"):
				OptionsSaver.save()


## Manually invoke the on-quit handling. This should be called before calling
## [method SceneTree.quit].
func invoke_on_quit() -> void:
	_on_quit()


func _on_quit() -> void:
	pass # TODO: Put on quit handling here
