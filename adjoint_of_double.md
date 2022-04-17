# Left/Right adjoint of double function
[Fong & Spivak, 2018, P27] Exercise 1.98

## Inverse of impossible.
The inverse of double: ℕ -> ℕ is not defined.
double: 0 1 2 -> 0 2 4.
half  : 0 2 4 -> 0 1 2. But what about 3? It must be either 1 or 2 because monotone.

## What's double's right adjoint?
    double x ≤ y ↔ x ≤ R y
         2*x ≤ y ↔ x ≤ R y
           x ≤ 0.5*y 
when y is 3, x ≤ 1.5, but R is defined on ℕ, and x is a ℕ,
           1 ≤ 1 ≤ 1.5 = 0.5*3
           x ≤ floor y/2 ≤ y/2

## Do not use Real division
In the deduction above, we use the knowledge of division in Real. Let get rid of it.
    2 3 4 -> 1 ? 2
3 has no inverse in double function, we can go smaller a little bit and get 2, then do the inverse get 1. 
ℕ is a total order, thus you can always find exactly 1 element less than x.

see [calculate right adjoint](calculate_right_adjoint.md)

## Left adjoint of double
    L x ≤ y ↔ x ≤ 2y 
        
    x/2  ≤ ceiling x/2 ≤ y
           L

### L x ≤ y => x ≤ 2y
    ceiling x/2 ≤y,
    = { x/2 ≤ ceiling x/2, and transitive} 
      x/2 ≤ y
    = { double both side}
      x ≤ 2y

### x ≤ 2y => L x≤ y
    x ≤ 2y
    = {half both side in real}
    x/2 ≤ y
    = {if x is 3, x/2 is 1.5, but y is ℕ, so y has to be 2}
    ceiling x/2 ≤ y
     
when y = 0 1 2, the largest x can be 0 2 4, when x is 1, 1 ≤ 2y, the minimun y is 1, so L x = ceiling x/2.
L = { celing x/2}.

### Do not use Real division
Give double: 1 ? 2  -> 2 3 4, how to find the inverse of 3?
We can find all elements that are larger than 3, and in range of double, find it's inverse, then get meet of the result.
    3 ≤ 4 6 8 ... -[half]-> 2 3 4 ... -[meet]-> 4
    L = ≤ inv[R] meet


