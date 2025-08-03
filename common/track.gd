extends Resource
class_name Track


enum ShotType { SINGLE, DOUBLE, SHOTGUN_SINGLE, SHOTGUN_DOUBLE }


@export var icon: Texture2D
@export var tracks: Array[AudioStream]
#@export var beats: Dictionary[float, int]
