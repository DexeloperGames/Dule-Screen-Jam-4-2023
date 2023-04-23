extends Node2D
class_name NoteTrack

@export var notes : Array
@export var song_time : float = 0.0
@export var note_scene : PackedScene = preload("res://note.tscn")
@export var track_type : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$Scaler.scale.y = Globals.scroll_speed
	pass # Replace with function body.

func load_notes(note_data):
	for time in note_data:
		var new_note = note_scene.instantiate()
		new_note.hit_time = time
		new_note.type = track_type
		$Scaler/Scroller.add_child(new_note)
		new_note.position.y = time*1000.0
		new_note.scale.y = 1.0/Globals.scroll_speed
		notes.append(new_note)
		new_note.parent_track = self
		new_note.type = track_type
		pass
	notes.sort_custom(func(a,b): return a.hit_time < b.hit_time)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Scaler/Scroller.position.y = -song_time*1000.0
	
	var closest : Note = find_closest_note()
	if closest:
		closest.process_mode = Node.PROCESS_MODE_INHERIT
		
	pass

func find_closest_note():
	var search_idx_0 = notes.bsearch_custom(song_time,func(a,b): return a.hit_time<b, true)
	var search_idx_1 = notes.bsearch_custom(song_time,func(a,b): return a.hit_time<b, true)-1
	if notes.is_empty(): return
	if search_idx_0 < len(notes) and search_idx_1 < len(notes):
		return notes[search_idx_0] if abs(notes[search_idx_0].hit_time) < abs(notes[search_idx_1].hit_time) else notes[search_idx_1]
	if min(search_idx_0,search_idx_1) < len(notes):
		return notes[min(search_idx_0,search_idx_1)]
	return

func note_missed(note):
	if note in notes:
		notes.erase(note)
		note.visible = false
		note.process_mode = Node.PROCESS_MODE_DISABLED

func _track_input(event : InputEvent):
	print("TRACK GOT INPUT ", track_type)
	if event.is_pressed():
		var closest = find_closest_note()
		if closest != null:
			print("found closest note: ", closest.hit_time)
			var offset_time = abs(closest.hit_time-(song_time-Globals.offset))
			print("song time ", song_time)
			print("offset_time ", offset_time)
			if offset_time<Globals.miss_time:
				if offset_time<Globals.good_hit_time:
					print("that's a hit "+"<"+"-".repeat(20))
					var hit_rating = 1
					if offset_time<Globals.great_hit_time:
						hit_rating = 2
					if offset_time<Globals.nautical_hit_time:
						hit_rating = 3
					get_tree().call_group("Player Hit Recievers","recieve_player_hit", hit_rating, closest.hit_time-(song_time-Globals.offset))
					pass
				else:
					print("missed lol")
					get_tree().call_group("Player Miss Recievers", "recieve_player_miss")
				note_missed(closest)
	pass
