extends CharacterBody2D

@export var isPlayer1: bool = true
@export var pushForce: float = 800.0
@export var knockbackForce: float = 420.0
const SPEED: float = 30.0
const MAXSPEED: float = 90.0
const ACCELERATION: float = 1000.0
const DECELERATION: float = 1000.0



func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info and !collision_info.is_in_group("Player"):
		velocity += velocity.bounce(collision_info.get_normal().normalized()*knockbackForce)
		collision_info.get_collider().apply_central_impulse(-collision_info.get_normal()*pushForce)
		
	var direction: Vector2 = Vector2.ZERO
	if isPlayer1:
		direction = Input.get_vector("P1_left", "P1_right", "P1_up", "P1_down")
	else:
		direction = Input.get_vector("P2_left", "P2_right", "P2_up", "P2_down")
	velocity += direction * SPEED
	
	#for collisionAmount in get_slide_collision_count():
		#var collision = get_slide_collision(collisionAmount)
		#if collision.get_collider() is RigidBody2D:
			#collision.get_collider().apply_central_impulse(-collision.get_normal()*pushForce)
			
	velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
	
	#move_and_slide()


