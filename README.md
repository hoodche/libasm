# Libasm-Linux

### CPU (Central Processor Unit) process instructions in our code. Different CPU`s process different types of instruction sets (ARM instruction set, X86, X64...). But CPU´s only understand 0's and 1's (binary code)!!!! ASM is the readable representation of the binary language that the processor understands. There's one assembly language per instruction set.

This project is written in in x86_64 ASM (in Intel syntax), the assembly language adapted to processors with X64 instruction set, and compiles (assembles) code with nasm assembler. 64-bit ASM is meant for CPU architectures with 64 bit registers (so we can address much more than 4Gb in RAM!!!!!). A specific calling convention and register set is used

#### Registers in x86_64

| 64-bit | 32-bit | 16-bit | 8-bit |
|--------|--------|--------|-------|
| rax    | eax    | ax     | al    |
| rbx    | ebx    | bx     | bl    |
| rcx    | ecx    | cx     | cl    |
| rdx    | edx    | dx     | dl    |
| rsi    | esi    | si     | sil   |
| rdi    | edi    | di     | dil   |
| rsp    | esp    | sp     | spl   |
| rbp    | ebp    | bp     | bpl   |
| r8–r15 | r8d–r15d | r8w–r15w | r8b–r15b |

#### Function Calls in x86_64
(Calling Convention = System V AMD64 ABI, which is the standard calling convention for 64-bit Linux and macOS systems.)

Arguments to functions are passed in registers (not on the stack):

| Argument # | Register |
|------------|----------|
| 1st        | rdi      |
| 2nd        | rsi      |
| 3rd        | rdx      |
| 4th        | rcx      |
| 5th        | r8       |
| 6th        | r9       |

**Return values go in rax.**

## Usage
1. with the "make" command we create the libasm.a library (containing ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s, ft_read.s ft_strdup.sfunctions).
2. with the "make test" command we compile the libasm.a library with a file (main.c) that tests the libasm.a library. Tests are executed and you can see their output in the terminal.
