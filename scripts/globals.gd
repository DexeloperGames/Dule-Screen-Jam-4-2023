extends Node

@export var miss_time = 101/1000.0
@export var good_hit_time = 100/1000.0
@export var great_hit_time = 32/1000.0
@export var nautical_hit_time = 16/1000.0

@export var Settings : SettingsResource = SettingsResource.new()

@export var SettingsPath : String = "user://settings.tres"

# Called when the node enters the scene tree for the first time.
func _ready():
	var file_settings = SettingsResource.load_from()
	if file_settings:
		Settings = file_settings
	Settings.load_settings()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
