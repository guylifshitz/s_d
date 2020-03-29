extends Node2D

func _ready():
	if global.play_audio == "all":
		$has_sound.show()
		$no_music.hide()
		$no_sound.hide()
	elif global.play_audio == "no_music":
		$has_sound.hide()
		$no_music.show()
		$no_sound.hide()
	else:
		$has_sound.hide()
		$no_music.hide()
		$no_sound.show()
	
	# only_sfx()
	
func _on_Button_button_down():
	if global.play_audio == "all":
		only_sfx()
	elif global.play_audio == "no_music":
		mute_all()
	else:
		play_all()

func only_sfx():
	$has_sound.hide()
	$no_music.show()
	$no_sound.hide()
	global.play_audio = "no_music"
	AudioServer.set_bus_mute(AudioServer.get_bus_index("music"), true)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("sound_effects"), false)

func mute_all():
	$has_sound.hide()
	$no_music.hide()
	$no_sound.show()
	global.play_audio = "none"
	AudioServer.set_bus_mute(AudioServer.get_bus_index("music"), true)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("sound_effects"), true)

func play_all():
	$has_sound.show()
	$no_music.hide()
	$no_sound.hide()
	global.play_audio = "all"
	AudioServer.set_bus_mute(AudioServer.get_bus_index("music"), false)
	AudioServer.set_bus_mute(AudioServer.get_bus_index("sound_effects"), false)
