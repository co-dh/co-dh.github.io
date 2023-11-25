\
#  Arthur's sudoku
# The sudoku table t:
~~~q
    t:value each "200370009009200007001004002050000800008000900006000040900100500800007600400089001"
    sh: {show 9 9 #x;}
    sh t
~~~

## Position P
### 9 vs convert numbers to ninary
~~~q
    show 9 vs 1 2 9 10 //each column is a result to make the result as a rectangle. it's not the same as 9 vs/:
    show 9 vs/: 1 2 9 10
~~~

### P 0 is the row of each cell
~~~q
    P,:3 sv floor(P:9 vs til 81)%3
    sh P 0
~~~
### P 1 is the column of each cell
~~~q
    sh P 1
~~~
### P 2 the sub table of each cell
~~~q
    sh P 2
~~~
# Abstraction and Readability
An OO programmer would start by define a class with member row, column, and subtable, and start write member function
for it. A Haskell programmer may start by define a coproduct(structure) with the same member.
But Arthur didn't do that: he started with a very generic data type: array and 2D array, and reuse the system functions
that defined on arrays. He don't need to start a new class, and create new methods for it.
This kind of style is hard to understand, because have to guess or remember that P 0 is row, P 1 is column etc,
but like mathematic, there is no names in matrix, so you can use the same matrix for many domains.

One method of abstraction is to get rid of names.

 
## The first empty cell is 1, find all choices of it by excluding all the numbers of the same row, column, subtable.
~~~q
    show w: where not t /the index of empty cel
    show P[;1] / the row, column, block of cell 1
    sh first P[;1] = P /all cells that has the same row as cell 1
    sh @[;1] P[;1] = P  /all cells that has the same column as cell 1
    sh @[;2] P[;1] = P  /all cells that has the same block as cell 1
    sh (or) over P[;1]=P /all cells that are either in the same row, or column, or block as cell 1
    show where (or) over P[;1]=P /the index of all above cells
    show same: t where (or) over P[;1]=P /the values of all cells that are either in the same row, or column, or block with cell 1
~~~


## Usage of ?
~~~q
    show 2 3 ? 2    /the index of 2 in 2 3
    show 2 3 ? 0    /the index of 0 in 2 3. 0 is not in 2 3, so return # 2 3
    show 2 3 ? 0 1 2
~~~

## find missing numbers
~~~q
    show same
    show count same //there are 21 cells that has the same row, column, or subtable as cell 1.
    show same?til 10 //find 0 to 9 from those cells, if can't find, it will return 21.
    show 21 = same?til 10
    show where 21 = same?til 10 //these are the numbers from 0 to 9 that is missing from above cells
~~~

## fill current table with each of the choices
~~~q
    / x is a table, y is the index of an empty cell.
    / T->I->[T]. table, int to table.
    fill: {@[x;y;:;]each where 21=x[where(or)over P[;y]=P]?til 10} /fill 1 cell with choices

    / the first cell have 3 choices: 4 6 8
    sh fill[t; 1] 0 /put 4 at 1
    sh fill[t; 1] 1 /put 6 at 1
    sh fill[t; 1] 2 /put 8 at 1
~~~


## f@g'
~~~q
    show parse "f@g'" /this is a composition, where the first element is f, second is g'.
    show parse "f g'" /space here is not composition.
    show 1 2 3 {x*2}'
~~~

## Binary Over
    When f has type A->B->A, that is: with A, f can absort B, (f/) can absort array of B, that is A->[B]->A.
    (+/)1 2 3
    step: (raze@{ @[x;y;:;]each where 21=x[where(or)over P[;y]=P]?til 10}')
    
## type of core
    fill          has type T  ->I->[T]
    fill'         has type [T]->I->[[T]], fill each x with y.
    raze@fill'    has type [T]->I->[T], given tables, it absort an int
    (raze@fill')/ has type [T]->[I]->[T], now it absort ints
                  It take an array of sudoku tables which have the same empty cells,
                  and indexes of the empty cells, fill the index one by one with availabe choices,
                  and collect the result as tables.
~~~q
    S:{first(enlist x)(raze@fill')/where not x}
    sh S t
~~~



```
