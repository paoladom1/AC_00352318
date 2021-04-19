        org 200h
        
        section .text

        mov     byte [200h], "P"
        mov     byte [201h], "C"
        mov     byte [202h], "D"
        mov     byte [203h], "D"

        ;Copiar el valor de 200h a AX usando direccionamiento directo.
        mov     AX, [200h]

        ;Copiar el valor de 201h a CX usando direccionamiento indirecto por registro.
        mov     BX, [201h]
        mov     CX, BX

        ;Copiar el valor de 202h a DX usando direccionamiento indirecto base más índice.
        mov     BP, 200h
        mov     SI, 002h
        mov     DX, [BP+SI]

        ;Copiar el valor de 203h a DI usando direccionamiento relativo por registro.
        mov     DI, [BP+003h]
        
        int 20h