extends Control
@onready var scroll_container: ScrollContainer = $ScrollContainer
@onready var about_me: VBoxContainer = $ScrollContainer/Page/Contents/Content/AboutMe
@onready var projects: VBoxContainer = $ScrollContainer/Page/Contents/Content/Projects
@onready var experience: VBoxContainer = $ScrollContainer/Page/Contents/Content/Experience
@onready var references: VBoxContainer = $ScrollContainer/Page/Contents/Content/References


func move_to_section(section):
	var tween = get_tree().create_tween()
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.set_trans(Tween.TRANS_QUAD)
	tween.tween_property(scroll_container, "scroll_vertical", section.position.y - 125, 0.4)


func _on_about_me_pressed() -> void:
	move_to_section(about_me)


func _on_game_dev_pressed() -> void:
	move_to_section(projects)


func _on_resume_pressed() -> void:
	move_to_section(experience)


func _on_references_pressed() -> void:
	move_to_section(references)
