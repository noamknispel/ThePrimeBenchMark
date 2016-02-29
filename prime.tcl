#!/usr/bin/env tclsh

###########################################
# Dummy prime list genetor by Barak Bloch #
###########################################


proc is_prime n {
	set sq [expr { sqrt($n)}]
	set sqlen [string length $sq]
	if {[string range $sq $sqlen-1 $sqlen] == ".0"} {
		return 0
	}
	set cei [expr {ceil($sq)}]
	for {set i 2} {$i < $cei} {incr i} {
		if {[expr {fmod($n,$i) } ] == 0} {
			return 0
		}
	}
	return 1
}


if { $::argc > 0 } {
	set primes  { }
	set i 0	
	
	 while {[llength $primes] < [lindex $::argv 0]} {
	 	if {[is_prime $i] == 1} {
	 		lappend primes $i
	 	}
	 	incr i
	 }
	 puts $primes
} else {
	puts "Error, please pass number of prime numbers to show"
}
