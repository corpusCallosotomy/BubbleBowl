extends Area2D

@export var isPlayer1Goal: bool = true

# Called when the node enters the scene tree for the first time.
func _ready():
	if !isPlayer1Goal:
		$GoalSprite.scale=Vector2(1.5, 1.8)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_body_entered(body):
	#print(body)
	if body.is_in_group("Bubble"):
		body.queue_free()
		var scoreToAdd = body.bubbleValue
		if isPlayer1Goal:
			MatchData.Score(0,scoreToAdd)
		else:
			MatchData.Score(1,scoreToAdd)
