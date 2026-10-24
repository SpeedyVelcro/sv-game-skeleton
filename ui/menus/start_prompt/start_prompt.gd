class_name _StartPrompt
extends Control
## Start prompt for the main menu
##
## Displays a flashing label that prompts the user to press any button. When
## any button is pressed, the signal [signal pressed] is emitted, and you can
## decide what to do with that (usually show the main menu).
##
## Visibility is handled automatically.

signal pressed

const _FLASH_ANIMATION_NAME := "flash"

## Set to [code]true[/code] to start with the prompt visible and listening for
## input.
@export var start_active := true

## Number of seconds before prompt should appear and start flashing when
## activated.
@export var delay: float = 1.0

@export_group("Internal")
@export var _animation_player: AnimationPlayer
@export var _flashing_node: CanvasItem
@export var _delay_timer: Timer

var _active := false


# Override
func _ready() -> void:
	if start_active:
		activate()
	else:
		const IMMEDIATE := true
		deactivate(IMMEDIATE)


func _input(event: InputEvent) -> void:
	if not _active:
		return
	
	if event.is_pressed() \
			and (event is InputEventKey \
					or event is InputEventJoypadButton \
					or event is InputEventMouseButton):
		pressed.emit()
		deactivate()


## Activate the prompt. This makes it visible and starts flashing the label,
## and also starts listening for input.
##
## This is automatically called on ready if [member start_active] is
## [code]true[/code].
func activate() -> void:
	if _active:
		return
	
	_flashing_node.modulate.a = 0.0
	visible = true
	
	if delay <= 0:
		_animation_player.play(_FLASH_ANIMATION_NAME)
	else:
		_delay_timer.start(delay)
	
	_active = true

## Forces the prompt to deactivate. This is the same as pressing any button.
## Pass in [param immediate] with a value of [code]true[/code] to make the
## prompt instantaneously disappear instead of waiting to fade out.
func deactivate(immediate: bool = false) -> void:
	if not _active:
		return
	
	_active = false
	_delay_timer.stop()
	
	if immediate:
		visible = false
		_animation_player.stop()


# Signal connection
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == _FLASH_ANIMATION_NAME:
		# We manually handle looping so we can stop the animation exactly between
		# loops if the prompt is no longer activated.
		if _active:
			_animation_player.play(_FLASH_ANIMATION_NAME)
		else:
			visible = false


# Signal connection
func _on_delay_timer_timeout() -> void:
	_animation_player.play(_FLASH_ANIMATION_NAME)
