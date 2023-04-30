extends MeshInstance2D
class_name Note

@export var type : int = 0:
	set(n_type):
		type = n_type
		if not is_inside_tree(): await ready
		material.set_shader_parameter("NoteType", type)
@export var hit_time : float = 0.0
@export var parent_track : NoteTrack

# Called when the node enters the scene tree for the first time.
func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if parent_track:
		if parent_track.auto_play and parent_track.song_time >= hit_time:
			visible = false
			process_mode = Node.PROCESS_MODE_DISABLED
			return
			
		if parent_track.song_time > hit_time + Globals.miss_time:
			get_tree().call_group("Player Miss Recievers", "recieve_player_miss")
			parent_track.note_missed(self)
			visible = false
			process_mode = Node.PROCESS_MODE_DISABLED
	pass
