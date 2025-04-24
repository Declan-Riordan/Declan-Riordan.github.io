extends Control
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var texture_button: TextureButton = $MarginContainer/MarginContainer/Control/TextureButton
@onready var og_position = texture_button.position
const DOWN_ARROW = preload("res://assets/down-arrow.png")
const UP_ARROW = preload("res://assets/up-arrow.png")
var hovering: bool = false
var state = false # true = expanded
var tween


func _on_texture_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		state = true
		animation_player.play("expand")
		texture_button.texture_normal = UP_ARROW
	else:
		state = false
		animation_player.play_backwards("expand")
		await animation_player.animation_finished
		texture_button.texture_normal = DOWN_ARROW


func _on_texture_button_mouse_entered() -> void:
	tween = create_tween()
	tween.tween_property(texture_button, "scale", Vector2(1.25, 1.25), 0.075).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	if state:
		tween.tween_property(texture_button, "position", og_position + Vector2(0, -3), 0.075).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	else:
		tween.tween_property(texture_button, "position", og_position + Vector2(0, 3), 0.075).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

func _on_texture_button_mouse_exited() -> void:
	tween = create_tween()
	tween.tween_property(texture_button, "scale", Vector2(1, 1), 0.075).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	if state:
		tween.tween_property(texture_button, "position", og_position - Vector2(0, -3), 0.075).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	else:
		tween.tween_property(texture_button, "position", og_position - Vector2(0, 3), 0.075).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
