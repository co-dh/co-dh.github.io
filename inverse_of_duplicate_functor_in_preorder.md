# Inverse of duplicator functor Δ in preorder.
The duplicator function dup: x -> (x,x) is a bi functor/monomap in preorder, that is, it preserve order.
What's it's inverse? Given (x,y), how do we get a inverse of dup?
First, the inverse do not exist. (x,y) has no preimage if x ≠ y. So we can only find something approximate it.

By [calculate_right_adjoint.md](calculate_right_adjoint.md),
    (x,y) ≥ (a,a), (b,b),... -inv[dup]-> a,b,... -[join]-> m=meet(x,y)
m is the join of all z:a,b,... that z ≤ x and z ≤ y, and that meet's definition.

Similarly, we have left adjoint of Δ
    (x,y) ≤ (a,a), (b,b),... -inv[dup]-> a,b,... -[meet]-> j=join(x,y)

# ∧ -| Δ -| ∨
