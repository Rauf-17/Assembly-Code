.model small
.stack 100h
.data  

a db "enter a binary value $"
b db "output : $ "   

.code    
    
main proc
    mov ax,@data
    mov ds,ax
    
    call display            
    call input 
    call output

    mov ah,4ch 
    int 21h  
    
    ret
    main endp  
    
    mov bx,0 
    mov cx ,16 
                 
                 
                 
                 
    
  display proc
    
    mov ah,9
    lea dx,a
    int 21h   
    
    ret 
    display endp  
  
  
  
   input proc 
    
input_:
    mov ah,1
    int 21h
    cmp al,13
   
    je output_
    and al,0Fh 
    
    shl bx,1
    
    or bl,al
    loop input_
          
    cmp al,41h ; 41==A
    jge letter
    
    and al,0Fh    
    jmp shift    
    
     ret  ;return  
    
    input endp 
   
  
    
        
letter:
            sub al,37h   
    
    
shift:
             
            shl bx,cl
            
            or bl,al
            
            jmp input_   
            
            
            
      
    
  output proc
    
    
output_:
            mov ah,2
            mov dl,10
            int 21h  
            
            mov dl,13 
            int 21h 
            
            
            mov ah,9   
            lea dx,b
            int 21h  
            
            mov cx,4
            
            mov ah,2
            
            
            
output_1:
           
           mov dl,bh
           shr dl,4
           rol bx,4
           cmp dl,0Ah 
           jge letteroutput 
           
           add dl,30h
           int 21h
           jmp exit1 
           
           
        
        
      letteroutput:   
            add dl,37h
            int 21h
           
      
      exit1:
            loop output_1      
            
                                   
    mov ah,4ch 
    int 21h  
            
            
              ret
      output endp
                           
                           
    
    
          
          
end
