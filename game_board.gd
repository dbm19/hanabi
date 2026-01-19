extends Node2D

var player_index = 1
var card_position_array = []
var card_scene
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
var hints_box
var list_of_hints = []

# Preload the scenes resource
const CONTROL_SCENE: PackedScene = preload("res://control.tscn")
const CARD_SCENE: PackedScene = preload("res://card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_position_array = [
		get_node("Card1Position"),
		get_node("Card2Position"),
		get_node("Card3Position"),
		get_node("Card4Position"),
		get_node("Card5Position")
	]
	
	# Get nodes
	var hints_position_node = get_node("HintsPosition")
	hints_box = get_node("Hints")

	for i in range(Singleton.player_information[player_index].Hand.size()):
		_render_card(Singleton.player_information[player_index].Hand[i], i)
	
	_assess_cards()
	Singleton.list_of_hints.append(_generate_number_hints(ones, 1))
	Singleton.list_of_hints.append(_generate_number_hints(twos, 2))
	Singleton.list_of_hints.append(_generate_number_hints(threes, 3))
	Singleton.list_of_hints.append(_generate_number_hints(fours, 4))
	Singleton.list_of_hints.append(_generate_number_hints(fives, 5))
	Singleton.list_of_hints.append(_generate_colour_hints(whites, "White"))
	Singleton.list_of_hints.append(_generate_colour_hints(reds, "Red"))
	Singleton.list_of_hints.append(_generate_colour_hints(greens, "Green"))
	Singleton.list_of_hints.append(_generate_colour_hints(blues, "Blue"))
	Singleton.list_of_hints.append(_generate_colour_hints(yellows, "Yellow"))
	print(Singleton.list_of_hints)
	
	var control_instance = CONTROL_SCENE.instantiate()
	hints_position_node.add_child(control_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _render_card(card, i) -> void:
	card_scene = CARD_SCENE.instantiate()
	match card:
		"1_g":
			card_scene.get_node("CardSprite").texture = load("res://green_one_card.png")
		"2_g":
			card_scene.get_node("CardSprite").texture = load("res://green_two_card.png")
		"3_g":
			card_scene.get_node("CardSprite").texture = load("res://green_three_card.png")
		"4_g":
			card_scene.get_node("CardSprite").texture = load("res://green_four_card.png")
		"5_g":
			card_scene.get_node("CardSprite").texture =  load("res://green_five_card.png")
		"1_b":
			card_scene.get_node("CardSprite").texture = load("res://blue_one_card.png")
		"2_b":
			card_scene.get_node("CardSprite").texture = load("res://blue_two_card.png")
		"3_b":
			card_scene.get_node("CardSprite").texture = load("res://blue_three_card.png")
		"4_b":
			card_scene.get_node("CardSprite").texture = load("res://blue_four_card.png")
		"5_b":
			card_scene.get_node("CardSprite").texture = load("res://blue_five_card.png")
		"1_r":
			card_scene.get_node("CardSprite").texture = load("res://red_one_card.png")
		"2_r":
			card_scene.get_node("CardSprite").texture = load("res://red_two_card.png")
		"3_r":
			card_scene.get_node("CardSprite").texture = load("res://red_three_card.png")
		"4_r":
			card_scene.get_node("CardSprite").texture = load("res://red_four_card.png")
		"5_r":
			card_scene.get_node("CardSprite").texture = load("res://red_five_card.png")
		"1_w":
			card_scene.get_node("CardSprite").texture = load("res://white_one_card.png")
		"2_w":
			card_scene.get_node("CardSprite").texture = load("res://white_two_card.png")
		"3_w":
			card_scene.get_node("CardSprite").texture = load("res://white_three_card.png")
		"4_w":
			card_scene.get_node("CardSprite").texture = load("res://white_four_card.png")
		"5_w":
			card_scene.get_node("CardSprite").texture = load("res://white_five_card.png")
		"1_y":
			card_scene.get_node("CardSprite").texture = load("res://yellow_one_card.png")
		"2_y":
			card_scene.get_node("CardSprite").texture = load("res://yellow_two_card.png")
		"3_y":
			card_scene.get_node("CardSprite").texture = load("res://yellow_three_card.png")
		"4_y":
			card_scene.get_node("CardSprite").texture = load("res://yellow_four_card.png")
		"5_y":
			card_scene.get_node("CardSprite").texture = load("res://yellow_five_card.png")

	card_position_array[i].add_child(card_scene)
	
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
	
func _generate_number_hints(numbers_array, number) -> String:
	var hints_for_number
	var hints_string = ""
	
	for i in range(numbers_array.size()):
		if numbers_array.size() > 1:
			if i != numbers_array.size() - 1:
				hints_string += str(numbers_array[i] + 1) + ", "
			else:
				hints_string += "and " + str(numbers_array[i] + 1) 
		elif numbers_array.size() == 1:
			hints_string += str(numbers_array[i] + 1)
	if numbers_array.size() > 1:
		hints_for_number = "Cards " + hints_string + " are " + str(number)
		return(hints_for_number)
	elif numbers_array.size() == 1:
		hints_for_number = "Card " + hints_string + " is a " + str(number)
		return(hints_for_number)
	else:
		hints_for_number = "There are no " + str(number) + "'s"
		return("")

func _generate_colour_hints(colours_array, colour) -> String:
	var hints_for_colour
	var hints_string = ""
	
	for i in range(colours_array.size()):
		if colours_array.size() > 1:
			if i != colours_array.size() - 1:
				hints_string += str(colours_array[i] + 1) + ", "
			else:
				hints_string += "and " + str(colours_array[i] + 1) 
		elif colours_array.size() == 1:
			hints_string += str(colours_array[i] + 1)
	if colours_array.size() > 1:
		hints_for_colour = "Cards " + hints_string + " are " + str(colour)
		return(hints_for_colour)
	elif colours_array.size() == 1:
		hints_for_colour = "Card " + hints_string + " is a " + str(colour)
		return(hints_for_colour)
	else:
		hints_for_colour = "There are no " + str(colour) + "'s"
		return("")
	
