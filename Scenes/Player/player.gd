extends CharacterBody2D

const MAX_SPEED = 125

const ACCELERATION_SMOOTHING = 25

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var movement_vector = get_movement_vector()
	var direction = movement_vector.normalized()
	var target_velocity = direction * MAX_SPEED
	
	velocity = velocity.lerp(target_velocity, 1 - exp(-delta * ACCELERATION_SMOOTHING))
	
	move_and_slide()

func get_movement_vector():
	var x_movement = Input.get_action_strength("Move_right") - Input.get_action_strength("Move_left")
	var y_movement = Input.get_action_strength("Move_down") - Input.get_action_strength("Move_up")
	
	return Vector2(x_movement, y_movement)
