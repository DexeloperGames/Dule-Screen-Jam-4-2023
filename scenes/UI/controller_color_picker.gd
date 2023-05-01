@tool
extends HBoxContainer


@export var color : Color

@export var hue_slider : Slider
@export var saturation_slider : Slider
@export var value_slider : Slider

signal color_changed(color: Color)
# Called when the node enters the scene tree for the first time.
func _ready():
	hue_slider.set_value_no_signal(color.h)
	saturation_slider.set_value_no_signal(color.s)
	value_slider.set_value_no_signal(color.v)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_sliders():
	hue_slider.set_value_no_signal(color.h)
	saturation_slider.set_value_no_signal(color.s)
	value_slider.set_value_no_signal(color.v)

func update_color():
	color.h = hue_slider.value
	color.s = saturation_slider.value
	color.v = value_slider.value
	saturation_slider.material.set_shader_parameter("Color", Color.from_hsv(hue_slider.value,1.0,1.0))
	emit_signal("color_changed", color)

func _on_hue_slider_value_changed(value):
#	color.h = value
	update_color()
	
	pass # Replace with function body.


func _on_saturation_slider_value_changed(value):
#	color.s = value
	update_color()
	pass # Replace with function body.


func _on_value_slider_value_changed(value):
#	color.v = value
	update_color()
	pass # Replace with function body.
