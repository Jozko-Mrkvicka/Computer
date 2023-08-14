%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction formats:
%
% Format 3
% ┏━━━━━┳━━━━━━━━━━━┳━━━┓ ┏━━━┳━━━━━━━┳━━━┳━━━━━━━┓
% ┃ F F ┃ O O O O O ┃ R ┃ ┃ R ┃ D D D ┃ R ┃ S S S ┃
% ┗━━━━━┻━━━━━━━━━━━┻━━━┛ ┗━━━┻━━━━━━━┻━━━┻━━━━━━━┛
%  (NOT, XOR, OR, AND, LDL, LDU, CMP, RET, POP, PUSH, SHIFT, ADD, NOT_USED, STL, STU, NOT_USED, NOT_USED, MOV)
%
% Format 2
% ┏━━━━━┳━━━━━━━┳━━━━━━━┓ ┏━━━━━━━━━━━━━━━━━━━┓
% ┃ F F ┃ O O O ┃ D D D ┃ ┃  I I I I I I I I  ┃
% ┗━━━━━┻━━━━━━━┻━━━━━━━┛ ┗━━━━━━━━━━━━━━━━━━━┛
%  (MOVL, LDLI, MOVU, ADDI, LDUI, NOT_USED, NOT_USED, NOT_USED)
%
% Format 1
% ┏━━━━━┳━━━━━━━┳━━━━━━━┓ ┏━━━━━━━━━━━━━━━━━━━┓
% ┃ F F ┃ O O O ┃ S S S ┃ ┃  I I I I I I I I  ┃
% ┗━━━━━┻━━━━━━━┻━━━━━━━┛ ┗━━━━━━━━━━━━━━━━━━━┛
%  (CMPI, STLI, STUI, SHIFTI, SGMT, NOT_USED, NOT_USED, NOT_USED)
%
% Format 0
% ┏━━━━━┳━━━━━┳━━━━━━━━━┓ ┏━━━━━━━━━━━━━━━━━━━┓
% ┃ F F ┃ O O ┃ I I I I ┃ ┃  I I I I I I I I  ┃
% ┗━━━━━┻━━━━━┻━━━━━━━━━┛ ┗━━━━━━━━━━━━━━━━━━━┛
%  (JLT, JPE, CALL, JMP)
%
%   F - Format
%   O - Operation code
%   D - Destination Register
%   S - Source Register
%   I - Immediate value
%   R - Reserved
%
%
%
% Immediate                 Register                    Register                    Memory
%               MOVU  ->                <-  MOV  ->                  <- LDUI
%               MOVL  ->                <-  NOT  ->                  <- LDLI
%               ADDI  ->                <-  XOR  ->                  <- LDU
%              SHIFTI ->                <-  OR   ->                  <- LDL
%               CMPI  ->                <-  AND  ->                     STUI ->
%                                       <-  CMP  ->                     STLI ->
%                                       <- SHIFT ->                     STU ->
%                                       <-  ADD  ->                     STL ->
% 
%                                                                   <-   POP        Stack
%                                                                       PUSH  ->
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Instruction Format 3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    NOT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     This instruction performs bitwise negation
%     of all bits in register.
% 
% First operand: 
%     In: Value to be negated.
%     Out: Destination of result.
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     NOT  REG               NOT  r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NOT = bin2dec('11 10001 0');
c.NOT = NOT;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     XOR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     This instruction performs exclusive OR
%     operation of all bits in registers.
% 
% First operand: 
%     In: Value to be XORed.
%     Out: Destination of result.
%
% Second operand:
%     Value to be XORed.
%
% Type of operands:        Example:
%     XOR  REG  REG          XOR  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
XOR = bin2dec('11 10000 0');
c.XOR = XOR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                      OR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     This instruction performs bitwise OR operation
%     of all bits in registers.
% 
% First operand: 
%     In: Value to be ORed.
%     Out: Destination of result.
%
% Second operand:
%     Value to be ORed.
%
% Type of operands:        Example:
%     OR  REG  REG           OR  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OR = bin2dec('11 01111 0');
c.OR = OR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     AND
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     This instruction performs bitwise AND operation
%     of all bits in registers.
% 
% First operand: 
%     In: Value to be ANDed.
%     Out: Destination of result.
%
% Second operand:
%     Value to be ANDed.
%
% Type of operands:        Example:
%     AND  REG  REG           AND  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AND = bin2dec('11 01110 0');
c.AND = AND;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Load Lower Byte
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     The LDL instruction loads byte from memory
%     to the lower byte of a register. The other
%     byte of the register remains unchanged.
%
% First operand:
%     Destination register.
%
% Second operand:
%     Address of a byte in memory to load.
%
% Type of operands:        Example:
%     LDL  REG  REG        LDL  r0  m(r1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LDL = bin2dec('11 01101 0');
c.LDL = LDL;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Load Upper Byte
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     The LDU instruction loads byte from memory
%     to the upper byte of a register. The other
%     byte of the register remains unchanged.
%
% First operand:
%     Destination register.
%
% Second operand:
%     Address of a byte in memory to load.
%
% Type of operands:        Example:
%     LDU  REG  REG        LDU  r0  m(r1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LDU = bin2dec('11 01100 0');
c.LDU = LDU;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                  Compare
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     This instruction compares two 16-bit numbers.
%     Numbers can be either signed or unsigned,
%     the CMP instruction does not distinguish between them.
%     The instruction computes result for both possibilities.
%     It is up to programmer to use proper result.
%     Result of the comparison can be "greater than",
%     "less than" or "equal". It is stored in status register.
% 
% First operand:
%     First value to compare.
%
% Second operand:
%     Second value to compare.
%
% Type of operands:        Example:
%     CMP  REG  REG          CMP  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CMP = bin2dec('11 01011 0');
c.CMP = CMP;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Return
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     This instruction exits currently executed function
%     and returns program counter back to caller.
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
%                    POP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     This instruction restores register with its
%     original value taken from stack.
% 
% First operand:
%     Destination register to be poped from stack. 
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
%                     PUSH
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     This instruction saves value stored in register
%     to stack.
% 
% First operand:
%     Not used.
%
% Second operand:
%     Source register to be pushed on stack.
%
% Type of operands:        Example:
%     PUSH  REG              PUSH  r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PUSH = bin2dec('11 01000 0');
c.PUSH = PUSH;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                    SHIFT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     The SHIFT instruction shifts bits in register.
%     If second operand is positive then the shift is
%     to left side. If second operand is negative then
%     the shift is to right side.
% 
% First operand: 
%     In: Data to shift.
%     Out: Result of the shift operation.
%
% Second operand:
%     Amount of bits to shift. Signed. Range is <-15, +15>.
%
% Type of operands:        Example:
%     SHIFT  REG  REG        SHIFT r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SHIFT = bin2dec('11 00111 0');
c.SHIFT = SHIFT;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     ADD
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
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
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
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
%              Store Lower Byte
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     The STL instruction stores lower byte of a register
%     to memory.
%
% First operand:
%     Destination address.
%
% Second operand:
%     Byte to store.
%
% Type of operands:        Example:
%     STL  REG  REG       STL  m(r0)  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
STL = bin2dec('11 00100 0');
c.STL = STL;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Store Upper Byte
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
%
% Description:
%     The STU instruction stores upper byte of a register
%     to memory.
%
% First operand:
%     Destination address.
%
% Second operand:
%     Byte to store.
%
% Type of operands:        Example:
%     STU  REG  REG       STU  m(r0)  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
STU = bin2dec('11 00011 0');
c.STU = STU;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
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
NOT_USED =  bin2dec('11 00010 0');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
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
NOT_USED =  bin2dec('11 00001 0');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                     MOV
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOOO|R R|DDD|R|SSS
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
%     MOV    REG  REG        MOV    r1     r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MOV   =  bin2dec('11 00000 0');
c.MOV = MOV;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Instruction Format 2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
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
NOT_USED = bin2dec('10 111 000');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
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
NOT_USED = bin2dec('10 110 000');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
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
NOT_USED = bin2dec('10 101 000');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Load Upper Byte (Immediate)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% Description:
%     The LDUI instruction moves value from data memory
%     (pointed by immediate) to the upper byte of a register.
%     Immediate value is unsigned, range is <0, 255>, it addresses a memory cell
%     inside of single memory segment (one memory segment has 256 cells).
%     Physical address of the memory cell is automatically computed
%     by adding the segment register to the immediate value (see SGMT instruction).
%
% First operand:
%     Destination register.
%
% Second operand:
%     Source memory address.
%
% Type of operands:        Example:
%     LDUI  REG  IMM         LDUI  r2  m(10)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LDUI = bin2dec('10 100 000');
c.LDUI = LDUI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Add Immediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
% 
% Description:
%     The ADDI instruction adds an immediate value
%     to a register. The result is stored in the
%     same register. Immediate value is signed and 
%     must be in range <-128, +127>.
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
ADDI = bin2dec('10 011 000');
c.ADDI = ADDI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               Move Upper Byte
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% Description:
%     The MOVU instruction moves an immediate value
%     to upper byte of a register. Immediate value
%     is unsigned and it is in range <0, 255>.
% 
% Note:
%     The lower byte of a register must be set before
%     instruction MOVU is executed. Otherwise whole
%     upper byte will be overwritten by most significant
%     bit of lower byte when the instruction MOVL
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
MOVU =  bin2dec('10 010 000');
c.MOVU = MOVU;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Load Lower Byte (Immediate)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% Description:
%     The LDLI instruction moves value from data memory
%     (pointed by immediate) to the lower byte of a register.
%     Immediate value is unsigned, range is <0, 255>, it addresses a memory cell
%     inside of single memory segment (one memory segment has 256 cells).
%     Physical address of the memory cell is automatically computed
%     by adding the segment register to the immediate value (see SGMT instruction).
%
% First operand:
%     Destination register.
%
% Second operand:
%     Source memory address.
%
% Type of operands:        Example:
%     LDLI  REG  IMM         LDLI  r2  m(10)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
LDLI = bin2dec('10 001 000');
c.LDLI = LDLI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Move Lower Byte (Immediate)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% Description:
%     The MOVL instruction moves an immediate value
%     into lower byte of a register. Immediate value
%     is signed and it is in range <-128, +127>.
%     The sign bit is copied to upper byte of the register.
%
% Note:
%     If higher value than 127 needs to be stored
%     to lower byte of a register (in range <128, 255>)
%     then the upper byte of the register must be overwritten
%     with zero using instruction MOVU.
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
MOVL =  bin2dec('10 000 000');
c.MOVL = MOVL;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Instruction Format 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS IIIIIIII
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
NOT_USED = bin2dec('01 111 000');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS IIIIIIII
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
NOT_USED = bin2dec('01 110 000');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   NOT_USED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS IIIIIIII
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
NOT_USED = bin2dec('01 101 000');
c.NOT_USED = NOT_USED;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Segment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS IIIIIIII
%
% Description:
%     The SGMT instruction sets the memory segment register which
%     is used for computation of physical (data memory) address. The segment
%     register is, in fact, used as upper byte (MSB) of a 16-bit address.
%     This gives us posibility to utilize (theoretically) whole 16-bit range
%     of data memory. The physical address is then used by instructions
%     STLI, STUI, LDLI and LDUI. The segment value is interpreted as
%     unsigned in range <0, 255>.
% 
% First operand: 
%     Not used.
%
% Second operand:
%     Data memory segment address.
%
% Type of operands:        Example:
%     SGMT  IMM              SGMT  msb(c.RAM_START + 0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SGMT = bin2dec('01 100 000');
c.SGMT = SGMT;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Bitwise Shift Immediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS IIIIIIII
%
% Description:
%     The SHIFTI instruction shifts bits in register.
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
%     SHIFTI  REG  IMM       SHIFTI  r0  -3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SHIFTI = bin2dec('01 011 000');
c.SHIFTI = SHIFTI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Store Upper Byte (Immediate)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS IIIIIIII
%
% Description:
%     The STUI instruction moves the upper byte of a register
%     to data memory (pointed by immediate). Immediate value 
%     is unsigned, range is <0, 255>, it addresses a memory cell
%     inside of single memory segment (one memory segment has 256 cells).
%     Physical address of the memory cell is automatically computed
%     by adding the segment register to the immediate value (see SGMT instruction).
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
%     (assembly) STUI  IMM  REG      STUI  m(11)  r3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
STUI = bin2dec('01 010 000');
c.STUI = STUI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%         Store Lower Byte (Immediate)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS IIIIIIII
%
% Description:
%     The STLI instruction moves the lower byte of a register
%     to data memory (pointed by immediate). Immediate value 
%     is unsigned, range is <0, 255>, it addresses a memory cell
%     inside of single memory segment (one memory segment has 256 cells).
%     Physical address of the memory cell is automatically computed
%     by adding the segment register to the immediate value (see SGMT instruction).
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
%     (assembly) STLI  IMM  REG      STLI  m(11)  r3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
STLI = bin2dec('01 001 000');
c.STLI = STLI;


% TODO: Description seems to be contradicting.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Compare Immediate
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OOO|SSS IIIIIIII
%
% Description:
%     This instruction compares two 16-bit numbers.
%     Numbers can be either signed or unsigned,
%     the CMP instruction does not distinguish between them.
%     The instruction computes result for both possibilities.
%     It is up to programmer to use proper result.
%     Result of the comparison can be "greater than",
%     "less than" or "equal". It is stored in status register.
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
CMPI = bin2dec('01 000 000');
c.CMPI = CMPI;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                   Instruction Format 0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Jump If Less Then
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% Description:
%     This instruction performs conditional jump.
%     The jump is performed only if the LessThen bit
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
%     JLT  IMM               JLT  LABEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JLT = bin2dec('00 11 0000');
c.JLT = JLT;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Jump If Equal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% Description:
%     This instruction performs conditional jump.
%     The jump is performed only if the Equality bit
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
%                    CALL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% Description:
%     This instruction calls a subroutine by performing
%     the following actions:
%       - Stores actual value of PC register on stack.
%       - Sets the PC register to new value specified
%         by the immediate (new address).
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
%                    Jump
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% Description:
%     This instruction performs unconditional jump
%     by setting the PC register to specified value (address).
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

