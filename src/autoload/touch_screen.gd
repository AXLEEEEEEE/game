extends CanvasLayer

onready var left := $Control/HBoxLeft
onready var top := $Control/HBoxTop

onready var keys := [$Control/HBoxLeft/C, $Control/HBoxLeft/X]
onready var buttons := [$Control/HBoxLeft/C/Control/Button, $Control/HBoxLeft/X/Control/Button, $Control/HBoxLeft/Up/Control/Button, $Control/HBoxLeft/Down/Control/Button, $Control/HBoxLeft/Left/Control/Button, $Control/HBoxLeft/Right/Control/Button]

func _ready():
	connect("visibility_changed", self, "vis")
	
	visible = (OS.has_touchscreen_ui_hint() and OS.get_name() == "HTML5") or OS.get_name() == "Android"
	vis()

func vis():
	UI.visible = !visible

func turn_arrows(arg := false):
	pass
#	var g = (PI * 0.5) if arg else 0
#	arrows[0].rotation = g
#	arrows[1].rotation = g + PI

func show_keys(arg_arrows := true, arg_c := true, arg_x := true, arg_pause := false, arg_passby := false):
	left.visible = arg_arrows
	keys[0].visible = arg_c
	keys[1].visible = arg_x
	top.visible = arg_pause
	for i in buttons:
		i.passby_press = arg_passby
