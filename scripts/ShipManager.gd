extends Node2D

# Ship data with properties for different types of ships
var ships = {
    "starter_ship": {
        "price": 10000,
        "cargo_capacity": 200,
        "speed": 100,
        "armor": 50,
        "fuel_capacity": 100,
    },
    "cargo_hauler": {
        "price": 30000,
        "cargo_capacity": 500,
        "speed": 60,
        "armor": 100,
        "fuel_capacity": 200,
    },
    "fast_courier": {
        "price": 25000,
        "cargo_capacity": 150,
        "speed": 150,
        "armor": 30,
        "fuel_capacity": 100,
    },
    "heavy_freighter": {
        "price": 50000,
        "cargo_capacity": 800,
        "speed": 40,
        "armor": 200,
        "fuel_capacity": 300,
    },
    "explorer": {
        "price": 70000,
        "cargo_capacity": 250,
        "speed": 90,
        "armor": 60,
        "fuel_capacity": 150,
    }
}

# Method to get ship data
func get_ship_data(ship_name):
    if ship_name in ships:
        return ships[ship_name]
    else:
        return null

# Method to upgrade a ship's cargo capacity
func upgrade_cargo(ship_name, additional_cargo):
    if ship_name in ships:
        ships[ship_name]["cargo_capacity"] += additional_cargo

# Method to upgrade a ship's armor
func upgrade_armor(ship_name, additional_armor):
    if ship_name in ships:
        ships[ship_name]["armor"] += additional_armor

# Method to upgrade a ship's speed
func upgrade_speed(ship_name, additional_speed):
    if ship_name in ships:
        ships[ship_name]["speed"] += additional_speed

# Method to upgrade a ship's fuel capacity
func upgrade_fuel(ship_name, additional_fuel):
    if ship_name in ships:
        ships[ship_name]["fuel_capacity"] += additional_fuel
