Given f: R->R, f is

| Prop               | Definition             | Relation Definition                | indicator function of domain |
|-                   |-                       |-                                   | -                            |
| order-preserving   | x <= y => f(x) <= f(y) | (x,y) in <= implies (fx, fy) in <= | x<=y                         |
| metric-preserving  | abs x-y = abs f(x)-f(y)| z = abs x-y implies z = abs fx-fy  | (x,y) - abs =z               |
| addition-preserving| f(x+y) =f(x)+f(y)      | x+y=z       implies fx+fy=fz       | ((x,y),z) (+,Id)=            |

```
(x,y) |       | - | abs => z
(x,y) |f each | - | abs => z
metric: - abs
f preserve metric: f metric = metric

f preserver order: f <= = <=

f preserve add: + f = f +  
```
metric[z]
: metric[z] is a binary relation with parameter z, that if x,y in metric[z] iff z=abs x-y.
(x,y)| - abs =z  | ==1 iff (x,y) in metric[z].
(- abs = z) is metric[z]'s characteristic function.

f is a mapping from a relation <= to itself. 

It's better to view f as a mapping/transformation, that certain properties(order, distance, equility) stays after
transformation.

Instead of simply define f as a mapping from Real to Real, we can define f as from a relation Rel to the same Rel. 
So *f preserve Rel* is the same as *f: Rel->Rel*, and same as *Rel close under f*.

