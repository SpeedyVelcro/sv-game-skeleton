class_name _OnAutoloadFinish
extends Node
## Final autoload used for game initialization.
##
## Use this autoload's [method _init] method for initialization tasks that
## must be run whenever the game is started, even if it is started from the
## "Run Current Scene" button in the editor. Tasks that only need to run when
## the game is started normally are better handled in the main scene.
##
## This autoload should always be placed at the end of the autoload list.


func _init() -> void:
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
		ProjectSettings.set_setting("newgrounds.io/app_id", Secrets.NEWGROUNDS_APP_ID)
		ProjectSettings.set_setting("newgrounds.io/AES-128_key", Secrets.NEWGROUNDS_AES_128_ENCRYPTION_KEY)
		NG.init()
	
	if OS.has_feature("game_jolt"):
		GameJolt.private_key = Secrets.GAME_JOLT_PRIVATE_KEY
	
	# TODO: Perform any other game initialization tasks
