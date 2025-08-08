; ************************************************************************** */
;                                                                            */
;                                                        :::      ::::::::   */
;   main.c                                             :+:      :+:    :+:   */
;                                                    +:+ +:+         +:+     */
;   By: igcastil <igcastil@student.42madrid.com    +#+  +:+       +#+        */
;                                                +#+#+#+#+#+   +#+           */
;   Created: 2025/08/06 16:02:01 by igcastil          #+#    #+#             */
;   Updated: 2025/08/07 11:52:29 by igcastil         ###   ########.fr       */
;                                                                            */
; ************************************************************************** */

;char *strcpy(char *restrict dst, const char *restrict src);
;copies the string pointed to by src (including the terminating null byte) to the buffer pointed to by dst.
;returns a pointer to the destination string dst.
;The function does not check for buffer overflows, so dst must be large enough to hold the copied string.
;If dst and src overlap, the behavior is undefined.
;The standard strcpy() does not check for NULL pointers - it's the programmer's responsibility to ensure valid pointers are passed. The C standard states this results in undefined behavior.
; when dst == NULL there will be segmentation fault in line 23 which is OK because the function is not supposed to handle NULL pointers.
section	.text
global	ft_strcpy

ft_strcpy:									; dst = rdi, src = rsi
			xor		rcx, rcx				; i = 0
			xor		rdx, rdx				; tmp register to read from src and write to dst
			cmp		rsi, 0					; ¿rsi == 0?
			jz		return					; jumps if the zero flag (ZF) is set. The jz mnemonic stands for "jump if zero" 
			jmp		copy
increment:
			inc		rcx
copy:
			mov		dl, BYTE [rsi + rcx]	;dl is the 8-bit lower portion of the rdx register,
			mov		BYTE [rdi + rcx], dl	;x86-64 assembly cannot perform a direct memory-to-memory copy in a single instruction. The x86 architecture requires that at least one operand in a mov instruction be a register.
			cmp		dl, 0
			jnz		increment
return:
			mov		rax, rdi				; return dst
			ret
