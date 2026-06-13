.MODEL SMALL
.STACK 100H

.DATA
    MSG  DB  'Smallest of three = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, 05          ; Number 1 = 5
    MOV BL, 03          ; Number 2 = 3
    MOV CL, 08          ; Number 3 = 8

    ; Step 1: Compare first two numbers
    CMP AL, BL
    JBE STEP2           ; AL <= BL, so AL stays
    MOV AL, BL          ; Else BL is smaller

STEP2:
    ; Step 2: Compare winner with third number
    CMP AL, CL
    JBE DISPLAY         ; AL <= CL, so AL is smallest
    MOV AL, CL          ; Else CL is smallest

DISPLAY:
    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
