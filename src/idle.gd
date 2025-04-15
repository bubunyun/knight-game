extends State

@export
var jump_state: State
@export
var move_state: State

func enter() -> void:
	super()
	parent.velocity.x = 0

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> State:
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction:
		return move_state
	
	parent.velocity.y += gravity * delta
	parent.move_and_slide()

	return null
