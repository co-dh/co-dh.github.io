\l boolean_matrix_multiplication.q
transitive: { x ~(bmm[x;]/) 0N!x } /WRONG
transitive: { all raze bmm[x;x] <= x}

\
# Define transitive in Boolean Matrix
A boolean Matrix M represented preorder is transitive if M * M * M ... = M

## Examples

### Id Matrix is transitive
~~~q
    transitive (100b; 010b; 001b)
~~~

### An example of non transitive relation:
/a≤b, b≤c, but not a≤c
~~~q
    transitive (010b; 001b; 000b) 
~~~

Agda can be a very good language to express these idea, but I don't want get distracted now.

## An example that do not converge
~~~q
    x: (100b;101b;010b)
    f: bmm[x;]
    x
    f x
    f f x
    f f f x
~~~

## The above definition is wrong.
M * M is is what you can reach in 2 steps, it doesn't necessarily include what you can reach in 1 step.
To test if a Matrix is transitive, we just need to know if M * M ≤ M. (I'm wondering if M * M = M works too)
~~~q
    transitive x
    
