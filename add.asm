.MODEL SMALL
.STACK 100H
.DATA


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV BH,3
    MOV CH,4
    
    ADD BH,CH
    ADD BH,30H
    
    MOV AH,2
    MOV DL,BH
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
    
    


