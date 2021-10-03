%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction formats:
%
% Format 0
% ┏━━━━━┳━━━━━┳━━━━━━━━━┓ ┏━━━━━━━━━━━━━━━━━┓
% ┃ F F ┃ O O ┃ I I I I ┃ ┃ I I I I I I I I ┃
% ┗━━━━━┻━━━━━┻━━━━━━━━━┛ ┗━━━━━━━━━━━━━━━━━┛
%
% Format 1
% ┏━━━━━┳━━━━━┳━━━━━━━━━┓ ┏━━━━━━━━━━━━━━━━━┓
% ┃ F F ┃ O O ┃ S S S S ┃ ┃ I I I I I I I I ┃
% ┗━━━━━┻━━━━━┻━━━━━━━━━┛ ┗━━━━━━━━━━━━━━━━━┛
%
% Format 2
% ┏━━━━━┳━━━━━┳━━━━━━━━━┓ ┏━━━━━━━━━━━━━━━━━┓
% ┃ F F ┃ O O ┃ D D D D ┃ ┃ I I I I I I I I ┃
% ┗━━━━━┻━━━━━┻━━━━━━━━━┛ ┗━━━━━━━━━━━━━━━━━┛
%
% Format 3
% ┏━━━━━┳━━━━━━━━━━━┳━━━┓ ┏━━━━━━━━━┳━━━━━━━━━┓
% ┃ F F ┃ O O O O O ┃ R ┃ ┃ D D D D ┃ S S S S ┃
% ┗━━━━━┻━━━━━━━━━━━┻━━━┛ ┗━━━━━━━━━┻━━━━━━━━━┛
%
%   F - Format
%   O - Operation code
%   D - Destination Register
%   S - Source Register
%   I - Immediate value
%   R - Reserved
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Instruction Format 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                TODO: Fix description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand: 
%     
%
% Second operand:
%
%
% Type of operands:        Example:
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NOT = bin2dec('11 10001 0');
c.NOT = NOT;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                TODO: Fix description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand: 
%     
%
% Second operand:
%
%
% Type of operands:        Example:
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
XOR = bin2dec('11 10000 0');
c.XOR = XOR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                TODO: Fix description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand: 
%     
%
% Second operand:
%
%
% Type of operands:        Example:
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OR = bin2dec('11 01111 0');
c.OR = OR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                TODO: Fix description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand: 
%     
%
% Second operand:
%
%
% Type of operands:        Example:
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AND = bin2dec('11 01110 0');
c.AND = AND;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Set Pixel to Zero instruction (SPX0)     TODO: Fix description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand: 
%     Horizontal position (X) in range 0..15.
%
% Second operand:
%     Vertical position (Y) in range 0..23.
%
% Third operand:
%     Pixel to set (switch off = 0 / switch on = 1)
%
% Type of operands:        Example:
%     SPX REG REG IMM      SPX r0 r1 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NOT_USED = bin2dec('11 01101 0');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Set Pixel to One instruction (SPX1)      TODO: Fix description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand: 
%     Horizontal position (X) in range 0..15.
%
% Second operand:
%     Vertical position (Y) in range 0..23.
%
% Third operand:
%     Pixel to set (switch off = 0 / switch on = 1).
%
% Type of operands:        Example:
%     SPX REG REG IMM      SPX r0 r1 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NOT_USED = bin2dec('11 01100 0');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RET instruction                          TODO: Doplnit kde sa uklada vysledok.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TODO: Fix the title.
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand:
%     First value to compare.
%
% Second operand:
%     Second value to compare.
%
% Note: 
%   The result is stored in status register.
%
% Type of operands:        Example:
%     CMP  REG  REG          CMP  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CMP = bin2dec('11 01011 0');
c.CMP = CMP;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RET instruction                          TODO: Add description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand:
%     Not used.
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     N/A                    RET
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RET = bin2dec('11 01010 0');
c.RET = RET;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      POP instruction                          TODO: Add description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand:
%     Destination register to pop from stack. 
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     POP  REG               POP  r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
POP = bin2dec('11 01001 0');
c.POP = POP;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      PUSH instruction                         TODO: Add description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand:
%     Not used.
%
% Second operand:
%     Source register to push on stack.
%
% Type of operands:        Example:
%     PUSH  REG  REG         PUSH  r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PUSH = bin2dec('11 01000 0');
c.PUSH = PUSH;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand:
%     NOT_USED
%
% Second operand:
%     NOT_USED
%
% Type of operands:        Example:
%     NOT_USED               NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NOT_USED = bin2dec('11 00111 0');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Add instruction (ADD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand:
%     In: First value to add.
%     Out: Destination for result.
%
% Second operand:
%     Value to add.
%
% Type of operands:        Example:
%     ADD  REG  REG          ADD  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADD = bin2dec('11 00110 0');
c.ADD = ADD;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand:
%     NOT_USED
%
% Second operand:
%     NOT_USED
%
% Type of operands:        Example:
%     NOT_USED               NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NOT_USED = bin2dec('11 00101 0');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     TXT (print TeXT character) instructions (TRR, TMR) TODO: Update and split to two separate descriptions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% First operand: 
%     Character to print.
%
% Second operand:
%     Position on display.
%
% Type of operands:        Example:
%     TRR  REG  REG          TRR  r0     r1
%     TMR  REG  REG          TMR  a(r0)  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TRR = bin2dec('11 00100 0');
TMR = bin2dec('11 00011 0');
c.TRR = TRR;
c.TMR = TMR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Data transfer instructions (STORE, LOAD, MOV)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R DDDD|SSSS
%
% The STORE instruction moves data from source
% register to memory (pointed by destination register).
% 
% The LOAD instruction moves data from memory
% (pointed by source register) to destination register.
% 
% The MOV instruction moves data between two registers.
% 
% First operand:
%     Destination.
%
% Second operand:
%     Source of data.
%
% Type of operands:        Example:
%     STORE  REG  REG        STORE  a(r1)  r3
%     LOAD   REG  REG        LOAD   r2     a(r1)
%     MOV    REG  REG        MOV    r1     r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
STORE =  bin2dec('11 00010 0');
LOAD  =  bin2dec('11 00001 0');
MOV   =  bin2dec('11 00000 0');
c.STORE = STORE;
c.LOAD  = LOAD;
c.MOV   = MOV;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Instruction Format 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Add Immediate instruction (ADDI)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
% 
% Description:
%     The ADDI instruction adds an immediate value
%     to a register. The result is stored in the
%     same register. Immediate value is signed and 
%     must be from range <-128, +127>.
%
% First operand:
%     In: Value (stored in a register) to be added.
%     Out: Destination of result.
%
% Second operand:
%     Immediate value to be added.
%
% Type of operands:        Example:
%     ADDI  REG  IMM          ADDI  r0  25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADDI = bin2dec('10 11 0000');
c.ADDI = ADDI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Move Upper Byte instruction (MOVU)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
%
% Description:
%     The MOVU instruction moves an immediate value
%     to MSB byte of a register. The value is from 
%     range <0, 255>.
% 
% Note:
%     The LSB byte of a register must be set before
%     instruction MOVU is executed. Otherwise whole
%     MSB byte will be overwritten by most significant
%     bit of LSB byte when the instruction MOVL
%     is executed.
% 
% First operand:
%     Destination register.
%
% Second operand:
%     Immediate value to be moved to register.
%
% Type of operands:        Example:
%     MOVU  REG  IMM         MOVU  r0  255
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MOVU =  bin2dec('10 10 0000');
c.MOVU = MOVU;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Load Immediate instruction (LOADI)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
%
% Description:
%     The LOADI instruction moves value from 
%     memory (pointed by immediate) to register.
%     Immediate value is unsigned. Range is <0, 255>.
%     The final address of memory is composed from MSB byte
%     of Base Register and LSB byte of the immediate.
%     The Base Register must be updated before LOADI
%     instruction is executed.
% 
% First operand:
%     Destination register.
%
% Second operand:
%     Source memory address. 
%
% Type of operands:        Example:
%     LOADI  REG  IMM         LOADI  r2  a(10)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LOADI = bin2dec('10 01 0000');
c.LOADI = LOADI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Move Lower Byte instruction (MOVL)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
%
% Description:
%     The MOVL instruction moves an immediate value
%     into LSB byte of a register. Immediate value
%     is signed and it is in range <-128, +127>.
%     The sign bit is copied to MSB byte of the register.
%     If higher value than 127 needs to be stored
%     to LSB byte of a register (in range <128, 255>)
%     then the MSB byte of the register must be set
%     to zero with instruction MOVU.
% 
% First operand:
%     Destination register.
%
% Second operand:
%     Immediate value to be moved to register.
%
% Type of operands:        Example:
%     MOVL  REG  IMM         MOVL  r0  10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MOVL =  bin2dec('10 00 0000');
c.MOVL = MOVL;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Instruction Format 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Bitwise Shift instruction (SHIFT)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|SSSS IIIIIIII
%
% Description:
%     The SHIFT instruction shifts bits in register.
%     If the immediate is positive then the shift is
%     to left side. If the immediate is negative then
%     the shift is to right side.
% 
% First operand: 
%     In: Data to shift.
%     Out: Result of shift operation.
%
% Second operand:
%     Amount of bits to shift. Signed. Range is <-15, +15>.
%
% Type of operands:        Example:
%     SHIFT  REG  IMM        SHIFT  r0  -3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SHIFT = bin2dec('01 11 0000');
c.SHIFT = SHIFT;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                               TODO: Add description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TODO: Doplnit maximalny rozsah operandu.
% Format 1: FF|OO|SSSS IIIIIIII
%
% First operand:
%
% Second operand:
%
% Type of operands:        Example:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TIR = bin2dec('01 10 0000');
c.TIR = TIR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Store Immediate instruction (STOREI)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|SSSS IIIIIIII
%
% Description:
%     The STOREI instruction moves value from register
%     to memory (pointed by immediate). Immediate value 
%     is unsigned. Range is <0, 255>. The final address
%     of memory is composed from MSB byte of Base Register
%     and LSB byte of the immediate. The Base Register 
%     must be updated before STOREI instruction is executed.
% 
% First operand:
%     Assembly code: Destination memory address.
%     Compiled binary: Source register to be saved into memory.
%
% Second operand: 
%     Assembly code: Source register to be saved into memory.
%     Compiled binary: Destination memory address.
%
% Note:
%     Order of operands in assembly source code and in compiled
%     binary code is vice versa. The reason is to unify all data
%     transfer instructions so they have destination operand
%     on left side.
% 
% Type of operands:                 Example:
%     (assembly) STOREI  IMM  REG      STOREI  a(11)  r3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
STOREI = bin2dec('01 01 0000');
c.STOREI = STOREI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Compare Immediate instruction (CMPI)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|SSSS IIIIIIII
%
% Description:
%     This instruction compares two values for equality.
%     The result is stored in Equality Bit of Status
%     Register.
% 
% First operand:
%     Data to compare. 
%
% Second operand:
%     Data to compare. Immediate value is interpreted
%     as signed. Range is <-128, +127>.
%
% Type of operands:        Example:
%     CMPI  REG  IMM         CMPI  r0  25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CMPI = bin2dec('01 00 0000');
c.CMPI = CMPI;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Instruction Format 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Jump If Not Equal instruction (JNE)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% Description:
%     This instruction performs conditional jump.
%     The jump is performed only if the Equality Bit
%     of Status Register is set to one.
% 
% First operand:
%     Not used.
%
% Second operand:
%     Absolute address to jump. Unsigned.
%     Range is <0, 4095>.
%
% Type of operands:        Example:
%     JNE  IMM               JNE  LABEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JNE = bin2dec('00 11 000 0');
c.JNE = JNE;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Jump If Equal instruction (JPE)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% Description:
%     This instruction performs conditional jump.
%     The jump is performed only if the Equality Bit
%     of Status Register is set to one.
% 
% First operand:
%     Not used.
%
% Second operand:
%     Absolute address to jump. Unsigned.
%     Range is <0, 4095>.
%
% Type of operands:        Example:
%     JPE  IMM               JPE  LABEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JPE = bin2dec('00 10 0000');
c.JPE = JPE;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Function Call instruction (CALL)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% Description:
%     This instruction performs the following actions:
%       - Decrements SP register.
%       - Stores old value of RA register on stack.
%       - Stores actual value of PC register to RA register.
%       - Sets the PC register to new value specified
%         by the instruction immediate (new address).
% 
% First operand:
%     Not used.
%
% Second operand:
%     Absolute address of a subroutine to call.
%     Unsigned. Range is <0, 4095>.
%
% Type of operands:        Example:
%     CALL  IMM              CALL  LABEL  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CALL = bin2dec('00 01 0000');
c.CALL = CALL;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Unconditional Jump instruction (JMP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% Description:
%     This instruction sets the PC register to
%     specified value (address).
% 
% First operand:
%     Not used.
%
% Second operand:
%     Absolute address to jump. Unsigned.
%     Range is <0, 4095>.
%
% Type of operands:        Example:
%     JMP  IMM               JMP  LABEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JMP = bin2dec('00 00 0000');
c.JMP = JMP;

