#include <xc.inc>

Countl equ 08h

psect   barfunc,local,class=CODE,delta=2

global _bar
_bar:
    bsf STATUS, 5        
    movlw 00h            
    movwf TRISA          
    movlw 01h
    movwf TRISB
    bcf STATUS, 5        

    clrf PORTA          

start:
    btfss PORTB, 0       
    goto button_not_pressed 
    
    bsf PORTA, 0                  
    goto start           

button_not_pressed:
    bcf PORTA, 0                
    goto start          

delay:
    decfsz Countl, f     
    goto delay          
    return               

end


