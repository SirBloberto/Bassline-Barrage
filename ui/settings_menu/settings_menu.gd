extends Control
class_name SettingsMenu


const counter = preload("res://resources/ui_components/setting_bar_counter.png") 


@export var bus_index: int
@export var bus_name: String


@onready var value_container: HBoxContainer = $ValueContainer


var volume: float


func _ready() -> void:
	volume = AudioServer.get_bus_volume_linear(0)
	for i in range(roundf(AudioServer.get_bus_volume_linear(0) * 10)):
		add_volume_counter()


func _on_back_button_pressed() -> void:
	hide()


func _on_increase_volume_pressed() -> void:
	volume = min(volume + 0.1, 1.0)
	
	AudioServer.set_bus_volume_db(0, linear_to_db(volume))
	add_volume_counter()


func add_volume_counter():
	if value_container.get_child_count() < 10:
		var counter_instance: TextureRect = TextureRect.new()
		counter_instance.texture = counter
		counter_instance.custom_minimum_size = Vector2(32, 22)
		value_container.add_child(counter_instance)


func _on_decrease_volume_pressed() -> void:
	volume = max(volume - 0.1, 0.0)
		
	AudioServer.set_bus_volume_db(0,linear_to_db(volume))
	if value_container.get_child_count() > 0:
		value_container.remove_child(value_container.get_child(value_container.get_child_count() - 1))
