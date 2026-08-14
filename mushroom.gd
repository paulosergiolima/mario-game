extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.zz
	if not is_on_floor():
		velocity += get_gravity() * delta


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
		velocity.x =  SPEED

	move_and_slide()


func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	
	
	pass # Replace with function body.


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("please tell me god")
	print(body.name)
	if body.name == "Mario":
		print("hello my beloved")
		body.test()
		queue_free()
	pass # Replace with function body.
