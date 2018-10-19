TestU01, a fork of  HTestU (a haskell strip down of TestU01)
------

Framework for testing correctness of Pseudorandom Number Generators
(PRNGs) in Haskell.  Wrapper for a TestU01 framework as per paper
["TestU01: A C Library for Empirical Testing of Random Number Generators" by P. L'Ecuyer and R. Simard](http://simul.iro.umontreal.ca/testu01/tu01.html)

For examples of how to run the tests, read and build the exe
referenced in the cabal file either:


## THIS set of directions is out of date
* via cabal

    > cabal configure -ftestKnownRNGs
    > cabal install



## building
* assumes GMP is installed
* you should be in C99 or newer
