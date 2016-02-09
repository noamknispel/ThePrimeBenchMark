all: python3 c

python3: prime.py
	py3compile -V 3.0- prime.py

c: prime.c
	gcc --std=c99 -Wall -lm prime.c

clean:
	- rm -fr a.out __pycache__

test: all
	@ time -f "%C : %E seconds" ./a.out 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.py 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.lua 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.php 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.rb 100000 > /dev/null
	@ time -f "%C : %E seconds" node --use_strict prime.js 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.awk 100000 > /dev/null
