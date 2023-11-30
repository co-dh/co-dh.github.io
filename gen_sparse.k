#!/usr/bin/env rq

fdd:{k:.q.inter[!y;!z];x[y k;z k]};  dXd:fdd[*];
From:{(+:idx),,x ./:idx:,/(!#:x)(,/:)'&:'~0=x}
Trans:{x 1 0 2}
unk: {(!x),/:'. x}
ddv: {(!'/) x[1 2]@\:=:x 0} /convert sparse matrix to row!col!val. like exec x[1]!x 2 by x 0 from x
unddv:{+:,/unk@unk'x} 
del0:  {x@\:&:~0=x[2]} /delete from sparse matrix where value (x[2]) is 0
smm:{del0 unddv@+/''ddv[x](+/dXd)/:\:ddv Trans y}

\l explain.k
    
/

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
