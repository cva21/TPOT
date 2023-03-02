extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	pass # Replace with function body.

func new_game():
	$box.start($positionbox.position)
	$Player.start($StartPosition.position)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $box.position.y > $Player.position.y:
		print($Player.position.y)
		print($box.position.y)
