extends Node2D

var player_index = 1
var card_sprite_node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_sprite_node = get_node("CardSprite")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _render_card(card_index) -> void:
	for i in range(Singleton.player_information[player_index].Hand.size()):
		match Singleton.player_information[player_index].Hand[i]:
			"1_g":
				card_sprite_node.texture = load("res://green_one_card.png")
			"2_g":
				card_sprite_node.texture = load("res://green_two_card.png")
			"3_g":
				card_sprite_node.texture = load("res://green_three_card.png")
			"4_g":
				card_sprite_node.texture = load("res://green_four_card.png")
			"5_g":
				card_sprite_node.texture = load("res://green_five_card.png")
			"1_b":
				card_sprite_node.texture = load("res://blue_one_card.png")
			"2_b":
				card_sprite_node.texture = load("res://blue_two_card.png")
			"3_b":
				card_sprite_node.texture = load("res://blue_three_card.png")
			"4_b":
				card_sprite_node.texture = load("res://blue_four_card.png")
			"5_b":
				card_sprite_node.texture = load("res://blue_five_card.png")
			"1_r":
				card_sprite_node.texture = load("res://red_one_card.png")
			"2_r":
				card_sprite_node.texture = load("res://red_two_card.png")
			"3_r":
				card_sprite_node.texture = load("res://red_three_card.png")
			"4_r":
				card_sprite_node.texture = load("res://red_four_card.png")
			"5_r":
				card_sprite_node.texture = load("res://red_five_card.png")
			"1_w":
				card_sprite_node.texture = load("res://white_one_card.png")
			"2_w":
				card_sprite_node.texture = load("res://white_two_card.png")
			"3_w":
				card_sprite_node.texture = load("res://white_three_card.png")
			"4_w":
				card_sprite_node.texture = load("res://white_four_card.png")
			"5_w":
				card_sprite_node.texture = load("res://white_five_card.png")
			"1_y":
				card_sprite_node.texture = load("res://yellow_one_card.png")
			"2_y":
				card_sprite_node.texture = load("res://yellow_two_card.png")
			"3_y":
				card_sprite_node.texture = load("res://yellow_three_card.png")
			"4_y":
				card_sprite_node.texture = load("res://yellow_four_card.png")
			"5_y":
				card_sprite_node.texture = load("res://yellow_five_card.png")
