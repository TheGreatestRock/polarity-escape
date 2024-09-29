extends CanvasLayer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func set_polarity(polarity: int) -> void:
	match polarity:
		1:
			animated_sprite_2d.animation = "Positive"
		-1:
			animated_sprite_2d.animation = "Negative"
		_:
			animated_sprite_2d.animation = "default"
