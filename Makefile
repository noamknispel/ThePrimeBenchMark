.PHONY: all test clean c clojure
ROUNDS ?= 100000

.PHONY: all
all: c clojure go

.PHONY: c
c: a.out

.PHONY: clojure
clojure: target/uberjar

target/uberjar:
	cd prime.clj; lein uberjar

a.out:
	gcc --std=c99 -Wall -lm -O3 prime.c

.PHONY: clean
clean:
	git clean -fdX

go: prime.go
	go build -o go prime.go

.PHONY: all
test: all
	@ time -f "%C : %E seconds" ./a.out $(ROUNDS) > /dev/null
	@ time -f "%C : %E seconds" java -jar prime.clj/target/uberjar/*-standalone.jar $(ROUNDS) > /dev/null
	@ [ -n "$$(which python)" ] && time -f "%C : %E seconds" ./prime.py $(ROUNDS) > /dev/null
	@ [ -n "$$(which python3)" ] && time -f "%C : %E seconds" python3 prime.py $(ROUNDS) > /dev/null
	@ [ -n "$$(which pypy)" ] && time -f "%C : %E seconds" pypy  prime.py $(ROUNDS) > /dev/null
	@ [ -n "$$(which lua)" ] && time -f "%C : %E seconds" ./prime.lua $(ROUNDS) > /dev/null
	@ [ -n "$$(which luajit)" ] && time -f "%C : %E seconds" luajit prime.lua $(ROUNDS) > /dev/null
	@ [ -n "$$(which php)" ] && time -f "%C : %E seconds" ./prime.php $(ROUNDS) > /dev/null
	@ [ -n "$$(which php7.0)" ] && time -f "%C : %E seconds" php7.0 prime.php $(ROUNDS) > /dev/null
	@ [ -n "$$(which ruby)" ] && time -f "%C : %E seconds" ./prime.rb $(ROUNDS) > /dev/null
	@ [ -n "$$(which node)" ] && time -f "%C : %E seconds" ./prime.js $(ROUNDS) > /dev/null
	@ [ -x /usr/bin/awk ] && time -f "%C : %E seconds" ./prime.awk $(ROUNDS) > /dev/null
	@ [ -n "$$(which tclsh)" ] && time -f "%C : %E seconds" ./prime.tcl $(ROUNDS) > /dev/null
