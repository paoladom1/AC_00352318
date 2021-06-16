org 100h

    section .text
    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX

    MOV SI, 0
    MOV DI, 0d

    MOV DH, 10 ;fila en la que se mostrará el cursor
    MOV DL, 20 ;columna en la que se mostrará el cursor

    call modotexto

    main:
        call escribirprimernombre
        call escribirsegundonombre
        call escribirprimerapellido
        call escribirsegundoapellido
        
        jmp esperartecla

    modotexto:
        MOV AH, 0h 
        MOV AL, 03h 
        INT 10h
        RET
    movercursor:
        MOV AH, 02h
        MOV BH, 0h 
        INT 10h
        RET
    escribircaracter:
        MOV AH, 0Ah
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        RET

    siguientefila:
        MOV SI, 0
        MOV DI, 0d
        INC DH
        INC DH
        MOV DL, 20
        RET

    escribirprimernombre:
        call movercursor
        MOV CL, [pnombre+SI] 
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 5d
        JB escribirprimernombre
        call siguientefila

    escribirsegundonombre:
        call movercursor
        MOV CL, [snombre+SI] 
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 8d
        JB escribirsegundonombre
        call siguientefila

    escribirprimerapellido:
        call movercursor
        MOV CL, [papellido+SI] 
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 9d
        JB escribirprimerapellido
        call siguientefila

    escribirsegundoapellido:
        call movercursor
        MOV CL, [sapellido+SI]
        call escribircaracter
        INC SI 
        INC DL 
        INC DI 
        CMP DI, 4d
        JB escribirsegundoapellido
        call siguientefila

    esperartecla:
        MOV AH, 00h 
        INT 16h
    exit:
        int 20h



    section .data

    pnombre DB 'Paola'
    snombre DB 'Carolina'
    papellido DB 'Dominguez'
    sapellido DB 'Diaz'