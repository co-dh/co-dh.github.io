\
# How many functions are there from 0 1 2 to 0 1 2?
3 exp 3 = 27
Each function can be reprented as an array of 3. Function composition can be represented as array application.

~~~q
    show f: 0 1 2!1 2 0
    show f f
~~~

## There are 27 functions from 0 1 2 to 0 1 2.
~~~q
    x: til 3
    rc: {raze x,/:\:y}
    show fs: rc[x;]rc[x;x]
    count fs
~~~

## composition matrix
matrix[row; col] = fs[row] @ fs[col]

~~~q
    show A: fs ? (fs @\:/: fs)
~~~
## Most frequent functions in composition matrix
~~~q
    show dist: desc count each group raze fs ? (fs @/:\: fs)
~~~
### constant function appears most
~~~q
    show fs 0 13 26
~~~
### functions that map from 0 1 2 to 2 distinct elements appears secondly
~~~q
    show fs where dist = 24
    show {count each group each x} fs where dist = 24
~~~

### The rest 6 bijection/permutation functions forms a group
~~~q
    show fs where dist = 6
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
