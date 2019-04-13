%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   ZZZ - Operands type:
%     INSTRcr  CONST  REG    (000)
%     INSTRrr  REG    REG    (001)
%     INSTRmr  MEM    REG    (010)
%     INSTRcm  CONST  MEM    (011)
%     INSTRrm  REG    MEM    (100)
%     INSTRcc  CONST  CONST  (101)
%     INSTRrc  REG    CONST  (110)
%     INSTRmc  MEM    CONST  (111)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 1: XXXXTTSS where:
%   XXXX - Operation code
%   TT   - Register 1
%   SS   - Register 2
%
% Examples:
%   MOV r0 r1 (copy data from one register to another)
%   TXT r0 r1 (output data to monitor)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 2: XXXXR1R2 BBBBBBBB
%   XXXX     - Operation code
%   R1       - Register 1
%   R2       - Register 2
%   BBBBBBBB - Data
% 
% Examples:
%   JEQ r0 r1 ADDRESS (jump to the address if content of both registers is equal)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format 3: XXXXRRSS BBBBBBBB
%   XXXX     - Operation code
%   RR       - Reserved
%   SS       - Register
%   BBBBBBBB - Data
%
% Examples:
%   MOV r0   CONST (copy immediate value to register)
%   MOV r0   ADDR  (copy value from memory to register)
%   MOV ADDR r0    (copy value from register to memory)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      MOV instructions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First operand:
%     Destination.
%
% Second operand:
%     Source of data.
%
% Type of operands:      Example:
%     MRC   REG  IMM       MRC   r0     10
%     MRR   REG  REG       MRR   r1     r0
%     MRM   REG  REG       MRM   r2     a(r1)
%     MRMI  REG  MEM       MRMI  r2     a(10)
%     MMR   REG  REG       MMR   a(r1)  r3
%     MMRI  MEM  REG       MMRI  a(11)  r3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MRC =  bin2dec('0000 0000');
MRR =  bin2dec('0001 0000');
MRM =  bin2dec('0010 0000');
MRMI = bin2dec('0011 0000');
MMR =  bin2dec('0100 0000');
MMRI = bin2dec('0101 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      JMP instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First operand:
%     Destination.
%
% Second operand:
%     Source of data.
%
% Type of operands:
%     JMP  CON
%     JMP  REG
%     JMP  MEM
%     JIZ  REG  CON
%     JIZ  REG  REG
%     JIZ  REG  MEM
%     JEQ  REG  REG  CON
%     JEQ  REG  REG  MEM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JMP = bin2dec('0100 0000');
JEQ = bin2dec('0101 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 7
%
% First operand:
%     Index pointing to a data
%     stored in external memory.
%
% Second operand:
%     Destination RAM address.
%
% Type of operands:
%     LOADcr  CONST  REG    (000) (Not implemented)
%     LOADrr  REG    REG    (001) (Not implemented)
%     LOADmr  MEM    REG    (010) (Not implemented)
%     LOADcm  CONST  MEM    (011) (Not implemented)
%     LOADrm  REG    MEM    (100) (Not implemented)
%     LOADcc  CONST  CONST  (101) (Not implemented)
%     LOADrc  REG    CONST  (110) (Not implemented)
%     LOADmc  MEM    CONST  (111) (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LOADcr = bin2dec('0011 0000');
% LOADrr = bin2dec('0011 0001');
% LOADmr = bin2dec('0011 0010');
% LOADcm = bin2dec('0011 0011');
% LOADrm = bin2dec('0011 0100');
% LOAD = bin2dec('0011 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 6
%
% First operand:
%     Source of data.
%
% Second operand:
%     Destination.
%
% Type of operands:
%     STOREcr  CONST  REG  (000)
%     STORErr  REG    REG  (001)
%     STOREmr  MEM    REG  (010)
%     STOREcm  CONST  MEM  (011)
%     STORErm  REG    MEM  (100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MOVcr = bin2dec('0011 0000');
% MOVrr = bin2dec('0011 0001');
% MOVmr = bin2dec('0011 0010');
% MOVcm = bin2dec('0011 0011');
% MOVrm = bin2dec('0011 0100');
% MOV = bin2dec('0011 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 5
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GPR


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 4
%
% First operand: 
%     Character to print.
%
% Second operand:
%     Position on display.
%
% Type of operands:
%     TPRcr  CONST  REG    (000)
%     TPRrr  REG    REG    (001)
%     TPRmr  MEM    REG    (010)
%     TPRcm  CONST  MEM    (011)
%     TPRrm  REG    MEM    (100)
%     TPRcc  CONST  CONST  (101)
%     TPRrc  REG    CONST  (110)
%     TPRmc  MEM    CONST  (111)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TPRcr = bin2dec('0100 0000');
% TPRrr = bin2dec('0100 0001');
% TPRmr = bin2dec('0100 0010');
% TPRcm = bin2dec('0100 0011');
% TPRrm = bin2dec('0100 0100');
% TPRcc = bin2dec('0100 0101');
% TPRrc = bin2dec('0100 0110');
% TPRmc = bin2dec('0100 0111');
% TPR = bin2dec('0100 0000');


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
% Operation code = 15
% Type of operands:
%     ANDcr  CONST  REG    (000)
%     ANDrr  REG    REG    (001)
%     ANDmr  MEM    REG    (010)  (Not implemented)
%     ANDcm  CONST  MEM    (011)  (Not implemented)
%     ANDrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANDcr = bin2dec('1111 0000');
% ANDrr = bin2dec('1111 0001');
% AND = bin2dec('1111 0000');


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
% Operation code = 11
% Type of operands:
%     ADDcr  CONST  REG    (000)
%     ADDrr  REG    REG    (001)
%     ADDmr  MEM    REG    (010)  (Not implemented)
%     ADDcm  CONST  MEM    (011)  (Not implemented)
%     ADDrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADDcr = bin2dec('1011 0000');
% ADDrr = bin2dec('1011 0001');
%ADDmr = bin2dec('1011 0010');
%ADDcm = bin2dec('1011 0011');
%ADDrm = bin2dec('1011 0100');
% ADD = bin2dec('1011 0000');


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


