.model small
.stack 100h

.data
    mas db 1,3,5,7,9,11,13,15,-1,4  ; однобайтовый массив чисел
    len equ $-mas

.code

mov ax, @data
mov ds, ax

lea si,mas
lea di,mas+1
mov cx,len
dec cx

call ssort

mov ah, 4Ch     ; Выход из программы
int 21h

ssort:
    cyc:
        push di
        push cx
        
        mov al,byte ptr [si]
        sort:
            mov ah,byte ptr [di]
            
            cmp ah,al
            jl change
 
            jmp skip
 
            change:
            mov byte ptr [si],ah
            mov byte ptr [di],al
            mov al,ah
 
            skip:
            inc di
        loop sort
 
        pop cx
        pop di
        
        inc di 
        inc si  
    loop cyc

    ret

end
