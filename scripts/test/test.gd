extends Node2D


func _ready() -> void:
	var data = TestData.new("ivan")
	
	data.name = "Иван"
	data.age = 18
	data.addres = "10 Солнечная Дом 12"
	data.sex = "male"
	
	var storage = JsonStorage.new()
	
	storage.save_data(data)
