extends Area2D

@export var speed = 300
var screen_size
var i = false
var camera

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	camera = $Camara  # Ajusta la ruta según la jerarquía de nodos de tu escena

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite2D.play()
	
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x == 0 && velocity.y == 0:
		$AnimatedSprite2D.flip_h = i
		$AnimatedSprite2D.animation = "Idle"
		
	elif velocity.x != 0:
		$AnimatedSprite2D.animation = "Caminar"
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
		if velocity.x < 0:
			i = true
		else: 
			i = false
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "Idle"
	





