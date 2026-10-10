extends Area2D

@onready var Onsprite = $EnabledGeyser
@onready var Offsprite = $DisabledGeyser
@onready var collision = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Offsprite.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		body.velocity.y = -1000
		Onsprite.hide()
		Offsprite.show()
		collision.set_deferred("disabled", true)
		
		await get_tree().create_timer(3).timeout
		Onsprite.show()
		Offsprite.hide()
		collision.set_deferred("disabled", false)
		
