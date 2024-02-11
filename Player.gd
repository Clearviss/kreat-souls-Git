extends CharacterBody2D

const speed = 100
const jump_power = -150

const acc = 10
const friction = 20

const gravity = 20

var can_jump = true

func _physics_process(delta):
	var input_dir: Vector2 = input()
	
	if input_dir != Vector2.ZERO:
		accelerate(input_dir)
		play_animation()
	else:
		add_friction()
		play_animation()
	player_movement()
	fgravity()
	frotate()

func input() -> Vector2:
	var input_dir = Vector2.ZERO
	
	input_dir.x = Input.get_axis("left", "right")
	input_dir = input_dir.normalized()
	return input_dir

func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acc)	

func add_friction():
	velocity = velocity.move_toward(Vector2.ZERO, friction)

func player_movement():
	move_and_slide()

func fgravity():
	#if Input.is_action_just_pressed("ui_up"):
		#if can_jump:
			#velocity.y = jump_power
			#can_jump = false
	
	velocity.y += gravity
	
	#if is_on_floor_only():
		#can_jump = true
		

func frotate():
	var mouse_position = get_global_mouse_position()
	
	if mouse_position.x < global_position.x:
		$body.scale.x = -1
		$head.scale.y = -1
	if mouse_position.x > global_position.x:
		$body.scale.x = 1
		$head.scale.y = 1
	


func play_animation():
	pass


