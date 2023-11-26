mm: {x {sum x*y}/:\: flip y}
mm0:  ('[(+/);*])\:

\
# Matrix multiplication in Q
There is a build in matrix multiplication in q: mmu($ in k).
This is my attemp to implement it, and prepare to expand with other operators other than + and *.

Give matrix x and y
    0N!x: enlist 1 2;
    show y: (1 0 2; 2 0 1)

You take a row x[i] from x, a column y[;j] from y, multiply them elementwisely, and take the sum
    show x[0]
    show y[;0]
    show x[0] * y[;0]
    show sum x[0] * y[;0]
and you do this for every row i of x and column j of y,
    0N!x {sum x*y}/:\: flip y;

# Performance measure
Given a 2000*2000 matrix,
    N:2000
    m:(N; 0N)#(N*N) ?100.0
    show system "t mm[m; m]"
    show system "t m mmu m"


# Rogui Hui's Inner Product - An Old/New Problem
Inspired by https://www.jsoftware.com/papers/innerproduct/ip1.htm,
I reimplemented it as below, but it's twice slower. Maybe because it need to hold full y in memory.
    show x: (1 2; 3 4)
    show y: (1 1 1; 1 1 1)
    show x[0]*y
    show (+/)x[0]*y
    show {(+/)x*y}[x 0;y]
    show@ '[(+/); *][x 0;y] /composition of sum and *
    show x('[(+/);*])\:y
    show system "ts mm[m; m]"
