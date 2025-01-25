extends Button

@export_file
var nextScene # returns a PackedScene

func _on_pressed() -> void:
	get_tree().change_scene_to_file(nextScene)
