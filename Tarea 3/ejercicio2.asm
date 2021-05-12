org 100h
        
section .text

        XOR AX, AX
        XOR CX, CX

        MOV AX, 1d
        MOV CX, 5d

        JMP factorial

factorial:
        MUL CL
        LOOP factorial
        MOV [020BH], AX

int 20h