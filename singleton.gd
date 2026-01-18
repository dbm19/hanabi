extends Node

var player_count = 2
var player_information = [
	{
		"Hand": []
	},
	{
		"Hand": []
	},
	{
		"Hand": []
	},
	{
		"Hand": []
	},
	{
		"Hand": []
	}
]
var deck = [
	"1_w", "1_w","1_w",
	"2_w","2_w",
	"3_w","3_w",
	"4_w","4_w",
	"5_w",
	"1_r","1_r","1_r",
	"2_r","2_r",
	"3_r","3_r",
	"4_r","4_r",
	"5_r",
	"1_b","1_b","1_b",
	"2_b","2_b",
	"3_b","3_b",
	"4_b","4_b",
	"5_b",
	"1_y","1_y","1_y",
	"2_y","2_y",
	"3_y","3_y",
	"4_y","4_y",
	"5_y",
	"1_g","1_g","1_g",
	"2_g","2_g",
	"3_g","3_g",
	"4_g","4_g",
	"5_g",
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	deck.shuffle()
	print(deck)
	_deal_cards(player_count)
	print(player_information)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _deal_cards(player_count) -> void:
	while player_information[player_count - 1].Hand.size() < 5:
		for i in range(player_count):
			player_information[i].Hand.append(deck.pop_back())
