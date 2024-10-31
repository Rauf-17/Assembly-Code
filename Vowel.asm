.MODEL SMALL
.STACK 100H 
.DATA

ENTER DB 'PLEASE ENTER A CHARACTER:$'
V DB 10,13,'THIS CHARACTER IS VOWEL $'
NV DB 10,13,'THIS CHARACTER IS NOT VOWEL $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,ENTER
    INT 21H
    
    MOV AH,1
    INT 21H
    
    CMP AL,'A'
    JE VOWEL
    
    CMP AL,'E'
    JE VOWEL
    
    CMP AL,'I'
    JE VOWEL
    
    CMP AL,'O'
    JE VOWEL
    
    CMP AL,'U'
    JE VOWEL
    
    CMP AL,'a'
    JE VOWEL
    
    CMP AL,'e'
    JE VOWEL
    
    CMP AL,'i'
    JE VOWEL
    
    CMP AL,'o'
    JE VOWEL
    
    CMP AL,'u'
    JE VOWEL
    
    
    LEA DX,NV
    MOV AH,9
    INT 21H
    JMP EXIT
    
    
VOWEL:
    MOV AH,9
    LEA DX,V
    INT 21H
    

EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
    
    
    