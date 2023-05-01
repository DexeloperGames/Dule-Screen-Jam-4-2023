extends Control


@export var settings_container : Control
@export var playfield : Node
@export var color1_picker : Node
@export var color2_picker : Node
@export var color3_picker : Node
@export var color4_picker : Node
@export var vertical_flip_checkbox : CheckBox
@export var scroll_speed_slider : HSlider
@export var volume_slider : HSlider
# Called when the node enters the scene tree for the first time.
func _ready():
	color1_picker.color = Globals.Settings.Gameplay.note_colors[0]
	color2_picker.color = Globals.Settings.Gameplay.note_colors[1]
	color3_picker.color = Globals.Settings.Gameplay.note_colors[2]
	color4_picker.color = Globals.Settings.Gameplay.note_colors[3]
	color1_picker.update_sliders()
	color2_picker.update_sliders()
	color3_picker.update_sliders()
	color4_picker.update_sliders()
	scroll_speed_slider.value = Globals.Settings.Gameplay.scroll_speed
#	vertical_flip_checkbox.pressed = (Globals.Settings.Gameplay.scroll_direction < 0)
	vertical_flip_checkbox.set_pressed_no_signal((Globals.Settings.Gameplay.scroll_direction < 0))
	volume_slider.set_value_no_signal(Globals.Settings.Audio.master_volume)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action("toggle_gameplay_settings_ui"):
		settings_container.modulate.a = float(!event.is_pressed())

func _on_color_1_color_changed(color):
	RenderingServer.global_shader_parameter_set("Note0Color", color)
	Globals.Settings.Gameplay.note_colors[0] = color
	Globals.Settings.save()
	pass # Replace with function body.


func _on_color_2_color_changed(color):
	RenderingServer.global_shader_parameter_set("Note1Color", color)
	Globals.Settings.Gameplay.note_colors[1] = color
	Globals.Settings.save()
	pass # Replace with function body.


func _on_color_3_color_changed(color):
	RenderingServer.global_shader_parameter_set("Note2Color", color)
	Globals.Settings.Gameplay.note_colors[2] = color
	Globals.Settings.save()
	pass # Replace with function body.


func _on_color_4_color_changed(color):
	RenderingServer.global_shader_parameter_set("Note3Color", color)
	Globals.Settings.Gameplay.note_colors[3] = color
	Globals.Settings.save()
	pass # Replace with function body.


func _on_sroll_speed_slider_value_changed(value):
	Globals.Settings.Gameplay.scroll_speed = value
	Globals.Settings.save()
	playfield.reload_settings()
	pass # Replace with function body.


func _on_flip_vertically_check_box_toggled(button_pressed):
	Globals.Settings.Gameplay.scroll_direction = -1 if button_pressed else 1
	Globals.Settings.save()
	playfield.reload_settings()
	pass # Replace with function body.


func _on_h_slider_value_changed(value):
	Globals.Settings.Audio.master_volume = value
	Globals.Settings.Audio.load_settings()
	pass # Replace with function body.


func _on_back_button_pressed():
	get_tree().call_group("DS Display Manager", "switch_to_main_menu")
	pass # Replace with function body.
