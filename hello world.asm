.MODEL SMALL
.STACK 100H
.DATA

A DB 'HELLO WORLD $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9H
    LEA DX,A
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END


