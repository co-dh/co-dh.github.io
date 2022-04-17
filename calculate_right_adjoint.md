# Calculating Right Adjoint in Preorder from Left Adjoint 
    L x ≤ y ↔ x ≤ R y
Given y, how to get x?

But any Preorder (Q, ≤), there be 0, 2, or more elements( S=(a.L, b.L)) below smaller than x and also in the image of L. 
Does S has a join j? Even yes, j may be not in the range of L.

    c  d            c.R d.R
    | /              |  / 
    m               m.R
                     |
          <--        y
                     |
    j               j.L
    | \              |  \ 
    a  b             a.L  b.L

Here I use [dot as application](dot_as_application.md), and [juctaposition as composition](junctaposition_as_composition.md).

but the preimage of S can have a join j, and this is the x we are looking for.
So:
    y ≥ (a.L, b.L) -inv[f]-> (a,b) -join-> j 
    R = ≥ inv[L] join

## Why the condition that Left adjoint preserve join, Right adjont preserve meet is not used above?
It's actually used implicitly with j = join(a,b), and j.L is is also the join of a.L and b.L

# Calculating Left Adjoint from R
Give double: 1 ? 2  -> 2 3 4, how to find the inverse of 3?
We can find all elements that are larger than 3, and in range of double, find it's inverse, then get meet of the result.
    3 ≤ 4 6 8 ... -[half]-> 2 3 4 ... -[meet]-> 4
    L = ≤ inv[R] meet
