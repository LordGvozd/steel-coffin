extends Node2D
class_name IndicatorSystem

var __oxygen
var __deep
var __energy

var __events: Dictionary = {
	
}

enum indicators{oxygen, deep, energy}

func __str_indicator(ind: indicators):
	return str(indicators.find_key(ind))
	
func indicator_by_str(string: String):
	var inds = {
		"oxygen": indicators.oxygen,
		"deep": indicators.deep,
		"energy": indicators.energy,
	}
	
	return inds[string]

static var storage = JsonStorage.new()

func _ready() -> void:
	
	
	__oxygen = storage.load_data("oxygen")
	__deep = storage.load_data("deep")
	__energy = storage.load_data("energy")
	
	
	if not __oxygen: 
		__oxygen = Oxygen.new("oxygen")
		storage.save_data(__oxygen)
	if not __deep: 
		__deep = Deep.new("deep")
		storage.save_data(__deep)
	if not __energy: 
		__energy = Energy.new("energy")
		storage.save_data(__energy)
		
func _condition_to_expr(indicator: indicators, condition: String) -> Expression:
	if condition.begins_with("?"):
		condition = condition.replace("?", "__" + __str_indicator(indicator))
	else:
		condition = "__" +  __str_indicator(indicator) + condition
		
	var expr = Expression.new()
	expr.parse(condition)
	
	return expr
	
func add_event(indicator: indicators, condition: String, event: Callable) -> void:
	var expr = _condition_to_expr(indicator, condition)
	
	if __str_indicator(indicator) not in __events.keys():
		__events[__str_indicator(indicator)] = []
	
	__events[__str_indicator(indicator)].append({"condition_expr": expr,
												 "callable": event})

func execute_if_true(indicator: indicators, condition: String, event: Callable) -> void:
	var expr = _condition_to_expr(indicator, condition)
	if expr.execute([], self):
		event.call()
	
	
func update_indicator(indicator: indicators, param: String, value) -> void:
	var expression_string = (
		"__"
		+ __str_indicator(indicator)
		+ "."
		+ param
		+ " = "
		+ str(value)
	)
	
	var expr = Expression.new()
	
	expr.parse(expression_string)
	expr.execute()
	
	storage.save_data(__oxygen)
	
	if __str_indicator(indicator) not in __events.keys():
		__events[__str_indicator(indicator)] = []
	
	for event in  __events[__str_indicator(indicator)]:
		if event["condition_expr"].execute([], self):
			event["callable"].call()


func get_indicator(indicator: indicators):
	var indicator_object = storage.load_data(__str_indicator(indicator))
	return indicator_object
	
