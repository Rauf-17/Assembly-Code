.MODEL SMALL
.STACK 100H
.DATA

ENTER DB 'ENTER A NUMBER: $'
LESS DB 'LESS THAN 5 $',0
GREATER DB 'GREATER THAN 5 $',0
EQUAL DB 'EQUAL $',0
NEWL DB 10,13,'$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,ENTER
    INT 21H 
    
    MOV AH,1
    INT 21H
    
    
    CMP AL,35H
    JL LESS_THAN
    JG GREATER_THAN
    JE EQUAL_TO
    
    


LESS_THAN:
    
    MOV AH,9
    LEA DX,NEWL
    INT 21H
    
    MOV AH,9
    LEA DX,LESS
    INT 21H
    
    JMP EXIT
    
GREATER_THAN:
    
    MOV AH,9
    LEA DX,NEWL
    INT 21H
    
    MOV AH,9
    LEA DX,GREATER
    INT 21H
    
    JMP EXIT
    
EQUAL_TO:
    
    MOV AH,9
    LEA DX,NEWL
    INT 21H
    
    MOV AH,9
    LEA DX,EQUAL
    INT 21H
    
    JMP EXIT
    
EXIT:

    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
    
    
    
    
