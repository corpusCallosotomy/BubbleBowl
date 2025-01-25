extends Node



var scores  = [] # holds the scores for each team.
var players =[] # holds objects that represent players
var bubbles =[] # holds objects for all bubbles on screen





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#spawn a default(?) bubble somewhere on the board
func spawnBubble(where: Vector2) -> void:
	pass
	
#increase the score for a team, based on a size of the incoming bubble
func Score(team: int,size: int) -> void:
	scores[0] +=size
	
