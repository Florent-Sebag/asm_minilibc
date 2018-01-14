[BITS 64]

	GLOBAL strcspn:function
	SECTION .text

strcspn:
	PUSH rbp
	MOV rbp, rsp

	XOR rcx, rcx
loop:
	XOR rax, rax
	INC rcx
	CMP BYTE [rdi + rcx - 1], 0
	JE end
	MOV r8b, [rdi + rcx - 1]
	test_letter:
		CMP BYTE [rsi + rax], 0
		JE loop
		CMP BYTE [rsi + rax], r8b
		JE end
		INC rax
		JMP test_letter


end:
  MOV rax, rcx
	SUB rax, 1
	LEAVE
	RET
