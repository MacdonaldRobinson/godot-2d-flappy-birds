extends RigidBody2D
class_name Player

onready var jump_sound: AudioStreamPlayer = $Jump
onready var impact_sound: AudioStreamPlayer = $Impact
onready var animations:AnimatedSprite = $Animations

func _ready():
	animations.play("Flapping")

func _process(delta):
	if GameManager.CurrentGameState == GameManager.GameState.Started:
		for body in self.get_colliding_bodies():
			var collider = body as Node2D
			if collider.is_in_group("Obstacle"):				
				animations.play("Dead")
				impact_sound.play()
				GameManager.EndGame()

func play_jump_sound():
	jump_sound.play()
	
func play_impact_sound():
	impact_sound.play()

