extends KinematicBody2D

var velocity = Vector2()
var speed = 100
var jump = -200
var gravity = 300

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed

func _physics_process(delta):
	get_input()
	
	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump
	print_debug(velocity.y)
	
	
# Called when the node enters the scene tree for the first time.

