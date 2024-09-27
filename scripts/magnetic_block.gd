extends RigidBody2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body, collision_layer, collision_mask)
	collision_layer = 3

func _on_area_2d_body_exited(body: Node2D) -> void:
	print(body, collision_layer, collision_mask)
	collision_layer = 2
