extends Node

var rng = RandomNumberGenerator.new()

func random_examples():
	var random_int = rng.randi_range(1, 10) # Returns 1, 2, ..., up to 10
	var random_float = rng.randf_range(1.5, 5.5)
	var zero_to_one = rng.randf() 
	
	var fruits = ["Apple", "Banana", "Cherry"]
	var random_fruit = fruits.pick_random()

	print(random_fruit)

# Random Weights
func random_weights():
	var items = ["Common Sword", "Rare Shield", "Legendary Bow"]
	var weights = PackedFloat32Array([10.0, 2.5, 0.5]) # Weights correspond to the items above

	var index = rng.rand_weighted(weights)
	print("You found: ", items[index])

func _ready():
	#var items = ["0", "1", "2"]
	#for i in items:
		#print(i)
		#random_weights()

	#var fruit_map = {
		#"Lemon": 1,
		#"Apple": 2
	#}
	#var random_fruit_map = fruit_map.pick_random()
	#
	#print("random_fruit_map ", random_fruit_map)
	
	# means the random result can be reproduces again using the seed
	rng.seed = 12345
		
	
	# Generate numbers using the instance
	var roll = rng.randi_range(1, 100)
	print("roll ", roll)
	
	var chance = rng.randf()
	print("chance ", chance)
