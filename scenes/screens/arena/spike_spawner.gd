extends Node2D

var rng = RandomNumberGenerator.new()
var spikeScene = preload("res://scenes/bubbles/SpikeBubble.tscn")


func _ready():
	print("meme")
	print("hello ",MatchData.spikeCount)
	if MatchData.spikeCount==0:
		queue_free()
	else:
		spawnLoop()

func spawnSpike():
	var spikeInstance = spikeScene.instantiate()
	add_sibling.call_deferred(spikeInstance)
	spikeInstance.position=self.position
	
func tryPosition():
	var spawnX = rng.randf_range(677.0, 1312.0)
	var spawnY = rng.randf_range(211.0, 830.0)
	self.position=Vector2(spawnX, spawnY)

	spawnSpike()

func spawnLoop():
	var remainingSpikesToSpawn = MatchData.spikeCount
	while remainingSpikesToSpawn>0:
		tryPosition()
		remainingSpikesToSpawn-=1

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
