.MODEL SMALL
.STACK 100H

.DATA
    MSG  DB  'Product = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV AL, 04          ; First number = 4
    MOV BL, 03          ; Second number = 3

    MUL BL              ; AX = AL * BL = 4 * 3 = 12

    ; Separate digits of result (12 = tens:1, units:2)
    MOV BL, 10
    DIV BL              ; AL = quotient (1), AH = remainder (2)

    ; Display tens digit
    MOV DL, AL
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ; Display units digit
    MOV DL, AH
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
