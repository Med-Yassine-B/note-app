extends Control

@onready var image:TextureRect=$VBoxContainer/TextureRect
@onready var head:Control=$VBoxContainer/head


var waitingForImage=false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _input(event):
	if event is InputEventKey and event.keycode==KEY_V and Input.is_key_pressed(KEY_CTRL) and waitingForImage:
		var keyboardImage=DisplayServer.clipboard_get_image()
		if keyboardImage:
			image.texture=ImageTexture.create_from_image(keyboardImage)
			image.visible=true
		waitingForImage=false 
	
	
		


func _on_image_pressed():
	waitingForImage=true
	pass # Replace with function body.


func _on_close_pressed():
	queue_free()
	pass # Replace with function body.
