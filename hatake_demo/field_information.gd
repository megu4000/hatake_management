extends VBoxContainer
func is_field_node():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$OptionButton.text = "畑の状態"
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_pressed():
	$LineEdit2.text = $LineEdit.text
	$LineEdit.text = ""
