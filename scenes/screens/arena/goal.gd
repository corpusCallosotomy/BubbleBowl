extends Area2D

@export var isPlayer1Goal: bool = true
#var confettiParticleScene = preload("res://VFX/confetti2.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	if !isPlayer1Goal:
		$GoalSprite.scale=Vector2(1.5, 1.8)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	print(body)
	if body.is_in_group("Bubble"):
		#makeConfetti()
		body.killBubble()
		var scoreToAdd = body.bubbleValue
		if isPlayer1Goal:
			MatchData.Score(0,scoreToAdd)
		else:
			MatchData.Score(1,scoreToAdd)

		if not $AudioStreamPlayer2D.playing:
			$AudioStreamPlayer2D.pitch_scale = 0.9 + (scoreToAdd/10.0)

			$AudioStreamPlayer2D.play()
	if body.is_in_group("Spike"):
		body.teleportHome()
#
#func makeConfetti():
	#var confettiInstance = confettiParticleScene.instantiate()
	#add_sibling.call_deferred(confettiInstance)
	#confettiInstance.position=self.position
