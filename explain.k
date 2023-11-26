#!/usr/bin/env rq
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
x: 0:: fn:`:sparse.txt
fn:"sparse.txt"
kfn: `$":",$`/:(*:`\:`$fn),`k
kfn
extract:{,[;"}"]x[0],":{", " "/:.q.trim'@[;0]'" /"\:'3_x }
kfn 0: extract'.:x@=:+\~:" "=x[;0]
/ generate code, load it, explain
