extends Area2D

export(NodePath) onready var player = get_node(player)
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_Key_body_entered(body):
	if body == player:
		visible = false
		set_collision_mask_bit(0,false)
		player.hasKey = true
		print("key picked up")
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
