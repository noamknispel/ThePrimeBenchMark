all: python3 c

python3: prime.py
	pycompile -V 3.4 prime.py

c: prime.c
	gcc --std=c99 -Wall -lm prime.c

clean:
	rm -r a.out __pycache__

test:
	echo 'Not yet implemented.'
