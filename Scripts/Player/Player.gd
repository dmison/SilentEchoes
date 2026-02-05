class_name Player extends CharacterBody2D


@onready var GroundRayCast := $groundRayCast
@onready var state_label := $StateLabel

@onready var sprite := $Sprite2D
@onready var animation_player := $AnimationPlayer

@onready var ledgeGrabRay = $LedgeGrab
@onready var aboveHeadRay = $AboveHead

@onready var aboveVaultGrabRay = $AboveVaultGrab
@onready var vaultGrabRay = $VaultingGrab

@export var SPEED:float = 50.0
@export var JUMP_VELOCITY:float = -200.0

var facingRight:bool = true;

enum player_state {
	IDLE,
	RUNNING,
	JUMPING,
	FALLING,
	EDGE_HANG,
	VAULTING
}

const state_text = [
	"IDLE",
	"RUNNING",
	"JUMPING",
	"FALLING",
	"EDGE_HANG",
	"VAULTING"
]

func onGround() -> bool:
	return GroundRayCast.is_colliding()

# set sprite & raycasts to face in the required direction
func setFacing(left: bool) -> void:
	facingRight = !left
	sprite.flip_h = left
	ledgeGrabRay.target_position.x = -10 if left else 10
	aboveHeadRay.target_position.x = -10 if left else 10
	vaultGrabRay.target_position.x = -10 if left else 10
	aboveVaultGrabRay.target_position.x = -10 if left else 10
