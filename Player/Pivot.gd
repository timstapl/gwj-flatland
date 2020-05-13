extends Position2D

onready var parent = get_parent()

func _ready():
	update_pivot_angle()

func _physics_process(_delta):
	update_pivot_angle()

func update_pivot_angle():
	rotation = parent.lookDirection.angle()