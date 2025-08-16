# class_name Data
extends Node

const BUILDINGS = preload("res://global/resource_groups/buildings.tres")
const RESOURCE_DATAS = preload("res://global/resource_groups/resource_datas.tres")

var buildings: Dictionary[String, BuildingData] = {}
var resources: Dictionary[Enum.ResourceType, ResourceData] = {}

func _ready() -> void:	
	for resourceData: ResourceData in RESOURCE_DATAS.load_all():
		resources[resourceData.type] = resourceData
	
	for building: BuildingData in BUILDINGS.load_all():
		buildings[building.id] = building
