ORG 100h          

JMP start          

num1 DW 1234h     
num2 DW 5678h      
result DW 0        

start:
    MOV AX, num1   
    MOV BX, num2   
    MUL BX        

    
    MOV result, AX 
    MOV result+2, DX 

    
    MOV AX, DX     

    
    CALL print_hex

  
    MOV AX, result 
    CALL print_hex

    MOV AH, 4Ch    
    INT 21h        

print_hex proc
   
    MOV AH, AL     
    AND AH, 0F0h   
    SHR AH, 4      
    ADD AH, 30h    
    CMP AH, 39h    
    JLE print_first 
    ADD AH, 7      

print_first:
    MOV DL, AH     
    MOV AH, 02h    
    INT 21h        

    
    MOV AH, AL     
    AND AH, 0Fh    
    ADD AH, 30h    
    CMP AH, 39h    
    JLE print_second 
    ADD AH, 7      

print_second:
    MOV DL, AH     
    MOV AH, 02h    
    INT 21h        

    RET
print_hex endp


