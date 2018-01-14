[BITS 64]

	GLOBAL memmove:function
	SECTION .text

memmove:
	PUSH rbp
	MOV rbp, rsp

	XOR rcx, rcx

	MOV r8, rdi
	SUB r8, rsi
	CMP r8, 0
	JGE f_right
	XOR r8, r8

f_left:
	CMP rcx, rdx
	JE end
	MOV r8b, [rsi + rcx]
	MOV BYTE [rdi + rcx], r8b
	INC rcx
	JMP f_left

f_right:
	DEC rdx
	loop_right:
		CMP rdx, -1
		JE end
		MOV r8b, [rsi + rdx]
		MOV BYTE [rdi + rdx], r8b
		DEC rdx
		JMP loop_right

end:
	MOV rax, rdi
	LEAVE
	RET
