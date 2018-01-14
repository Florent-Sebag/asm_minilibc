[BITS 64]

	GLOBAL read:function
	SECTION .text

  read:
  PUSH rbp
	MOV rbp, rsp

  XOR rax, rax
  SYSCALL

  LEAVE
  RET
