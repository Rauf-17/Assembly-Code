.MODEL SMALL
.STACK 100H
.DATA

A DB 'PLEASE ENTER VALUE A: $'
B DB 'PLEASE ENTER VALUE B: $'
S DB 'AFTER VALUE SWAPPING A: $'
NEWL DB 10,13,'$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    MOV AH,9H
    LEA DX,A
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV A,AL
    
    MOV AH,9H
    LEA DX,NEWL
    INT 21H
    
    MOV AH,9H
    LEA DX,B
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV B,AL
    
    MOV AH,9H
    LEA DX,NEWL
    INT 21H
    
    MOV BH,A
    XCHG BH,B
    MOV A,BH
       
    MOV AH,9H
    LEA DX,S
    INT 21H 
    
    MOV AH,2
    MOV DL,A
    INT 21H
    
    

    MOV AH,4CH
    INT 21H
MAIN ENDP
END

    




