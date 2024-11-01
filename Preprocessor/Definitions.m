%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     General purpose register definitions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
r0  = 0x0s16;
r1  = 0x1s16;
r2  = 0x2s16;
r3  = 0x3s16;
r4  = 0x4s16;
r5  = 0x5s16;
r6  = 0x6s16;
r7  = 0x7s16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Button definition
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
BTN_0 = 0x0s16;
BTN_1 = 0x1s16;
BTN_2 = 0x2s16;
BTN_3 = 0x3s16;
BTN_4 = 0x4s16;
BTN_5 = 0x5s16;
BTN_6 = 0x6s16;
BTN_7 = 0x7s16;
BTN_8 = 0x8s16;
BTN_9 = 0x9s16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Create uint16 bus type
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cellInfo =                                                                                                                                 ...
{                                                                                                                                          ... 
  {                                                                                                                                        ... 
    'BUS_UINT16_T',                                                                                                                        ... 
    '',                                                                                                                                    ... 
    '',                                                                                                                                    ... 
    'Auto',                                                                                                                                ... 
    '-1',                                                                                                                                  ...
    {                                                                                                                                      ...
%         ElementName, Dimensions, DataType,  SampleTime, Complexity, SamplingMode, DimensionsMode, Min, Max, DocUnits, Description        ... 
        {'b15',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b14',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b13',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b12',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b11',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b10',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b09',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b08',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b07',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b06',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b05',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b04',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b03',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b02',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b01',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
        {'b00',        1,          'boolean', -1,         'real',     'Sample',     'Fixed',        [],  [],  '',       ''};               ...
    }                                                                                                                                      ...
  }                                                                                                                                        ...
}; 
Simulink.Bus.cellToObject(cellInfo);

% Available datatypes.
TEXT = 0;  c.TEXT = TEXT;
BYTE = 1;  c.BYTE = BYTE;
WORD = 2;  c.WORD = WORD;

% Destination label (for example "LOOP_") represents absolute memory address.
c.LABEL_DEST_PREFIX = 0b1110000000000000s16;
c.LABEL_SRC_PREFIX  = 0b1101000000000000s16;
c.LABEL_PREFIX_MASK = 0b1111000000000000s16;
c.LABEL_VALUE_MASK  = 0b0000111111111111s16;

% Constant definition
c.FORMAT_0_OPERAND_1_MASK = 0b00001111s16;
c.FORMAT_1_OPERAND_1_MASK = 0b00000111s16;
c.FORMAT_2_OPERAND_1_MASK = 0b00000111s16;
c.FORMAT_3_OPERAND_1_MASK = 0b01110000s16;
c.FORMAT_3_OPERAND_2_MASK = 0b00000111s16;

c.FORMAT_0_OPCODE_MASK = 0b00110000s16;
c.FORMAT_1_OPCODE_MASK = 0b00111000s16;
c.FORMAT_2_OPCODE_MASK = 0b00111000s16;
c.FORMAT_3_OPCODE_MASK = 0b00111110s16;

c.INSTR_FORMAT_MASK = 0b11000000s16;

c.INSTR_FORMAT_0 = 0b00000000s16;
c.INSTR_FORMAT_1 = 0b01000000s16;
c.INSTR_FORMAT_2 = 0b10000000s16;
c.INSTR_FORMAT_3 = 0b11000000s16;

c.BYTE_MASK = 0b11111111s16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Instruction address bus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start address of ROM memory on instruction address bus and it`s size in words.
c.ROM_START        = 0x0000;  %% This value is used for Program Counter initialization.
c.ROM_SIZE         = 0x1000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Data address bus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start address of constant data ROM memory on data address bus and it`s size in words.
c.CONST_DATA_START = 0x0000;
c.CONST_DATA_SIZE  = 0x1000;

% Start address of RAM memory on data address bus and it`s size in words.
c.RAM_START        = 0x1000;
c.RAM_SIZE         = 0x1000;

% Start address of video RAM memory on data address bus and it`s size in words.
c.VRAM_START       = 0x2000;
c.VRAM_SIZE        = 0x400;

% Address of keyboard on data address bus.
c.KEYBOARD         = 0xFFFE;

% Address of random number generator on data address bus.
c.RAND_NUM_GEN     = 0xFFFF;

% ROM LookUpTable breakpoints.
c.RomCodeBreakpoints = 0 : c.ROM_SIZE - 1;
c.DataRomBreakpoints = 0 : c.CONST_DATA_SIZE - 1;
c.DataRom = zeros(1, c.CONST_DATA_SIZE);


% Start address of the stack on dedicated (stack) address bus and it`s size in words.
% The stack grows towards lower addresses (it decreases).
c.STACK_START      = 15;
c.STACK_SIZE       = 16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Interrupt Vector Table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c.IRQ_KEYBOARD = 


% Definition of function "m" which has one parameter "n" and returns a return value "n".
% This function is used just to visually emphasise that an immediate value
% is a pointer/memory address.
m = @(n) n;

% Functions returning most significant and least significat byte from 16-bit word.
msb = @(n) bitshift(n, -8);  c.msb = msb;
lsb = @(n) bitand(n, 255);   c.lsb = lsb;

