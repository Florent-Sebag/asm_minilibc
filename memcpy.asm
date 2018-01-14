[BITS 64]

	GLOBAL memcpy:function
	SECTION .text

memcpy:
	PUSH rbp
	MOV rbp, rsp

	XOR rcx, rcx
	CMP rdi, 0
	JE end
	CMP rsi, 0
	JE end
loop:
	CMP rcx, rdx
	JE end
  MOV r8b, [rsi + rcx]
  MOV BYTE [rdi + rcx], r8b
  INC rcx
  JMP loop

end:
	MOV rax, rdi
	LEAVE
	RET
