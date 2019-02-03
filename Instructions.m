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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code = 15
% Number of operands = 2
% Operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%AND = bin2dec('1111 1000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 14
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%OR = bin2dec('1110 1000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 13
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%XOR = bin2dec('1101 1000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 12
% number of operands = 1
% operands type = 0 (direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NOT = bin2dec('1100 0100');


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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 10
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%SUB = bin2dec('1010 1000');


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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General purpose register definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
REG_A = bin2dec('0000 0000');
REG_B = bin2dec('0000 0001');
REG_C = bin2dec('0000 0010');
REG_D = bin2dec('0000 0011');














