# class_name Logger
extends Node

func debug(message: String, source := "", data: Variant = null) -> void:
	var msg := _format_msg(message, source, data)
	print(msg)

func info(message: String, source := "", data: Variant = null) -> void:
	var msg := _format_msg(message, source, data)
	print(msg)

func warn(message: String, source := "", data: Variant = null) -> void:
	var msg := _format_msg(message, source, data)
	print(msg)
	
func error(message: String, source := "", data: Variant = null) -> void:
	var msg := _format_msg(message, source, data)
	push_error(msg)
	printerr(msg)

func _format_msg(message: String, source := "", data: Variant = null) -> String:
	var json_string := JSON.stringify(data) if data else ""
	if source:
		return "%s: %s Data: %s" % [source, message, json_string]
	else:
		return "%s Data: %s" % [message, json_string]
