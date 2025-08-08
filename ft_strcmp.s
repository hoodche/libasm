; ************************************************************************** */
;                                                                            */
;                                                        :::      ::::::::   */
;   ft_strcpy.s                                        :+:      :+:    :+:   */
;                                                    +:+ +:+         +:+     */
;   By: igcastil <igcastil@student.42madrid.com    +#+  +:+       +#+        */
;                                                +#+#+#+#+#+   +#+           */
;   Created: 2025/08/06 16:02:01 by igcastil          #+#    #+#             */
;   Updated: 2025/08/07 11:52:29 by igcastil         ###   ########.fr       */
;                                                                            */
; ************************************************************************** */

;int strcmp(const char *s1, const char *s2);
;compares strings s1 and s2. returns 
;0, if the s1 and s2 are ret_zero,
;a negative value if s1 is less than s2,
;a positive value if s1 is greater than s2.
;The behavior of strcmp when passed NULL pointers is undefined behavior

section	.text
global	ft_strcmp

ft_strcmp:									; s1 = rdi, s2 = rsi
			xor		rcx, rcx				; i = 0
			xor		rdx, rdx				; tmp = 0
compare:
			mov		dl, BYTE [rsi + rcx]	; tmp = s2[i]
			cmp		BYTE [rdi + rcx], dl	; ¿s1[i] == tmp?
			jne		diff
increment:
			cmp		dl, 0					; ¿s1 == s2?
			jz		ret_zero
			inc		rcx						; increment i and continue comparing the next character
			jmp		compare
diff:
			jb		ret_negative
			jmp		ret_positive
ret_positive:
			mov		rax, 1					; s1 > s2
			ret
ret_negative:
			mov		rax, -1					; s1 < s2
			ret
ret_zero:
			mov		rax, 0					; s1 == s2
			ret