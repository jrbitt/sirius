extends Node

export(String) var prefix_ip_network = "192.168."

var url = ""

func _ready():
	define_ip()

func define_ip():
	var ips = IP.get_local_addresses()
	for i in ips:
		if i.begins_with(prefix_ip_network):
			var index = i.rfindn(".")
			url = "http://"+i.substr(0,index)+".1/"

func near():
	$request.request(url+"temAlguemProximo/")
	
func turn_motor(ang,vel):
	var sang = "ang="+str(ang)
	var svel = "vel="+str(vel)
	$request.request(url+"girarMotor/"+sang+"&"+svel)
	
func setup_leds(colors):
	var scolors = ""
	for c in colors:
		scolors = scolors + str(c)+","
	$request.request(url+"corLeds/p="+scolors)

func leds(sequence):
	var ssize_seq = sequence.length()
	var sseq = ""
	for s in sequence:
		var ss = str(s[0])+","+str(s[1])
		sseq = sseq + ss + ";"
	$request.request(url+"leds/p="+ssize_seq+";"+sseq)
	
func display(sequence):
	var ssize_seq = sequence.length()
	var sseq = ""
	for s in sequence:
		var ss = str(s[0])+","+str(s[1])+","+str(s[2])
		sseq = sseq + ss + ";"
	$request.request(url+"display/p="+ssize_seq+";"+sseq)
	
func _on_request_request_completed(result, response_code, headers, body):
	
	# TODO
	
	pass # replace with function body
