%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 0: FF|OOO|RRR RRRRR|DDD
%   FF              - Format
%   RRRRRR RRRRRRRR - Reserved
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 1: FF|OO|DDD|S SS|IIIIII
%   FF       - Format
%   OO       - Operation code
%   DD       - Register 1 (Destination)
%   SS       - Register 2 (Source)
%   IIIIIIII - Immediate value
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 2: FF|OOO|DDD IIIIIIII
%   FF       - Format
%   OOO      - Operation code
%   DDD      - Register 1 (Destination)
%   IIIIIIII - Immediate value
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 3: FF|OOOO|RR RR|DDD|SSS
%   FF       - Format
%   OOOO     - Operation code
%   RRRR     - Reserved
%   DDD      - Register 1 (Destination)
%   SSS      - Register 2 (Source)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      GCH (Get CHar) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
%
% First operand:
%     Destination for read button code.
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     GCH  REG  REG          GCH  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GCH = bin2dec('11 0111 00');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      ADD (ADD registers) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADD = bin2dec('11011000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      GPX (Get PiXel) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
%
% First operand: 
%     In: Horizontal position (X) in range 0..15.
%     Out: Read pixel value is stored here. 
%
% Second operand:
%     Vertical position (Y) in range 0..23
%
% Type of operands:        Example:
%     DIS REG REG          DIS r0 r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX = bin2dec('11010100');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     TXT (print TeXT character) instructions (TRR, TMR)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
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
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TRR = bin2dec('11010000');
TMR = bin2dec('11001100');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      MOV instructions (MMR, MRM, MRR)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
%
% First operand:
%     Destination.
%
% Second operand:
%     Source of data.
%
% Type of operands:        Example:
%     MMR   REG  REG         MMR   a(r1)  r3
%     MRM   REG  REG         MRM   r2     a(r1)
%     MRR   REG  REG         MRR   r1     r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MMR =  bin2dec('11001000');
MRM =  bin2dec('11000100');
MRR =  bin2dec('11000000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      JMP instruction (unconditional JuMP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% First operand:
%     Address to jump.
%
% Second operand:
%     None.
%
% Type of operands:        Example:
%     JMP  REG  IMM          JMP  a(11)  r3   (not finished)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JMP = bin2dec('10110000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      SUBI (SUBtract Immediate) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% First operand:
%     In: 
%     Out: Destination for result.
%
% Second operand:
%     
%
% Type of operands:        Example:
%     SUI  REG  IMM          SUI  r0  25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SUBI = bin2dec('10101000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      ADDI (ADD Immediate) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% First operand:
%     In: First value to add.
%     Out: Destination for result.
%
% Second operand:
%     Value to add.
%
% Type of operands:        Example:
%     ADDI  REG  IMM          ADDI  r0  25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADDI = bin2dec('10100000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      TIR (Print immediate text character) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% First operand: 
%     Character to print.
%
% Second operand:
%     Position on display.
%
% Type of operands:        Example:
%     TIR  IMM  REG          TIR  J      r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TIR = bin2dec('10011000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      MOV instructions (MMRI, MRMI, MRC)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% First operand:
%     Destination.
%
% Second operand:
%     Source of data.
%
% Type of operands:        Example:
%     MMRI  IMM  REG         MMRI  a(11)  r3
%     MRMI  REG  IMM         MRMI  r2     a(10)
%     MRC   REG  IMM         MRC   r0     10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MMRI = bin2dec('10010000');
MRMI = bin2dec('10001000');
MRC =  bin2dec('10000000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      SPX (Set PiXel) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|DDD|S SS|IIIIII
%
% First operand: 
%     Horizontal position (X) in range 0..15
%
% Second operand:
%     Vertical position (Y) in range 0..23
%
% Third operand:
%     Pixel to set (switch off = 0 / switch on = 1)
%
% Type of operands:        Example:
%     SPX REG REG IMM      SPX r0 r1 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPX = bin2dec('01100000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      JMP instructions (JPE, JNE)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|DDD|S SS|IIIIII
%
% First operand:
%     Value to compare.
%
% Second operand:
%     Value to compare.
%
% Third operand:
%     Address to jump.
%
% Type of operands:        Example:
%     JNE  REG  REG  IMM     JPE  r0  r1  16
%     JPE  REG  REG  IMM     JPE  r0  r1  16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JNE = bin2dec('01010000');
JPE = bin2dec('01000000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code = 10
% Type of operands:
%     SUBcr  CONST  REG    (000)
%     SUBrr  REG    REG    (001)
%     SUBmr  MEM    REG    (010)  (Not implemented)
%     SUBcm  CONST  MEM    (011)  (Not implemented)
%     SUBrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SUBcr = bin2dec('1010 0000');
% SUBrr = bin2dec('1010 0001');
% SUB = bin2dec('1010 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      LOAD instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First operand:
%     Index pointing to a data
%     stored in external memory.
%
% Second operand:
%     Destination RAM address.
%
% Type of operands:
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOAD = bin2dec('0011 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      STORE instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First operand:
%     Source of data.
%
% Second operand:
%     Destination.
%
% Type of operands:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% STORE = bin2dec('0011 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      PUSH instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      POP instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      LSH instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RSH instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General purpose register definitions
%
% Prefix "01" means that the number represents a register.
% Prefix is used only by preprocessor and is erased 
% (set to zero) after preprocessing.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r0 = bin2dec('0000 0000');
r1 = bin2dec('0000 0001');
r2 = bin2dec('0000 0010');
r3 = bin2dec('0000 0011');
r4 = bin2dec('0000 0100');
r5 = bin2dec('0000 0101');
r6 = bin2dec('0000 0110');
r7 = bin2dec('0000 0111');


%%%%%%%%%%%%%%%%%%%
% Screen Resolution
%%%%%%%%%%%%%%%%%%%
MIN_X = 0;
MIN_Y = 0;
MAX_X = 15;
MAX_Y = 23;


%%%%%%%%%%%%%%%%%%%%%
% Pixel switch on/off 
%%%%%%%%%%%%%%%%%%%%%
ON  = 1;
OFF = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 14
% Type of operands:
%     ORcr  CONST  REG    (000)
%     ORrr  REG    REG    (001)
%     ORmr  MEM    REG    (010)  (Not implemented)
%     ORcm  CONST  MEM    (011)  (Not implemented)
%     ORrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ORcr = bin2dec('1110 0000');
% ORrr = bin2dec('1110 0001');
% OR = bin2dec('1110 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 13
% Type of operands:
%     XORcr  CONST  REG    (000)
%     XORrr  REG    REG    (001)
%     XORmr  MEM    REG    (010)  (Not implemented)
%     XORcm  CONST  MEM    (011)  (Not implemented)
%     XORrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% XORcr = bin2dec('1101 0000');
% XORrr = bin2dec('1101 0001');
% XOR = bin2dec('1101 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 12
% Type of operands:
%     NOTcr  CONST  REG    (000)
%     NOTrr  REG    REG    (001)
%     NOTmr  MEM    REG    (010)  (Not implemented)
%     NOTcm  CONST  MEM    (011)  (Not implemented)
%     NOTrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NOT = bin2dec('1100 0000');


