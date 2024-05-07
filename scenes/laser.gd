extends Area2D

@export var speed = 1000

func _ready():
	$Sprite2D.scale = Vector2 (0,0)
	var tween = create_tween()
	tween.tween_property($Sprite2D, 'scale', Vector2(1.5,1.5), 0.2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta
