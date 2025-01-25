extends RigidBody2D

@export var collisionShape: CollisionShape2D
#@export var bounceForce: float = 10.0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	if body.is_in_group("Bubble") or body.is_in_group("Environment"):
		#apply_central_impulse(body.get_normal()*bounceForce)
		pass
		
