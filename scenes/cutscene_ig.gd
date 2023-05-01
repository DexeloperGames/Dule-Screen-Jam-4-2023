#@tool
extends Node3D

@export var thingtest : Callable = start_animation

# Called when the node enters the scene tree for the first time.
func _ready():
#	start_animation()
	pass # Replace with function body.

func start_animation():
	print("yeahah")
	$camra/AnimationPlayer.play("CameraAction")
	$tytina1/AnimationPlayer.play("Princess Tytina ArmatureAction")
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	get_tree().call_group("DS Display Manager", "switch_to_main_menu")
	pass # Replace with function body.
