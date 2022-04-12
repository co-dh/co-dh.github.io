# symmetric monoidal preoder: A preorder (X, ≤) with a symmetric monoidal (I, ⊗) that preserve order/close in it.
Preserver order:  **X ≤ Y ⇒ X.⊗ ≤ Y.⊗**, while X: (x1,x2), Y: (y1,y2)
Or: a monoid that close in (X, ≤)


##Examples

    | Name | SET   | Order   | I    | ⊗   |                      |
    |------| ------| --------| -----| ----| ---------------------|
    |      |ℝ      | ≤       | 0    | +   |                      |
    |      |ℕ      | ≤       | 0    | *   |                      |
    |      |Bool1  | ≤       | false| ∨   |                      |
    |      |ℕ      | divisib | 0    | +   |                      |
    |      |3      | ≤       | 0    | min | 3 value boolean      |
    |      |Prop(N)| ⇒       | True | ∧   | All proposition on N |
    | ℙ    |ℙ(S)   | ⊆       | S    | ∩   |                      |
    | Bool |0 1    | ≤       | true | ∧   |                      |
    | Cost |[0,∞]  | ≥       | 0    | +   | Cost                 |

## Opposite of monoidal preorder
By switch the order, we get another SMP, because ⊗ preserve the opposite order too.

## How many close function from (0 1, ≤) to (0 1 2 3 4, ≤)? C(5, 2) = 10
    (0 1) -> 0 0, 0 1,..      0 4
          ->      1 1, 1 2, ..1 4
          ...
          ->                  4 4

    10
    C(B, A) = B!/A!* (B-A)!
              
          
## How many SMP from A: 0 1 to B: 0 1 2 3 4?
      
### What's the decomposition relation looks like?
Well, function decomposition are not a preorder, as the permutation functions formed a group.

# DISCARD AXIOM to throw away garbage.
    X ≤ I
# Copy Axiom(to copy a file)
    x ≤ x+ x ∀ x ∈ X
