%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 1: OOOODDSS IIIIIIII
%   OOOO     - Operation code
%   DD       - Register 1 (Destination)
%   SS       - Register 2 (Source)
%   IIIIIIII - Immediate value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 2.1: FF|OO|DD|SS IIIIIIII
%   FF       - Format
%   OO       - Operation code
%   DD       - Register 1 (Destination)
%   SS       - Register 2 (Source)
%   IIIIIIII - Immediate value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 2.2: FF|OOO|DDD IIIIIIII
%   FF       - Format
%   OOO      - Operation code
%   DDD      - Register 1 (Destination)
%   IIIIIIII - Immediate value
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 2.3: FF|OOOO|RR RR|DDD|SSS
%   FF       - Format
%   OOOO     - Operation code
%   RRRR     - Reserved
%   DDD      - Register 1 (Destination)
%   SSS      - Register 2 (Source)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 2.4: FF|RRRRRR RRRRRRRR
%   FF              - Format
%   RRRRRR RRRRRRRR - Reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      MOV instructions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First operand:
%     Destination.
%
% Second operand:
%     Source of data.
%
% Type of operands:        Example:
%     MRC   REG  IMM         MRC   r0     10
%     MRR   REG  REG         MRR   r1     r0
%     MRM   REG  REG         MRM   r2     a(r1)
%     MRMI  REG  MEM         MRMI  r2     10
%     MMR   REG  REG         MMR   a(r1)  r3
%     MMRI  MEM  REG         MMRI  11     r3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MRC =  bin2dec('0000 0000');
MRR =  bin2dec('0001 0000');
MRM =  bin2dec('0010 0000');
MRMI = bin2dec('0011 0000');
MMR =  bin2dec('0100 0000');
MMRI = bin2dec('0101 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      JMP instructions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%     JPE  REG  REG  IMM     JPE  r0  r1  16
%     JNE  REG  REG  IMM     JPE  r0  r1  16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JPE = bin2dec('0110 0000');
JNE = bin2dec('0111 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      TXT instructions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First operand: 
%     Character to print.
%
% Second operand:
%     Position to display.
%
% Type of operands:        Example:
%     TMR  REG  REG          TMR  a(r0)  r1
%     TRR  REG  REG          TRR  r0     r1
%     TIR  IMM  REG          TIR  J      r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TMR = bin2dec('1000 0000');
TRR = bin2dec('1001 0000');
TIR = bin2dec('1010 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      ADD instructions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First operand:
%     Value to add and also destination for the result.
%
% Second operand:
%     Value to add.
%
% Type of operands:        Example:
%     ADI  REG  IMM          ADI  r0  25
%     ADD  REG  REG          ADD  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADI = bin2dec('1110 0000');
ADD = bin2dec('1111 0000');


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
% Operation code: 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GPR


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
r0 = bin2dec('01 0000 0000');
r1 = bin2dec('01 0000 0001');
r2 = bin2dec('01 0000 0010');
r3 = bin2dec('01 0000 0011');












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


