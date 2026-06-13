.MODEL SMALL
.STACK 100H

.DATA
    MSG1  DB  'Quotient  = $'
    MSG2  DB  0DH, 0AH, 'Remainder = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    MOV AH, 00          ; Clear AH before division (important!)
    MOV AL, 09          ; Dividend = 9
    MOV BL, 03          ; Divisor = 3

    DIV BL              ; AL = quotient (3), AH = remainder (0)

    MOV CL, AL          ; Save quotient
    MOV CH, AH          ; Save remainder

    ; Display quotient
    MOV DL, CL
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    ; Display remainder label
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    ; Display remainder
    MOV DL, CH
    ADD DL, 30H
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
