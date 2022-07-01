extends RigidBody2D
class_name Player

onready var jump_sounds: AudioStreamPlayer = $Jump

func _ready():
	pass

func _process(delta):
	pass

func play_jump_sounds():
	jump_sounds.play()
