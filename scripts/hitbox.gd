extends Area2D

@export var damage: int = 10

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		var health_comp = body.get_node_or_null("HealthComponent")
		if health_comp and health_comp.has_method("take_damage"):
			health_comp.take_damage(damage)
