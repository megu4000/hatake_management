extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

var speed = 500 # カメラの移動速度

func _process(delta):
	var direction = Vector2.ZERO
	if Input.is_action_pressed("CAMERA_RIGHT"):
		direction.x += 1
	if Input.is_action_pressed("CAMERA_LEFT"):
		direction.x -= 1
	if Input.is_action_pressed("CAMERA_DOWN"):
		direction.y += 1
	if Input.is_action_pressed("CAMERA_UP"):
		direction.y -= 1
	position += direction * speed * delta
