.MODEL SMALL
.STACK 100H

.DATA
    question1 DB "What is the capital of France?$"
    answer1A DB "A. London$"
    answer1B DB "B. Paris$"
    answer1C DB "C. Berlin$"
    correctAnswer1 DB 'B'

    question2 DB "Which planet is known as the Red Planet?$"
    answer2A DB "A. Venus$"
    answer2B DB "B. Mars$"
    answer2C DB "C. Jupiter$"
    correctAnswer2 DB 'B'

    userAnswer DB 0 ; Initialize userAnswer to 0

    correctMessage DB "Correct! Well done!$"
    incorrectMessage DB "Incorrect. Better luck next time!$"

.CODE
MAIN PROC
    MOV AX, @data
    MOV DS, AX

    ; Display and process question 1
    CALL DisplayQuestion1
    CALL GetUserInput
    CALL CheckAnswer1
    CALL DisplayFeedback

    ; Display and process question 2
    CALL DisplayQuestion2
    CALL GetUserInput
    CALL CheckAnswer2
    CALL DisplayFeedback

    ; Terminate program
    MOV AX, 4C00H
    INT 21H

MAIN ENDP

DisplayQuestion1 PROC
    MOV AH, 09H
    ; Display question
    LEA DX, question1
    INT 21H
    ; Display answer choices
    LEA DX, answer1A
    INT 21H
    LEA DX, answer1B
    INT 21H
    LEA DX, answer1C
    INT 21H
    RET
DisplayQuestion1 ENDP

DisplayQuestion2 PROC
    MOV AH, 09H
    ; Display question
    LEA DX, question2
    INT 21H
    ; Display answer choices
    LEA DX, answer2A
    INT 21H
    LEA DX, answer2B
    INT 21H
    LEA DX, answer2C
    INT 21H
    RET
DisplayQuestion2 ENDP

GetUserInput PROC
    MOV AH, 01H
    INT 21H
    SUB AL, 'A'
    MOV userAnswer, AL
    RET
GetUserInput ENDP

CheckAnswer1 PROC
    ; Convert ASCII characters to uppercase
    CALL ConvertToUpper

    ; Check correctness of the answer for question 1
    MOV AL, userAnswer   ; Move the value of userAnswer into AL
    CMP AL, correctAnswer1
    JE  CorrectAnswer1
    JMP IncorrectAnswer1
CorrectAnswer1:
    ; Display correct message
    MOV AH, 09H
    LEA DX, correctMessage
    INT 21H
    JMP EndCheck1
IncorrectAnswer1:
    ; Display incorrect message
    MOV AH, 09H
    LEA DX, incorrectMessage
    INT 21H
EndCheck1:
    RET
CheckAnswer1 ENDP

CheckAnswer2 PROC
    ; Convert ASCII characters to uppercase
    CALL ConvertToUpper

    ; Check correctness of the answer for question 2
    MOV AL, userAnswer   ; Move the value of userAnswer into AL
    CMP AL, correctAnswer2
    JE  CorrectAnswer2
    JMP IncorrectAnswer2
CorrectAnswer2:
    ; Display correct message
    MOV AH, 09H
    LEA DX, correctMessage
    INT 21H
    JMP EndCheck2
IncorrectAnswer2:
    ; Display incorrect message
    MOV AH, 09H
    LEA DX, incorrectMessage
    INT 21H
EndCheck2:
    RET
CheckAnswer2 ENDP

ConvertToUpper PROC
    ; Convert userAnswer to uppercase
    CMP userAnswer, 'a'
    JB  EndConvert
    CMP userAnswer, 'z'
    JA  EndConvert
    SUB userAnswer, 20H ; Convert to uppercase
EndConvert:
    RET
ConvertToUpper ENDP

DisplayFeedback PROC
    ; Display feedback message (add your code here)
    RET
DisplayFeedback ENDP

END MAIN