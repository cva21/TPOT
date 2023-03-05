extends KinematicBody2D

const UP_DIRECTION := Vector2.UP

export var speed := 600.0

export var jump_strength := 2000.0
export var maximum_jumps := 2
export var double_jump_strength := 1500.0
export var gravity := 4500.0


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screen_size
var _jumps_made := 0
var _velocity := Vector2.ZERO
var hasKey := false
var numberofclocks := 0

func _ready():
	screen_size = get_viewport_rect().size #Find size of window
	hide()
	pass # Replace with function body.
	
func _physics_process(delta: float)-> void:
	var _horizontal_direction = (
		Input.get_action_strength("move_right")
		- Input.get_action_strength("move_left")
	)
	
	_velocity.x = _horizontal_direction * speed
	_velocity.y += gravity * delta
	# variables ejemplo para animaciones
	var is_falling := _velocity.y > 0.0 and not is_on_floor()
	var is_jumping := Input.is_action_just_pressed("move_up") and is_on_floor()
	var is_jump_cancelled := Input.is_action_just_released("move_up") and _velocity.y < 0.0
	var is_double_jumping := Input.is_action_just_pressed("move_up") and is_falling
	var is_idling := is_on_floor() and is_zero_approx(_velocity.x)
	var is_running := is_on_floor() and not is_zero_approx(_velocity.x)
	
	
	if is_jumping:
		_jumps_made += 1
		_velocity.y = -jump_strength
	elif is_jump_cancelled:
		_velocity.y = 0.0
	elif is_idling or is_running:
		_jumps_made = 0
	elif is_double_jumping:
		_jumps_made += 1
		if _jumps_made <= maximum_jumps:
			_velocity.y = -double_jump_strength
			
	if _velocity.length() > 0:
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	if is_running or is_jumping or is_double_jumping: 
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = _velocity.x < 0
		if $Timer.time_left <= 0:
			$WalkingSound.play()
			$Timer.start(6)
	elif is_idling:
		$AnimatedSprite.stop()
			
	_velocity = move_and_slide(_velocity, UP_DIRECTION,false,4,0.785398,false)
	
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		#Si es una caja lo movemos
		if collision.collider is Crate:
			collision.get_collider().apply_central_impulse(-collision.normal * 20)
			$MovingBox.play()
			


# Called when the node enters the scene tree for the first time.

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
