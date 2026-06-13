.MODEL SMALL
.STACK 100H

.DATA
    MSG  DB  'Sum of 1 to 5 = $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AH, 09H
    LEA DX, MSG
    INT 21H

    MOV AX, 0000H       ; AX = 0, holds the running sum
    MOV BX, 0001H       ; BX = 1, current number to add
    MOV CX, 0005H       ; CX = 5, loop counter (N = 5)

LOOP_START:
    ADD AX, BX          ; Add current number to sum
    INC BX              ; Next number
    LOOP LOOP_START     ; CX--, loop if CX != 0

    ; Result: AX = 15, display as '1' and '5'
    MOV DL, '1'
    MOV AH, 02H
    INT 21H

    MOV DL, '5'
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
