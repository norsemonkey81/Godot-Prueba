extends CharacterBody2D
const SPEED = 200
const JUMP_SPEED = -400
@onready var animated_sprite = $AnimatedSprite2D
var jumpCont=3;


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity = velocity + get_gravity() * delta

#Si personaje esta en el suelo, el contador de saltos se iguala a 0
# y va aumentando 1 cada vez que pulsas la tecla de salto hasta 3, 
# en cuanto llega a 3 el personaje pierde la capacidadd de salto hasta tocar suelo
	if is_on_floor():
		jumpCont=0;
	if Input.is_action_just_pressed("Salto") and jumpCont<3:
		velocity.y = JUMP_SPEED 
		jumpCont+=1

	if Input.is_action_pressed("izqda"):
		velocity.x = -SPEED

#animated_sprite.flip_h =true indica que al presionar la tecla
#designada como "izqda" el sprite cambia su orientacion horizontalmente
#siempre que se encuentre en "true"

		animated_sprite.flip_h = true
	elif Input.is_action_pressed("der"):
		velocity.x = SPEED
		animated_sprite.flip_h = false
	else:
		velocity.x = 0
	
	if is_on_floor():
		
#Cuando la velocidad !=0, inicia la animacion designada como "Walk"
		if velocity.x != 0:
			animated_sprite.play("Walk")
			
#Cuando la velocidad =0, inicia la animacion designada como "Idle"
		else:
			animated_sprite.play("Idle")

#Si ninguna la velocidad =0 y se presiona la tecla "Salto" inicia la animacion
#"Jump"
#Si la velocidad es !=0 entonces al pulsar "Salto", se conserva la animacion 
#"Walk"
	else:
		animated_sprite.play("Jump")
		
	move_and_slide()
