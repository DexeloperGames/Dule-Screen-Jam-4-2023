extends Node2D

@export var judgement_colors : Array[Color] = [Color.RED,Color.GREEN,Color.WHITE,Color.CYAN]
@export var judgement_text : Array[String] = ["Miss -_-", "Good", "Great!", "Nautical!!"]
var tween : Tween
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func animate_judgement():
	if tween:
		tween.kill()
	tween = create_tween()
	
	tween.tween_property($Pivot,"scale",Vector2.ONE,10.0/60.0).from(Vector2.ONE*1.3).set_trans(Tween.TRANS_ELASTIC)
	#tween.tween_property(self, "rotation", 2*PI, 1)
	#tween.tween_callback(func(): print("yo tween stop tho"))

func recieve_player_hit(rating, offset):
	$Pivot/Label.modulate = judgement_colors[rating]
	$Pivot/Label.text = judgement_text[rating]
	animate_judgement()
	pass

func recieve_player_miss():
	$Pivot/Label.modulate = judgement_colors[0]
	$Pivot/Label.text = judgement_text[0]
	pass
