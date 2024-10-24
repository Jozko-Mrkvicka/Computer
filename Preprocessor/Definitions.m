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
    %   % fprintf(fileID, 'h%04X = %05d;    ', i, i);
    %   fprintf(fileID, 'assignin(''base'', ''h%04X'', h%04X);\n', i, i);
    % end
    fclose(fileID);
end

if (0 == evalin('base', '1 == exist(''hFFFF'',''var'')'))
    fprintf('Loading... ')
    Hex_Consts;
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
        {'b15',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b14',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b13',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b12',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b11',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b10',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b09',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b08',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b07',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b06',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b05',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b04',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b03',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b02',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b01',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b00',   1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
    }                                                                                                                                 ...
  }                                                                                                                                   ...
}; 
Simulink.Bus.cellToObject(cellInfo);

% Available datatypes.
TEXT = 0;  c.TEXT = TEXT;
BYTE = 1;  c.BYTE = BYTE;
WORD = 2;  c.WORD = WORD;

% Destination label (for example "LOOP_") represents absolute memory address.
c.LABEL_DEST_PREFIX = bin2dec('11100000 00000000');
c.LABEL_SRC_PREFIX  = bin2dec('11010000 00000000');
c.LABEL_PREFIX_MASK = bin2dec('11110000 00000000');
c.LABEL_VALUE_MASK  = bin2dec('00001111 11111111');

% Constant definition
c.FORMAT_0_OPERAND_1_MASK = bin2dec('0000 1111');
c.FORMAT_1_OPERAND_1_MASK = bin2dec('0000 0111');
c.FORMAT_2_OPERAND_1_MASK = bin2dec('0000 0111');
c.FORMAT_3_OPERAND_1_MASK = bin2dec('0111 0000');
c.FORMAT_3_OPERAND_2_MASK = bin2dec('0000 0111');

c.FORMAT_0_OPCODE_MASK = bin2dec('0011 0000');
c.FORMAT_1_OPCODE_MASK = bin2dec('0011 1000');
c.FORMAT_2_OPCODE_MASK = bin2dec('0011 1000');
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
% Start address of ROM memory on instruction address bus and it`s size in words.
c.ROM_START        = 0x0000;  %% This value is used for Program Counter initialization.
c.ROM_SIZE         = 0x1000;


%%%%%%%%%%%%%%%%%%
% Data address bus
%%%%%%%%%%%%%%%%%%
% Start address of constant data ROM memory on data address bus and it`s size in words.
c.CONST_DATA_START = 0;
c.CONST_DATA_SIZE  = 256;

% Start address of RAM memory on data address bus and it`s size in words.
c.RAM_START        = 256;
c.RAM_SIZE         = 512;

% Start address of the stack on dedicated (stack) address bus and it`s size in words.
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


% ROM LookUpTable breakpoints.
c.RomCodeBreakpoints = 0 : c.ROM_SIZE - 1;
c.DataRomBreakpoints = 0 : 255;
c.DataRom = zeros(1, 256);


% Definition of function "m" which has one parameter "n" and returns a return value "n".
% This function is used just to visually emphasise that an immediate value
% is a pointer/memory address.
m = @(n) n;

% Functions returning most significant and least significat byte from 16-bit word.
msb = @(n) bitshift(n, -8);  c.msb = msb;
lsb = @(n) bitand(n, 255);   c.lsb = lsb;

