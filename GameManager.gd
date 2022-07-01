extends Node

var Player: Player
var CurrentGameState = GameState.NotStarted

enum GameState {
	NotStarted	
	Started,
	Ended,
}

func SetPlayer(player:Player):
	Player = player

func StartGame():
	CurrentGameState = GameState.Started

