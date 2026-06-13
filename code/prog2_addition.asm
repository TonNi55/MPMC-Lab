.MODEL SMALL
.STACK 100H

.DATA
    MSG  DB  'Sum = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV AL, 05          ; First number = 5
    MOV BL, 03          ; Second number = 3

    ADD AL, BL          ; AL = 5 + 3 = 8

    ADD AL, 30H         ; Convert to ASCII ('8')

    MOV AH, 02H
    MOV DL, AL
    INT 21H             ; Display result

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
