%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generate and load hexadecimal constants
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if (2 ~= exist('Hex_Consts.m', 'file'))
	fileID = fopen('Hex_Consts.m','w');
	for (i = 0 : 255)
		fprintf(fileID, 'h%02X = %03d;    ', i, i);
		fprintf(fileID, 'assignin(''base'', ''h%02X'', h%02X);\n', i, i);
	end

	% for (i = 0 : 65535)
	% 	% fprintf(fileID, 'h%04X = %05d;    ', i, i);
	% 	fprintf(fileID, 'assignin(''base'', ''h%04X'', h%04X);\n', i, i);
	% end
	fclose(fileID);
end

if (0 == evalin('base', '1 == exist(''hFFFF'',''var'')'))
	fprintf('Loading... ')
	Hex_Consts
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General purpose register definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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


%%%%%%%%%%%%%%%%%%%%%%%%%
%  Create uint16 bus type
%%%%%%%%%%%%%%%%%%%%%%%%%
cellInfo =                                                                                                                            ...
{                                                                                                                                     ... 
  {                                                                                                                                   ... 
	'BUS_UINT16_T',                                                                                                                   ... 
	'',                                                                                                                               ... 
	'',                                                                                                                               ... 
	'Auto',                                                                                                                           ... 
	'-1',                                                                                                                             ...
	{                                                                                                                                 ...
%         ElementName, Dimensions, DataType,  SampleTime, Complexity, SamplingMode, DimensionsMode, Min, Max, DocUnits, Description   ... 
		{'signal1',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal2',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal3',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal4',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal5',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal6',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal7',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal8',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal9',    1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal10',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal11',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal12',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal13',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal14',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal15',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
		{'signal16',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};          ...
	}                                                                                                                                 ...
  }                                                                                                                                   ...
}; 
Simulink.Bus.cellToObject(cellInfo);

% Instruction ROM LookUpTable breakpoints.
c.RomCodeBreakpoints = 0 : 511;

% Available datatypes for constant data.
c.U16 = bin2dec('10000000 00000000');
c.S16 = bin2dec('10010000 00000000');
c.U8 =  bin2dec('10100000 00000000');
c.S8 =  bin2dec('10110000 00000000');
c.CHR = bin2dec('11000000 00000000');
U16 = c.U16;
S16 = c.S16;
U8 =  c.U8;
S8 =  c.S8;
CHR = c.CHR;

% Destination label (for example "LOOP_") represents absolute memory address.
c.LABEL_DEST_PREFIX = bin2dec('11100000 00000000');
c.LABEL_SRC_PREFIX  = bin2dec('11010000 00000000');
c.LABEL_PREFIX_MASK = bin2dec('11110000 00000000');
c.LABEL_VALUE_MASK  = bin2dec('00001111 11111111');

% Constant definition
c.FORMAT_0_OPERAND_1_MASK = bin2dec('0000 1111');
c.FORMAT_1_OPERAND_1_MASK = bin2dec('0000 1111');
c.FORMAT_2_OPERAND_1_MASK = bin2dec('0000 1111');
c.FORMAT_3_OPERAND_1_MASK = bin2dec('1111 0000');
c.FORMAT_3_OPERAND_2_MASK = bin2dec('0000 1111');

c.FORMAT_0_OPCODE_MASK = bin2dec('0011 0000');
c.FORMAT_1_OPCODE_MASK = bin2dec('0011 0000');
c.FORMAT_2_OPCODE_MASK = bin2dec('0011 0000');
c.FORMAT_3_OPCODE_MASK = bin2dec('0011 1110');

c.INSTR_FORMAT_MASK = bin2dec('1100 0000');

c.INSTR_FORMAT_0 = bin2dec('0000 0000');
c.INSTR_FORMAT_1 = bin2dec('0100 0000');
c.INSTR_FORMAT_2 = bin2dec('1000 0000');
c.INSTR_FORMAT_3 = bin2dec('1100 0000');

c.BYTE_MASK = bin2dec('1111 1111');


%%%%%%%%%%%%%%%%%%%%%%%%% 
% Instruction address bus
%%%%%%%%%%%%%%%%%%%%%%%%%
% Start address of MPROM memory on instruction address bus and it`s size in words.
c.MPROM_START      = 0;
c.MPROM_SIZE       = 256;

% Start address of ROM memory on instruction address bus and it`s size in words.
c.ROM_START        = 256;
c.ROM_SIZE         = 256;


%%%%%%%%%%%%%%%%%%
% Data address bus
%%%%%%%%%%%%%%%%%%
% Start address of constant data ROM memory on data address bus and it`s size in words.
c.CONST_DATA_START = 0;
c.CONST_DATA_SIZE  = 32;

% Start address of RAM memory on data address bus and it`s size in words.
c.RAM_START        = 256;
c.RAM_SIZE         = 512;

				% Start address of stack on data address bus and it`s size in words.
% The stack grows towards lower addresses (it decreases).
c.STACK_START      = 15;
c.STACK_SIZE       = 16;

% Start address of video RAM memory on data address bus and it`s size in words.
c.VRAM_START       = 768;
c.VRAM_SIZE        = 1000;

% Address of keyboard on data address bus.
c.KEYBOARD         = 239;

% Address of random number generator on data address bus.
c.RAND_NUM_GEN     = 255;


% Definition of function "m" which has one parameter "n" and returns a return value "n".
% This function is used just to visually emphasise that an immediate value
% is a pointer/memory address.
m = @(n) n;

% Functions returning most significant and least significat byte from 16-bit word.
msb = @(n) bitshift(n, -8);
lsb = @(n) bitand(n, 255);

