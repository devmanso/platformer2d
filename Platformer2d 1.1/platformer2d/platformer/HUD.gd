extends CanvasLayer

var coins = 0

func _ready():
	$count_coins.text = String(coins)#converts ints to string data type, variables containg ints also work
	#for example I put 0 into the string method, the method will turn the int(or double, float etc) into a string or char (like  0  -> '0')
	
	
