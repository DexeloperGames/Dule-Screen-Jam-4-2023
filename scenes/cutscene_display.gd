extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Cutscene directed by Steven Spielburg")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_game_cutscene_visibility_changed():
	$"Game Cutscene/VBoxContainer/AspectRatioContainer/SubViewportContainer/SubViewport/Cutscene ig".start_animation()
	pass # Replace with function body.


func _on_animation_player_animation_finished(anim_name):
	get_tree().call_group("DS Display Manager", "switch_to_text_cutscene")
	pass # Replace with function body.
