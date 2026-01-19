extends Button
#セーブ
func save():
	return {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"pos_x": position.x,
		"pos_y": position.y,
		"size_x":size.x,
		"size_y":size.y,
		"area_name":text,
		"nowplanted_name":$Popup/FieldInformation/LineEdit.text,
		"lateplanted_name":$Popup/FieldInformation/LineEdit2.text,
		"note":$Popup/FieldInformation/TextEdit.text,
		"field_situation":$Popup/FieldInformation/OptionButton.selected,
	}
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Persist")
	mouse_default_cursor_shape = Control.CURSOR_ARROW
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = $Popup/FieldInformation/OptionButton.selected
	var normal_style = StyleBoxFlat.new() #通常状態
	var hover_style = StyleBoxFlat.new() #ホバー時
	var pressed_style = StyleBoxFlat.new() #押されている状態
	match x:
		0: # 茶色
			normal_style.bg_color = Color("#F6BF7F80")
			add_theme_stylebox_override("normal", normal_style)
			hover_style.bg_color = Color("#F6BF7F80")
			add_theme_stylebox_override("hover", hover_style)
			pressed_style.bg_color = Color("#F6BF7F80")
			add_theme_stylebox_override("pressed", pressed_style)
			$Plow.visible = true
			$Follow.visible = false
		1: # 茶色
			normal_style.bg_color = Color("#F6BF7F80")
			add_theme_stylebox_override("normal", normal_style)
			hover_style.bg_color = Color("#F6BF7F80")  # 青色
			add_theme_stylebox_override("hover", hover_style)
			pressed_style.bg_color = Color("#F6BF7F80")
			add_theme_stylebox_override("pressed", pressed_style)
			$Plow.visible = false
			$Follow.visible = false
		2: # 緑色
			normal_style.bg_color = Color("#CFD0A080")
			add_theme_stylebox_override("normal", normal_style)
			hover_style.bg_color = Color("#CFD0A080")  # 青色
			add_theme_stylebox_override("hover", hover_style)
			pressed_style.bg_color = Color("#CFD0A080")
			add_theme_stylebox_override("pressed", pressed_style)
			$Plow.visible = false
			$Follow.visible = false
		3: # オレンジ色
			normal_style.bg_color = Color("#F6E8A280")
			add_theme_stylebox_override("normal", normal_style)
			hover_style.bg_color = Color("#F6E8A280")  # 青色
			add_theme_stylebox_override("hover", hover_style)
			pressed_style.bg_color = Color("#F6E8A280")
			add_theme_stylebox_override("pressed", pressed_style)
			$Plow.visible = false
			$Follow.visible = false
		4: # 茶色
			normal_style.bg_color = Color("#F6BF7F80")
			add_theme_stylebox_override("normal", normal_style)
			hover_style.bg_color = Color("#F6BF7F80")  # 青色
			add_theme_stylebox_override("hover", hover_style)
			pressed_style.bg_color = Color("#F6BF7F80")
			add_theme_stylebox_override("pressed", pressed_style)
			$Plow.visible = false
			$Follow.visible = true
	self.text = $Popup/FieldInformation/LineEdit.text
#サイズ変更
func _on_upper_pressed():
	size.y -= 50
func _on_downer_pressed():
	size.y += 50
func _on_bigger_pressed():
	size.x -= 50
func _on_smaller_pressed():
	size.x += 50

func _on_hide_button_pressed():
	$Popup.hide()

#DD移動
var dragging = false
var drag_start_position = Vector2()
func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				dragging = true
				drag_start_position = get_global_mouse_position() - global_position
				mouse_default_cursor_shape = Control.CURSOR_MOVE
			else:
				dragging = false
				mouse_default_cursor_shape = Control.CURSOR_ARROW
		elif event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			# 左クリックの処理をここに移動
			emit_signal("pressed")
	
	if event is InputEventMouseMotion and dragging:
		global_position = get_global_mouse_position() - drag_start_position

func _on_yes_button_pressed():
	queue_free()

#ポップアップ表示
func _on_pressed():
	$Popup.popup_centered()
