mm: {x {sum x*y}/:\: flip y}

\
# Matrix multiplication in Q

Give matrix x and y
~~~q
    0N!x: enlist 1 2;
    show y: (1 0 2; 2 0 1)
~~~

You take a row x[i] from x, a column y[;j] from y, multiply them elementwisely, and take the sum
~~~q
    show x[0]
    show y[;0]
    show x[0] * y[;0]
    show sum x[0] * y[;0]
~~~
and you do this for every row i of x and column j of y,
~~~q
    0N!x {sum x*y}/:\: flip y;
~~~ 
