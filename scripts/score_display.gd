extends Node

@export var score1Display: Label
@export var score2Display: Label

@export var endScore: int = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	var score1 = MatchData.getScore(1)
	var score2 = MatchData.getScore(0)

	score1Display.text = str(score1)
	score2Display.text = str(score2)
	
	#end match
	if score1 >= endScore or score2 >= endScore:
		get_tree().change_scene_to_file("res://scenes/screens/menus/MatchEnd.tscn")
