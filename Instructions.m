%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction formats:
%
% 0.) FF|OO|IIII   IIIIIIII
%
% 1.) FF|OO|DDD|S  SS|IIIIII
%
% 2.) FF|OOO|DDD   IIIIIIII
%
% 3.) FF|OOOO|RR   RR|DDD|SSS
%
%   F - Format
%   O - Operation code
%   D - Register 1 (Destination)
%   S - Register 2 (Source)
%   I - Immediate value
%   R - Reserved
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RET instruction (not finished)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
%
% First operand:
%     
%
% Second operand:
%     
%
% Type of operands:        Example:
%     
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RET = bin2dec('11 1010 00');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      POP instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
%
% First operand:
%     Destination register to pop from stack. 
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     POP  REG  REG          POP  r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
POP = bin2dec('11 1001 00');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      PUSH instruction (not finished)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR RR|DDD|SSS
%
% First operand:
%     Not used.
%
% Second operand:
%     Source register to push on stack.
%
% Type of operands:        Example:
%     PUSH  REG  REG         PUSH  r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PUSH = bin2dec('11 1000 00');


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
ADD = bin2dec('11 0110 00');


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
GPX = bin2dec('11 0101 00');


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
TRR = bin2dec('11 0100 00');
TMR = bin2dec('11 0011 00');


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
MMR =  bin2dec('11 0010 00');
MRM =  bin2dec('11 0001 00');
MRR =  bin2dec('11 0000 00');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      CALL instruction (not finished)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address of a subroutine to call.
%
% Type of operands:        Example:
%     CALL  REG  IMM         CALL  r0  LABEL  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CALL = bin2dec('10 111 000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      JMP instruction (unconditional JuMP)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address to jump.
%
% Type of operands:        Example:
%     JMP  REG  IMM          JMP  r0  LABEL   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JMP = bin2dec('10 110 000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Not Used
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OOO|DDD IIIIIIII
%
% First operand:
%     N/A
%
% Second operand:
%     N/A
%
% Type of operands:        Example:
%     N/A  REG  IMM          N/A  r0  25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Not_Used = bin2dec('10 101 000');


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
ADDI = bin2dec('10 100 000');


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
TIR = bin2dec('10 011 000');


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
MMRI = bin2dec('10 010 000');
MRMI = bin2dec('10 001 000');
MRC =  bin2dec('10 000 000');


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
SPX = bin2dec('01 10 000 0');


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
JNE = bin2dec('01 01 000 0');
JPE = bin2dec('01 00 000 0');


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


