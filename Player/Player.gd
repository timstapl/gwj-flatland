extends KinematicBody2D

export var speed : int = 200

var target = Vector2()
var velocity = Vector2()

func _ready():
	# Prevent player from moving on scene start
	target = self.position

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.pressed:
		target = event.position

func _physics_process(_delta):
	velocity = position.direction_to(target) * speed
	if position.distance_to(target) > 5:
		velocity = move_and_slide(velocity)
