extends Node2D

func _ready():
	GameManager.SetPlayer($RedBird)
	$Camera.target_to_follow = GameManager.Player	
	GameManager.Player.apply_central_impulse(Vector2(500, -800))
	GameManager.StartGame()
	
func spawn_random_sprite():
	var obstacles: Array = get_tree().get_nodes_in_group("SpawnSprites")			
	var index = randi()%obstacles.size()

	var new_instance: Node2D = (obstacles[index] as Node2D).duplicate()
	new_instance.global_position = GameManager.Player.global_position
	new_instance.global_position.x += get_viewport_rect().size.x * 5
	new_instance.global_position.y = rand_range(0, get_viewport_rect().size.y * 2)

	add_child(new_instance)
	
func _process(delta):
	if GameManager.CurrentGameState == GameManager.GameState.Started:				
		if Input.is_action_just_pressed("pressed"):
			GameManager.Player.apply_central_impulse(Vector2(500, -800))

func _on_SpawnSpriteTimer_timeout():
	spawn_random_sprite()
