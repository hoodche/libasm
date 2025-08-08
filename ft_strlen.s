; ************************************************************************** */
;                                                                            */
;                                                        :::      ::::::::   */
;   ft_strlen.s                                        :+:      :+:    :+:   */
;                                                    +:+ +:+         +:+     */
;   By: igcastil <igcastil@student.42madrid.com    +#+  +:+       +#+        */
;                                                +#+#+#+#+#+   +#+           */
;   Created: 2025/08/06 16:02:01 by igcastil          #+#    #+#             */
;   Updated: 2025/08/07 11:52:29 by igcastil         ###   ########.fr       */
;                                                                            */
; ************************************************************************** */

;size_t strlen(const char *s)
;calculates the length of the string pointed to by s, excluding the terminating null byte ('\0').
;returns the number of bytes in the string pointed to by s

section	.text
global	ft_strlen

ft_strlen:
			xor		rax, rax			; i = 0
			jmp		compare				;When the processor encounters this instruction, it immediately changes the instruction pointer (RIP register in x86-64) to point to the memory location marked by the compare label. This means the next instruction to be executed will be whatever instruction is located at the compare labe
increment:
			inc		rax					; i++
compare:
			cmp		BYTE [rdi + rax], 0	; ¿str[i] == 0? performs a subtraction operation between two operands but discards the result, only keeping the processor flags that indicate the relationship between the values
			jne		increment			;jump if not equal (jne) instruction checks the zero flag (ZF) set by the cmp instruction. If ZF is not set (meaning the two compared values were not equal), it jumps to the increment label, which increments the index i and continues checking the next character in the string.
			ret							; return i

;marks stack as non-executable and avoids compiling warnings about executable stack
section .note.GNU-stack noalloc noexec nowrite progbits