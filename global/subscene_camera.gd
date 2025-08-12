# class_name SubsceneCamera
extends Node

## Autload script that ensures that a scene has a camera if it's not the project's main scene.
##
## This script checks whether the currently running scene is the same as the project's configured main scene
## (as defined in `application/run/main_scene` in the Project Settings).
## If it is not, a `Camera2D` is automatically added to the scene to ensure proper rendering
## in cases where a camera might otherwise be missing.

@onready var main_scene_path: String = ProjectSettings.get("application/run/main_scene")
 
func _ready() -> void:
	ensure_main_scene()
 
func ensure_main_scene() -> void:
	if not is_running_main_scene():
		_add_camera_to_scene()
 
func is_running_main_scene() -> bool:
	var current_scene_path := get_tree().current_scene.scene_file_path
	var main_uid := ResourceLoader.get_resource_uid(main_scene_path)
	var resource_uid := ResourceLoader.get_resource_uid(current_scene_path)
	return main_uid == resource_uid
 
func _add_camera_to_scene() -> void:
	var new_camera := Camera2D.new() 
	new_camera.name = "Subscene Camera"
	get_tree().root.add_child.call_deferred(new_camera)
 
