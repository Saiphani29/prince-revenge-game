extends CharacterBody2D

enum State { IDLE, CHASE, ATTACK }
var current_state: State = State.IDLE

@export var speed: float = 150.0
@export var detection_range: float = 400.0
@export var attack_range: float = 50.0

@export var player_node: Node2D

func _physics_process(delta: float) -> void:
	if player_node == null:
		return

	var distance: float = global_position.distance_to(player_node.global_position)

	match current_state:
		State.IDLE:
			if distance < detection_range:
				current_state = State.CHASE

		State.CHASE:
			var direction: Vector2 = global_position.direction_to(player_node.global_position)
			velocity = direction * speed
			move_and_slide()

			if distance < attack_range:
				current_state = State.ATTACK
			elif distance > detection_range:
				current_state = State.IDLE

		State.ATTACK:
			velocity = Vector2.ZERO
			move_and_slide()

			if distance > attack_range:
				current_state = State.CHASE
