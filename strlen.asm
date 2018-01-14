BITS 64

GLOBAL strlen:function
SECTION .text

strlen:
	push rbp
	mov rbp, rsp ; Initialisation pour recup le premier param

	xor rax, rax ; rax = 0
loop:
	cmp BYTE [rdi + rax], 0 ; on compare word[rax] a \0
	jz end ; si cmp renvoie 1 alors fin de la boucle
	inc rax ; sinon rax += 1
	jmp loop ; relancer boucle

end:
	pop rbp
	ret
