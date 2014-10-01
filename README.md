Rewriting Inject
================

Part 1 of this week's challenge was to reopen the Array class and reimplement the inject method. I rewrote inject using two approaches: using iterators and using recursion. Both rewrites were test-driven with Rspec and compared against the standard inject method. They are able to take starting values and/or method symbols, and the original array is left unchanged at the end.

How to use
----------
Clone the repository:
```shell
$ git clone git@github.com:ch2ch3/rewriting-inject.git
```

Change into the directory:
```shell
$ cd rewriting-inject
```

To run the rests:
```shell
$ rspec
```

To use the methods, open in IRB and require the array.rb file:
```shell
$ irb
  > require './lib/array'
```

Try it out!
```shell
  > array = [1, 2, 3, 4, 5]
  > array.iterative_inject(:+)
  > array.recursive_inject(:+)
```