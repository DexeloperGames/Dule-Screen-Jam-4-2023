extends Resource
class_name Chart

@export var song : AudioStream
@export var chart_data : Array[Array]

func _init(n_song = AudioStream.new(), n_chart_data = [[],[],[],[]]):
	song = n_song
	chart_data = n_chart_data
