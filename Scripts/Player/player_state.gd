class_name PlayerState extends State

var player: Player

enum states {
	IDLE,
	RUNNING,
	JUMPING,
	FALLING,
	HANGING,
	VAULTING,
	LEDGE_CLIMB
}

const state_text: Array[String] = [
	"IDLE",
	"RUNNING",
	"JUMPING",
	"FALLING",
	"HANGING",
	"VAULTING",
	"LEDGE_CLIMB"
]

func _ready() -> void:
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
