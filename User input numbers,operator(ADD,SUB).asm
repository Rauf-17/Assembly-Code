.MODEL SMALL
.STACK 100H
.DATA
NEWL DB 0AH,0DH,'$'
ERR DB "!!ERROR!! $"
NUM1 DB "ENTER NUMBER 1: $"
NUM2 DB "ENTER NUMBER 2: $"
OPE DB "ENTER OPERATION (+, -): $"
RESULT DB "RESULT: $"
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 9
    LEA DX, NUM1
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BL, AL

    MOV AH, 9
    LEA DX, NEWL
    INT 21H

    CMP BL, 30H
    JGE NUM1_VALID
    JL ERROR

NUM1_VALID:
    CMP BL, 39H
    JLE NUM1_FOUND
    JG ERROR

NUM1_FOUND:
    MOV AH, 9
    LEA DX, NUM2
    INT 21H

    MOV AH, 1
    INT 21H
    MOV CL, AL

    MOV AH, 9
    LEA DX, NEWL
    INT 21H

    CMP CL, 30H
    JGE NUM2_VALID
    JL ERROR

NUM2_VALID:
    CMP CL, 39H
    JLE NUM2_FOUND
    JG ERROR

NUM2_FOUND:
    MOV AH, 9
    LEA DX, OPE
    INT 21H

    MOV AH, 1
    INT 21H
    MOV BH, AL

    MOV AH, 9
    LEA DX, NEWL
    INT 21H

    CMP BH, '+'
    JE ADDITION
    CMP BH, '-'
    JE SUBTRACTION

    JMP ERROR

ADDITION:
    ADD BL, CL
    SUB BL, 30H

    MOV AH, 9
    LEA DX, RESULT
    INT 21H

    MOV AH, 2
    MOV DL, BL
    INT 21H

    JMP EXIT

SUBTRACTION:
    SUB BL, CL
    ADD BL, 30H

    MOV AH, 9
    LEA DX, RESULT
    INT 21H

    MOV AH, 2
    MOV DL, BL
    INT 21H

    JMP EXIT

ERROR:
    MOV AH, 9
    LEA DX, ERR
    INT 21H

EXIT:
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
