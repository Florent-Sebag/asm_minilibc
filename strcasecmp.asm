[BITS 64]

	GLOBAL strcasecmp:function
	SECTION .text

strcasecmp:
	PUSH rbp
	MOV rbp, rsp

  XOR rax, rax
  XOR r8, r8
  XOR r9, r9
  XOR rcx, rcx

loop:
  MOV r8b, [rdi + rcx]
  MOV r9b, [rsi + rcx]
  CMP r8b, 0
  JE end
  CMP r9b, 0
  JE end

check_letter1:
  CMP r8b, 65
  JGE check_maj1

check_letter2:
  CMP r9b, 65
  JGE check_maj2

cmp_letter:
  CMP r8b, r9b
  JNE end
  INC rcx
  JMP loop

check_maj1:
  CMP r8b, 90
  JLE put_min1
  JMP check_letter2

check_maj2:
  CMP r9b, 90
  JLE put_min2
  JMP cmp_letter

put_min1:
  ADD r8b, 32
  JMP check_letter2

put_min2:
  ADD r9b, 32
  JMP cmp_letter

end:
  MOV	al, r8b
  SUB	al, r9b

  MOVSX	rax, al
	LEAVE
	RET
