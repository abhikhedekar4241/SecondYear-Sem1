%macro xyz 4
            mov rax,%1
            mov rdi,%2
            mov rsi,%3
            mov rdx,%4
	    syscall
%endmacro

 section .data
              m1 DB "HELLO WORLD",10d,13d
              l1 equ $-m1
              m2 DB "RAJ TAWARI",10d,13d
              l2 equ  $-m2
             m3 DB "9860754060"
              l3  equ $-m3
       section .text 
       global  _start
        _start :
                            xyz 1,1,m1,l1
                            xyz  1,1,m2,l2
                            xyz 1,1,m3,l3

                            mov rax,60
                            mov rdi,0
	                    syscall
