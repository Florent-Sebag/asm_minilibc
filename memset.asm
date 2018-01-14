[BITS 64]

	global memset:function
	section .text

memset:
	PUSH rbp
	MOV rbp, rsp

	XOR rcx, rcx
	CMP rdx, 0
	JE end
	DEC rdx
loop:
	MOV BYTE [rdi + rcx], sil
	CMP rcx, rdx
	JE end
	CMP BYTE [rdi + rcx], 0
	JE end
	INC rcx
	JMP loop

end:
	MOV rax, rdi
	LEAVE
	RET
