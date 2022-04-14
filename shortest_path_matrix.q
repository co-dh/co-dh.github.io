infToNull:{@[x; where 0W=x; : ; 0N]}
short: { infToNull each x {min x+y}/:\: flip y}
distance: {(short[x]/) x}
\
# Get Shortest Path with Matrix Multiplication
[Fong & Spivak, 2018, P62] Exercise 2.58
## Adjacency Matrix of X of (2.56)
It's possible to put label around matrix in Q, and do multiplication, like D4M.
Here we do not use label.
The row is the source of the arrow, and column is the destination.
rows are labeled with A B C D.
0N is null. I'm not use 0W here because 0W + 0W = -2 in Q.

~~~q
    show X: (0 0N 3 0N; 2 0 0N 5; 0N 3 0 0N; 0N 0N 6 0);
    / from A , you can only reach A B C D at following cost
    a: "ABCD"
    0N!a!X[0];
    / from A B C D, you can reach B with cost 3
    0N!a!X[;1];
    / from A to B by any of A/B/C/D, you have the following cost. 
    0N!a!X[0]+X[;1];
    /As you can see, if you go by C to B, your cost is 6, and there is no other way from A to B in 1 steps.
    show min X[0] + X[;1]
~~~

## Define matrix multiplication for shortest.
We use infix notation here for the matrix multiplication because it more clear.
~~~q
    .q.S : { x {min x+y}/:\: flip y}
    show X S X
~~~ 
The 0W at row 3(D) to column 0(A) is because min[ 0N 0N] gives 0W in Q.
We use infToNull to change 0W back to 0N, and redefine .q.S

~~~q
    .q.S : { infToNull each x {min x+y}/:\: flip y}
    show X S X
~~~ 
## X^2, X^3, X^4
~~~q
    show X S X S X
    show X S X S X S X
~~~
X^3 is the same as X^4, the closure of S is the cost matrix of any lenght
~~~q
    show (S[X]/) X
    show distance X
~~~
