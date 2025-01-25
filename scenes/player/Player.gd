extends CharacterBody2D

@export var isPlayer1: bool = true
const SPEED: float = 30.0
const MAXSPEED: float = 90.0
const ACCELERATION: float = 1000.0
const DECELERATION: float = 1000.0



func _physics_process(delta):
	var direction: Vector2 = Vector2.ZERO
	if isPlayer1:
		direction = Input.get_vector("P1_left", "P1_right", "P1_up", "P1_down")
	else:
		direction = Input.get_vector("P2_left", "P2_right", "P2_up", "P2_down")
	velocity += direction * SPEED
#	if direction:
#		velocity.x = direction * SPEED

	#velocity = move_toward(velocity, Vector2.ZERO, SPEED)
	
	#if direction != Vector2.ZERO:
		#velocity = velocity.move_toward(direction, ACCELERATION * delta)
	#else:
	velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)

	move_and_slide()
