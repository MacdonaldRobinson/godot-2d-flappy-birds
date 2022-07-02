extends Node2D

onready var GameOverPopup:Popup = $CanvasLayer/GameOverPopup
signal EndGame

func _ready():
	GameManager.SetPlayer($RedBird)	
	$Camera.target_to_follow = GameManager.Player		
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	
	GameManager.StartGame()
	GameManager.connect("GameOver", self, "_on_GameOver")
	
func _input(event):	
	if Input.is_action_just_pressed("mouse_capture"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		
	if GameManager.CurrentGameState == GameManager.GameState.Started:	
		if event is InputEventScreenTouch and (event as InputEventScreenTouch).pressed:
			flap()

func spawn_random_sprite():
	var obstacles: Array = get_tree().get_nodes_in_group("SpawnSprites")			
	var index = randi()%obstacles.size()

	var new_instance: Node2D = (obstacles[index] as Node2D).duplicate()
	new_instance.global_position = GameManager.Player.global_position
	new_instance.global_position.x += get_viewport_rect().size.x * 5
	new_instance.global_position.y = rand_range(0, get_viewport_rect().size.y)

	add_child(new_instance)
	
func flap():	
	var newVelocity:Vector2 = Vector2(200, -500)
	
	if GameManager.Player.linear_velocity.x > 1000:
		newVelocity.x = 0;
	
	GameManager.Player.apply_central_impulse(newVelocity)
	GameManager.Player.play_jump_sound()

func _on_SpawnSpriteTimer_timeout():
	spawn_random_sprite()

func _on_GameOver():
	GameOverPopup.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)	
