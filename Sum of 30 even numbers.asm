.MODEL SMALL
.STACK 100H
.DATA
    A DW 0
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 30
    MOV SI, 0
    MOV AX, 2
    MOV BX, 0
    
SUM_LOOP:
    ADD BX, AX
    ADD AX, 2
    
    INC SI
    
    CMP SI, CX
    JE EXIT
    
    JMP SUM_LOOP
        
EXIT:
    MOV A, BX
        
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
