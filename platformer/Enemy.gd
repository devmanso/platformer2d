class_name Enemy
extends KinematicBody2D

var speed = Vector2()
var health = 10
var velo = 50

#export variables show up in the inspector 
export var direct = -1
export var detect_cliff = true 




func _ready():
	$MID.position.x = $CollisionShape2D.shape.get_extents().x * direct
	$MID.enabled = detect_cliff # if the detect_cliff variable is toggled off in the inspector then the raycast will not be enabled
	



func _physics_process(delta):
	
	
	if is_on_wall() or not $MID.is_colliding() and detect_cliff and is_on_floor(): # DO NOT CONFUSE is_on_wall(): FUNCTION WITH is_on_floor():
		direct = direct * -1
		$MID.position.x = $CollisionShape2D.shape.get_extents().x * direct
		
		
	
	speed.y += 20
	speed.x = velo * direct
	
	speed = move_and_slide(speed, Vector2.UP)

#linked signal
func _on_Head_checker_body_entered(body):
	velo = 0
	set_collision_layer_bit(4,false)
	set_collision_mask_bit(0, false)
	$Head_checker.set_collision_layer_bit(4,false)
	$Head_checker.set_collision_mask_bit(0, false)
	
	$Side_checker.set_collision_layer_bit(4,false)
	$Side_checker.set_collision_mask_bit(0, false)
	
	queue_free()
	
	

#linked siganl
func _on_Side_checker_body_entered(KinematicBody2D):
	print("ouch")
	$Timer.start(0.33)
	get_tree().change_scene("res://World.tscn")



func _on_Timer_timeout():
	queue_free()
