class_name Enemy
extends KinematicBody2D

var speed = Vector2()
var health = 10


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
	speed.x = 50 * direct
	
	speed = move_and_slide(speed, Vector2.UP)
