extends RigidBody2D

@export var bubbleSize: int = 1

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

			if selfIndex>bodyIndex:
				self.queue_free()
			else:
				print("I was the higher one")
				# SPAWN NEXT SIZE BUBBLE
			
		# CHECK IF BUBBLE IS THE SAME SIZE
		# CHECK WHICH BUBBLE IS HIGHER IN SCENE TREE. LOWER BUBBLE DIES INSTANTLY
		# HIGHER BUBBLE SPAWNS BUBBLE OF NEXT SIZE


func _on_body_entered(body):
	#print("HELP")
	bodyEntered(body)
