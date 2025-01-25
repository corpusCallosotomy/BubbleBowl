extends CheckButton

@onready var click_fx = preload("res://audio/sfx/ui/UI_bop.wav")

func _on_toggled(toggled_on: bool) -> void:
	AudioPlayer.play_FX(click_fx, -12)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), toggled_on)
