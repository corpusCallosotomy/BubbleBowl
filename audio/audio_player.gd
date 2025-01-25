extends AudioStreamPlayer

const level_music = preload("res://audio/music/MUSIC_mainmenu.wav")

func _play_music(music: AudioStream, volume = -25):
		if stream == music:
			return
			
		stream = music
		volume_db = volume
		play()
		
func play_music_level():
	_play_music(level_music)

func play_FX(stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "fx_player"
	fx_player.volume_db = volume
	fx_player.bus = &"SFX"
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	
	fx_player.queue_free()
