#Adaptive Audio Player made by berryberryniceu

@icon("res://adaptive-audio-player-main/aap.svg")
extends AudioStreamPlayer3D

class_name AdaptiveAudioPlayer

@onready var detectors: Node3D = Node3D.new()
@onready var up: RayCast3D = RayCast3D.new()
@onready var right: RayCast3D = RayCast3D.new()
@onready var left: RayCast3D = RayCast3D.new()
@onready var front: RayCast3D = RayCast3D.new()
@onready var back: RayCast3D = RayCast3D.new()
@onready var player_check: RayCast3D = RayCast3D.new()

@export var adaptionRange: int = 25
@export var AAPAutoPlay: bool = false
@export var ContinuousAdapt: bool = false
@export var debug: bool = false

@export var small_threshold: float = 15
@export var medium_threshold: float = 25
@export var big_threshold: float = 50
@export var tunnel_threshold: float = 5

var type: String = "Generic"

func _ready() -> void:
	add_child(detectors)
	detectors.add_child(up)
	up.target_position = Vector3(0,1,0)
	detectors.add_child(right)
	right.target_position = Vector3(0,0,1)
	detectors.add_child(left)
	left.target_position = Vector3(0,0,-1)
	detectors.add_child(front)
	front.target_position = Vector3(1,0,0)
	detectors.add_child(back)
	back.target_position = Vector3(-1,0,0)
	detectors.add_child(player_check)
	player_check.target_position = Vector3(0,-1,0)
	player_check.add_to_group("player_check")
	
	detectors.set_as_top_level(true)
	rotation = Vector3.ZERO
	for n in detectors.get_children():
		n.enabled = true
		n.target_position = n.target_position * adaptionRange
		
	if AAPAutoPlay:
		play_sfx()

func _physics_process(_delta) -> void:
	player_check.set_target_position(get_viewport().get_camera_3d().global_position - global_position)
	detectors.global_position = global_position
	if PlayerAutoload.player != null:
		for n in detectors.get_children():
			n.add_exception(PlayerAutoload.player)
		
	if ContinuousAdapt and is_playing():
		adapt()

func adapt() -> void:
		
	if !up.is_colliding():
		
		if right.is_colliding() and left.is_colliding() \
		and !front.is_colliding() and !back.is_colliding(): 
			type = "Open 2"
		elif front.is_colliding() and back.is_colliding() \
		and !right.is_colliding() and !left.is_colliding():
			type = "Open 2"
		elif right.is_colliding() and left.is_colliding() \
		and front.is_colliding() and back.is_colliding(): 
			type = "Generic"
		else:
			type = "Open"
		
	elif up.is_colliding():
		var room_size: float = 0
		var x_width: float = 0
		var z_width: float = 0
		
		for n in detectors.get_children():
			if !n.is_in_group("player_check"):
				if n.is_colliding():
					var cp: Vector3 = n.get_collision_point()
					room_size += cp.distance_to(global_position)
					
					if n.name == "right" or n.name == "left":
						cp = n.get_collision_point()
						z_width += cp.distance_to(global_position) 
					elif n.name == "front" or n.name == "back":
						cp = n.get_collision_point()
						x_width += cp.distance_to(global_position) 
			
		if debug:
			print(str("Room size: " + str(room_size)))
			print(str("X Width: " + str(x_width)))
			print(str("Z Width: " + str(z_width)))
				
		type = "Generic"
				
		if room_size <= small_threshold:
			type = "Generic"
		elif room_size > small_threshold and room_size <= medium_threshold:
			type = "Room Small"
		elif room_size > medium_threshold and room_size <= big_threshold:
			type = "Room Medium"
		elif room_size > big_threshold:
			type = "Room Big"
			
		if x_width > z_width * tunnel_threshold or z_width > x_width * tunnel_threshold \
		or x_width == 0 or z_width == 0:
			if type.get_slice(" ", 0) == "Room":
				type = str("Tunnel ") + type.get_slice(" ", 1)
			else:
				type = "Tunnel Small"
			
	if player_check.is_colliding():
		type = str("Damped ") + type.get_slice(" ", 0)
		
	set_bus(type)
			
	if debug:
		print(get_bus())

func play_sfx() -> void:
	adapt()
	play()
