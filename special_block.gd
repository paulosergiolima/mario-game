extends StaticBody2D

const mush = preload("res://mushroom.tscn")
var blocked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if not blocked:
		spawn_mushroom()
	blocked = true
	
	pass # Replace with function body.

func spawn_mushroom() -> void:
	var mushroom_instance = mush.instantiate();
	mushroom_instance.global_position = global_position + Vector2(0,-50.0)
	add_sibling(mushroom_instance)
	
