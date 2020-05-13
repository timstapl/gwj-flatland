extends KinematicBody2D

export var speed : int = 100
var path : = PoolVector2Array() setget set_path
var lookDirection : = Vector2(1, 0)

func _ready() -> void:
	set_process(false)

func _process(delta : float) -> void:
	var move_distance : = speed * delta
	move_along_path(move_distance)

func move_along_path(distance : float) -> void:
	var start_point : = position
	for _i in range(path.size()):
		var distance_to_next_point : = start_point.distance_to(path[0])
		if distance <= distance_to_next_point and distance >= 0.0:
			move_and_slide(position.direction_to(start_point.linear_interpolate(path[0], distance / distance_to_next_point)) * speed)
			break
		elif path.size() == 1 && distance > distance_to_next_point:
			move_and_slide(position.direction_to(path[0])*speed)
			set_process(false)	
		elif distance < 5:
			print("<5 case hit")
			move_and_slide(Vector2(0,0), Vector2(0,0), true)
		distance -= distance_to_next_point	
		start_point = path[0]
		path.remove(0)

func set_path(value : PoolVector2Array) -> void:
	path = value
	if value.size() == 0:
		return
	set_process(true)
