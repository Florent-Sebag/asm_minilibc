[BITS 64]

	GLOBAL strncmp:function
	SECTION .text

strncmp:
	PUSH rbp
	MOV rbp, rsp

	XOR rcx, rcx

loop:
  MOV r8b, [rsi + rcx]
  CMP rcx, rdx
  JE end_n
  CMP BYTE [rdi + rcx], 0
  JE end_loop
  CMP r8b, 0
  JE end_loop
  inc rcx
  CMP BYTE [rdi + rcx - 1], r8b
  JE loop ; si oui loop
  JMP diff_end

end_loop:
  CMP BYTE [rdi + rcx], r8b
  JE good_end
  JMP nope_end

good_end:
  MOV rax, 0
  JMP end

nope_end:
  CMP BYTE [rdi + rcx], 0
  JE neg_end
  CMP BYTE [rsi + rcx], 0
  JE pos_end

neg_end:
  MOV rax, -1
  JMP end

pos_end:
  MOV rax, 1
  JMP end

diff_end:
  CMP BYTE [rdi + rcx - 1], r8b
  JA pos_end
  JMP neg_end

end_n:
  MOV rax, 0

end:
	LEAVE
	RET
