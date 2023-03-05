extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var pressed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




func _on_Superior_body_exited(body):
	print($Superior.get_overlapping_bodies().size() )
	if $Superior.get_overlapping_bodies().size() <= 1:
		$Superior/ParteSuperior.disabled = true
		$AnimatedSprite.play("not")
		pressed = false


func _on_Superior_body_entered(body):
	print($Superior.get_overlapping_bodies().size() )
	if $Superior.get_overlapping_bodies().size() <= 1:
		$Superior/ParteSuperior.disabled = true
		$AnimatedSprite.play("pushed")
		pressed = true
	
