extends Resource
class_name AudioSettingsResource

@export var master_volume : float = 1.0

func load_settings():
	var master_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(master_index,linear_to_db(master_volume))
