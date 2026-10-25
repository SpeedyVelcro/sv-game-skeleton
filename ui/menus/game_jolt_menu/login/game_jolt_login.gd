extends MarginContainer

## Emitted when started showing login UI
signal showing_login
## Emitted when started showing logout UI
signal showing_logout

@export_group("Internal")
@export var _username_line_edit: LineEdit
@export var _token_line_edit: LineEdit
@export var _login_container: Control
@export var _logout_container: Control
@export var _fail_label: Label
@export var _login_fail_animation_player: AnimationPlayer
@export var _login_button: Button
@export var _auto_login_button: Button
@export var _logout_button: Button


# Override
func _ready():
	GameJoltIntegration.session_open_attempt.connect(_on_game_jolt_integration_session_open_attempt)
	GameJoltIntegration.session_open.connect(_on_game_jolt_integration_session_open)
	GameJoltIntegration.session_open_fail.connect(_on_game_jolt_integration_session_open_fail)
	
	_fail_label.modulate.a = 0.0 # Invisible, but keep space in UI
	if GameJoltIntegration.is_integration_enabled():
		_show_logout()
	else:
		_show_login()


## Gets the control that should be focused when trying to grab focus with this
## login submenu. This will be either the username line edit or the logout
## button, depending on whether the player is logged in or not.
func get_first_focusable_control() -> Control:
	if _login_container.visible:
		return _username_line_edit
	else:
		return _logout_button


func _show_login():
	_login_container.visible = true
	_logout_container.visible = false
	_login_button.disabled = false
	_auto_login_button.disabled = false
	_username_line_edit.editable = true
	_token_line_edit.editable = true
	showing_login.emit()


func _show_logout():
	_login_container.visible = false
	_logout_container.visible = true
	showing_logout.emit()


# Signal connection
func _on_login_button_pressed():
	var username = _username_line_edit.get_text()
	var token = _token_line_edit.get_text()
	GameJoltIntegration.login(username, token)


# Signal connection
func _on_auto_login_button_pressed():
	if not GameJoltIntegration.login_auto():
		# Currently GameJoltIntegration's login_auto() can fail without emitting a signal
		# e.g. by missing credentials file, etc. It returns false instead so we have
		# to do this here manually.
		_login_fail_animation_player.play("login_fail")
		_login_button.disabled = false
		_auto_login_button.disabled = false
		_username_line_edit.editable = true
		_token_line_edit.editable = true


# Signal connection
func _on_logout_button_pressed():
	GameJoltIntegration.logout()
	_show_login()


func _on_game_jolt_integration_session_open_attempt():
	_login_button.disabled = true
	_auto_login_button.disabled = true
	_username_line_edit.editable = false
	_token_line_edit.editable = false


# Signal connection
func _on_game_jolt_integration_session_open():
	_show_logout()


# Signal connection
func _on_game_jolt_integration_session_open_fail():
	_login_fail_animation_player.play("login_fail")
	_login_button.disabled = false
	_auto_login_button.disabled = false
	_username_line_edit.editable = true
	_token_line_edit.editable = true
