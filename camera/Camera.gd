extends Camera2D

onready var target_to_follow:Node2D

func _ready():
	pass # Replace with function body.


func _process(delta):
	if is_instance_valid(target_to_follow):
		global_position.x = target_to_follow.global_position.x - 200
	pass
