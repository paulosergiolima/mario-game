extends CharacterBody2D


@export var JUMP_VELOCITY: float
@export var isBig: bool
@export var isFlower: bool
@export var isStar: bool
var speed = 300
var running = false
var max_speed = 600
var movement = 20
var last_direction

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("running_left", "running_right")
	if Input.is_action_pressed("shift"):
		max_speed = 1200
		movement = 40
	else:
		max_speed = 600
		movement = 20
	if direction and velocity.y == 0:
		#jogador se movendo no chão
		speed = move_toward(speed, max_speed, movement)
		last_direction = direction
		velocity.x = direction * speed
	elif direction and velocity.y != 0:
		#jogador se movendo no ar
		speed = move_toward(speed,max_speed,movement)
		velocity.x = direction * speed
	elif velocity.y == 0 and !direction:
		#jogar parado chão
		speed = 0
		velocity.x = move_toward(velocity.x, 0, movement)
	elif velocity.y != 0:
		velocity.x = move_toward(velocity.x, 0, movement/4)
		speed = 0

	move_and_slide()
func test():
	print("me when I have sex")
	getBig()

func getBig():
	scale.y = 1.5
	pass
