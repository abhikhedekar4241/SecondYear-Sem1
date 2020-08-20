%macro scall 4
mov rax,%1
mov rdi,%2
mov rsi,%3
mov rdx,%4
syscall
%endmacro
section .data
m1 db "Enter 1st 64bit HEX number (Multiplicand) =",10d,13d
l1 equ $-m1
m2 db "Enter 2nd 64bit HEX number (Multiplier) =",10d,13d
l2 equ $-m2
m3 db "The product of two HEX numbers using successive addition is =",10d,13d
l3 equ $-m3
m4 db " ",10d,13d
l4 equ $-m4
section .bss
num1 resq 1
num2 resq 1
buf resq 1
;count resb 16
char_ans resb 17
section .text
global _start
_start:
       scall 1,1,m1,l1
       call accept_16       
       mov [num1],rbx
       
       scall 1,1,m2,l2
       call accept_16
       mov [num2],rbx
       
       call product
       scall 1,1,m3,l3
       call display_proc
       scall 1,1,m4,l4
       
       mov rax,60
       mov rdi,0
       syscall
;-----------------accept procedure------------
accept_16:
            scall 0,0,buf,17
            mov rsi,buf
            mov rbx,0
            mov rax,0
            mov rcx,16
back: 
     rol rbx,04
     mov al,[rsi]
     cmp al,39H
     jbe next
     sub al,07H
next:
     sub al,30H
     add rbx,rax
     inc rsi
     dec rcx
     jnz back
     ret     
;...............product................  
product:    mov rbx,0h
            mov rax,[num1]
            mov rcx,[num2]
addition:   add rbx,rax
            dec rcx
            jnz addition
            ret
;-----------display-------------------
display_proc:
	
	mov rbp,char_ans
	mov rcx,16

up3:
	rol rbx,04
	mov dl,bl

	and dl,0Fh

	cmp dl,09h
	jbe next1

	add dl,07h
next1:
	add dl,30h

	mov [rbp],dl

	inc rbp
	dec rcx

	jnz up3

	scall 1,1,char_ans,17
ret
