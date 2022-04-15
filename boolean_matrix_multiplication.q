bmm: { x { (|/)x&y}/:\: flip y}

\
# Boolean Matrix Multiplication

see [matrix_multiplication.md](matrix_multiplication.md)

## example
~~~q
    show x: (001b ;101b )
    / for row 0, it can only reach column 2( 0 based)
    show y: (0011b; 0100b;1010b)
    / from row 2, it can reach column 0,and 2
    show bmm[x;y]
~~~

