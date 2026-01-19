extends Node2D

var player_index = 1
var card_sprite_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_sprite_node = get_node("CardSprite")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
