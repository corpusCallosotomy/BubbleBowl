extends Area2D

var rng = RandomNumberGenerator.new()
var bubbleScene = preload("res://scenes/bubbles/Bubble.tscn")
var spikeScene = preload("res://scenes/bubbles/SpikeBubble.tscn")

var readyToSpawn: bool = true

# Called when the node enters the scene tree for the first time.
#func _ready():
	#spawnLoop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if readyToSpawn == true:
		spawnLoop()

func spawnBubble():
	#print("TRYPOS LOOP EXITED")
	var bubbleInstance = bubbleScene.instantiate()
	add_sibling.call_deferred(bubbleInstance)
	bubbleInstance.position=self.position
	#print(bubbleInstance.global_position)
	MatchData.addBubble(bubbleInstance)
	MatchData.bubbleCount+=1
	
func tryPosition():
	var spawnX = rng.randf_range(677.0, 1312.0)
	var spawnY = rng.randf_range(211.0, 830.0)
	self.position=Vector2(spawnX, spawnY)
	#while self.has_overlapping_bodies()==true:
		#print("BAD POSITION")
		#spawnX = rng.randf_range(677.0, 1312.0)
		#spawnY = rng.randf_range(211.0, 830.0)
		#self.position=Vector2(spawnX, spawnY)

	spawnBubble()

func spawnLoop():
	if MatchData.bubbleCount<MatchData.maxBubbles:
		tryPosition()
		readyToSpawn = false
		await get_tree().create_timer(MatchData.spawnRate).timeout
		readyToSpawn = true

#func spawnSpikes():
	#
	#var spawnX = rng.randf_range(677.0, 1312.0)
	#var spawnY = rng.randf_range(211.0, 830.0)
	#self.position=Vector2(spawnX, spawnY)
	#
	#
	#var spikeInstance = spikeScene.instantiate()
	#add_sibling.call_deferred(spikeInstance)
	#spikeInstance.position=self.position
