extends AbsctractStorage
class_name JsonStorage

func _load_stored_dict():
	if not FileAccess.file_exists(Config.STORAGE_FILE):
		return {}
	var file_access = FileAccess.open(Config.STORAGE_FILE, FileAccess.READ)
	var json_string = file_access.get_file_as_string(Config.STORAGE_FILE)
	
	file_access.close()
	return JSON.parse_string(json_string)

func save_data(data: Data) -> void:
	var stored_dict: Dictionary = _load_stored_dict()
	
	var data_dict = data.get_data()
	
	stored_dict[data_dict["__name__"]] = data_dict
	
	var json_string = JSON.stringify(stored_dict)
	
	var file = FileAccess.open(Config.STORAGE_FILE, FileAccess.WRITE)
	
	file.store_string(json_string)
	file.close()
	
func load_data(data_name: String):
	var loaded_dict = _load_stored_dict()
	
	if not loaded_dict:
		return null
	
	if data_name not in loaded_dict.keys():
		return null
	
	var script_object = load(loaded_dict[data_name]["__path__"])
	var data_object = script_object.new(data_name)
	
	
	for d in loaded_dict[data_name].keys():
		data_object.set(d, loaded_dict[data_name][d])
	
	return data_object
