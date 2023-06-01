extends Node2D

class_name Health_Component

@export var MaxHealth: float

var CurrentHealth: float



# Called when the node enters the scene tree for the first time.
func _ready():
	print("HealthComponent Entered Scene Tree")
	initializeHealth()
	
	# This signal is connected to the global event manager which contains the
	# "healthUpdate Signal. updateCurrentHealth is a Callable and healthUpdate
	# unwraps with the argument for updateCurrentHealth
	Events.healthUpdate.connect(updateCurrentHealth)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func updateCurrentHealth(delta):
	CurrentHealth = min(CurrentHealth + delta, MaxHealth)
	

func getCurrentHealth():
	return CurrentHealth


func initializeHealth():
	CurrentHealth = MaxHealth
