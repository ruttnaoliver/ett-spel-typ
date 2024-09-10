extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

var direction = Vector2(0,0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
var screen_size := get_viewport_rect().size
var speed = 1200
func _process(delta: float) -> void:
	
	direction.x = Input.get_axis("movement left", "movement right")
	position += Vector2(speed,speed) * direction * delta
	if global_position.y>screen_size.y:
		speed=0


func _on_area_entered(area: Area2D) -> void:
	direction.x = 0 # Replace with function body.

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("movement left", "movement right")
	
