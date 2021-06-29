org 100h

    section .text

	mov 	DX, msg1
	call  	escribircadena

	mov 	BP, frase
	call  	leercadena

    cmp     SI, 05d
    jne     claveincorrecta
    xor     SI,SI
    jmp     verificarclave

	int 	20h

    esperartecla:
        mov AH, 01h 
        int 21h
        ret

    leercadena:
            xor     SI, SI          
    while:  
            call    esperartecla    
            cmp     AL, 0x0D        
            je      exit            
            mov     [BP+SI], AL   
            inc     SI              
            jmp     while           
    exit:
        mov 	byte [BP+SI], "$"	
        ret


    escribircadena:
        mov 	AH, 09h
        int 	21h
        ret
    
    verificarclave:
        cmp     SI, 05d
        je      bienvenido
        mov     AL, [BP+SI]
        mov     AH, [clave+SI]
        cmp     AL, AH
        jne     claveincorrecta
        inc     SI
        je      verificarclave

    bienvenido:
        mov     DX, msg2
        call    escribircadena
        int     20h

    claveincorrecta:
        mov     DX, msg3
        call    escribircadena
        int     20h

    section	.data

msg1	DB	"Ingrese la clave: ", "$"
msg2 	DB 	"BIENVENIDO", "$"
msg3    DB  "INCORRECTO", "$"
frase 	times 	20  	DB	" "
clave   DB  "paola", "$"