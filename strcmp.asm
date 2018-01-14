[BITS 64]

	GLOBAL strcmp:function
	SECTION .text

strcmp:
	PUSH rbp
	MOV rbp, rsp

	XOR rcx, rcx

loop:
  MOV r8b, [rsi + rcx] ; r8b = tmp = rsi[i]
  CMP BYTE [rdi + rcx], 0 ; compare rdi a 0
  JE end_loop ; si oui go endloop
  CMP r8b, 0 ; compare r8b a 0
  JE end_loop ; si oui endloop
  inc rcx
  CMP BYTE [rdi + rcx - 1], r8b ; compare tmp a rdi[i]
  JE loop ; si oui loop
  JMP diff_end ; sinon diff_end

end_loop:
  CMP BYTE [rdi + rcx], r8b ; on vérifie que les 2 soit bien = \0
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

end:
	LEAVE
	RET
