extends Node
var plr = null
var els = null
var paus = false
var gte = 0
var score = 0
var dmg = 1
var rate = 0.25
var speed = 1000
var pir = 0
var upgrades = []
var h = -1
var aura = 0
var n = 100
var m = 0
var crit = 1
var ran = 0
var bomb = 0
var death =0
func reset():
	death = 0
	bomb = 0
	crit =1
	ran=0
	m=0
	n=100
	aura = 0
	gte = 0
	h=-1
	paus = false
	upgrades.clear()
	score = 0
	els = null
	plr = null
	dmg = 1
	rate = 0.25
	speed = 1000
	pir = 0
