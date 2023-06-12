class_name StringLight
extends Light3D


@export var light_style: LightStyle

var total_time := 0.0
var threshold := 1.0 / 10.0

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


func _physics_process(delta: float) -> void:
	total_time += delta
	if total_time >threshold:
		total_time = 0
		print(total_time)
