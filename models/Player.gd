extends CharacterBody3D


const SPEED = 15.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _input(event):
	if event is InputEventMouse:
		pass

func _physics_process(delta):
	if Input.is_action_pressed("player_move_left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("player_move_right"):
		position.x += SPEED * delta
	if Input.is_action_pressed("player_move_forwards"):
		position.z -= SPEED * delta
	if Input.is_action_pressed("player_move_backwards"):
		position.z += SPEED * delta

	move_and_slide()
	
func jump():
	pass
