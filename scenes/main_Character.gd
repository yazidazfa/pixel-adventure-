extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -600.0
@onready var sprite_2d = $Sprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	#facing animation
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "run"
	else:
		sprite_2d.animation = "idle"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		sprite_2d.animation = "jump"
		

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite_2d.animation = "jump"
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 50)

	move_and_slide()

	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft
<<<<<<< HEAD
# CHECK APAKAH BISA
=======
>>>>>>> 74cdbcaf89e7206170fc1fef4a7ad3b469fbad03
