extends StaticBody2D

@onready var sprite = $Sprite2D
@onready var collision = $CollisionPolygon2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		sprite.modulate = Color(1, 0.5, 0.5)
		
		await get_tree().create_timer(1.0).timeout
		
		collision.set_deferred("disabled", true)
		sprite.hide()
		
		await get_tree().create_timer(3.0).timeout
		collision.set_deferred("disabled", false)
		sprite.show()
		sprite.modulate = Color(1,1,1)
		
