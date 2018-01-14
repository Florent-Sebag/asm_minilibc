[BITS 64]

	GLOBAL strstr:function
	SECTION .text

strstr:
  PUSH rbp
  MOV rbp, rsp

  XOR rcx, rcx ; i
  XOR rax, rax ; j
loop:
  CMP BYTE [rsi + rax], 0 ; cmp str2[j], 0
  JE good_end
  CMP BYTE [rdi + rcx], 0 ; cmp str1[i], 0
  JE bad_end
  MOV r8b, [rsi + rax] ; r8b = str2[j]
  CMP BYTE [rdi + rcx], r8b ; cmp str1[i], r8b
  JE find_letter
  XOR rax, rax ; j = 0
  inc rcx ; i = i + 1
  JMP loop

bad_end:
  MOV rax, 0
  JMP end

good_end:
  MOV r8, rax
  MOV rax, rdi
  ADD rax, rcx
  SUB rax, r8
  JMP end

find_letter:
  inc rax ; j = j + 1
  inc rcx
  JMP loop

end:
	LEAVE
	RET
