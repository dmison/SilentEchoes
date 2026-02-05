class_name  PlayerStateIdle extends PlayerState

var timeSinceLookCheck: float = 0

func enter(_previous_state_path: String, _data := {}) -> void:
	player.velocity.x = 0.0
	player.animation_player.play('idle')
	player.state_label.text = "idle"

	player.animation_player.connect("animation_finished", on_animation_player_animation_finished)

func exit() -> void:
	player.animation_player.disconnect("animation_finished", on_animation_player_animation_finished)

func physics_update(_delta: float) -> void:

	
	# very 5 seconds, 50% chance to look around
	randomize()	
	if timeSinceLookCheck >= 5:
		timeSinceLookCheck = 0
		var cn = randf()
		if cn > 0.5 && player.animation_player.current_animation != "looking":
			player.animation_player.play('looking')
	else:
		timeSinceLookCheck = timeSinceLookCheck + _delta
	
	# transitions
	
	if(!player.onGround()):
		finished.emit(state_text[states.FALLING])
		return

	if Input.is_action_just_pressed("jump") and player.onGround():
		finished.emit(state_text[states.JUMPING])
		return
#
	var direction = Input.get_axis("move_left", "move_right")
	if direction && player.onGround():
		finished.emit(state_text[states.RUNNING])
		return

func on_animation_player_animation_finished(animation):
	if animation == "looking":
		player.animation_player.play("idle")
