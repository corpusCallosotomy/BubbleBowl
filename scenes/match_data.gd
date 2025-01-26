extends Node



var stage = null #what stage we're on. 

var scores  = [0,0] # holds the scores for each team.
var players =[] # holds objects that represent players
var bubbles =[] # holds objects for all bubbles on screen

var spawnRate: float = 3.0
var maxBubbles = 25
var bubbleCount: int = 0
var spikedEnabled = false
var spikeCount: int = 0




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
#spawn a default(?) bubble somewhere on the board
func spawnBubble(where: Vector2) -> void:
	pass
	
func addBubble(bubble) -> void:
	bubbles.append(bubble)
	
#increase the score for a team, based on a size of the incoming bubble
func Score(team: int,size: int) -> void:
	scores[team] +=size
	
func getScore(team: int) -> int:
		print(scores[team])
		return scores[team]
		
func resetScores() -> void:
		scores = [0,0]
