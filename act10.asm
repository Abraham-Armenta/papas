_start: 
    mov al, 'A'
    shl al, 1
    mov [char], al 

    mov eax, 4
    mov ebx, 1
    mov edx, char 
    mov 0x80 

    mov eax, 4 
    mov ebx, 1
    mov ecx, newLine
    mov edx, 1
    int 0x80

    mov eax, 1 
    xor ebx, ebx
    int 0x80

    //-------------------------------------------

    _start:
        mov al, 'A'
        shr al, 1
        mov [char], al
    //-------------------------------------------

    _start:
        mov al, 'A'
        rol al, 1
        mov [char], al
    //-------------------------------------------

    _start:
        mov al, 'A'
        rov al, 1
        mov [char], al