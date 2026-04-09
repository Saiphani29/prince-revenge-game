extends RigidBody2D

@export var punch_force: float = 800.0

func _ready() -> void:
	linear_damp = 20.0

func apply_power_punch(direction: Vector2) -> void:
	apply_central_impulse(direction * punch_force)
