//parte 1//
section .data
    num1 db 5            ; Define el primer número (5)
    num2 db 11           ; Define el segundo número (11)
    result db 0          ; Reserva espacio para el resultado
    message db "Resultado: ", 0   ; Mensaje a imprimir

section .bss
    buffer resb 4        ; Buffer para conversión de números

section .text
    global _start

; Macro para imprimir una cadena
%macro PRINT_STRING 1
    mov eax, 4           ; Syscall para 'write'
    mov ebx, 1           ; Descriptor de archivo (stdout)
    mov ecx, %1          ; Cadena a imprimir (pasada como argumento)
    mov edx, 13          ; Longitud de la cadena
    int 0x80             ; Llamada al sistema
%endmacro

; Macro para imprimir un número
%macro PRINT_NUMBER 1
    mov eax, %1          ; Número a imprimir (pasado como argumento)
    add eax, '0'          ; Convertir número a carácter ASCII
    mov [buffer], eax     ; Almacenar en buffer
    mov eax, 4           ; Syscall para 'write'
    mov ebx, 1           ; Descriptor de archivo (stdout)
    mov ecx, buffer       ; Buffer con el carácter
    mov edx, 1           ; Longitud 1
    int 0x80             ; Llamada al sistema
%endmacro

_start:
    mov al, [num1]       ; Cargar num1 en AL
    add al, [num2]       ; Sumar num2 a AL
    mov [result], al     ; Guardar resultado en 'result'

    PRINT_STRING message ; Imprimir mensaje
    PRINT_NUMBER [result] ; Imprimir resultado

    ; Salir del programa
    mov eax, 1           ; Syscall para 'exit'
    mov ebx, 0           ; Código de salida (0)
    int 0x80

    //parte 2//

    section .data
    message db "La suma de los valores es: ", 0
    newline db 10, 0           ; Nueva línea para la salida
    numeros db 3, 7, 5         ; Estructura de datos con 3 números

section .bss
    buffer resb 4              ; Buffer para convertir números a caracteres

section .text
    global _start

; Macro para imprimir una cadena
%macro PRINT_STRING 1
    mov eax, 4
    mov ebx, 1
    mov ecx, %1
    mov edx, 13
    int 0x80
%endmacro

; Macro para sumar 3 números y mostrar el resultado
%macro PRINT_SUM 0
    mov al, [numeros]         ; Cargar primer número
    add al, [numeros + 1]     ; Sumar segundo número
    add al, [numeros + 2]     ; Sumar tercer número
    add al, '0'               ; Convertir a ASCII
    mov [buffer], al          ; Guardar en buffer
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, 1
    int 0x80
    PRINT_STRING newline      ; Imprimir nueva línea
%endmacro

_start:
    ; Imprime el mensaje inicial
    PRINT_STRING message

    ; Imprime la suma de los valores
    PRINT_SUM

    ; Salir del programa
    mov eax, 1                ; Syscall para 'exit'
    mov ebx, 0                ; Código de salida
    int 0x80