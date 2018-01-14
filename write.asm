[BITS 64]

	GLOBAL write:function
	SECTION .text

  write:
  PUSH rbp
	MOV rbp, rsp

  MOV rax, 1
  SYSCALL

  LEAVE
  RET
