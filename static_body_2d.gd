extends StaticBody2D


# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var padding := 0

func _ready():
	get_window().size_changed.connect(resize)

func resize():
	var size := get_viewport_rect().size
	for n in get_children():
		remove_child(n)
		n.queue_free() 
	for bound in [
			[Vector2(1, 0), 0],
			[Vector2(-1, 0), -size.x + padding],
			[Vector2(0, 1), 0],
			[Vector2(0, -1), -size.y + padding],
		]:
		var shape := WorldBoundaryShape2D.new()
		shape.normal = bound[0]
		shape.distance = bound[1]
		var collision_shape := CollisionShape2D.new()
		collision_shape.shape = shape
		add_child(collision_shape)
