extends RigidBody2D

class_name Crate
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _integrate_forces(state):
	angular_velocity=0
	rotation_degrees=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
