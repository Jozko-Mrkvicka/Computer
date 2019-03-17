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
% Operation code = 11
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
LOADcr = bin2dec('0011 0000');
% LOADrr = bin2dec('0011 0001');
% LOADmr = bin2dec('0011 0010');
% LOADcm = bin2dec('0011 0011');
% LOADrm = bin2dec('0011 0100');
LOAD = bin2dec('0011 0000');


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
TPRcr = bin2dec('0100 0000');
TPRrr = bin2dec('0100 0001');
TPRmr = bin2dec('0100 0010');
TPRcm = bin2dec('0100 0011');
TPRrm = bin2dec('0100 0100');
TPRcc = bin2dec('0100 0101');
TPRrc = bin2dec('0100 0110');
TPRmc = bin2dec('0100 0111');
TPR = bin2dec('0100 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 3
%
% First operand:
%     Source of data.
%
% Second operand:
%     Destination.
%
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












