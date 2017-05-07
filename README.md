# Sudoku
Forked from Dev Bootcamp
Single day challenge, completed on 3/10/2017

## Developers:
- Linsey Reed
- Josh Mun
- Seth Georu
- Grace Noh

## Summary
![solving sequence animation](readme-assets/sequence.gif)  
*Figure 1*.  Animation solving a sudoku puzzle and partially verifying the solution.

[Sudoku](http://en.wikipedia.org/wiki/Sudoku) is a logic-based, combinatorial number-placement puzzle. The objective is to fill a 9×9 grid with digits so that each column, each row, and each of the nine 3×3 sub-grids that compose the grid (also called "boxes") contains the digits from 1 to 9.

Generally, a puzzle provides a partial solution so that some squares already have numbers.  To solve the puzzle, we need to fill in the unsolved squares, as demonstrated in Figure 1.

By the end of this challenge we'll have a fully functioning Sudoku solver that runs from the command line.  We'll be presented with 15 unsolved Sudoku puzzles.  The puzzles can be found in the file `sudoku_puzzles.txt`.

 * Five puzzles can be solved with **basic logic**.
 * Five require slightly more **advanced logic**.
 * Five require **educated guessing**.
 
A complete solution to this challenge will solve all 15 puzzles.

### Restrictions

Failing to follow the following restrictions will result in an invalid submission:

 - Do not create classes, you will only be creating (many) methods.
 - No instance variables and no globals, you will only use local variables.

To accomplish this, you will be writing methods that accept arguments as inputs and return useful values representing their work. You should be writing many methods, and using them together to build up your solver.

## Testing
Good news: you will be creating many small methods, and small methods are easier to test.

The number of tests you write is completely up to you. Testing is for _you_, and will help you develop code. You must balance testing with the need to write code and make progress on the solution, but remember that being able to easily run tests that prove your code is working correctly can help you move faster.

