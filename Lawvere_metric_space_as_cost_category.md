# A Lawvere metric space is a Cost-category.

A metric space can be represented with a weight graph, with label being shortest length
between nodes.

## Given adjancy matrix, get length of shortest path between nodes.

~~~q
    / x[i][j] is the length from i to j directly.
    show x: `A`B`C`D!flip `A`B`C`D!( 0 2 0 0; 0 0 3 0; 3 0 0 6; 0 5 0 0)
    / Let's get rid of the label, so we can use matrix multiplication
    x: flip value flip value x
    0N!x+/:\:flip x;
    
    
~~~

