# Max's Conway's Game of Life

During my time at General Assembly, for one of the training sessions we had a full day of "code retreat" where we practiced using different group coding methods and cooperating to try to solve a coding problem under various constraints.  The problem we were given was to implement Conway's Game of Life.  (See below for a description of Conway's Game of Life, provided by General Assembly.)

I was actually familiar with Conway's Game of Life (from way back in [Microsoft Entertainment Pack 3](https://en.wikipedia.org/wiki/Microsoft_Entertainment_Pack#Microsoft_Entertainment_Pack_3)) so after the retreat was over, I wanted to try to complete the problem we had started during that day.  This repository contains my follow-up, a simulation of Conway's Game of Life using Ruby.

The logic is found in file `lib\conway.rb`.  This file can be executed as-is to run a pre-defined demonstration in the terminal consisting of a 40x40 grid with one glider and one three-period pulsar.  The glider will proceed across the board until it reachees the edge, while the pulsar will repeat indefinitely.

Alternatively, the data from the file can be loaded into a Ruby interpreter, and a new gameboard can be instantiated with an x and y board size (`Gameboard.new(x, y)`).  Then this `make_alive` method of this gameboard can be given an X and Y coordinate for each initial living cell.  Finally, the gameboard's `start_game` method is used to run the simulation.  See the demo code at the bottom of `lib\conway.rb` for the example.

## Conway's Game of Life

The Game of Life, also known simply as Life, is a cellular automaton devised by
the British mathematician John Horton Conway in 1970.

Visualization of the Game of Life:

[Interactive Conway's Game of Life](http://pmav.eu/stuff/javascript-game-of-life-v3.1.1/)


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
