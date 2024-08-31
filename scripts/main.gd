extends Control


@onready var noteRoot:=$VBoxContainer/body/ScrollContainer/notesRoot
@onready var notePrefab:=preload("res://scenes/note.tscn")
@onready var head:=$VBoxContainer/head
@onready var imageViewerPopup:Popup=$Popup
@onready var imageViewerImage:TextureRect = imageViewerPopup.get_node("imageViewer/MarginContainer/TextureRect")

var clickPos:Vector2
var imageToView:TextureRect


var movingNote:Control=null
var clickToMovePos:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _input(event):
	if event is InputEventMouseButton and event.get_button_index()==MOUSE_BUTTON_LEFT :
		#for moving the note
		if event.pressed:
			var nots=noteRoot.get_children()
			for i in range(len(nots)-1,-1,-1):
				var headGlobalRect:=Rect2(nots[i].head.global_position,nots[i].head.get_rect().size)
				if  headGlobalRect.has_point(event.position):
					movingNote=nots[i]
					clickToMovePos=nots[i].head.global_position-event.position
					return
			for i in range(len(nots)-1,-1,-1):
				var imageGlobalRect:=Rect2(nots[i].image.global_position,nots[i].image.get_rect().size)
				if imageGlobalRect.has_point(event.position):
					clickPos=event.position
					imageToView=nots[i].image
		else:
			if event.position==clickPos:
				imageViewerImage.texture=imageToView.texture
				imageViewerPopup.popup()
			movingNote=null

			
				
		#for viewing the image
		
			
	if event is InputEventMouseMotion and movingNote:
		movingNote.global_position=event.position+clickToMovePos
	pass


func _on_button_pressed():
	var newNote=notePrefab.instantiate()
	#newNote.z_index=len(noteRoot.get_children())
	noteRoot.add_child(newNote)
	pass # Replace with function body.
