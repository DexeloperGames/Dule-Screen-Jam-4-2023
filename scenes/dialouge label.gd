extends Label

@export var lines : Array[String]
@export var line_index : int = 0

var tween : Tween
# Called when the node enters the scene tree for the first time.
func _ready():
	_next_line()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _next_line():
	if line_index >= len(lines):
		get_tree().call_group("DS Display Manager", "switch_to_gameplay")
	else:
		text = lines[line_index]
		line_index += 1
		visible_ratio = 0.0
		if tween:
			tween.kill()
		tween = create_tween()
		tween.tween_property(self, "visible_ratio",1.0, 30.0/60)

func _input(event):
	if event.is_action_pressed("ui_accept"):
		_next_line()
