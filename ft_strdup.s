; ************************************************************************** */
;                                                                            */
;                                                        :::      ::::::::   */
;   ft_strdup.s                                        :+:      :+:    :+:   */
;                                                    +:+ +:+         +:+     */
;   By: igcastil <igcastil@student.42madrid.com    +#+  +:+       +#+        */
;                                                +#+#+#+#+#+   +#+           */
;   Created: 2025/08/06 16:02:01 by igcastil          #+#    #+#             */
;   Updated: 2025/08/07 11:52:29 by igcastil         ###   ########.fr       */
;                                                                            */
; ************************************************************************** */

;char *strdup(const char *s);
;returns a pointer to a new string which is a duplicate of the string s.  Memory for the
;new string is obtained with malloc(3), and can be freed with free(3). 
; returns NULL if insufficient memory was available, with errno set to indicate the error..


section	.text
global	ft_strdup
extern malloc
extern ft_strlen
extern ft_strcpy
extern __errno_location					;external function reference to __errno_location, which is a glibc-specific function that provides access to the thread-local errno variable. The extern keyword tells the assembler that this symbol is defined in another object file or library and will be resolved during the linking phase

ft_strdup:								; char *s = rdi
			call	ft_strlen wrt ..plt ; call to ft_strlen(rdi) -char *s is already in rdi-
			inc		rax					; we will need one more byte for the \0
			push	rdi					; rdi has *s and we need to preserve it before writing in rdi to call malloc
			mov		rdi, rax			; rdi now has number of bytes to allocate with malloc
			call	malloc wrt ..plt 	
			cmp		rax, 0				; malloc failed?
			jz		error_handler		; jump to error handler if malloc failed
			mov		rdi, rax			; rdi points to the allocated memory
			pop		rsi					; rsi now has the original string *s
			call	ft_strcpy wrt ..plt ; ft_strcpy(rdi, s)
			ret							; return pointer to the new string in rax

error_handler:
			neg		rax						; make error code positive
			mov		rdi, rax				; save error code
			call    __errno_location wrt ..plt  ; PIC-compatible call; get address of errno
			mov		[rax], rdi				; errno = error code
			mov		rax, 0					; return NULL if malloc failed
			ret

section .note.GNU-stack noalloc noexec nowrite progbits
; PIE (Position Independent Executable) is a security feature
; that makes executables load at random memory addresses each time they run,
; making it harder for attackers to exploit memory vulnerabilities.
; that is why wrt ..plt is used in the call to __errno_location.
; It Allows dynamic resolution at runtime
; Works with randomized addresses
; the GOT (Global Offset Table) stores addresses of global variables/functions
; and is updated at load time with actual addresses
; Enables position independence