extends CharacterBody2D
const SPEED = 200
const JUMP_SPEED = -600

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity = velocity + get_gravity() * delta
	
	if Input.is_action_just_pressed("izqda"):
		velocity.x = -SPEED
	elif Input.is_action_just_pressed("der"):
		velocity.x = SPEED
	elif Input.is_action_just_pressed("Salto") and is_on_floor():
		velocity.y = JUMP_SPEED
		
	
	move_and_slide()
	
