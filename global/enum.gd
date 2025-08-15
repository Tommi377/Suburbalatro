#class_name Enum
extends Node

enum ResourceType {
	Money,
	Worker,
	Wood,
	Brick,
	Stone,
	Food
}

enum Trigger {
	OnTick,
	OnPlace,
	OnBuy,
	OnUse,
}

enum Comparison {
	Less,
	LessEqual,
	Equal,
	MoreEqual,
	More
}
