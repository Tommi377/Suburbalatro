class_name ComparisonRequirement
extends Requirement

@export var resourceType: Enum.ResourceType
@export var operation: Enum.Comparison
@export var variable: int

func apply(player: PlayerData, _grid: HexGrid) -> bool:
	var value := player.get_resource(resourceType)
	match(operation):
		Enum.Comparison.Less:
			return operation < variable
		Enum.Comparison.LessEqual:
			return operation <= variable
		Enum.Comparison.Equal:
			return operation == variable
		Enum.Comparison.MoreEqual:
			return operation >= variable
		Enum.Comparison.More:
			return operation > variable
		_:
			Logger.error("Invalid comparison type", "comparison_requirement.gd", self)
			return false
	
