extends Node2D

var player_index = 1
var card_scene_array = []
var hand = Singleton.player_information[player_index].Hand
var ones = []
var twos = []
var threes = []
var fours = []
var fives = []
var reds = []
var greens = []
var blues = []
var whites = []
var yellows = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_scene_array = [
		get_node("Card/CardSprite"),
		get_node("Card2/CardSprite"),
		get_node("Card3/CardSprite"),
		get_node("Card4/CardSprite"),
		get_node("Card5/CardSprite")
	]
	
	for i in range(Singleton.player_information[player_index].Hand.size()):
		_render_card(Singleton.player_information[player_index].Hand[i], i)
	
	_assess_cards()
	_generate_number_hints(ones)
	_generate_number_hints(twos)
	_generate_number_hints(threes)
	_generate_number_hints(fours)
	_generate_number_hints(fives)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _render_card(card, i) -> void:
	match card:
		"1_g":
			card_scene_array[i].texture = load("res://green_one_card.png")
		"2_g":
			card_scene_array[i].texture = load("res://green_two_card.png")
		"3_g":
			card_scene_array[i].texture = load("res://green_three_card.png")
		"4_g":
			card_scene_array[i].texture = load("res://green_four_card.png")
		"5_g":
			card_scene_array[i].texture = load("res://green_five_card.png")
		"1_b":
			card_scene_array[i].texture = load("res://blue_one_card.png")
		"2_b":
			card_scene_array[i].texture = load("res://blue_two_card.png")
		"3_b":
			card_scene_array[i].texture = load("res://blue_three_card.png")
		"4_b":
			card_scene_array[i].texture = load("res://blue_four_card.png")
		"5_b":
			card_scene_array[i].texture = load("res://blue_five_card.png")
		"1_r":
			card_scene_array[i].texture = load("res://red_one_card.png")
		"2_r":
			card_scene_array[i].texture = load("res://red_two_card.png")
		"3_r":
			card_scene_array[i].texture = load("res://red_three_card.png")
		"4_r":
			card_scene_array[i].texture = load("res://red_four_card.png")
		"5_r":
			card_scene_array[i].texture = load("res://red_five_card.png")
		"1_w":
			card_scene_array[i].texture = load("res://white_one_card.png")
		"2_w":
			card_scene_array[i].texture = load("res://white_two_card.png")
		"3_w":
			card_scene_array[i].texture = load("res://white_three_card.png")
		"4_w":
			card_scene_array[i].texture = load("res://white_four_card.png")
		"5_w":
			card_scene_array[i].texture = load("res://white_five_card.png")
		"1_y":
			card_scene_array[i].texture = load("res://yellow_one_card.png")
		"2_y":
			card_scene_array[i].texture = load("res://yellow_two_card.png")
		"3_y":
			card_scene_array[i].texture = load("res://yellow_three_card.png")
		"4_y":
			card_scene_array[i].texture = load("res://yellow_four_card.png")
		"5_y":
			card_scene_array[i].texture = load("res://yellow_five_card.png")

func _assess_cards() -> void:
	hand = Singleton.player_information[player_index].Hand
	ones = []
	twos = []
	threes = []
	fours = []
	fives = []
	reds = []
	greens = []
	blues = []
	whites = []
	yellows = []
	
	# Find all numbers
	for i in range(hand.size()):
		match str(hand[i])[0]:
			"1":
				ones.append(i)
			"2":
				twos.append(i)
			"3":
				threes.append(i)
			"4":
				fours.append(i)
			"5":
				fives.append(i)
	
	# Find all colours
	for i in range(hand.size()):
		match str(hand[i])[2]:
			"w":
				whites.append(i)
			"r":
				reds.append(i)
			"b":
				blues.append(i)
			"g":
				greens.append(i)
			"y":
				yellows.append(i)
	print(ones, twos, threes, fours, fives)
	print(whites, reds, blues, greens, yellows)
	
func _generate_number_hints(number) -> void:
	var hints_for_number
	var hints_string = ""
	
	for i in range(number.size()):
		if number.size() > 1:
			if i != number.size() - 1:
				hints_string += str(number[i] + 1) + ", "
			else:
				hints_string += "and " + str(number[i] + 1) 
		elif number.size() == 1:
			hints_string += str(number[i] + 1)
	if number.size() != 1:
		hints_for_number = "Cards " + hints_string + " are 1's"
	else:
		hints_for_number = "Card " + hints_string + " is a 1"
	
	print(hints_for_number)
