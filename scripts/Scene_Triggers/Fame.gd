extends ColorRect

func fade_in(duration: float = 1.0) -> void:
	modulate.a = 1.0
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 0.0, duration)
	await tween.finished

func fade_out(duration: float = 1.0) -> void:
	modulate.a = 0.0
	var tween := create_tween()
	tween.tween_property(self, "modulate:a", 1.0, duration)
	await tween.finished
