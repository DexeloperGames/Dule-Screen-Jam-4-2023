@tool
extends Node3D

@export var rig : Skeleton3D
# Called when the node enters the scene tree for the first time.
func _ready():
	RenderingServer.connect("frame_pre_draw",_draw_frame_pre)
	print("test ready")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw_frame_pre():
#	print(rig)
	if rig == null:
		rig = $"Princess Tytina Armature/Skeleton3D"
	var left_eye_shape = rig.get_bone_pose_rotation(rig.find_bone("Left Eye Shape")).get_euler(EULER_ORDER_XYZ)/PI*180.0-Vector3(90,0,0)
	var left_eye_position = rig.get_bone_pose_rotation(rig.find_bone("Left Eye Position")).get_euler(EULER_ORDER_XYZ)/PI*180.0-Vector3(90,0,0)
	var right_eye_shape = rig.get_bone_pose_rotation(rig.find_bone("Right Eye Shape")).get_euler(EULER_ORDER_XYZ)/PI*180.0-Vector3(90,0,0)
	var right_eye_position = rig.get_bone_pose_rotation(rig.find_bone("Right Eye Position")).get_euler(EULER_ORDER_XYZ)/PI*180.0-Vector3(90,0,0)
	var mouth_shape = rig.get_bone_pose_rotation(rig.find_bone("Mouth Shape")).get_euler(EULER_ORDER_XYZ)/PI*180.0-Vector3(90,0,0)
	
	$"Princess Tytina Armature/Skeleton3D/Princess Tytina Mesh".get_surface_override_material(12).set_shader_parameter("Eye_Shape", right_eye_shape)
	$"Princess Tytina Armature/Skeleton3D/Princess Tytina Mesh".get_surface_override_material(11).set_shader_parameter("Eye_Shape", left_eye_shape)
	$"Princess Tytina Armature/Skeleton3D/Princess Tytina Mesh".get_surface_override_material(12).set_shader_parameter("Eye_Position", right_eye_position)
	$"Princess Tytina Armature/Skeleton3D/Princess Tytina Mesh".get_surface_override_material(11).set_shader_parameter("Eye_Position", left_eye_position)
	$"Princess Tytina Armature/Skeleton3D/Princess Tytina Mesh".get_surface_override_material(8).set_shader_parameter("Mouth_Shape", mouth_shape)
	
#	print(mouth_shape)
	pass
