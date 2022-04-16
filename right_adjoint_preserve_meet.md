# right adjoint(l) preserve meet.
If r don't preserve meet, let's save a meet b = c, but a.l meet b.l = m > c.l

```q
    a.l  b.l |  a   b
             |
      m      |    c
      c.l    |    m.r
    m ≤ a.l and m ≤b.l
    {definition of galios connetion} 
    m.r ≤a and m.r ≤b
    {c = a meet b}
    m.r ≤ c
    {galios}
    m ≤ c.l
    {meet definition}
    c.l is meet
```

see [galios](galois_left_right_bigger.md)
see [right below](right_adjoint_is_the_best_approximation_from_below.md)
see [right adjoint of pullback](dictionary_pullback.md)
