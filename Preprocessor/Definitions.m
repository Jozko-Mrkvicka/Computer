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

% Available data types.
TEXT = 0;
BYTE = 1;
WORD = 2;

% Destination label (for example "LOOP_") represents absolute memory address.
LABEL_DEST_PREFIX = 0b1110000000000000s16;
LABEL_SRC_PREFIX  = 0b1101000000000000s16;
LABEL_PREFIX_MASK = 0b1111000000000000s16;
LABEL_VALUE_MASK  = 0b0000111111111111s16;

% Constant definition
FORMAT_0_OPERAND_1_MASK = 0b00001111s16;
FORMAT_1_OPERAND_1_MASK = 0b00000111s16;
FORMAT_2_OPERAND_1_MASK = 0b00000111s16;
FORMAT_3_OPERAND_1_MASK = 0b01110000s16;
FORMAT_3_OPERAND_2_MASK = 0b00000111s16;

FORMAT_0_OPCODE_MASK = 0b00110000s16;
FORMAT_1_OPCODE_MASK = 0b00111000s16;
FORMAT_2_OPCODE_MASK = 0b00111000s16;
FORMAT_3_OPCODE_MASK = 0b00111110s16;

INSTR_FORMAT_MASK = 0b11000000s16;

INSTR_FORMAT_0 = 0b00000000s16;
INSTR_FORMAT_1 = 0b01000000s16;
INSTR_FORMAT_2 = 0b10000000s16;
INSTR_FORMAT_3 = 0b11000000s16;

BYTE_MASK = 0b11111111s16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Instruction address bus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start address of ROM memory on instruction address bus and it`s size in words.
ROM_START        = 0x0000;  %% This value is used for Program Counter initialization.
ROM_SIZE         = 0x1000;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%              Data address bus
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Start address of constant data ROM memory on data address bus and it`s size in words.
ROM_DATA_START   = 0x0000;
ROM_DATA_SIZE    = 0x1000;

% Start address of RAM memory on data address bus and it`s size in words.
RAM_START        = 0x1000;
RAM_SIZE         = 0x1000;

% Start address of video RAM memory on data address bus and it`s size in words.
VRAM_START       = 0x2000;
VRAM_SIZE        = 0x400;

% Universal Asynchronous Receiver
UART_RX          = 0xFFF5;

% Universal Asynchronous Transmitter
UART_TX          = 0xFFF6;

% Address of the Interrupt Enable Register.
IRQ_ENBL_REG     = 0xFFF7;

% General Purpose Timer
TIMER_BASE_ADDR  = 0xFFF8;

% Address of keyboard on data address bus.
KEYBOARD         = 0xFFFE;

% Address of random number generator on data address bus.
RAND_NUM_GEN     = 0xFFFF;

% Start address of the stack on dedicated (stack) address bus and it`s size in words.
% The stack grows towards lower addresses (it decreases).
STACK_START      = 15;
STACK_SIZE       = 16;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%           Interrupt Vector Table
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
IRQ_ADDR_KEYBOARD = 0x00FF;  in.IRQ_ADDR_KEYBOARD = IRQ_ADDR_KEYBOARD;  
IRQ_ADDR_TIMER    = 0x01FF;  in.IRQ_ADDR_TIMER    = IRQ_ADDR_TIMER;
IRQ_ADDR_UART     = 0x02FF;  in.IRQ_ADDR_UART     = IRQ_ADDR_UART;
IRQ_ADDR_FPU      = 0x03FF;  in.IRQ_ADDR_FPU      = IRQ_ADDR_FPU;

% Delay between two keyboard IRQs. It ensures that a pressed key will not block entire CPU.
% Every time when the keyboard IRQ is handled, all following keyboard IRQs are disabled
% and the keyboard IRQ counter starts to count. Once the IRQ_KEYBOARD_DELAY value is reached
% the keyboard IRQs are enabled again.
IRQ_KEYBOARD_DELAY = 0xFF;  in.IRQ_KEYBOARD_DELAY = IRQ_KEYBOARD_DELAY;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            General Purpose Timer
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The GP Timer is a memory mapped device. It consists of 5 registers used for its
% configuration and control. Each register address represents one command.
% Data sent to this address represents the command parameter.
% 
% - Execute the CMD_TIMER_RUN command with parameter TIMER_RUN to continue/keep counting.
%   Please note that if timer is starting for first time after power cycle or timer was previously
%   halted in TIMER_ONE_SHOT state then it will take one extra clock cycle for timer to start counting.
%   Otherwise timer starts counting immediately.
% 
% - Execute the CMD_TIMER_RUN command with parameter TIMER_HALT to temporarily stop counting.
% 
% - Execute the CMD_TIMER_MODE command with parameter TIMER_FREE_RUN to keep counter running
%   without stopping. Counter will count until the stop value, then it will overflow
%   to the start value and it will start counting again.
% 
% - Execute the CMD_TIMER_MODE command with parameter TIMER_ONE_SHOT to stop counting after overflow.
%   Counter will count until the stop value, then it will overflow to the start value
%   and it will stay there until new CMD_TIMER_RUN command.
% 
% - To start counting again, once it was stopped in TIMER_ONE_SHOT mode, execute the CMD_TIMER_RUN
%   command with parameter TIMER_HALT two times in row and then execute the CMD_TIMER_RUN
%   command with parameter TIMER_RUN.
% 
% - Execute the CMD_TIMER_RESET command with parameter 0x00 (in fact, parameter is not needed):
%    - to configure new start value,
%    - to reset counter to its preconfigured start value.
% 
% Example:
%   % Store Timer base address.
%   SGMT  msb(c.TIMER_BASE_ADDR)
% 
%   % Configure start value.
%   MOVL  r0                                0x00
%   STLI  lsb(c.CMD_TIMER_SET_START_VALUE)  r0
% 
%   % Configure stop value.
%   MOVL  r0                                0xFF
%   STLI  lsb(c.CMD_TIMER_SET_STOP_VALUE)   r0 
% 
%   % Configure free run mode.
%   MOVL  r0                                c.TIMER_FREE_RUN
%   STLI  lsb(c.CMD_TIMER_SET_MODE)         r0
% 
%   % Start timer.
%   MOVL  r0                                c.TIMER_RUN
%   STLI  lsb(c.CMD_TIMER_RUN)              r0
% 
CMD_TIMER_SET_STOP_VALUE  = TIMER_BASE_ADDR + 0x0000;
CMD_TIMER_SET_START_VALUE = TIMER_BASE_ADDR + 0x0001;
CMD_TIMER_RESET           = TIMER_BASE_ADDR + 0x0002;
CMD_TIMER_MODE            = TIMER_BASE_ADDR + 0x0003;
CMD_TIMER_RUN             = TIMER_BASE_ADDR + 0x0004;
TIMER_ONE_SHOT            = 0x00;
TIMER_FREE_RUN            = 0x01;
TIMER_HALT                = 0x00;
TIMER_RUN                 = 0x01;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Universal Asynchronous Receiver/Transmitter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
UART_COM_PORT     = "COM5";  in.UART_COM_PORT  = UART_COM_PORT;
UART_BAUD_RATE    = 9600;    in.UART_BAUD_RATE = UART_BAUD_RATE;
UartDataRx        = 0x00u8;
UartDataRx_Active = false;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                 Test Points
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Button "Oo" test input. By default button is not pressed.
in.IRQ_Keyboard_Test = 0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                Miscellaneous
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Definition of function "m" which has one parameter "n" and returns a return value "n".
% This function is used just to visually emphasis that an immediate value
% is a pointer/memory address.
m = @(n) n;

% Functions returning most significant and least significant byte from 16-bit word.
msb = @(n) bitshift(n, -8);
lsb = @(n) bitand(n, 255);


% Place all model inputs to the base workspace.
assignin('base', 'in', in);
