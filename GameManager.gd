extends Node

var Player: Player
var CurrentGameState = GameState.NotStarted
signal GameOver

enum GameState {
	NotStarted	
	Started,
	Ended,
}

func SetPlayer(player:Player):
	Player = player

func StartGame():
	CurrentGameState = GameState.Started

func EndGame():
	CurrentGameState = GameState.Ended
	emit_signal("GameOver")

