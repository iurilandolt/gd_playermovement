# gd_playermovement

Simple implementation of input controls for 3D object movement in godot.

The usual implementation of player movement in games is made in the "update" or "physics/process" functions which are called once per frame.

This makes sense for everything physics related, object movement included, however i wanted to find a way to keep these functions as clean and readable as possible. 

Avoiding having to check for user input on every frame. Here is an approach that uses signals/events instead.

In the physics/process function we will be applying a costant force to the object in axis, X Y & Z.

The applied force will always be 0 in any direction:

`apply_central_force(align_force * m_input *  1200.0 * delta)`

The value of the applied force on each axis will be changed by the events/signals recieved from the user.

This script also includes an horizontal rotation function for a camera object '$TwistPivot'.

The force applied forward will always match with the direction the camera is facing:

`view_pos = $TwistPivot
align_force = view_pos.basis`




