extends Node2D

var pauseMenuScene = preload("res://scenes/screens/menus/PauseScreen.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if get_tree().paused==false:
			var pauseInstance = pauseMenuScene.instantiate()
			add_child.call_deferred(pauseInstance)
			Engine.time_scale = 0
			get_tree().paused=true
