extends RigidBody2D

@export var bubbleSize: int = 1

@export var spriteParent: Node2D
@export var sprite: Sprite2D

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
			
			var selfIndex = self.get_index()
			var bodyIndex = body.get_index()

			if selfIndex < bodyIndex:
				#self.queue_free()
				return
			else:
				if bubbleSize<5:
					bubbleSize+=1
					bubbleValue+=1
					increaseBubbleScale()
					body.queue_free()
		
	
		
			
		# CHECK IF BUBBLE IS THE SAME SIZE
		# CHECK WHICH BUBBLE IS HIGHER IN SCENE TREE. LOWER BUBBLE DIES INSTANTLY
		# HIGHER BUBBLE SPAWNS BUBBLE OF NEXT SIZE

func increaseBubbleScale():
	$CollisionShape2D.shape.radius=40+(bubbleSize*10)
	bubbleScale+=0.25
	$SpriteParent.scale=Vector2(bubbleScale,bubbleScale)
	# Sprite scale of 1 is 40 pixels at size 1
	# Sprite scale of 1.25 is 60 pixels at size 2
	# Sprite scale of 1.75 at 70 pixels at size 3
func _on_body_entered(body):
	#print("HELP")
	bodyEntered(body)
