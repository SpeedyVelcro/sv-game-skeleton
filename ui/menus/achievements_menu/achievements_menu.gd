class_name _AchievementsMenu
extends Control

## Emitted when the player requests to go back e.g. by hitting the back button.
signal back

@export_group("Internal")
@export var _scroll_container: ScrollContainer


# Override
func _input(event: InputEvent) -> void:
	if visible:
		if event.is_action_pressed("ui_cancel"):
			back.emit()
			get_viewport().set_input_as_handled()


# Signal connection
func _on_visibility_changed() -> void:
	if visible:
		_scroll_container.set_deferred("scroll_vertical", 0)


# Signal connection
func _on_back_button_pressed() -> void:
	back.emit()
