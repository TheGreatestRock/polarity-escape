extends CanvasLayer

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var player: CharacterBody2D = $"../Player"

func _ready() -> void:
	player.switch_polarity()
	player.switch_polarity()

func set_polarity(polarity: int) -> void:
	if animated_sprite_2d:
		match polarity:
			1:
				animated_sprite_2d.animation = "Positive"
			-1:
				animated_sprite_2d.animation = "Negative"
			_:
				animated_sprite_2d.animation = "default"
