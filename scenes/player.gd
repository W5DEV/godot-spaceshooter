extends CharacterBody2D

@export var speed := 600
var can_shoot: bool = true

signal laser(pos)


# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(960, 900)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

	# shoot input - *just* makes it "semi-auto". Remove *just* to make full auto
	if Input.is_action_pressed("fire") and can_shoot:
		laser.emit($LaserStartPos.global_position)
		can_shoot = false
		$LaserTimer.start()
		$LaserSound.play()
	
func play_collision_sound():
	$DamageSound.play()
	
func _on_laser_timer_timeout():
	can_shoot = true
