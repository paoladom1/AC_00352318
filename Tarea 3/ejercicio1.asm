org 100h
        
section .text

        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        XOR SI, SI

        MOV BX, 8d
        MOV CX, 8d ;cantidad de digitos

        ; Llenando los 8 digitos del carnet
        MOV byte [200h], 0d
        MOV byte [201h], 0d
        MOV byte [202h], 3d
        MOV byte [203h], 5d
        MOV byte [204h], 2d
        MOV byte [205h], 3d
        MOV byte [206h], 1d
        MOV byte [207h], 8d

        JMP sumar_digitos
        JMP promedio

sumar_digitos:
        ADD AL, [200h + SI]
        INC SI
        LOOP sumar_digitos

promedio:
        ; La suma de los digitos esta guardada en AL
        DIV BX
        MOV [020AH], AL

int 20h



