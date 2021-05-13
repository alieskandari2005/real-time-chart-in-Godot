extends Control


onready var chart_node = get_node('chart')

func _ready():
	chart_node.initialize(chart_node.LABELS_TO_SHOW.NO_LABEL,
	{
		value = Color(1.0, 0.18, 0.18)
	})
	chart_node.set_labels(7)

	reset()
	set_process(true)

	while true:
		var file = File.new()
		file.open("values.json", file.READ)
		var json = file.get_as_text()
		var json_result = JSON.parse(json).result
		file.close()
		
		yield(get_tree().create_timer(0.5),"timeout")
		var file2 = File.new()
		file2.open("values.json", file.READ)
		var json2 = file2.get_as_text()
		var json_result2 = JSON.parse(json2).result
		file2.close()
		
		if json!=json2:
			reset()



func reset():
	var file = File.new()
	file.open("values.json", file.READ)
	var json = file.get_as_text()
	var json_result = JSON.parse(json).result
	file.close()
	for item in json_result:
		chart_node.create_new_point({
		label = str(item),
		values = {
		value = json_result[str(item)]
		   }
		})
