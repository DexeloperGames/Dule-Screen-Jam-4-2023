extends Resource
class_name GameplaySettingsResource

@export var scroll_speed : float = 1.0
@export var offset : float = 0
@export var scroll_direction : float = 1.0

@export var note_colors : Array[Color] = [Color.DEEP_SKY_BLUE, Color.BLUE, Color.BLUE, Color.DEEP_SKY_BLUE]

func load_settings():
	for i in range(len(note_colors)):
		var note_string = "Note%sColor"%i
		print("trying to set the thing of ", note_string)
		RenderingServer.global_shader_parameter_set("Note%sColor"%i,note_colors[i])
