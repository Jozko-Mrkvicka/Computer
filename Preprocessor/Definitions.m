%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% General purpose register definitions
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

% General purpose register 14 is used as a column selector (for video controller).
% It can be also used like normal general purpose register.
r14 = bin2dec('0000 1110');
col = r14;

% General purpose register 15 is used as a raw selector (for video controller).
% It can be also used like normal general purpose register.
r15 = bin2dec('0000 1111');
row = r15;


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


%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Video controller commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%
CLR_SCR = 4;
PIX_ON  = 3;
PIX_OFF = 2;


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


% Start address of MPROM memory on instruction address bus and it`s size in words.
c.MPROM_START  = 0;
c.MPROM_SIZE   = 256;

% Start address of ROM memory on instruction address bus and it`s size in words.
c.ROM_START    = 256;
c.ROM_SIZE     = 256;

% Start address of RAM memory on data address bus and it`s size in words.
c.RAM_START    = 0;
c.RAM_SIZE     = 32;

% Start address of stack on data address bus and it`s size in words.
% The stack grows towards lower addresses (it decreases).
c.STACK_START  = 31;
c.STACK_SIZE   = 8;

% Start address of video RAM memory on data address bus and it`s size in words.
c.VRAM_START   = 32;
c.VRAM_SIZE    = 24;

% Address of video controller on data address bus.
c.VIDEO_CTRL   = 223;

% Address of keyboard on data address bus.
c.KEYBOARD     = 239;

% Address of random number generator on data address bus.
c.RAND_NUM_GEN = 255;


% Definition of function "m" which has one parameter "n" and returns a return value "n".
% This function is used just to visually emphasise that an immediate value
% is a pointer/memory address.
m = @(n) n;

% Functions returning most significant and least significat byte from 16-bit word.
msb = @(n) bitshift(n, -8);
lsb = @(n) bitand(n, 255);


% Hexadecimal constants
h00 = 0;
h01 = 1;
h02 = 2;
h03 = 3;
h04 = 4;
h05 = 5;
h06 = 6;
h07 = 7;
h08 = 8;
h09 = 9;
h0A = 10;
h0B = 11;
h0C = 12;
h0D = 13;
h0E = 14;
h0F = 15;
h10 = 16;
h11 = 17;
h12 = 18;
h13 = 19;
h14 = 20;
h15 = 21;
h16 = 22;
h17 = 23;
h18 = 24;
h19 = 25;
h1A = 26;
h1B = 27;
h1C = 28;
h1D = 29;
h1E = 30;
h1F = 31;
h20 = 32;
h21 = 33;
h22 = 34;
h23 = 35;
h24 = 36;
h25 = 37;
h26 = 38;
h27 = 39;
h28 = 40;
h29 = 41;
h2A = 42;
h2B = 43;
h2C = 44;
h2D = 45;
h2E = 46;
h2F = 47;
h30 = 48;
h31 = 49;
h32 = 50;
h33 = 51;
h34 = 52;
h35 = 53;
h36 = 54;
h37 = 55;
h38 = 56;
h39 = 57;
h3A = 58;
h3B = 59;
h3C = 60;
h3D = 61;
h3E = 62;
h3F = 63;
h40 = 64;
h41 = 65;
h42 = 66;
h43 = 67;
h44 = 68;
h45 = 69;
h46 = 70;
h47 = 71;
h48 = 72;
h49 = 73;
h4A = 74;
h4B = 75;
h4C = 76;
h4D = 77;
h4E = 78;
h4F = 79;
h50 = 80;
h51 = 81;
h52 = 82;
h53 = 83;
h54 = 84;
h55 = 85;
h56 = 86;
h57 = 87;
h58 = 88;
h59 = 89;
h5A = 90;
h5B = 91;
h5C = 92;
h5D = 93;
h5E = 94;
h5F = 95;
h60 = 96;
h61 = 97;
h62 = 98;
h63 = 99;
h64 = 100;
h65 = 101;
h66 = 102;
h67 = 103;
h68 = 104;
h69 = 105;
h6A = 106;
h6B = 107;
h6C = 108;
h6D = 109;
h6E = 110;
h6F = 111;
h70 = 112;
h71 = 113;
h72 = 114;
h73 = 115;
h74 = 116;
h75 = 117;
h76 = 118;
h77 = 119;
h78 = 120;
h79 = 121;
h7A = 122;
h7B = 123;
h7C = 124;
h7D = 125;
h7E = 126;
h7F = 127;
h80 = 128;
h81 = 129;
h82 = 130;
h83 = 131;
h84 = 132;
h85 = 133;
h86 = 134;
h87 = 135;
h88 = 136;
h89 = 137;
h8A = 138;
h8B = 139;
h8C = 140;
h8D = 141;
h8E = 142;
h8F = 143;
h90 = 144;
h91 = 145;
h92 = 146;
h93 = 147;
h94 = 148;
h95 = 149;
h96 = 150;
h97 = 151;
h98 = 152;
h99 = 153;
h9A = 154;
h9B = 155;
h9C = 156;
h9D = 157;
h9E = 158;
h9F = 159;
hA0 = 160;
hA1 = 161;
hA2 = 162;
hA3 = 163;
hA4 = 164;
hA5 = 165;
hA6 = 166;
hA7 = 167;
hA8 = 168;
hA9 = 169;
hAA = 170;
hAB = 171;
hAC = 172;
hAD = 173;
hAE = 174;
hAF = 175;
hB0 = 176;
hB1 = 177;
hB2 = 178;
hB3 = 179;
hB4 = 180;
hB5 = 181;
hB6 = 182;
hB7 = 183;
hB8 = 184;
hB9 = 185;
hBA = 186;
hBB = 187;
hBC = 188;
hBD = 189;
hBE = 190;
hBF = 191;
hC0 = 192;
hC1 = 193;
hC2 = 194;
hC3 = 195;
hC4 = 196;
hC5 = 197;
hC6 = 198;
hC7 = 199;
hC8 = 200;
hC9 = 201;
hCA = 202;
hCB = 203;
hCC = 204;
hCD = 205;
hCE = 206;
hCF = 207;
hD0 = 208;
hD1 = 209;
hD2 = 210;
hD3 = 211;
hD4 = 212;
hD5 = 213;
hD6 = 214;
hD7 = 215;
hD8 = 216;
hD9 = 217;
hDA = 218;
hDB = 219;
hDC = 220;
hDD = 221;
hDE = 222;
hDF = 223;
hE0 = 224;
hE1 = 225;
hE2 = 226;
hE3 = 227;
hE4 = 228;
hE5 = 229;
hE6 = 230;
hE7 = 231;
hE8 = 232;
hE9 = 233;
hEA = 234;
hEB = 235;
hEC = 236;
hED = 237;
hEE = 238;
hEF = 239;
hF0 = 240;
hF1 = 241;
hF2 = 242;
hF3 = 243;
hF4 = 244;
hF5 = 245;
hF6 = 246;
hF7 = 247;
hF8 = 248;
hF9 = 249;
hFA = 250;
hFB = 251;
hFC = 252;
hFD = 253;
hFE = 254;
hFF = 255;
