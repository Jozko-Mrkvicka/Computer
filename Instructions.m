%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format: XXXX YZZZ where:
%
%   XXXX - Operation code:
%       ALU Operations: 15d..05d
%       MEM Operations: 04d..02d
%       JMP Operations: 01d..00d
%
%   Y - Number of operands: 1..2
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aritmetic-Logic instructions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code = 15
% Number of operands = 2
% Operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AND = bin2dec('1111 1000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 14
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OR = bin2dec('1110 1000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 13
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
XOR = bin2dec('1101 1000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 12
% number of operands = 1
% operands type = 0 (direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
NOT = bin2dec('1100 0100');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 11
% Type of operands:
%     ADDcr  CONST  REG    (000)
%     ADDrr  REG    REG    (001)
%     ADDmr  MEM    REG    (010)  (Not implemented)
%     ADDcm  CONST  MEM    (011)  (Not implemented)
%     ADDrm  REG    MEM    (100)  (Not implemented)
%     ADDcc  CONST  CONST  (101)
%     ADDrc  REG    CONST  (110)
%     ADDmc  MEM    CONST  (111)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADDcr = bin2dec('1011 0000');
ADDrr = bin2dec('1011 0001');
%ADDmr = bin2dec('1011 0010');
%ADDcm = bin2dec('1011 0011');
%ADDrm = bin2dec('1011 0100');
ADDcc = bin2dec('1011 0101');
ADDrc = bin2dec('1011 0110');
%ADDmc = bin2dec('1011 0111');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 10
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SUB = bin2dec('1010 1000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Operation code: 3
% Type of operands:
%     MOVcr  CONST  REG  (000)
%     MOVrr  REG    REG  (001)
%     MOVmr  MEM    REG  (010)
%     MOVcm  CONST  MEM  (011)
%     MOVrm  REG    MEM  (100)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MOVmr = bin2dec('0011 0000');
MOVcr = bin2dec('0011 0001');
MOVrr = bin2dec('0011 0010');
MOVcm = bin2dec('0011 0011');
MOVrm = bin2dec('0011 0100');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 1
% number of operands = 1
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JMP = bin2dec('0001 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 0
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%JEQ = bin2dec('0000 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Range of ALU type instructions: 15..05
% Range of MEM type instructions: 04..02
% Range of JMP type instructions: 01..00
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ALU_LOW_LIMIT = bin2dec('0101 0000');
%MEM_LOW_LIMIT = bin2dec('0010 0000');


%%%%%%%%%%%%%%%%%%%%%%
% Register definitions
%%%%%%%%%%%%%%%%%%%%%%
%REG_A = bin2dec('0000 0000');
%REG_B = bin2dec('0000 0001');















