@tool
extends EditorContextMenuPlugin

signal create_function_pressed(script: CodeEdit)
signal create_getset_pressed(script: CodeEdit)

func _popup_menu(paths : PackedStringArray):
	add_context_menu_item("Create function", create_function_pressed.emit)
	add_context_menu_item("Create get/set", create_getset_pressed.emit)
