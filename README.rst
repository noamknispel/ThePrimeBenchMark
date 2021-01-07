The prime benchmark
===================

Benchmarking programming languages by running program to find the first X prime
numbers. The algorithm is naive and should be implemented the same regardless of
the language.

Added languages
---------------

- C
- Lua
- PHP
- Python3
- AWK
- JS
- Ruby
- Clojure
- TCL

Usage
-----
Build:

.. code:: shell

    make

Clean:

.. code:: shell

    make clean

Test:

.. code:: shell

    make test

Also, Docker and Docker Compose are supported (so just run
:code:`docker-compose up`).

History
-------

When starting to learn Lua, I wrote a simple program to exercise the table data
structure. But I had difficulties expressing what I wanted so I first wrote the
program in Python. After I had the program written in both languages I did the
obvious thing, I timed them. From there on Barak implemented the program in PHP
and we implemented it in C. We hope to have many more languages tested.

License
-------

This software is licensed under the BSD 3-clause license (see the
:code:`LICENSE.txt` file).
