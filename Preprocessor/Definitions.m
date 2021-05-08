%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General purpose register definitions
%
% Prefix "01" means that the number represents a register.
% Prefix is used only by preprocessor and is erased 
% (set to zero) after preprocessing.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r0  = bin2dec('0000 0000');
r1  = bin2dec('0000 0001');
r2  = bin2dec('0000 0010');
r3  = bin2dec('0000 0011');
r4  = bin2dec('0000 0100');
r5  = bin2dec('0000 0101');
r6  = bin2dec('0000 0110');
r7  = bin2dec('0000 0111');
r8  = bin2dec('0000 1000');
r9  = bin2dec('0000 1001');
r10 = bin2dec('0000 1010');
r11 = bin2dec('0000 1011');
r12 = bin2dec('0000 1100');
r13 = bin2dec('0000 1101');
r14 = bin2dec('0000 1110');
r15 = bin2dec('0000 1111');

v  = r11; 
a0 = r12;
a1 = r13;
a2 = r14;
a3 = r15;


%%%%%%%%%%%%%%%%%%%
% Screen resolution
%%%%%%%%%%%%%%%%%%%
MIN_X = 0;
MIN_Y = 0;
MAX_X = 15;
MAX_Y = 23;


%%%%%%%%%%%%%%%%%%%
% Button definition
%%%%%%%%%%%%%%%%%%%
BTN_0 = 0;
BTN_1 = 1;
BTN_2 = 2;
BTN_3 = 3;
BTN_4 = 4;
BTN_5 = 5;
BTN_6 = 6;
BTN_7 = 7;
BTN_8 = 8;
BTN_9 = 9;


%%%%%%%%%%%%%%%%%%%%%
% Pixel switch on/off 
%%%%%%%%%%%%%%%%%%%%%
ON  = 1;
OFF = 0;


% Destination label (for example "LOOP_") represents absolute memory address.
c.LABEL_DEST_PREFIX = bin2dec('11100000 00000000');
c.LABEL_SRC_PREFIX  = bin2dec('11010000 00000000');
c.LABEL_PREFIX_MASK = bin2dec('11110000 00000000');
c.LABEL_VALUE_MASK =  bin2dec('00001111 11111111');

% Constant definition
c.FORMAT_0_OPERAND_1_MASK = bin2dec('0000 1111');
c.FORMAT_1_OPERAND_1_MASK = bin2dec('0000 1111');
c.FORMAT_2_OPERAND_1_MASK = bin2dec('0000 1111');
c.FORMAT_3_OPERAND_1_MASK = bin2dec('1111 0000');
c.FORMAT_3_OPERAND_2_MASK = bin2dec('0000 1111');

c.FORMAT_0_OPCODE_MASK = bin2dec('0011 0000');
c.FORMAT_1_OPCODE_MASK = bin2dec('0011 0000');
c.FORMAT_2_OPCODE_MASK = bin2dec('0011 0000');
c.FORMAT_3_OPCODE_MASK = bin2dec('0011 1100');

c.INSTR_FORMAT_MASK = bin2dec('1100 0000');

c.INSTR_FORMAT_0 = bin2dec('0000 0000');
c.INSTR_FORMAT_1 = bin2dec('0100 0000');
c.INSTR_FORMAT_2 = bin2dec('1000 0000');
c.INSTR_FORMAT_3 = bin2dec('1100 0000');

c.BYTE_MASK = bin2dec('1111 1111');


% Range of RAM addresses.
c.RAM_START  = 0;
c.RAM_END    = 31;


% Definition of function "m" which has one parameter "n" and returns a return value "n".
% This function is used just to visually emphasise that an immediate value
% is a pointer/memory address.
m = @(n) n;

