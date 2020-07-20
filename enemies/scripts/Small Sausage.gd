extends KinematicBody2D

var level

func _ready():
	level = get_parent()

func _process(delta):
	$"AnimatedSprite".play()

func _on_Area2D_area_entered(area):
	queue_free()
	randomize()
	var rng = int(rand_range(1, 101))
	print(rng)
	if rng >= 1 and rng <= 10:
		dropitem()

func dropitem():
	randomize()
	var rng = int(rand_range(1, 5))
	var drop
	if rng == 1:
		drop = load("res://pickups/Extra Health.tscn")
	elif rng == 2:
		drop = load("res://pickups/Blueberry Upgrade.tscn")
	elif rng == 3:
		drop = load("res://pickups/Lemon Upgrade.tscn")
	elif rng == 4:
		drop = load("res://pickups/Raspberry Upgrade.tscn")
	var dropinstance = drop.instance()
	dropinstance.position = get_global_position()
	level.add_child(dropinstance)
	level.move_child(dropinstance, 0)
