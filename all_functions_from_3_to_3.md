# How many functions are there from 0 1 2 to 0 1 2?
3 exp 3 = 27
Each function can be reprented as an array of 3. Function composition can be represented as array application.

~~~q
    show f: 0 1 2!1 2 0
0| 1
1| 2
2| 0
    show f f
0| 2
1| 0
2| 1
~~~

## There are 27 functions from 0 1 2 to 0 1 2.
~~~q
    x: til 3
    rc: {raze x,/:\:y}
    show fs: rc[x;]rc[x;x]
0 0 0
0 0 1
0 0 2
0 1 0
0 1 1
0 1 2
0 2 0
0 2 1
0 2 2
1 0 0
1 0 1
1 0 2
1 1 0
1 1 1
1 1 2
1 2 0
1 2 1
1 2 2
2 0 0
2 0 1
2 0 2
2 1 0
..
    count fs
~~~

## composition matrix
matrix[row; col] = fs[row] @ fs[col]

~~~q
    show A: fs ? (fs @\:/: fs)
0 0  0  0  0  0  0  0  0  13 13 13 13 13 13 13 13 13 26 26 26 26 26 26 26 26 26
0 0  0  1  1  1  2  2  2  12 12 12 13 13 13 14 14 14 24 24 24 25 25 25 26 26 26
0 1  2  0  1  2  0  1  2  12 13 14 12 13 14 12 13 14 24 25 26 24 25 26 24 25 26
0 0  0  3  3  3  6  6  6  10 10 10 13 13 13 16 16 16 20 20 20 23 23 23 26 26 26
0 0  0  4  4  4  8  8  8  9  9  9  13 13 13 17 17 17 18 18 18 22 22 22 26 26 26
0 1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26
0 3  6  0  3  6  0  3  6  10 13 16 10 13 16 10 13 16 20 23 26 20 23 26 20 23 26
0 3  6  1  4  7  2  5  8  9  12 15 10 13 16 11 14 17 18 21 24 19 22 25 20 23 26
0 4  8  0  4  8  0  4  8  9  13 17 9  13 17 9  13 17 18 22 26 18 22 26 18 22 26
0 0  0  9  9  9  18 18 18 4  4  4  13 13 13 22 22 22 8  8  8  17 17 17 26 26 26
0 0  0  10 10 10 20 20 20 3  3  3  13 13 13 23 23 23 6  6  6  16 16 16 26 26 26
0 1  2  9  10 11 18 19 20 3  4  5  12 13 14 21 22 23 6  7  8  15 16 17 24 25 26
0 0  0  12 12 12 24 24 24 1  1  1  13 13 13 25 25 25 2  2  2  14 14 14 26 26 26
0 0  0  13 13 13 26 26 26 0  0  0  13 13 13 26 26 26 0  0  0  13 13 13 26 26 26
0 1  2  12 13 14 24 25 26 0  1  2  12 13 14 24 25 26 0  1  2  12 13 14 24 25 26
0 3  6  9  12 15 18 21 24 1  4  7  10 13 16 19 22 25 2  5  8  11 14 17 20 23 26
0 3  6  10 13 16 20 23 26 0  3  6  10 13 16 20 23 26 0  3  6  10 13 16 20 23 26
0 4  8  9  13 17 18 22 26 0  4  8  9  13 17 18 22 26 0  4  8  9  13 17 18 22 26
0 9  18 0  9  18 0  9  18 4  13 22 4  13 22 4  13 22 8  17 26 8  17 26 8  17 26
0 9  18 1  10 19 2  11 20 3  12 21 4  13 22 5  14 23 6  15 24 7  16 25 8  17 26
0 10 20 0  10 20 0  10 20 3  13 23 3  13 23 3  13 23 6  16 26 6  16 26 6  16 26
0 9  18 3  12 21 6  15 24 1  10 19 4  13 22 7  16 25 2  11 20 5  14 23 8  17 26
..
~~~
## Most frequent functions in composition matrix
~~~q
    show dist: desc count each group raze fs ? (fs @/:\: fs)
0 | 87
13| 87
26| 87
1 | 24
3 | 24
4 | 24
9 | 24
10| 24
12| 24
2 | 24
6 | 24
8 | 24
18| 24
20| 24
24| 24
14| 24
16| 24
17| 24
22| 24
23| 24
25| 24
5 | 6
..
~~~
### constant function appears most
~~~q
    show fs 0 13 26
0 0 0
1 1 1
2 2 2
~~~
### functions that map from 0 1 2 to 2 distinct elements appears secondly
~~~q
    show fs where dist = 24
0 0 1
0 1 0
0 1 1
1 0 0
1 0 1
1 1 0
0 0 2
0 2 0
0 2 2
2 0 0
2 0 2
2 2 0
1 1 2
1 2 1
1 2 2
2 1 1
2 1 2
2 2 1
    show {count each group each x} fs where dist = 24
2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2
~~~

### The rest 6 bijection/permutation functions forms a group
~~~q
    show fs where dist = 6
0 1 2
0 2 1
1 0 2
1 2 0
2 0 1
2 1 0
~~~

# What's the minimal function base, that all other functions can be composed from them?
I don't know the answer yet, but 8 is enough.

Select rows where asc raze A[rows][rows] = til[27]
find the rows/cols that have most distinct functions
where 27 = count each distinct each A

~~~q
    til[27] ~ asc distinct raze A[x]@\:x:til[16] except 0 1 2 3 4 5 13
    x
    fs x
    A[x]@\:x
~~~
## Code loaded
~~~q
~~~
~~~
