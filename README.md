# Max's Conway's Game of Life

This repository contains my attempt to generate a simulation of Conway's Game of
Life using Ruby.

Below is a description of Conway's Game of Life, provided by General Assembly.

## Conway's Game of Life

The Game of Life, also known simply as Life, is a cellular automaton devised by
the British mathematician John Horton Conway in 1970.

Visualization of the Game of Life:

![Alt Conway's Game of Life](http://pmav.eu/stuff/javascript-game-of-life-v3.1.1/)


<!--
Image from Population Dynamics(http://www.slideshare.net/pelikan/stars2012-finalpresentation)

-->

The "game" is a zero-player game, meaning that its evolution is determined by
its initial state, requiring no further input. One interacts with the Game of
Life by creating an initial configuration and observing how it evolves.

The universe of the Game of Life is an **infinite two-dimensional orthogonal
grid** of square cells, each of which is in one of two possible states, live or
dead. Every cell interacts with its eight neighbors, which are the cells that
are directly horizontally, vertically, or diagonally adjacent.

### Rules

At each step in time, the following transitions occur:

1.  Any live cell with fewer than two live neighbors dies, as if caused by
    underpopulation.
1.  Any live cell with more than three live neighbors dies, as if by
    overcrowding.
1.  Any live cell with two or three live neighbors lives on to the next
    generation.
1.  Any dead cell with exactly three live neighbors becomes a live cell.

The initial pattern constitutes the seed of the system. The first generation is
created by applying the above rules simultaneously to every cell in the seed.
**Births and deaths happen simultaneously**, and the discrete moment at which
this happens is sometimes called a `tick` (in other words, each generation is a
pure function of the one before). The rules continue to be applied repeatedly to
create further generations.

Here is a visual representation of what is happening:

![population-dynamics-in-conways-game-of-life-and-its-variants-9-728](https://cloud.githubusercontent.com/assets/10408784/17438008/b3013c1a-5aee-11e6-888c-65946800ebcd.jpg)
