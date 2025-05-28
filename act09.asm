section .data
num1 db 5            ; Define un byte con el valor 5
num2 db 11           ; Define un byte con el valor 11
result db 0          ; Espacio para almacenar el resultado de la suma
msg db 'Resultado: ', 0 ; Cadena de texto para mostrar antes del resultado (11 caracteres + NULL)

section .bss
buffer resb 4        ; Reservar 4 bytes para almacenar la versión ASCII del número

section .text
global _start
_start:
mov al, [num1]       ; Mueve el valor de num1 (5) al registro AL
add al, [num2]       ; Suma el valor de num2 (11) al registro AL => AL = 16
mov [result], al     ; Guarda el resultado (16) en la variable result

; Convertir el resultado a ASCII
movzx eax, byte [result] ; Expande el byte de result a 32 bits sin signo
add eax, 48          ; Suma 48 para convertir número en su representación ASCII

mov [buffer], al     ; Almacena el carácter ASCII en el buffer

; Imprimir 'Resultado: '
mov eax, 4           ; syscall write
mov ebx, 1           ; file descriptor (stdout)
mov ecx, msg         ; dirección de la cadena 'Resultado: '
mov edx, 11          ; número de bytes a imprimir
int 0x80             ; interrupción para llamada al sistema

; Imprimir el carácter (resultado de la suma en ASCII)
mov eax, 4           ; syscall write
mov ebx, 1           ; file descriptor (stdout)
mov ecx, buffer      ; dirección del buffer con carácter ASCII
mov edx, 1           ; longitud: 1 byte
int 0x80             ; interrupción

; Terminar el programa
mov eax, 1           ; syscall exit
xor ebx, ebx         ; código de salida 0
int 0x80
//-------------------------------------------------------------------
movzx eax, byte [result]
//-------------------------------------------------------------------
Sí, se está utilizando:

Modo de direccionamiento directo: cuando se accede a una dirección de memoria nombrada explícitamente, como [num1], [num2], [result].

Modo inmediato: al usar constantes como mov eax, 4 o add eax, 48.
//-------------------------------------------------------------------
Resultado: 0
//------------------------------------------------------------------
e. Modifica el programa para que imprima A, , $, & y 1. Documenta tu procedimiento.
Primero, busquemos los códigos ASCII:

Carácter	ASCII decimal
A	65
\	92
$	36
&	38
1	49
//------------------------------------------------------------------
f. ¿Fue la única forma de modificar el código para llegar a esos resultados? ¿Qué otra línea pudiste modificar para llegar a los mismos resultados?
No fue la única forma.

Alternativas:

En lugar de cambiar num1 y num2, puedes modificar directamente el valor que se guarda en result:

asm
Copiar
Editar
mov byte [result], 17 ; en lugar de sumar num1 + num2
//-------------------------------------------------------------------
section .text
global _start
_start:
mov al, 64         ; 64 es el código ASCII de '@'
mov [buffer], al

mov eax, 4
mov ebx, 1
mov ecx, buffer
mov edx, 1
int 0x80

mov eax, 1
xor ebx, ebx
int 0x80
//-------------------------------------------------------------------
section .data
caracter db '@'
section .bss
buffer resb 1
section .text
global _start
_start:
mov esi, caracter   ; Modo indirecto: apunta a la dirección
mov al, [esi]       ; Indirección a través de ESI
mov [buffer], al

mov eax, 4
mov ebx, 1
mov ecx, buffer
mov edx, 1
int 0x80

mov eax, 1
xor ebx, ebx
int 0x80
//--------------------------------------------------------------------
ok..