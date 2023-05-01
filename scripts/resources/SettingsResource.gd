extends Resource
class_name SettingsResource

@export var Gameplay : GameplaySettingsResource = GameplaySettingsResource.new()
@export var Audio : AudioSettingsResource = AudioSettingsResource.new()


func _init():
	pass

func save(path : String = Globals.SettingsPath):
	prints("Saving settings to path:", path)
	ResourceSaver.save(self, path)

static func load_from(path : String = Globals.SettingsPath):
	if ResourceLoader.exists(path):
		return ResourceLoader.load(path)
	else: return null

func load_settings():
	Gameplay.load_settings()
	Audio.load_settings()
