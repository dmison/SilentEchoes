class_name  PlayerStateRunning extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	# TODO: player.animation_player.play('running')
	player.state_label.text = "running"

func physics_update(_delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = direction * player.SPEED
		player.setFacing(direction < 0)
	else:
		player.velocity.x = move_toward(player.velocity.x, 0, player.SPEED)
	
	player.move_and_slide()
	
	if(!player.onGround()):
		finished.emit(state_text[states.FALLING])
		return
	
	if Input.is_action_just_pressed("jump") and player.onGround():
		finished.emit(state_text[states.JUMPING])
		return
	
	if(player.velocity.x < 0.01 && player.velocity.x > -0.01):
		finished.emit(state_text[states.IDLE])
		return
