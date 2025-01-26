extends GPUParticles2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.emitting=true
	self.finished.connect(particlesDone)

func particlesDone():
	queue_free()
