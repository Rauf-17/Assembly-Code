.MODEL SMALL
.DATA
 
IP DB "ENTER A CHARACTER: $"
VOW DB "ENTERED CHARACTER IS VOWEL! $"
CONST DB "ENTERED CHARACTER IS CONSONANT! $"
NUM DB "ENTERED CHARACTER IS NUMBER! $"
ERR DB "!!ERROR!! $"
NEWL DB 0DH,0AH, '$'
 
.CODE
 
MAIN PROC
    MOV AX,@DATA 
    MOV DS, AX
    MOV AH,9H
    LEA DX,IP
    INT 21H 
    
    MOV AH,1H
    INT 21H 
    MOV BL,AL 
    
    MOV AH,9
    LEA DX,NEWL
    INT 21H 
    
    CMP BL,'A'
    JB NOT_LETTER
    CMP BL,'Z'
    JA CONSONANT
    
    CMP BL,'A'
    JE VOWEL
    CMP BL,'E'
    JE VOWEL
    CMP BL,'I'
    JE VOWEL
    CMP BL,'O'
    JE VOWEL
    CMP BL,'U'
    JE VOWEL  
    
    ADD BL,32H  ;CONVERTING UPPERCASE INTO LOWERCASE
    
    CMP BL,'A'
    JB CONSONANT
    CMP BL,'Z'
    JA CONSONANT
    CMP BL,'A'
    JE CONSONANT
    CMP BL,'E'
    JE CONSONANT
    CMP BL,'I'
    JE CONSONANT
    CMP BL,'O'
    JE CONSONANT
    CMP BL,'U'
    JE CONSONANT
    
VOWEL:
    MOV AH,9
    LEA DX,VOW
    INT 21H   
    
    JMP EXIT
 
    
CONSONANT:
    MOV AH,9
    LEA DX,CONST
    INT 21H
    
    JMP EXIT 
    
NOT_LETTER:
    CMP BL,'0'
    JB ERROR
    CMP BL,'9'
    JA ERROR
    
    MOV AH,9
    LEA DX,NUM
    INT 21H 
    
    JMP EXIT 
    
ERROR:
    MOV AH,9
    LEA DX,ERR
    INT 21H

EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP  
ENDP


