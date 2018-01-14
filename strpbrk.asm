[BITS 64]

	GLOBAL strpbrk:function
	SECTION .text

strpbrk:
	PUSH rbp
	MOV rbp, rsp

	XOR rcx, rcx

loop:
  inc rcx
  XOR rax, rax
  MOV r8b, [rdi + rcx - 1]
  CMP BYTE [rdi + rcx - 1], 0
  JE bad_end

  test_letter:
    CMP BYTE [rsi + rax], 0
    JE loop
    CMP BYTE [rsi + rax], r8b
    JE end
    inc rax
    JMP test_letter

bad_end:
  XOR rax, rax
  LEAVE
  RET

end:
  MOV rax, rdi
  ADD rax, rcx
  SUB rax, 1
	LEAVE
	RET
