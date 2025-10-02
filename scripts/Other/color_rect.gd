extends ColorRect
var fadeMode = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fadeMode == 0:
		if modulate.a > 0:
			modulate.a -= delta*100/255
	else:
		if modulate.a < 256:
			modulate.a += delta*100/255


func _on_audio_stream_player_2d_finished() -> void:
	fadeMode = 1 # Replace with function body.
