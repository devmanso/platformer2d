extends Area2D

func _ready():
	pass

#signal is pointing to thois function
func _on_Coin_body_entered(body):
	body.add_coin() #if another entity is able to collide with the coin and does so, the game might crash
	
	#this funtion deletes the object from memory
	queue_free()
	
