class_name FarmSquare
extends MouseClickable

func _ready() -> void:
	super._ready()
	
	hover_started.connect(_on_farm_hovered)
	#hover_ended.connect(_on_farm_exited)
	clicked.connect(_on_farm_clicked)
	#pressed.connect(_on_coin_pressed)
	released.connect(_on_farm_released)

func _on_farm_hovered() -> void:
	print("Is HOVERING")


func _on_farm_clicked():
	print("Farm clicked!")
	
func _on_farm_released():
	#print("Farm Released")
	pass
