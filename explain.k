#!/usr/bin/env q
    extract code, load it, then explain by execute line by line, and save the result in Markdown.
    The explain step should output a markdown table of func|result|comment.
    It also extract the k code into a .k file.
    
dedent:{d:&/+/'&\'" "=x:x@&~.q.trim[x]like ""; d _/:x}; ralign:{(-:|/#:'x)$/:x}
indent:{"\n"/:"    ",/:"\n"\:x}
fmt:{[n;com;w;x]-1@"\n### ",n,"\n",.q.ltrim[com],"\n~~~q\n",indent[w,.q.ssr[.Q.s x;"\"";""]],"\n~~~\n";}
txtCom:{.q.trim'+(" /"\:)'dedent x} /txt and comment 
ex:{[w;x].:w; tc:|:'txtCom x;  :({`Code`Result`Comment!(x;z;y)}'[tc 0;tc 1])r:-3!' .:'"k)",/:t:ralign({y," ",x}\)tc[0]}
explain:{fmt[x 0;x 1;x 2;] ex[x 2;3_x]}
\c 15 500
x: 0:: `$":",fn:.z.x 0
kfn: `$":",$`/:(*:`\:`$fn),`k
extract:{,[;"}"]x[0],":{", " "/:.q.trim'@[;0]'" /"\:'3_x }
kfn 0: extract'.:x@=:+\~:" "=x[;0]


From:{(+:idx),, x ./:idx: ,/ (!#:x)(,/:)' &:'~0=x }
fdd:{[f;g;d;e]f/g[d k;]e k: .q.inter[!d;!e]}
ddv:{(!'/) x[1 2]@\: =:x 0}
Trans:{x 1 0 2}
dXd:fdd[+;*];

unk: {(!x),/:'. x}
ddv: {(!'/) x[1 2]@\:=:x 0} /convert sparse matrix to row!col!val. like exec x[1]!x 2 by x 0 from x
unddv:{+:,/unk@unk'x} 
/del0:  {x@\:&:~0=x[2]} /delete from sparse matrix where value (x[2]) is 0
del0:{((!x)@&~0=. x)#x}
smm:{del0 unddv@+/''ddv[x](+/dXd@)/:\:ddv Trans y}

explain'.:x@=:+\~:" "=x[;0]
/ generate code, load it, explain
