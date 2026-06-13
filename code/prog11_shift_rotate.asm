.MODEL SMALL
.STACK 100H

.DATA
    MSG_SHL  DB  'After SHL (4 shl 1 = 8): $'
    MSG_SHR  DB  0DH, 0AH, 'After SHR (8 shr 1 = 4): $'
    MSG_ROL  DB  0DH, 0AH, 'After ROL (80H rol 1 = 01H): $'
    MSG_ROR  DB  0DH, 0AH, 'After ROR (01H ror 1 = 80H): $'

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ;===========================================
    ; 1. SHL - Shift Left (AL * 2 each shift)
    ;    Bit 7 goes to Carry Flag, 0 enters bit 0
    ;===========================================
    MOV AH, 09H
    LEA DX, MSG_SHL
    INT 21H

    MOV AL, 04H         ; AL = 00000100 (4)
    SHL AL, 1           ; AL = 00001000 (8) - shifted left
    ADD AL, 30H         ; Convert to ASCII
    MOV DL, AL
    MOV AH, 02H
    INT 21H             ; Prints '8'

    ;===========================================
    ; 2. SHR - Shift Right (AL / 2 each shift)
    ;    Bit 0 goes to Carry Flag, 0 enters bit 7
    ;===========================================
    MOV AH, 09H
    LEA DX, MSG_SHR
    INT 21H

    MOV AL, 08H         ; AL = 00001000 (8)
    SHR AL, 1           ; AL = 00000100 (4) - shifted right
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H             ; Prints '4'

    ;===========================================
    ; 3. ROL - Rotate Left
    ;    Bit 7 wraps around to bit 0 (no bits lost)
    ;===========================================
    MOV AH, 09H
    LEA DX, MSG_ROL
    INT 21H

    MOV AL, 80H         ; AL = 10000000 (bit 7 set)
    ROL AL, 1           ; AL = 00000001 (bit 7 moved to bit 0)
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H             ; Prints '1'

    ;===========================================
    ; 4. ROR - Rotate Right
    ;    Bit 0 wraps around to bit 7 (no bits lost)
    ;===========================================
    MOV AH, 09H
    LEA DX, MSG_ROR
    INT 21H

    MOV AL, 01H         ; AL = 00000001 (bit 0 set)
    ROR AL, 1           ; AL = 10000000 (bit 0 moved to bit 7 = 80H)
    ; 80H = 128 which is not printable ASCII, display 'X' to indicate done
    MOV DL, 'X'         ; Display 'X' to show ROR completed (80H = non-printable)
    MOV AH, 02H
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
