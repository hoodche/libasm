; ************************************************************************** */
;                                                                            */
;                                                        :::      ::::::::   */
;   ft_write.s                                         :+:      :+:    :+:   */
;                                                    +:+ +:+         +:+     */
;   By: igcastil <igcastil@student.42madrid.com    +#+  +:+       +#+        */
;                                                +#+#+#+#+#+   +#+           */
;   Created: 2025/08/06 16:02:01 by igcastil          #+#    #+#             */
;   Updated: 2025/08/07 11:52:29 by igcastil         ###   ########.fr       */
;                                                                            */
; ************************************************************************** */

;ssize_t write(int fd, const void buf[.count], size_t count);
;writes up to count bytes from the buffer starting at buf 
;to the file referred to by the file descriptor fd.
;On success, the number of bytes written is returned.
;On error, -1 is returned, and errno is set to indicate the error.

section	.text
global	ft_write
extern __errno_location					;external function reference to __errno_location, which is a glibc-specific function that provides access to the thread-local errno variable. The extern keyword tells the assembler that this symbol is defined in another object file or library and will be resolved during the linking phase

ft_write:								; fd = rdi, buf = rsi, bytes = rdx
			mov		rax, 1				; write system call number
			syscall						; execute system call
			cmp		rax, 0				; check if return value is negative
			jl		error_handler		; jump to error handler if negative
			ret							; return positive value (bytes written)

error_handler:
			neg		rax						; make error code positive
			mov		rdi, rax				; save error code
			call    __errno_location wrt ..plt  ; PIC-compatible call; get address of errno
			mov		[rax], rdi				; errno = error code
			mov		rax, -1					; return -1
			ret

section .note.GNU-stack noalloc noexec nowrite progbits	;marks stack as non-executable and avoids compiling warnings about executable stack
; .note.GNU-stack section is a special section used in ELF (Executable and Linkable Format) binaries. It is primarily used to indicate whether
;  the program requires an executable stack. Modern compilers and linkers use this section to mark the stack as non-executable for security purposes,
;   helping prevent certain types of attacks like stack-based buffer overflows.
; noalloc: Indicates that this section does not allocate memory in the program's address space. It is purely informational and does not contribute to the runtime behavior of the program.
; noexec: Specifies that the section is not executable. This is critical for security, as it ensures that the stack cannot be used to execute arbitrary code. The linker will generate a binary with a non-executable stack
; nowrite: Marks the section as read-only, meaning it cannot be modified during program execution.
; progbits: Indicates that the section contains program-specific data. In this case, it is metadata related to the stack's properties.



;calling functions with wrt ..plt:
; PIE (Position Independent Executable) is a security feature
; that makes executables load at random memory addresses each time they run,
; making it harder for attackers to exploit memory vulnerabilities.
; that is why wrt ..plt is used in the call to __errno_location.
; It Allows dynamic resolution at runtime
; Works with randomized addresses
; the GOT (Global Offset Table) stores addresses of global variables/functions
; and is updated at load time with actual addresses
; Enables position independence