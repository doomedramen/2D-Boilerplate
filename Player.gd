extends KinematicBody2D

const lEFT_INPUT_NAME = "ui_left"
const RIGHT_INPUT_NAME = "ui_right"
const JUMP_INPUT_NAME = "ui_accept"

const GRAVITY = 500
const JUMP_FORCE = 300
const FLOOR_NORMAL = Vector2(0, -1)
const SLOPE_SLIDE_STOP = 25.0
const WALK_SPEED = 100
var linear_vel = Vector2()


func _physics_process(delta):

	linear_vel.x = 0
	
	if Input.is_action_pressed(lEFT_INPUT_NAME):
		linear_vel.x = -WALK_SPEED
	if Input.is_action_pressed(RIGHT_INPUT_NAME):
		linear_vel.x = WALK_SPEED
		
	if Input.is_action_just_pressed(JUMP_INPUT_NAME) and is_on_floor():
		linear_vel.y = -JUMP_FORCE

	linear_vel.y += (GRAVITY * delta)
	linear_vel = move_and_slide(linear_vel, FLOOR_NORMAL, SLOPE_SLIDE_STOP)