all: python3 c

python3: prime.py
	pycompile -V 3.4 prime.py

c: prime.c
	gcc --std=c99 -Wall -lm prime.c

clean:
	- rm -fr a.out __pycache__

test:
	@ time -f "%C : %E seconds" ./a.out 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.py 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.lua 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.php 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.rb 100000 > /dev/null
	@ time -f "%C : %E seconds" ./prime.js 100000 > /dev/null
