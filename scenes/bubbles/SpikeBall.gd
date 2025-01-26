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
	


func bodyEntered(body):
	wobble = 100
	
	#print("Bubble hit a body")
	if body.is_in_group("Bubble"):
		#print("Bubble hit a bubble")
		body.killBubble()

func _on_body_entered(body):
	#print("HELP")
	bodyEntered(body)
