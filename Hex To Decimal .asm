.model small
.stack 100h
.data

a db 'ENTER THE HEXA DIGIT: $'
b db 0dh,0ah,'IN DECIMAL IT IS: $'


.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,09h
    lea dx,a
    int 21h
    
    mov ah,1     ; Please Enter HEXA chartectized value from (A-F)
    int 21h
    mov a,al
    sub a,11h  ;converting charcter into second digit by sub
    int 21h
    
    mov ah,09h
    lea dx,b
    int 21h
    
    mov ah,2
    mov dl,31h  ;by default displaying the first digit
    int 21h
    
    mov dl,a
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end

