.MODEL SMALL
.STACK 100H
.DATA

C DB '? $'
X DB 'THE SUM OF $'
A DB ?
Y DB ' AND $'
B DB ?
Z DB ' IS $'
S DB ?
NEWL DB 10,13,'$'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9H
    LEA DX,C
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV A,AL
    INT 21H
    MOV B,AL
    
    MOV AH,9H
    LEA DX,NEWL
    INT 21H
    
    
    ADD BL,B
    SUB BL,30H
    MOV S,BL
    
    MOV AH,9H
    LEA DX,X
    INT 21H
    
    MOV AH,2
    MOV DL,A
    INT 21H
    
    MOV AH,9H
    LEA DX,Y
    INT 21H
    
    MOV AH,2
    MOV DL,B
    INT 21H
    
    MOV AH,9H
    LEA DX,Z
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN 



                                                                                            