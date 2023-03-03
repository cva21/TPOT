extends Area2D

var isOverDoor := false
var isLocked := true

var teleportState = 0
export(NodePath) onready var player = get_node(player)
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
	if player.hasKey:
		$AnimatedSprite.play("closed")
		isLocked = false
			
func _physics_process(delta):
	if isOverDoor and player.hasKey and Input.is_action_just_pressed("move_right"):
		$AnimatedSprite.play("open")
		#TODO: Cambiar de nivel
		#get_tree().change_scene("res://Nivel_" + str(int(get_tree().current_scene.name)+1)+".tscn")
		

func teleport():
	match teleportState:
		0:
			#personaje invisible
			pass
		1:
			#cargar siguiente nivel
			pass
		2:
			#abrir la otra puerta
			pass
		3:
			#hacer jugador visble
			pass
