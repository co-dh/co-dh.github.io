#  Arthur's sudoku
# The sudoku table t:
~~~q
    t:value each "200370009009200007001004002050000800008000900006000040900100500800007600400089001"
    sh: {show 9 9 #x;}
    sh t
2 0 0 3 7 0 0 0 9
0 0 9 2 0 0 0 0 7
0 0 1 0 0 4 0 0 2
0 5 0 0 0 0 8 0 0
0 0 8 0 0 0 9 0 0
0 0 6 0 0 0 0 4 0
9 0 0 1 0 0 5 0 0
8 0 0 0 0 7 6 0 0
4 0 0 0 8 9 0 0 1
~~~

## Position P
### 9 vs convert numbers to ninary
~~~q
    show 9 vs 1 2 9 10 //each column is a result. it's not the same as 9 vs/:
0 0 1 1
1 2 0 1
    show 9 vs/: 1 2 9 10
,1
,2
1 0
1 1
~~~

### P 0 is the row of each cell
~~~q
    P,:3 sv floor(P:9 vs til 81)%3
    sh P 0
0 0 0 0 0 0 0 0 0
1 1 1 1 1 1 1 1 1
2 2 2 2 2 2 2 2 2
3 3 3 3 3 3 3 3 3
4 4 4 4 4 4 4 4 4
5 5 5 5 5 5 5 5 5
6 6 6 6 6 6 6 6 6
7 7 7 7 7 7 7 7 7
8 8 8 8 8 8 8 8 8
~~~
### P 1 is the column of each cell
~~~q
    sh P 1
0 1 2 3 4 5 6 7 8
0 1 2 3 4 5 6 7 8
0 1 2 3 4 5 6 7 8
0 1 2 3 4 5 6 7 8
0 1 2 3 4 5 6 7 8
0 1 2 3 4 5 6 7 8
0 1 2 3 4 5 6 7 8
0 1 2 3 4 5 6 7 8
0 1 2 3 4 5 6 7 8
~~~
### P 2 the sub table of each cell
~~~q
    sh P 2
0 0 0 1 1 1 2 2 2
0 0 0 1 1 1 2 2 2
0 0 0 1 1 1 2 2 2
3 3 3 4 4 4 5 5 5
3 3 3 4 4 4 5 5 5
3 3 3 4 4 4 5 5 5
6 6 6 7 7 7 8 8 8
6 6 6 7 7 7 8 8 8
6 6 6 7 7 7 8 8 8
~~~
# Abstraction and Readability
TODO

## The first empty cell is 1, find all choices of it by excluding all the numbers of the same row, column, subtable.
~~~q
    show w: where not t /the index of empty cel
1 2 5 6 7 9 10 13 14 15 16 18 19 21 22 24 25 27 29 30 31 32 34 35 36 37 39 40..
    show P[;1] / the row, column, block of cell 1
0 1 0
    sh first P[;1] = P /all cells that has the same row as cell 1
111111111b
000000000b
000000000b
000000000b
000000000b
000000000b
000000000b
000000000b
000000000b
    sh @[;1] P[;1] = P  /all cells that has the same column as cell 1
010000000b
010000000b
010000000b
010000000b
010000000b
010000000b
010000000b
010000000b
010000000b
    sh @[;2] P[;1] = P  /all cells that has the same block as cell 1
111000000b
111000000b
111000000b
000000000b
000000000b
000000000b
000000000b
000000000b
000000000b
    sh (or) over P[;1]=P /all cells that are either in the same row, or column, or block as cell 1
111111111b
111000000b
111000000b
010000000b
010000000b
010000000b
010000000b
010000000b
010000000b
    show where (or) over P[;1]=P /the index of all above cells
0 1 2 3 4 5 6 7 8 9 10 11 18 19 20 28 37 46 55 64 73
    show same: t where (or) over P[;1]=P /the values of all cells that are either in the same row, or column, or block with cell 1
2 0 0 3 7 0 0 0 9 0 0 9 0 0 1 5 0 0 0 0 0
~~~


## Usage of ?
~~~q
    show 2 3 ? 2    /the index of 2 in 2 3
0
    show 2 3 ? 0    /the index of 0 in 2 3. 0 is not in 2 3, so return # 2 3
2
    show 2 3 ? 0 1 2
2 2 0
~~~

## find missing numbers
~~~q
    show same
2 0 0 3 7 0 0 0 9 0 0 9 0 0 1 5 0 0 0 0 0
    show count same //there are 21 cells that has the same row, column, or subtable as cell 1.
21
    show same?til 10 //find 0 to 9 from those cells, if can't find, it will return 21.
1 14 0 3 21 15 21 4 21 8
    show 21 = same?til 10
0000101010b
    show where 21 = same?til 10 //these are the numbers from 0 to 9 that is missing from above cells
4 6 8
~~~

## fill current table with each of the choices
~~~q
    / x is a table, y is the index of an empty cell.
    / T->I->[T]. table, int to table.
    fill: {@[x;y;:;]each where 21=x[where(or)over P[;y]=P]?til 10} /fill 1 cell with choices

    / the first cell have 3 choices: 4 6 8
    sh fill[t; 1] 0 /put 4 at 1
2 4 0 3 7 0 0 0 9
0 0 9 2 0 0 0 0 7
0 0 1 0 0 4 0 0 2
0 5 0 0 0 0 8 0 0
0 0 8 0 0 0 9 0 0
0 0 6 0 0 0 0 4 0
9 0 0 1 0 0 5 0 0
8 0 0 0 0 7 6 0 0
4 0 0 0 8 9 0 0 1
    sh fill[t; 1] 1 /put 6 at 1
2 6 0 3 7 0 0 0 9
0 0 9 2 0 0 0 0 7
0 0 1 0 0 4 0 0 2
0 5 0 0 0 0 8 0 0
0 0 8 0 0 0 9 0 0
0 0 6 0 0 0 0 4 0
9 0 0 1 0 0 5 0 0
8 0 0 0 0 7 6 0 0
4 0 0 0 8 9 0 0 1
    sh fill[t; 1] 2 /put 8 at 1
2 8 0 3 7 0 0 0 9
0 0 9 2 0 0 0 0 7
0 0 1 0 0 4 0 0 2
0 5 0 0 0 0 8 0 0
0 0 8 0 0 0 9 0 0
0 0 6 0 0 0 0 4 0
9 0 0 1 0 0 5 0 0
8 0 0 0 0 7 6 0 0
4 0 0 0 8 9 0 0 1
~~~


## f@g'
~~~q
    show parse "f@g'" /this is a composition, where the first element is f, second is g'.
'
(@;`f)
(';`g)
    show parse "f g'" /space here is not composition.
(';`g)
`f
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
2 8 4 3 7 5 1 6 9
6 3 9 2 1 8 4 5 7
5 7 1 9 6 4 3 8 2
1 5 2 4 9 6 8 7 3
3 4 8 7 5 2 9 1 6
7 9 6 8 3 1 2 4 5
9 6 7 1 4 3 5 2 8
8 1 3 5 2 7 6 9 4
4 2 5 6 8 9 7 3 1
~~~



```
## Library Code[^1]
~~~q
```
~~~

[^1]: This file is generated by [qnote.q](https://github.com/co-dh/qnote)
