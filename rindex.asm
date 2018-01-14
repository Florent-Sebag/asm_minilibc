[BITS 64]

	global rindex:function
	section .text

rindex:
	push rbp
	mov rbp, rsp

	xor rcx, rcx
  xor rax, rax
loop:
	cmp BYTE [rdi + rcx], sil
	je finded
  save:
	 cmp BYTE [rdi + rcx], 0
	 je nf
	 inc rcx
	 jmp loop

nf:
	jmp end

finded:
	mov rax, rdi
	add rax, rcx
  jmp save

end:
	LEAVE
	RET
