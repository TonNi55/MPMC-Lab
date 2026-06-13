.MODEL SMALL
.STACK 100H

.DATA
    MSG1  DB  'Enter a character: $'
    MSG2  DB  0DH, 0AH, 'You entered: $'

.CODE
MAIN PROC
    MOV AX, @DATA       ; Load data segment address
    MOV DS, AX          ; Set up data segment

    ; Display prompt
    MOV AH, 09H
    LEA DX, MSG1
    INT 21H

    ; Read character from keyboard
    MOV AH, 01H         ; Function 01H = read char with echo
    INT 21H             ; Character stored in AL
    MOV BL, AL          ; Save it in BL

    ; Display second message
    MOV AH, 09H
    LEA DX, MSG2
    INT 21H

    ; Display the character back
    MOV AH, 02H         ; Function 02H = display character
    MOV DL, BL
    INT 21H

    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
