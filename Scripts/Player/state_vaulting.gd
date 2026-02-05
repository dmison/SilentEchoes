class_name  PlayerStateVaulting extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	player.state_label.text = "vaulting"
	#player.move_and_slide()
	player.velocity = Vector2.ZERO
	
func physics_update(_delta: float) -> void:
	# TODO play ledge climb animation & await animation
	
	# move player to new postion	
	player.global_position.y = player.global_position.y-32
	if player.facingRight:
		player.global_position.x = player.global_position.x + 15
	else:
		player.global_position.x = player.global_position.x -15

	finished.emit(state_text[states.IDLE])
	#
