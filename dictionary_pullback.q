inverse:{ value[x]!key x } /inverse a dictionary's key and value
pullback: {[f; x] raze group[f]x }
rightAdjoint:{[f; x] where all x in/:\: group f}
leftAdjoint: {[f; x] where any x in/:\: group f}
leftAdjoint2:{[f] f} //another definition, since f: dictionary is implicitly mapped

\
# Pullback of a function f: A->B ( represented as dictionary in Q)
The inverse of f in Q is group[f]: B->[A] that map b to it's preimage. However B has no order, but [B] can have order(⊆),
we define **pullback[f] : [B]->[A] = a|-> a.group[f].map.concat** .

In Q, map are implicitly for dictionary: d 1 2 = d[1],d[2]

~~~q
show f: 0 1 2 !`a`a`b /function f as dictionary
show group f
p: pullback[f]
    k: (`a; `b; `a`b)
    show k!p each k
~~~

## pullback is monotone

    (1#`a) ⊆ `a`b ⇒ (p 1#`a)  ⊆ p `a`b
    
## pullback preserve meet, so it's a right adjoint(meet the right person), and it has a left adjoint.
    (1#`a)  ∩  `a`b =   1#`a
    p[1#`a] ∩ p`a`b = 0 1 ∩ 0 1 2 = 0 1 = p 1#`a


## pullback's left adjoint:
    
The left adjoint function L has the type [A]->[B]. Given x: 0 2 of type [A],
[0] is a subset of 0 1, which map to a by the p: pullback of f.
Why am I apply enlist on each element of x here?

    x: 0 2
    / y: set of `a`b
    L x ⊆ y ↔ x ⊆ p y
    
    / let's say y is [`a]
    L x ⊆ [`a] ↔ x ⊆ 0 1
    / similarly, when y is [`b]
    L x ⊆ [`b] ↔ x ⊆ [2]
    / similarly, when y is [`a`b]
    L x ⊆ `a`b ↔ x ⊆ [0 1 2]
    
How do we define L here? We reverse both sides of ↔ in above equations.

    x ⊆ 0 1 ↔ L x ⊆ [`a]
so if x is [], [0], [1], or 0 1, L x ⊆ [`a]
    [ ]   -[L]->? ⊆ [`a] 
    [0]   -[L]->? ⊆ [`a] 
    [1]   -[L]->? ⊆ [`a] 
    [0 1] -[L]->? ⊆ [`a]
    
The question marke here can be either [], or [a]. If it's [], then something may break.

    [ ]   -[L]-> [`a] ⊆ [`a] 
    [0]   -[L]-> [`a] ⊆ [`a] 
    [1]   -[L]-> [`a] ⊆ [`a] 
    [0 1] -[L]-> [`a] ⊆ [`a]
    
similar for [2]
    [2] -[L]-> [`b] ⊆ [`b]
    
What about x: 0 1 2? I know the answer must be [a b], but how?
    [0 1 2] -[L]-> [`a`b] ⊆ [`a `b]

It seemed that the only reason approach is to enlist each x, and take the union of the result
    
    [0] -[L]-> [`a] ⊆ [`a`b] 
    [1] -[L]-> [`a] ⊆ [`a`b] 
    [2] -[L]-> [`b] ⊆ [`a`b]

Here is how we implement it in Q
~~~q
    show group f
    show 0 in/: group f 
    show where 0 in/: group f 
    show where 2 in/: group f
    show 0 2 in/:\: group f
    0N!where each 0 2 in/:\: group f
    0N!raze where each 0 2 in/:\: group f;
~~~

## The left adjoint of pullback of a function f represented as dictionary is:

    leftAdjointOfPullBack: {[f]raze where each x in/:\: group f}
    
But this do not like approach from above to me, it looks like approach from below ( right adjoint) to me.


## pullback preserve join, so it's a left adoint, and it has a left adjoint
    
    (1#`a)  ∪  `a`b =   1#`a
    p[1#`a] ∪ p`a`b = p 1#`a
    
       
### pullback is a left adjoint, it's right adjoint l is:

    0 enlist [0] ⊆ 0 1 -> a
    1 enlist [1] ⊆ 0 1 -> a
    all[(enlist each x) ⊆\: ■] -group[f]-> b
    
~~~q
    show group f
    show 0 in/: group f
    show 1 in/: group f
    show 0 1 in/:\: group f 
    show all 0 1 in/:\: group f 
    show where all 0 1 in/:\: group f
~~~
    
    
