extends RigidBody3D

var m_input
var view_pos
var align_force

func _ready():

	m_input = Vector3.ZERO
	view_pos = $TwistPivot
	align_force = view_pos.basis

func _input(event: InputEvent):

	if event.is_action_pressed("move_left") || event.is_action_pressed("move_right"):
		m_input.x = Input.get_axis("move_left", "move_right")
	if event.is_action_released("move_left") || event.is_action_released("move_right"):
		m_input.x = Input.get_axis("move_left", "move_right")

	if  event.is_action_pressed("move_forwd") || event.is_action_pressed("move_back"):
		m_input.z = Input.get_axis("move_forwd", "move_back")
	if event.is_action_released("move_forwd") || event.is_action_released("move_back"):
		m_input.z = Input.get_axis("move_forwd", "move_back")

	if event.is_action_pressed("jump"):
		m_input.y = 1
		await get_tree().create_timer(0.3).timeout
		m_input.y = 0

	if event.is_action_pressed("roll"):
		apply_central_force(align_force * m_input *  500.0)

	if event.is_action_pressed("rotate_cam_left"):
		view_pos.rotate_y(deg_to_rad(90))
		align_force = view_pos.basis
	if event.is_action_pressed("rotate_cam_right"):
		view_pos.rotate_y(deg_to_rad(-90))
		align_force = view_pos.basis

func _physics_process(delta):
	apply_central_force(align_force * m_input *  1200.0 * delta)
