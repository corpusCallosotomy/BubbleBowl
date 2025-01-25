extends Node

@export var score1: Label
@export var score2: Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	score1.text = str(MatchData.getScore(0))
	score2.text = str(MatchData.getScore(1))
	
	
	pass
