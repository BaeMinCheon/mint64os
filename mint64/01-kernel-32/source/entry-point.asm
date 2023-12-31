
[BITS 16]

section .text

START:
    mov ax, 0x1000
    mov ds, ax
    mov es, ax
    cli
    lgdt [ GDTR ]
    mov eax, 0x4000003B
    mov cr0, eax
    jmp dword 0x08: (PROTECTEDMODE - $$ + 0x10000)

[BITS 32]

PROTECTEDMODE:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ss, ax
    mov esp, 0xFFFE
    mov ebp, 0xFFFE
    push (SWITCHSUCCESSMESSAGE - $$ + 0x10000)
    push 3
    push 0
    call PRINTMESSAGE
    add esp, 12
    jmp $

PRINTMESSAGE:
    push ebp
    mov ebp, esp
    push esi
    push edi
    push eax
    push ecx
    push edx
    mov eax, dword [ ebp + 12 ]
    mov esi, 80 * 2
    mul esi
    mov edi, eax
    mov eax, dword [ ebp + 8 ]
    mov esi, 2
    mul esi
    add edi, eax
    mov esi, dword [ ebp + 16 ]

.MESSAGELOOP:
    mov cl, byte [ esi ]
    cmp cl, 0
    je .MESSAGEEND
    mov byte [ edi + 0xB8000 ], cl
    add esi, 1
    add edi, 2
    jmp .MESSAGELOOP

.MESSAGEEND:
    pop edx
    pop ecx
    pop eax
    pop edi
    pop esi
    pop ebp
    ret

align 8, db 0
dw 0x0000

GDTR:
    dw GDTEND - GDT - 1
    dd (GDT - $$ + 0x10000)

GDT:
    NullDescriptor:
        dw 0x0000
        dw 0x0000
        db 0x00
        db 0x00
        db 0x00
        db 0x00

    CodeDescriptor:
        dw 0xFFFF
        dw 0x0000
        db 0x00
        db 0x9A
        db 0xCF
        db 0x00
    
    DataDescriptor:
        dw 0xFFFF
        dw 0x0000
        db 0x00
        db 0x92
        db 0xCF
        db 0x00
        
GDTEND:

SWITCHSUCCESSMESSAGE: db '[Successfully switched to Protected Mode]', 0

times 512 - ($ - $$) db 0x00