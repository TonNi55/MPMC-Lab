.MODEL SMALL
.STACK 100H

.DATA
    MSG  DB  'Difference = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV AL, 09          ; First number = 9 (minuend)
    MOV BL, 04          ; Second number = 4 (subtrahend)

    SUB AL, BL          ; AL = 9 - 4 = 5

    ADD AL, 30H         ; Convert to ASCII ('5')

    MOV AH, 02H
    MOV DL, AL
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
