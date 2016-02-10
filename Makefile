.PHONY: all test clean c python3
ROUNDS = 100000

c: a.out

python3: __pycache__

all: python3 c

__pycache__:
	py3compile -V 3.0- prime.py

a.out:
	gcc --std=c99 -Wall -lm prime.c

clean:
	- rm -fr a.out __pycache__

test: all
	@ time -f "%C : %E seconds" ./a.out $(ROUNDS) > /dev/null
	@ [ -n "$$(which python3)" ] && time -f "%C : %E seconds" ./prime.py $(ROUNDS) > /dev/null
	@ [ -n "$$(which lua)" ] && time -f "%C : %E seconds" ./prime.lua $(ROUNDS) > /dev/null
	@ [ -n "$$(which php)" ] && time -f "%C : %E seconds" ./prime.php $(ROUNDS) > /dev/null
	@ [ -n "$$(which php7.0)" ] && time -f "%C : %E seconds" php7.0 prime.php $(ROUNDS) > /dev/null
	@ [ -n "$$(which ruby)" ] && time -f "%C : %E seconds" ./prime.rb $(ROUNDS) > /dev/null
	@ [ -n "$$(which node)" ] && time -f "%C : %E seconds" ./prime.js $(ROUNDS) > /dev/null
	@ [ -x /usr/bin/awk ] && time -f "%C : %E seconds" ./prime.awk $(ROUNDS) > /dev/null
