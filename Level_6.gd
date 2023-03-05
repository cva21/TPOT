extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var puzzleSolved = false 

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	pass # Replace with function body.

func new_game():
	$Player.start($StartPosition.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Boton2.pressed and $Boton.pressed:
		puzzleSolved = true
	else: 
		puzzleSolved = false	
	#Volver atrás en el tiempo
	if Input.is_action_pressed("resetposition"):
		$Player.start($StartPosition.position)
	
	
