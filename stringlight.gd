class_name StringLight
extends Light3D


@export var light_style: LightStyle

var max_energy := light_energy
var frame := 0

enum LightStyle {
	NORMAL,
	FLICKER_A,
	SLOW_STRONG_PULSE,
	CANDLE_A,
	FAST_STROBE,
	GENTLE_PULSE,
	FLICKER_B,
	CANDLE_B,
	CANDLE_C,
	SLOW_STROBE,
	FLUORESCENT_FLICKER,
	SLOW_PULSE_NOBLACK
}

const light_anim: Array[String] = [
	"m",
	"mmnmmommommnonmmonqnmmo",
	"abcdefghijklmnopqrstuvwxyzyxwvutsrqponmlkjihgfedcba",
	"mmmmmaaaaammmmmaaaaaabcdefgabcdefg",
	"mamamamamama",
	"jklmnopqrstuvwxyzyxwvutsrqponmlkj",
	"nmonqnmomnmomomno",
	"mmmaaaabcdefgmmmmaaaammmaamm",
	"mmmaaammmaaammmabcdefaaaammmmabcdefmmmaaaa",
	"aaaaaaaazzzzzzzz",
	"mmamammmmammamamaaamammma",
	"abcdefghijklmnopqrrqponmlkjihgfedcba"
]


func _ready() -> void:
	var timer := Timer.new()
	timer.autostart = true
	timer.wait_time = 1.0 / 10.0
	timer.timeout.connect(update_light)
	add_child(timer)
	
	update_light()


func update_light() -> void:
	frame += 1
	
	var char := light_anim[light_style][frame % light_anim[light_style].length()].unicode_at(0)
	light_energy = max_energy * float(char - 97) / 12.0
