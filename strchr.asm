[BITS 64]

	global strchr:function
	section .text

strchr:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
loop:
	cmp BYTE [rdi + rcx], sil
	je finded
	cmp BYTE [rdi + rcx], 0
	je nf
	inc rcx
	jmp loop

nf:
	XOR rax, rax
	jmp end

finded:
	mov rax, rdi
	add rax, rcx

end:
	LEAVE
	RET
