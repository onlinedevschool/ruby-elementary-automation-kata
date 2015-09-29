# Elemenntary Cellular Automation in Ruby

Cellular Automaton is a model of a grid of 'cells' that change over time based on the patterns of nearby cells.

The objective of this challenge is to create an Elementary Automaton, or a 1-dimensional version of changing cells. Given a starting string of 1's and 0's can you determine the next steps for the Automaton?


## Cloning the kata

``` sh
git clone git@github.com:onlinedevschool/ruby-elementary-automation-kata.git
```

## Implementing your own version

Check out the `starthere` branch:

``` sh
git checkout starthere
```

You will find a `shell.rb` file and a `round.rb` file.

The shell.rb file is the `imperative shell`, which essentially kicks off the program. You can think of it as main, if you think of such things.

The round.rb file is where you will code your solution. Each round as specified by the program input (more on that below) will be generated inside this file.

Finally the `shell command` to run this excersize is a combination of several `unix commands`, `piped` together to generate the output. A unix pipe is essentially a way to redirect the output of one unix command into another so you can further process the output before it hits the terminal screen.

``` sh
ruby shell.rb < input > results && diff output results
```

The input file is your program instruction code. It contains the format as described below in the rules:

```
3
1 15
110111 20
100001 25
```

Essentially this command used `ruby` to run the `shell.rb` file, which takes `STDIN` in this case, our `input` file, and then the result of that gets `redirected` to a file called `results`. We then use the AND operator to consecutively run the `diff` command after the previous commands have done their thing.

And in that `diff` we just compare the result of our command with the expected result, found in the `output` file.

## The Rules

To determine the next step for a given cell, simply look at the cell and its two immediate neighbors. The rules for life and death and rebirth come [from the 110 Rule](https://en.wikipedia.org/wiki/Rule_110):

|-----------------------|-----|-----|-----|-----|-----|-----|-----|-----|
| current pattern       | 111 | 110 | 101 | 100 | 011 | 010 | 001 | 000 |
| center cell becomes   |  0  |  1  |  1  |  0  |  1  |  1  |  1  |  0  |
|-----------------------|-----|-----|-----|-----|-----|-----|-----|-----|

For example, if given a string `111`, the middle cell will turn into a `0`, as shown in the first column of the above table.

The right (and far-left) sides of the string are considered 0's and are not shown in the input or output. This means the string:

0 1 1 1

will become:

1 1 0 1 

In each case, you will be given an input string to start with and a number b. Can you output the next b steps of the Automaton?

## Program Input Description

You will be given a number `N` followed by `T` lines. Each line will contain 2 numbers: `A`, the starting pattern for the automaton, and `B`, the number of lines of the pattern to output.

The provided boilerplate code will provide both a and b as integers to the method doStuff.

## The Program Output Format

For each test case, output the specified number of lines of the pattern (including the starting string).

For this challenge, always print out the same length string. To do this, print out `B` 0's along with the given input and decrease the leading 0's by 1 on each line.

### Sample Input/Output

Input
```
 1
 1 15
```

Output
```
 0000000000000001
 0000000000000011
 0000000000000111
 0000000000001101
 0000000000011111
 0000000000110001
 0000000001110011
 0000000011010111
 0000000111111101
 0000001100000111
 0000011100001101
 0000110100011111
 0001111100110001
 0011000101110011
 0111001111010111
```

## To see the final code as completed by me

Checkout the branch 'complete', then run this in the terminal:

``` sh
ruby shell.rb < input > results && diff output results
```

This command will return nothing if successful (in the true unix fashion) or a 'diff' of the differences if the utility is not creating correct output.
