%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction formats:
%
% Format 0: FF|OO|CCCC   CCCCCCCC
%
% Format 1: FF|OO|SSSS   CCCCCCCC
%
% Format 2: FF|OO|DDDD   CCCCCCCC
%
% Format 3: FF|OOOO|RR   DDDD|SSSS
%
%   F - Format
%   O - Operation code
%   D - Destination Register
%   S - Source Register
%   C - Immediate value
%   R - Reserved
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Set Pixel to Zero instruction (SPX0)     TODO: Fix description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
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
SPX0 = bin2dec('11 1101 00');
c.SPX0 = SPX0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Set Pixel to One instruction (SPX1)      TODO: Fix description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
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
SPX1 = bin2dec('11 1100 00');
c.SPX1 = SPX1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RET instruction                          TODO: Doplnit kde sa uklada vysledok.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TODO: Fix the title.
% Format 3: FF|OOOO|RR DDDD|SSSS
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
CMP = bin2dec('11 1011 00');
c.CMP = CMP;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RET instruction                          TODO: Add description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
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
RET = bin2dec('11 1010 00');
c.RET = RET;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      POP instruction                          TODO: Add description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
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
POP = bin2dec('11 1001 00');
c.POP = POP;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      PUSH instruction                         TODO: Add description.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
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
PUSH = bin2dec('11 1000 00');
c.PUSH = PUSH;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Get Char instruction (GCH)               TODO: Fix example.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand:
%     Destination for read button code.
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     GCH  REG  REG          GCH  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GCH = bin2dec('11 0111 00');
c.GCH = GCH;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Add instruction (ADD)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
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
ADD = bin2dec('11 0110 00');
c.ADD = ADD;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Get PiXel instruction (GPX)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand: 
%     In: Horizontal position (X) in range 0..15.
%     Out: Read pixel value is stored here. 
%
% Second operand:
%     Vertical position (Y) in range 0..23.
%
% Type of operands:        Example:
%     GPX REG REG          GPX r0 r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX = bin2dec('11 0101 00');
c.GPX = GPX;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     TXT (print TeXT character) instructions (TRR, TMR) TODO: Update and split to two separate descriptions.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
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
TRR = bin2dec('11 0100 00');
TMR = bin2dec('11 0011 00');
c.TRR = TRR;
c.TMR = TMR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Data transfer instructions (STORE, LOAD, MOV)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
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
STORE =  bin2dec('11 0010 00');
LOAD  =  bin2dec('11 0001 00');
MOV   =  bin2dec('11 0000 00');
c.STORE = STORE;
c.LOAD  = LOAD;
c.MOV   = MOV;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Add Immediate instruction (ADDI)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
% 
% Description:
%     The ADDI instruction adds an immediate value
%     to a register. The result is stored in the
%     same register. Immediate value is signed and 
%     must be from range <-128 .. +127>.
%
% First operand:
%     In: Value (stored in a register) to be added.
%     Out: Destination of the sum.
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
%     The MOVU instruction moves an immediate
%     value to upper byte of register. 
%     The value is from range <0 .. 255>.
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
%      Load Immediate instruction (LOADI)       TODO: Ako nahrat hodnotu ktora je inde nez na adrese v rozsahu 8-bitov? Napriklad loadovanie dat z ROM? Mozno by som mohol skusit pouzit specialny bazovy register ktory by sa vzdy pripocital k danej adrese.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
%
% Description:
%     The LOADI instruction moves value from 
%     memory (pointed by immediate) to register.
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
%      Move Lower Byte instruction (MOVL)       TODO: Co sa stane ked tam vlozim uint8? Napr. 128? Zdokumentovat. Skontrolovat ostatne instrukcie.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
%
% Description:
%     The MOVL instruction moves an immediate
%     value into lower byte of a register. 
%     Immediate value is signed and it is from
%     range <-128 .. +127>. The sign bit is copied
%     to upper byte of the register.
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      This opcode is not yet used.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|SSSS IIIIIIII
%
% First operand: 
%     N/A
%
% Second operand:
%     N/A
%
% Type of operands:        Example:
%     N/A  N/A  N/A          N/A  N/A  N/A
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NOT_USED = bin2dec('01 11 0000');
c.NOT_USED = NOT_USED;


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
%      Store Immediate instruction (STOREI)     TODO: Ako ulozit hodnotu na adresu ktora je inde nez v rozsahu 8-bitov? Mozno by som mohol skusit pouzit specialny bazovy register ktory by sa vzdy pripocital k danej adrese.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TODO: Doplnit maximalny rozsah operandu.
% Format 1: FF|OO|SSSS IIIIIIII
%
% Description:
%     The STOREI instruction moves value from 
%     register to memory (pointed by immediate).
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
%      Compare Immediate instruction (CMPI)     TODO: Doplnit kde sa uklada vysledok.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TODO: Doplnit maximalny rozsah operandu.
% Format 1: FF|OO|SSSS IIIIIIII                 TODO: Doplnit ci porovnava iba na rovnost, alebo aj vacsi/mensi.
%
% First operand:
%     Data to compare.
%
% Second operand:
%     Data to compare.
%
% Type of operands:        Example:
%     CMPI  REG  IMM         CMPI  r0  25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CMPI = bin2dec('01 00 0000');
c.CMPI = CMPI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Jump If Not Equal instruction (JNE)      TODO: Doplnit kde sa nachadza podmienka skoku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TODO: Doplnit maximalny rozsah operandu (adresy).
% Format 0: FF|OO|IIII IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address to jump.
%
% Type of operands:        Example:
%     JNE  IMM               JNE  LABEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JNE = bin2dec('00 11 000 0');
c.JNE = JNE;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Jump If Equal instruction (JPE)          TODO: Doplnit kde sa nachadza podmienka skoku.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TODO: Doplnit maximalny rozsah operandu (adresy).
% Format 0: FF|OO|IIII IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address to jump.
%
% Type of operands:        Example:
%     JPE  IMM               JPE  LABEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JPE = bin2dec('00 10 0000');
c.JPE = JPE;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Function Call instruction (CALL)         TODO: Zdokumentovat "call & jump" funkcionalitu.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TODO: Doplnit maximalny rozsah operandu (adresy).
% Format 0: FF|OO|IIII IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address of a subroutine to call.
%
% Type of operands:        Example:
%     CALL  IMM              CALL  LABEL  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CALL = bin2dec('00 01 0000');
c.CALL = CALL;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Unconditional Jump instruction (JMP)     TODO: Doplnit maximalny rozsah operandu (adresy).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address to jump.
%
% Type of operands:        Example:
%     JMP  IMM               JMP  LABEL
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JMP = bin2dec('00 00 0000');
c.JMP = JMP;

