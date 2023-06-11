extends CharacterBody3D


const SPEED = 15.0
const JUMP_VELOCITY = 4.5
@export_range(0.0, 1.0) var sensitivity: float = 0.25

# Mouse state
var _mouse_position = Vector2(0.0, 0.0)
var _total_pitch = 0.0

# Movement state
var _direction = Vector3(0.0, 0.0, 0.0)
var _velocity = Vector3(0.0, 0.0, 0.0)
var _acceleration = 30
var _deceleration = -10
var _vel_multiplier = 4

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _process(delta):
	_update_mouselook()
	_update_movement(delta)

func _input(event):
	if event is InputEventMouse:
		#_mouse_position = event.
		pass
	
func jump():
	pass

func _update_movement(delta):
	if Input.is_action_pressed("player_move_left"):
		position.x -= SPEED * delta
	if Input.is_action_pressed("player_move_right"):
		position.x += SPEED * delta
	if Input.is_action_pressed("player_move_forwards"):
		position.z -= SPEED * delta
	if Input.is_action_pressed("player_move_backwards"):
		position.z += SPEED * delta

func _update_mouselook():
	# Only rotates mouse if the mouse is captured
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		_mouse_position *= sensitivity
		var yaw = _mouse_position.x
		var pitch = _mouse_position.y
		_mouse_position = Vector2(0, 0)
		
		# Prevents looking up/down too far
		pitch = clamp(pitch, -90 - _total_pitch, 90 - _total_pitch)
		_total_pitch += pitch
	
		rotate_y(deg_to_rad(-yaw))
		rotate_object_local(Vector3(1,0,0), deg_to_rad(-pitch))
