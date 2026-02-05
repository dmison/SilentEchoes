class_name  PlayerStateFalling extends PlayerState

func enter(_previous_state_path: String, _data := {}) -> void:
	
	#TODO player.animation_player.play('falling')
	player.state_label.text = "falling"

func physics_update(_delta: float) -> void:
	if(player.onGround()):
		finished.emit(state_text[states.IDLE])
		return
	player.velocity += player.get_gravity() * _delta		

	player.move_and_slide()

	if !player.aboveHeadRay.is_colliding() && player.ledgeGrabRay.is_colliding():
		finished.emit(state_text[states.HANGING])
		
