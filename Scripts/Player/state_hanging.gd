class_name PlayerStateHanging extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	#player.animation_player.play('idle')
	player.state_label.text = "hanging"
	player.velocity = Vector2.ZERO
	player.move_and_slide()
	
func physics_update(_delta: float) -> void:
	
	# press down to let go
	
	if Input.is_action_just_pressed("jump"):
		# check if space is available
		finished.emit(state_text[states.LEDGE_CLIMB])
		return

	
