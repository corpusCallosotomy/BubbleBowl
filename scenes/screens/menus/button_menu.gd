extends Panel




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	MatchData.spikeCount = $VBoxContainer/SpikeBubbles/HSlider.value
	MatchData.spawnRate = $"VBoxContainer/Bubble Spawn Speed/HSlider".value
	MatchData.maxBubbles = $"VBoxContainer/Max Bubbles/HSlider".value
	MatchData.maxScore = $"VBoxContainer/Max Score/HSlider".value
