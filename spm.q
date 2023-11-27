    The dictionry of dictionry representation of sparse matrix have following problem:
    1. hard to flip.
    2. can't save to splayed table.
    3. memory fragementation.
    Let's try a keyed table of row,col!val
    
a:1 2!3 4
b:3 1!2 3
a+b  /null ignored
a+'b /null propagate
.Q.s1 a,'b

k)From:{2!+:`r`c`v!(+:idx),,x ./:idx:,/(!#:x)(,/:)'&:'~0=x}
x:From x0:(1 5 0f;2 0 3f); y: From y0: (4 0 0 0f;6 0 0 0f;0 0 0 0f);
smm[x;y]~From x0$y0

Trans:{select v by r:c, c:r from x}
/support all binary operation.
/how to do matrix multiplication. cross product of dictonary when key is the same.
count each value each t: value
/flat dictionary. From x!y!v to (x;y)!v
/0 (,0)!,4 -> 0 0!4
flatDict:{(x,/:key[y])!value y}

/this smm is more complicated than the dictionary version
x0:(exec r!v by c from x)
y0: exec c!v by r from y
ck: key[x0] inter key[y0]
{([]r:key[x][;0]; c:key[x][;1]; v:value x)}sum raze {flatDict'[key x;value x]}each value (ck#x0)(*/:\:)'ck#y0

ddv y

