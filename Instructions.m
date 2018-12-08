%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction format: XXXX YYZZ where
%   XXXX - operation code
%   YY - number of operands
%   ZZ - operands type
%       0 - direct operand (constant)
%       1 - address
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 15
% number of operands = 2
% operands type = 00 (direct, direct)
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 11
% number of operands = 2
% operands type = 00 (direct, direct)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADD = bin2dec('1011 1000');


