extends Area2D

var isOverDoor := false
var isLocked := true

var teleportState = 0
export(NodePath) onready var main_scene = get_node(main_scene)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Door_body_entered(body):
	isOverDoor = true
func _on_Door_body_exited(body):
	isOverDoor = false
func _on_NearDoor_body_entered(body):
	if main_scene.puzzleSolved:
		$AnimatedSprite.play("open")
		isLocked = false
			
func _physics_process(delta):
	if isOverDoor and main_scene.puzzleSolved and Input.is_action_just_pressed("open_door"):
		$AnimatedSprite.play("open")
		print(int(main_scene.get_tree().current_scene.name)+1)
		main_scene.get_tree().change_scene("res://Level_" + str(int(main_scene.get_tree().current_scene.name)+1)+".tscn")
		
