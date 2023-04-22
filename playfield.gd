extends Node2D

@export var notetrack0 : NoteTrack
@export var notetrack1 : NoteTrack
@export var notetrack2 : NoteTrack
@export var notetrack3 : NoteTrack
# Called when the node enters the scene tree for the first time.
var thing_time = 3.0
var time = 0
var stupid_thing = false
func _ready():
	notetrack0.load_notes([0.0, 1.0, 2.0, 3.0, 3.75, 4.5, 5.0, 6.0, 6.5, 7.0, 7.75, 8.4375, 8.875, 9.375, 9.75, 10.25, 10.75, 11.5, 12.5, 13.5, 14.5, 15.5, 16.25, 16.625, 17.0, 17.5, 17.875, 18.25, 18.625, 19.25, 20.125, 20.625, 21.25, 22.125, 22.5625, 22.875, 23.375, 23.8125, 24.0625, 24.5625, 25.0625, 25.5625, 26.125, 26.625, 27.25])
	notetrack1.load_notes([0.25, 1.25, 2.25, 3.25, 4.125, 4.625, 5.25, 6.125, 6.625, 7.25, 8.0625, 8.5, 9.0, 9.4375, 9.875, 10.375, 10.875, 11.75, 12.75, 13.75, 14.75, 15.75, 16.375, 16.6875, 17.125, 17.625, 17.9375, 18.375, 18.75, 19.5, 20.25, 20.75, 21.5, 22.25, 22.625, 23.0, 23.5, 23.875, 24.125, 24.625, 25.125, 25.625, 26.25, 26.75, 27.5])
	notetrack2.load_notes([0.5, 1.5, 2.5, 3.5, 4.25, 4.75, 5.5, 6.25, 6.75, 7.5, 8.25, 8.625, 9.0625, 9.5, 9.875, 10.5, 11.0, 11.75, 13.0, 14.0, 15.0, 15.75, 16.5, 16.75, 17.25, 17.75, 17.9375, 18.4375, 18.875, 19.75, 20.375, 20.875, 21.75, 22.375, 22.6875, 23.125, 23.625, 23.9375, 24.1875, 24.6875, 25.1875, 25.6875, 26.375, 26.875, 27.75])
	notetrack3.load_notes([0.75, 1.75, 2.75, 3.75, 4.375, 4.875, 5.75, 6.375, 6.875, 7.75, 8.375, 8.75, 9.25, 9.625, 10.125, 10.625, 11.25, 12.25, 13.25, 14.25, 15.25, 16.125, 16.5625, 16.875, 17.375, 17.8125, 18.0625, 18.5, 19.0, 20.0, 20.5, 21.0, 21.75, 22.5, 22.75, 23.25, 23.75, 24.0, 24.5, 25.0, 25.5, 26.0, 26.5, 27.0])
#	$AudioStreamPlayer.play(-3.0)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	if time > thing_time and not stupid_thing:
		$AudioStreamPlayer.play()
		stupid_thing = true
	update_track_times()
	pass

func update_track_times():
	var current_time = (Time.get_ticks_usec()/1.0e+6)-thing_time
	current_time = $AudioStreamPlayer.get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
	notetrack0.song_time = current_time
	notetrack1.song_time = current_time
	notetrack2.song_time = current_time
	notetrack3.song_time = current_time
	pass

func _input(event):
	if event.is_action("note_0"):
		$Icon0.modulate = Color.MAGENTA if event.is_pressed() else Color.WHITE
		notetrack0._track_input(event)
	if event.is_action("note_1"):
		$Icon1.modulate = Color.CYAN if event.is_pressed() else Color.WHITE
		notetrack1._track_input(event)
	if event.is_action("note_2"):
		$Icon2.modulate = Color.GREEN if event.is_pressed() else Color.WHITE
		notetrack2._track_input(event)
	if event.is_action("note_3"):
		$Icon3.modulate = Color.RED if event.is_pressed() else Color.WHITE
		notetrack3._track_input(event)

func recieve_player_hit(hit_rating):
	print("yay hit! ", hit_rating)