extends Object
class_name Data

var __name__: String
var __path__: String

func _init(name: String) -> void:
	self.__name__ = name

func get_data() -> Dictionary:
	var this_script: GDScript = get_script()
	
	var class_data: Dictionary = {}
	
	self.__path__ = this_script.get_path()
	for property_info in this_script.get_script_property_list():
		var property_name: String = property_info.name
		var property_value = get(property_name)
		
		class_data[property_name] = property_value
		
	return class_data
		
	
