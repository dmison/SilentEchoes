class_name  PlayerStateJumping extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	# TODO: player.animation_player.play('jump_up')
	player.state_label.text = "jumping"
	player.velocity.y = player.JUMP_VELOCITY
	player.move_and_slide()
	
func physics_update(_delta: float) -> void:
	
	# hack: this is to making it possible to traverse 1 tile high obstacles without a run up
	# tiny bit of aircontrol
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		player.velocity.x = player.velocity.x + direction * player.SPEED / 100
		player.setFacing(direction < 0)

	player.velocity += player.get_gravity() * _delta
	player.move_and_slide()
		
	if(player.onGround()):
		finished.emit(state_text[states.IDLE])
		return
	
	if player.velocity.y > 0.1:
		finished.emit(state_text[states.FALLING])
		return
		
	if !player.aboveHeadRay.is_colliding() && player.ledgeGrabRay.is_colliding():
		finished.emit(state_text[states.HANGING])
		return

	if !player.aboveVaultGrabRay.is_colliding() && player.vaultGrabRay.is_colliding():
		finished.emit(state_text[states.VAULTING])
		return
