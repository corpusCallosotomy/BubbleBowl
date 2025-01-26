extends CharacterBody2D

@export var isPlayer1: bool = true
@export var pushForce: float = 800.0
@export var knockbackForce: float = 1.2
const SPEED: float = 30.0
const MAXSPEED: float = 1000.0
const ACCELERATION: float = 1000.0
const DECELERATION: float = 1000.0

var facingAngle: float = 0.0

@export var sound_collideWithWall: AudioStream
@export var sound_collideWithSeal: AudioStream
@export var sound_collideWithBubble: AudioStream

func _physics_process(delta):
	var collision_info = move_and_collide(velocity * delta)
	if collision_info:
		velocity += velocity.bounce(collision_info.get_normal().normalized()) * knockbackForce
		if collision_info.get_collider().is_in_group("Player"): 
			playSound(sound_collideWithSeal)
		elif collision_info.get_collider().is_in_group("Environment"):
			playSound(sound_collideWithWall)
		else:
			playSound(sound_collideWithBubble)
			collision_info.get_collider().apply_central_impulse(-collision_info.get_normal()*pushForce)
			#print(collision_info.get_collider())
		
	var direction: Vector2 = Vector2.ZERO
	if isPlayer1:
		direction = Input.get_vector("P1_left", "P1_right", "P1_up", "P1_down")
	else:
		direction = Input.get_vector("P2_left", "P2_right", "P2_up", "P2_down")
	velocity += direction * SPEED
	
	if(direction.length_squared() > 0.01):
		facingAngle = direction.angle() - (PI/2.0)
	
	$Icon.rotation = lerpf($Icon.rotation, facingAngle, delta * 50)
	
	#for collisionAmount in get_slide_collision_count():
		#var collision = get_slide_collision(collisionAmount)
		#if collision.get_collider() is RigidBody2D:
			#collision.get_collider().apply_central_impulse(-collision.get_normal()*pushForce)
	
	velocity = velocity.limit_length(MAXSPEED)
	
	velocity = velocity.move_toward(Vector2.ZERO, DECELERATION * delta)
	
	#move_and_slide()

const soundCooldown = 500
var lastSoundPlayed: int

func playSound(sound: AudioStream):	
	var currentTime = Time.get_ticks_msec()
	
	if currentTime - lastSoundPlayed < soundCooldown:
		return
	
	lastSoundPlayed = currentTime
	var player = $AudioStreamPlayer
	player.playing = false
	player.stream = sound
	player.play()
	
