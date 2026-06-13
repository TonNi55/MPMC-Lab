.MODEL SMALL
.STACK 100H

.DATA
    NEWLINE  DB  0DH, 0AH, '$'     ; Newline string

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV CX, 04H         ; Outer loop = 4 rows
    MOV BL, 01H         ; Row counter starts at 1

OUTER_LOOP:
    PUSH CX             ; Save outer counter (inner loop will change CX)
    MOV CX, BX          ; Inner loop runs BL times (row number = star count)

INNER_LOOP:
    MOV AH, 02H
    MOV DL, 2AH         ; 2AH = ASCII '*'
    INT 21H
    LOOP INNER_LOOP     ; Print stars for this row

    ; Print newline after each row
    MOV AH, 09H
    LEA DX, NEWLINE
    INT 21H

    INC BL              ; Next row = one more star
    POP CX              ; Restore outer counter
    LOOP OUTER_LOOP     ; Next row

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
