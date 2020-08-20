%macro scall 4
                 mov rax,%1
                 mov rdi,%2
                 mov rsi,%3
                 mov rdx,%4
syscall
%endmacro
section .data
   m1 db  "rajjjjjjjjjjjjjjjjjjjjj"
   l1 equ $-m1
   m2 db "wdffrefgirehfui"
   l2 equ $-m2
   m3 db "fgugfyure"
   l3 equ $-m3
           section .bss
                     num resb 10
                     char_ans resb 6
                     count resb 1
                     arr resb 8
section .text 
global _start
_start:
           scall 1,1,m1,l1
           scall 0,0,num,10
call accept 
    ;scall 1,1,m2,l2
     scall 1,1,m3,l3
             
call h2b
    ;exit
          mov rax,60
          mov rdi,0
            syscall
accept:mov ax, 0000h
           xor rdx,rdx
           mov rcx,04h
           mov rsi,num
back:rol bx,04
         
         mov al,[rsi]

        cmp al,39h
	jbe next
        sub al,07h
next: sub al,30h
         add rdx,rax
         inc si
        dec cx
        jnz back
            ret

h2b:
       mov rax,rbx
       mov rbx,0Ah
       mov rbp,arr
back2 : xor rdx,rdx
            div rbx
            mov [rbp],rdx
            inc rbp
            inc byte[count]
            cmp rax,0h
            jnz back2
            dec rbp

display : xor rdx,rdx
       mov rdx,[rbp]
     add dl,30h
mov [char_ans],dl
scall 1,1,char_ans,1
dec rbp
dec byte[count]
jnz display 
ret

