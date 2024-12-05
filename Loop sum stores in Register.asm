.MODEL SMALL
.STACK 100H
.DATA
SUM DB 'SUM: $'
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AX, 100
    MOV BX, 0
   
CALCULATION_LOOP:
    ADD BX, AX
    SUB AX, 5
   
    CMP AX, 5
    JGE CALCULATION_LOOP
     
    MOV AH, 9
    LEA DX, SUM
    INT 21H

 
    MOV AX, BX
    MOV AH, 2
    INT 21H

    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
