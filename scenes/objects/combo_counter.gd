extends Node2D
class_name ComboCounter

enum COMBO{
	CURRENT,
	MAX
}

@export var combo_display : COMBO

var current_combo : int = 0
var max_combo : int = 0

var tween : Tween
# Called when the node enters the scene tree for the first time.
func _ready():
	update_combo_label()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_combo_label():
	if combo_display == COMBO.CURRENT:
		$Pivot/Label.text = "COMBO\nx%s"%current_combo
		
	else:
		$Pivot/Label.text = "MAX COMBO\nx%s"%max_combo
	

func animate_text():
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property($Pivot,"scale",Vector2.ONE,0.1).from(Vector2.ONE*1.3).set_ease(Tween.EASE_OUT)

func recieve_player_hit(rating, offset):
	current_combo += 1
	if (combo_display == COMBO.MAX and current_combo > max_combo) or combo_display == COMBO.CURRENT:
		animate_text()
	max_combo = max(max_combo,current_combo)
	update_combo_label()

func recieve_player_miss():
	if combo_display == COMBO.CURRENT and current_combo != 0:
		animate_text()
	current_combo = 0
	update_combo_label()
