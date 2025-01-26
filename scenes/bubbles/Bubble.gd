extends RigidBody2D

@export var bubbleSize: int = 1

@export var spriteParent: Node2D
@export var sprite: AnimatedSprite2D

@export var sound_collideWithWall: AudioStream
@export var sound_collideWithSeal: AudioStream
@export var sound_collideWithBubble: AudioStream
@export var sound_mergeWithBubble: AudioStream

var popParticleScene = preload("res://VFX/pop_bubble.tscn")

var wobble = 0.0
var angle = 0.0

var bubbleValue : int = 1
var bubbleScale : float = 1.0
func _ready():
	self.body_entered.connect(bodyEntered)
	wobble = 100


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	
	var velocity = linear_velocity
	
	if(velocity.length_squared() > 0.01):
		
		if(velocity.angle() != angle):
			spriteParent.scale = Vector2(bubbleScale, bubbleScale)
		
		angle = velocity.angle()
		spriteParent.rotation = angle
		sprite.rotation = -angle
	
	spriteParent.scale.x = bubbleScale + (sin(50 * Time.get_unix_time_from_system()) * (wobble/250.0))
	spriteParent.scale.y = bubbleScale + (cos(50 * Time.get_unix_time_from_system()) * (wobble/250.0))


		
	if(wobble > 0):
		wobble *= 0.9
	
	
	pass


func bodyEntered(body):
	wobble = 100
	
	#print("Bubble hit a body")
	if body.is_in_group("Bubble"):
		#print("Bubble hit a bubble")
		if body.bubbleSize==self.bubbleSize:
			playSound(sound_collideWithBubble)
			var selfIndex = self.get_index()
			var bodyIndex = body.get_index()

			if selfIndex < bodyIndex:
				#self.queue_free()
				return
			else:
				if bubbleSize<4:
					bubbleSize+=1
					match bubbleSize:
						2:
							bubbleValue = 3
						3:
							bubbleValue = 7
						4:
							bubbleValue = 15
					
					increaseBubbleScale()
					# We do NOT call the kill function here because this bubble GROWS into the bigger one.
					# Well, the OTHER bubble does. THIS ONE just dies. Two bubbles become one.
					MatchData.bubbleCount-=1
					body.queue_free()
				else:
					# Pop both bubbles if they're both size 4 already
					body.killBubble()
					self.killBubble()
		else:
			playSound(sound_mergeWithBubble)
	
		
			
		# CHECK IF BUBBLE IS THE SAME SIZE
		# CHECK WHICH BUBBLE IS HIGHER IN SCENE TREE. LOWER BUBBLE DIES INSTANTLY
		# HIGHER BUBBLE SPAWNS BUBBLE OF NEXT SIZE
	elif body.is_in_group("Environment"):
		playSound(sound_collideWithWall)
	elif body.is_in_group("Player"):
		playSound(sound_collideWithSeal)

func increaseBubbleScale():
	$CollisionShape2D.shape.radius=40+(bubbleSize*10)
	bubbleScale+=0.25
	$SpriteParent.scale=Vector2(bubbleScale,bubbleScale)
	if $SpriteParent/Sprite.frame<3:
		$SpriteParent/Sprite.frame+=1
	# Sprite scale of 1 is 40 pixels at size 1
	# Sprite scale of 1.25 is 60 pixels at size 2
	# Sprite scale of 1.75 at 70 pixels at size 3
func _on_body_entered(body):
	#print("HELP")
	bodyEntered(body)

const soundCooldown = 500
var lastSoundPlayed: int

func playSound(sound: AudioStream):	
	var currentTime = Time.get_ticks_msec()
	
	if currentTime - lastSoundPlayed < soundCooldown:
		return
	
	lastSoundPlayed = currentTime
	var player = $AudioStreamPlayer2D
	player.playing = false
	player.stream = sound
	
	player.pitch_scale = (1.0 / sqrt(bubbleSize)) + randf_range(-0.1, 0.1)
	
	player.play()

func killBubble():
	MatchData.bubbleCount-=1
	var popInstance = popParticleScene.instantiate()
	add_sibling.call_deferred(popInstance)
	popInstance.position=self.position
	queue_free()
