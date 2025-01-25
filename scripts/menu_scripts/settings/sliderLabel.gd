extends HSlider

@export
var sliderText : Label

@onready var drag_fx = preload("res://audio/sfx/ui/UI_Pluck.wav")

func _on_value_changed(value: float) -> void:
	sliderText.text = str(value)


func _on_drag_started() -> void:
	AudioPlayer.play_FX(drag_fx, 0)
