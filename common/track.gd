extends Resource
class_name Track


enum ShotType { SINGLE, DOUBLE, SHOTGUN_SINGLE, SHOTGUN_DOUBLE }


@export var icon: ImageTexture
@export var track: AudioStream
@export var beats: Dictionary[float, ShotType]
