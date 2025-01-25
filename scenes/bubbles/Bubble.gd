extends RigidBody2D

@export var bubbleSize: int = 1
var bubbleValue : int = 1
func _ready():
	self.body_entered.connect(bodyEntered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func bodyEntered(body):
	#print("Bubble hit a body")
	if body.is_in_group("Bubble"):
		#print("Bubble hit a bubble")
		if body.bubbleSize==self.bubbleSize:
			
			var selfIndex = self.get_index()
			var bodyIndex = body.get_index()

			if selfIndex<bodyIndex:
				self.queue_free()
			else:
				if bubbleSize<5:
					bubbleSize+=1
					bubbleValue+=1
					increaseBubbleScale()

			
		# CHECK IF BUBBLE IS THE SAME SIZE
		# CHECK WHICH BUBBLE IS HIGHER IN SCENE TREE. LOWER BUBBLE DIES INSTANTLY
		# HIGHER BUBBLE SPAWNS BUBBLE OF NEXT SIZE

func increaseBubbleScale():
	$CollisionShape2D.shape.radius=40+(bubbleSize*10)
	$SpriteParent.scale+=Vector2(0.25,0.25)
	# Sprite scale of 1 is 40 pixels at size 1
	# Sprite scale of 1.25 is 60 pixels at size 2
	# Sprite scale of 1.75 at 70 pixels at size 3
func _on_body_entered(body):
	#print("HELP")
	bodyEntered(body)
