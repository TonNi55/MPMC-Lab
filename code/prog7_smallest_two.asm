.MODEL SMALL
.STACK 100H

.DATA
    MSG  DB  'Smallest = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, 07          ; First number = 7
    MOV BL, 03          ; Second number = 3

    CMP AL, BL          ; Compare AL and BL (sets flags only, no change)
    JBE FIRST_SMALL     ; Jump if AL <= BL (AL is already smaller)
    MOV AL, BL          ; Else BL is smaller, copy to AL

FIRST_SMALL:
    ; AL holds the smaller number
    ADD AL, 30H         ; Convert to ASCII

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
