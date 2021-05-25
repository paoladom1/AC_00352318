org 100h
        
section .text

    XOR AX, AX
    XOR BX, BX  ;loop
    XOR CX, CX  
    XOR DI, DI  ;indice pares 
    XOR SI, SI  ;indice impares

    CALL separar_numeros

    int 20h

    section .data

arr_nums db 01, 02, 03, 04, 05, 06, 07, 08, 09, 10

    separar_numeros:
        CALL cargar_numero
        CMP AL, 1
        JE es_impar
        MOV BX, 2
        DIV BL
        CMP AH, 0
        CALL cargar_numero
        JZ es_par
        CALL es_impar
        RET

    es_par:
        MOV [0300H + DI], AL
        INC DI
        INC CX
        CMP CX, 10
        JB separar_numeros
        RET
    
    es_impar:
        MOV [0320H + SI], AL
        INC SI
        INC CX
        CMP CX, 10
        JB separar_numeros
        RET

    cargar_numero:
        MOV BX, CX
        MOV AL, [arr_nums + BX]
        RET