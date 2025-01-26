extends Button

@export_file
var nextScene # returns a PackedScene

@export
var sfxSound : AudioStreamPlayer
@onready var transition_fx = preload("res://audio/sfx/ui/UI_Select.wav")

func _on_pressed() -> void:
	AudioPlayer.play_FX(transition_fx, 0)
	MatchData.resetScores()
	get_tree().change_scene_to_file(nextScene)
