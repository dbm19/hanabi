extends Control

var dropdown_button: Button
var item_list: VBoxContainer
var items = Singleton.list_of_hints

func _ready():
	dropdown_button = Button.new()
	dropdown_button.text = "Select Hints"
	dropdown_button.connect("pressed", _on_dropdown_button_pressed)
	add_child(dropdown_button)

	item_list = VBoxContainer.new()
	item_list.visible = false
	# Move list away from original button
	item_list.position.y += 50
	add_child(item_list)

	for item in items:
		if item != "":
			var checkbox = CheckBox.new()
			checkbox.text = item
			item_list.add_child(checkbox)

func _on_dropdown_button_pressed():
	item_list.visible = !item_list.visible

func get_selected_items():
	var selected = []
	for child in item_list.get_children():
		if child is CheckBox and child.pressed:
			selected.append(child.text)
	return selected
