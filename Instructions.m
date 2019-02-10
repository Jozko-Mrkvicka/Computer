%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format: XXXX YZZZ where:
%
%   XXXX - Operation code:
%       ALU Operations: 11
%       MEM Operations (which read
%           or write to/from memory):
%           3
%       JMP Operations: N/A
%
%   Y - Reserved
%
%   ZZZ - Operands type:
%     INSTRcr  CONST  REG    (000)
%     INSTRrr  REG    REG    (001)
%     INSTRmr  MEM    REG    (010)
%     INSTRcm  CONST  MEM    (011)
%     INSTRrm  REG    MEM    (100)
%     INSTRcc  CONST  CONST  (101)
%     INSTRrc  REG    CONST  (110)
%     INSTRmc  MEM    CONST  (111)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code = 15
% Type of operands:
%     ANDcr  CONST  REG    (000)
%     ANDrr  REG    REG    (001)
%     ANDmr  MEM    REG    (010)  (Not implemented)
%     ANDcm  CONST  MEM    (011)  (Not implemented)
%     ANDrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ANDcr = bin2dec('1111 0000');
ANDrr = bin2dec('1111 0001');
AND = bin2dec('1111 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 14
% Type of operands:
%     ORcr  CONST  REG    (000)
%     ORrr  REG    REG    (001)
%     ORmr  MEM    REG    (010)  (Not implemented)
%     ORcm  CONST  MEM    (011)  (Not implemented)
%     ORrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ORcr = bin2dec('1110 0000');
ORrr = bin2dec('1110 0001');
OR = bin2dec('1110 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 13
% Type of operands:
%     XORcr  CONST  REG    (000)
%     XORrr  REG    REG    (001)
%     XORmr  MEM    REG    (010)  (Not implemented)
%     XORcm  CONST  MEM    (011)  (Not implemented)
%     XORrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
XORcr = bin2dec('1101 0000');
XORrr = bin2dec('1101 0001');
XOR = bin2dec('1101 0000');


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
% Operation code: 11
% Type of operands:
%     ADDcr  CONST  REG    (000)
%     ADDrr  REG    REG    (001)
%     ADDmr  MEM    REG    (010)  (Not implemented)
%     ADDcm  CONST  MEM    (011)  (Not implemented)
%     ADDrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADDcr = bin2dec('1011 0000');
ADDrr = bin2dec('1011 0001');
%ADDmr = bin2dec('1011 0010');
%ADDcm = bin2dec('1011 0011');
%ADDrm = bin2dec('1011 0100');
ADD = bin2dec('1011 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code = 10
% Type of operands:
%     SUBcr  CONST  REG    (000)
%     SUBrr  REG    REG    (001)
%     SUBmr  MEM    REG    (010)  (Not implemented)
%     SUBcm  CONST  MEM    (011)  (Not implemented)
%     SUBrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SUBcr = bin2dec('1010 0000');
SUBrr = bin2dec('1010 0001');
SUB = bin2dec('1010 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 3
% Type of operands:
%     MOVcr  CONST  REG  (000)
%     MOVrr  REG    REG  (001)
%     MOVmr  MEM    REG  (010)
%     MOVcm  CONST  MEM  (011)
%     MOVrm  REG    MEM  (100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MOVcr = bin2dec('0011 0000');
MOVrr = bin2dec('0011 0001');
MOVmr = bin2dec('0011 0010');
MOVcm = bin2dec('0011 0011');
MOVrm = bin2dec('0011 0100');
MOV = bin2dec('0011 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 1
% Type of operands:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%JMP = bin2dec('0001 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 0
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%JEQ = bin2dec('0000 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General purpose register definitions
%
% Prefix "01" means that the number represents a register.
% Prefix is used only by preprocessor and is erased 
% (set to zero) after preprocessing.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REG_A = bin2dec('0000 0000');
REG_B = bin2dec('0000 0001');
REG_C = bin2dec('0000 0010');
REG_D = bin2dec('0000 0011');
REG_A = bitor(REG_A, bin2dec('01 0000 0000'));
REG_B = bitor(REG_B, bin2dec('01 0000 0000'));
REG_C = bitor(REG_C, bin2dec('01 0000 0000'));
REG_D = bitor(REG_D, bin2dec('01 0000 0000'));












