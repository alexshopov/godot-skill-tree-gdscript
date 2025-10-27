extends Node

var abilities : Dictionary = {
    "prime_tower": preload("res://resources/prime_tower.tres")._create_instance(),
    "drop_rate": preload("res://resources/drop_rate.tres")._create_instance(),
    "all_towers_damage_increase": preload("res://resources/all_towers_damage_increase.tres")._create_instance(),
    "rate_of_fire": preload("res://resources/rate_of_fire.tres")._create_instance(),
}

