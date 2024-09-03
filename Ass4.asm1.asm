ORG 100h          

JMP start          

num1 DB 21h       
num2 DB 29h        
result DW 0       

start:
    MOV AL, num1   
    MOV BL, num2   
    MUL BL        

    MOV result, AX 

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

    MOV AH, 4Ch    
    INT 21h        

