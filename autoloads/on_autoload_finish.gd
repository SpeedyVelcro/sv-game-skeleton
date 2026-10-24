class_name _OnAutoloadFinish
extends Node
## Final autoload used for game initialization.
##
## Use this autoload's [method _ready] method for initialization tasks that
## must be run whenever the game is started, even if it is started from the
## "Run Current Scene" button in the editor. Tasks that only need to run when
## the game is started normally are better handled in the main scene.
##
## This autoload should always be placed at the end of the autoload list.


# Override
func _ready() -> void:
	if OS.has_feature("web"):
		var config := OptionsConfigProvider.get_config()
		
		config.manage_resolution = false
		config.manage_window_mode = false
		config.manage_screen = false
		
		# On web we always just use the canvas size as the resolution, so no
		# need for scaling. Users who need more granular display settings are
		# advised to use the desktop version.
		get_window().content_scale_mode = Window.CONTENT_SCALE_MODE_DISABLED
	
	OptionsLifecycle.start_up()
	
	if OS.has_feature("newgrounds"):
		# Secrets should have already been included in the PCK by setting
		# environment variables during export. The newgrounds plugin
		# automatically picks them up, so unlike the Game Jolt addon we don't
		# need to do our own secrets management.
		NG.init()
	
	if OS.has_feature("game_jolt"):
		GameJolt.private_key = Secrets.GAME_JOLT_PRIVATE_KEY
	
	# TODO: Perform any other game initialization tasks
