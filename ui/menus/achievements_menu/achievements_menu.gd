class_name _AchievementsMenu
extends Control

## Emitted when the player requests to go back e.g. by hitting the back button.
signal back

@export_group("Internal")
@export var _scroll_container: ScrollContainer


# Signal connection
func _on_visibility_changed() -> void:
	if visible:
		_scroll_container.set_deferred("scroll_vertical", 0)


# Signal connection
func _on_back_button_pressed() -> void:
	back.emit()
