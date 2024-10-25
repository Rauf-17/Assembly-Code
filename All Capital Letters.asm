.MODEL SMALL
.STACK 100H
.DATA
ALL DB 'PRINTING ALL THE LETTERS: $'
NEWL DB 10,13,'$'


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,ALL
    INT 21H
    
    MOV AH,9
    LEA DX,NEWL
    INT 21H
    
    MOV CX,41H
    
PRINT_ALL:
    
    MOV AH,2
    MOV DL,CL
    INT 21H
    
    INC CX
    CMP CX,5AH
    
    JBE PRINT_ALL
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END
    

