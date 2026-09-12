extends Node

# Variables
var vname = "value"
var vinteger: int = 2
var vfloat: float = 2.0
var vboolean: bool = true
var vstring: String = "hello"
var vvector2: Vector2 = Vector2(1, 2)
var vvector3: Vector3 = Vector3(1, 2, 3)
var varray: Array = [1, 1, 2]

# Create an empty dictionary
var player_stats = {}

# Create a dictionary with initial key-value pairs
var item_prices = {
	"potion": 50,
	"sword": 150,
	"shield": 100
}

const vconstant = 2.0

@export var custom_property = "custom_name"

# Functions
# this is doing something
func my_function() -> void:
	print("data")

	# Conditionals
	if vinteger == 2:
		print("2")
	elif vinteger == 1:
		print("1")
	else:
		print("not an integer")
	
	# Conditional for Dictionary/HashMaps
	if item_prices.has("bow"):
		print(item_prices["bow"])
	
	# Adding a new key-value pair
	item_prices["axe"] = 200

	# Accessing a value using brackets
	print(item_prices["potion"]) # Outputs: 50

	# Accessing a value using dot notation
	print(item_prices.sword)     # Outputs: 150
	
	# Loops
	for i in varray:
		print(i)
	
	var items = ["Apple", "Banana", "Cherry"]
	for i in range(items.size()):
		var item = items[i]
		print("Index: ", i, " | Item: ", item)

	while vinteger != 0:
		vinteger -= 1
		
	# Loop through keys
	for item in item_prices:
		print("Item: ", item, " costs: ", item_prices[item])

	# Loop through keys explicitly
	for key in item_prices.keys():
		print(key)

	# Loop through values explicitly
	for value in item_prices.values():
		print(value)
	
	print(vinteger)

# Function with return type
func my_func_type() -> int:
	return vinteger
	
	
	
	
# ============================================================
# BUILT-IN LIFECYCLE METHODS
# ============================================================
# These are called automatically by Godot in this order:

# 1. _init() - Called when object is created (before scene tree)
func _init():
	print("Object created")
	# Rarely used unless extending Resource/RefCounted
	# CANNOT access nodes here!

# 2. _enter_tree() - Called when node enters the scene tree
func _enter_tree():
	print("Entered tree")
	# Parent is available here
	# Called BEFORE _ready()

# 3. _ready() - Called ONCE when node and all children are ready
func _ready():
	print("Ready!")
	# Best place to:
	# - Initialize variables
	# - Connect signals
	# - Setup child nodes
	# - Start timers
	# Child nodes are guaranteed to exist

# 4. _process(delta) - Called EVERY FRAME (variable rate)
func _process(delta: float):
	# delta = time since last frame (in seconds)
	# Use for: input, UI, animations that don't need physics
	# Runs at monitor refresh rate (can be 60, 144, etc.)
	pass  # pass = do nothing (placeholder)

# 5. _physics_process(delta) - Called at FIXED rate (default 60/sec)
func _physics_process(delta: float):
	# delta = fixed time step (1/60 = 0.0167 seconds)
	# Use for: movement, physics, collision checks
	# Consistent timing regardless of frame rate
	pass

# 6. _input(event) - Called for every input event
func _input(event: InputEvent):
	# Called for ALL input, even if handled
	# Use for: global input handling
	pass

# 7. _unhandled_input(event) - Called for unhandled input
func _unhandled_input(event: InputEvent):
	# Only called if UI didn't consume the event
	# Use for: player controls, camera movement
	pass

# 8. _exit_tree() - Called when node is removed from tree
func _exit_tree():
	print("Exiting tree")
	# Cleanup here

# 9. _notification(what) - Low-level notifications
func _notification(what: int):
	# Called for various events (predelete, wm_close, etc.)
	pass
