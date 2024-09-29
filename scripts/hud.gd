extends CanvasLayer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	if PlayerManager:
		if PlayerManager.get_polarity() != 0:
			set_polarity(1)

func set_polarity(polarity: int) -> void:
	if animated_sprite_2d:
		match polarity:
			1:
				animated_sprite_2d.animation = "Positive"
			-1:
				animated_sprite_2d.animation = "Negative"
			_:
				animated_sprite_2d.animation = "default"
