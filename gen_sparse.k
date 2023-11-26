#!/usr/bin/env rq

fdd:{k:.q.inter[!y;!z];x[y k;z k]};  dXd:fdd[*];
From:{(+:idx),,x ./:idx:,/(!#:x)(,/:)'&:'~0=x}
Trans:{x 1 0 2}
unk: {(!x),/:'. x}
ddv: {(!'/) x[1 2]@\:=:x 0} /convert sparse matrix to row!col!val. like exec x[1]!x 2 by x 0 from x
unddv:{+:,/unk@unk'x} 
del0:  {x@\:&:~0=x[2]} /delete from sparse matrix where value (x[2]) is 0
smm:{del0 unddv@+/''ddv[x]dXd/:\:ddv Trans y}

\l explain.k
explain[`From; "convert matrix to sparse";  "x: (0 1.1 0; 2.1 0 3.1)"]"
    (+:idx),,                   /tuple of (row ; col; val)
    x ./:idx:                   /get the value
    ,/                          /flat
    (!#:x)(,/:)'                /add row index
    &:'~0=x                    /column of non zero element at each row"
explain[`fdd; "apply function f on 2 dictionaries"; "x:(+); y:1 2!2 4; z:1 3!3 9"]" 
    x[y k;]z k:                      /apply binary function x on value of common keys
    .q.inter[!y;!z]              /find common key of dictionary y an z"
explain[`ddv; "convert sparse matrix to (row; col!val) format" ; "x:(0 1 1;2 3 4; `a`b`c)"]"
    (!'/)       /change to col!val
    x[1 2]@\\:  /get col and val by row
    =:x 0       /group by row";
explain[`smm; "Multiply sparse matrix"; "x:From x0:(1 0 0f;1 0 1f); y: From y0: (1 0 0 0f;0 0 2 1f;0 0 0 0f); r:x0$y0";]"
    del0            /remove if value is 0
    unddv@          /from ddv to sparse matrix
    +/''            /sum vals
    ddv[x]dXd/:\\:  /outer product * of dictionary
    ddv             /convert to dict->dict->val of row!col!val
    Trans y         /transpose sparse matrix y";
    
\\

/
x: (,0)!,(2 3!1 2)
y: (,1)!,(1 3!10 20)
x dXd/:\:y

(0;2 3!`a`b),/:\:(1;1 3!`c`d)

/outer product of dictionary: dict f/:\: dict 
(0 1!`a`b),/:\:(1 2!`c`d)

/# x,/:\:y = x(,/:)\:y = x[0],/:y, x[1],/:y, ... , x on row, y on column.

/# exec c!v by r from t


x: From x0:(0 5 0f; 4 0 3f)
y: From y0:(0 0 2 0f; 1 0 0 0f; 0 0 1 3f)
smm[x;y]~From x0$y0

/
# you can define unk as inverse of (!/), but it's not good for unddv
k)unk: {+:(!x),' ,:' . x} /this unk, though is true inverse of (!/), causing too many flip when define unddv
x~!/ unk x:1 2!(`a`b; `c`d)

k),'/unk@
k)vcat:{((#y 0)#x), y}
k){(!x)vcat' .:x}@ unk' ddv (0 1 1;1 0 2;5 4 3f)

\

\\
/
tree diameter problem.
    assert From[r]~ /verify the result against normal matrix multiplication
