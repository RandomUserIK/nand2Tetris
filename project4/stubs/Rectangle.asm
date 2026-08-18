// Program: Rectangle.asm
// Draw a filled rectangle at the 
// upper left corner of the screen,
// 16 pixels wide and RAM[0] pixels long
// Usage: put a non-negative number (rectangle's height) in RAM[0].

// make addr a pointer 
// to the screen's base (16384)
@SCREEN
D=M
@addr
M=D

// n = RAM[0]
@R0
D=M
@n
M=D

// i = 0
@i
M=0

(LOOP)
    // if i > n goto END
    @i
    D=M
    @n
    D=D-M
    @END
    D;JGT

    // RAM[addr] = -1
    @addr
    A=M
    M=-1

    // i = i + 1
    @i
    M=M+1

    // addr = addr + 32
    @32
    D=A
    @addr
    M=D+M
    @LOOP
    0;JMP

(END)
    @END
    0;JMP