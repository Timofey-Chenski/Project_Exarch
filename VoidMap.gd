extends TileMap

export var voidDamage = 2
var scaler = 10
var safeZone = 5936 #185 tiles of 32x32 pix + half tile 

func _ready():
	pass
	
func _process(delta): 
	var Player = get_node('%Player')
	if abs(Player.position.x)>5936 or abs(Player.position.y)>5936:
		Player.trueHit(voidDamage * scaler%10)
		scaler+=1
	else:pass
