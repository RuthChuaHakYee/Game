extends KinematicBody2D

const UP = Vector2(0,-10)
const GRAVITY = 50
const SPEED = 210
const JUMP_HEIGHT = 1000
var MOTION = Vector2()

func _physics_process(delta): 
	MOTION.y += GRAVITY
	if Input.is_action_pressed("ui_right"):
		MOTION.x = SPEED
		$AnimatedSprite.flip_h = false
		$AnimatedSprite.play("Walk")
	elif Input.is_action_pressed("ui_left"):
		MOTION.x = -SPEED
		$AnimatedSprite.flip_h = true
		$AnimatedSprite.play("Walk")
	else: 
		MOTION.x = 0
		$AnimatedSprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			MOTION.y = -JUMP_HEIGHT
			$AnimatedSprite.play("Jump")
			
	MOTION = move_and_slide(MOTION, UP)
	pass


func _on_enemy_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://Game over.tscn")
	pass # Replace with function body.
