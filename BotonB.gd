extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(NodePath) onready var columna = get_node(columna)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Superior_body_entered(body):
		
		$AnimatedSprite.play("pushed")
		columna.cerrarB()
		remove_child($Superior)
		
	
