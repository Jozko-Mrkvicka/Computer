c.CHAR_SIZE = 256;

% Initialize whole array to a blank character.
for (i = 1 : 256)
    c.char_7x5(:, :, i) = ...
    [
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
        0 0 0 0 0 0 0 0
    ];
end

% c.0                  = NOT_IMPLEMENTED;
% c.1                  = NOT_IMPLEMENTED;
% c.2                  = NOT_IMPLEMENTED;
% c.3                  = NOT_IMPLEMENTED;
% c.4                  = NOT_IMPLEMENTED;
% c.5                  = NOT_IMPLEMENTED;
% c.6                  = NOT_IMPLEMENTED;
% c.7                  = NOT_IMPLEMENTED;
% c.8                  = NOT_IMPLEMENTED;
% c.9                  = NOT_IMPLEMENTED;
% c.10                 = NOT_IMPLEMENTED;
% c.11                 = NOT_IMPLEMENTED;
% c.12                 = NOT_IMPLEMENTED;
% c.13                 = NOT_IMPLEMENTED;
% c.14                 = NOT_IMPLEMENTED;
% c.15                 = NOT_IMPLEMENTED;
% c.16                 = NOT_IMPLEMENTED;
% c.17                 = NOT_IMPLEMENTED;
% c.18                 = NOT_IMPLEMENTED;
% c.19                 = NOT_IMPLEMENTED;
% c.20                 = NOT_IMPLEMENTED;
% c.21                 = NOT_IMPLEMENTED;
% c.22                 = NOT_IMPLEMENTED;
% c.23                 = NOT_IMPLEMENTED;
% c.24                 = NOT_IMPLEMENTED;
% c.25                 = NOT_IMPLEMENTED;
% c.26                 = NOT_IMPLEMENTED;
% c.27                 = NOT_IMPLEMENTED;
% c.28                 = NOT_IMPLEMENTED;
% c.29                 = NOT_IMPLEMENTED;
% c.30                 = NOT_IMPLEMENTED;
% c.31                 = NOT_IMPLEMENTED;
c.SPACE                = 32;
c.EXCLAMATION_MARK     = 33;
c.DOUBLE_QUOTES        = 34;
c.HASH                 = 35;
c.DOLLAR               = 36;
c.PERCENT              = 37;
c.AMPERSAND            = 38;
c.APOSTROPHE           = 39;
c.ROUND_BRACKET_LEFT   = 40;
c.ROUND_BRACKET_RIGHT  = 41;
c.ASTERISK             = 42;
c.PLUS                 = 43;
c.COMMA                = 44;
c.MINUS                = 45;
c.DOT                  = 46;
c.SLASH                = 47;
c.d0                   = 48;
c.d1                   = 49;
c.d2                   = 50;
c.d3                   = 51;
c.d4                   = 52;
c.d5                   = 53;
c.d6                   = 54;
c.d7                   = 55;
c.d8                   = 56;
c.d9                   = 57;
c.COLON                = 58;
c.SEMICOLON            = 59;
c.LESS_THAN            = 60;
c.EQUALS               = 61;
c.GREATER_THAN         = 62;
c.QUESTION_MARK        = 63;
c.AT                   = 64;
c.A                    = 65;
c.B                    = 66;
c.C                    = 67;
c.D                    = 68;
c.E                    = 69;
c.F                    = 70;
c.G                    = 71;
c.H                    = 72;
c.I                    = 73;
c.J                    = 74;
c.K                    = 75;
c.L                    = 76;
c.M                    = 77;
c.N                    = 78;
c.O                    = 79;
c.P                    = 80;
c.Q                    = 81;
c.R                    = 82;
c.S                    = 83;
c.T                    = 84;
c.U                    = 85;
c.V                    = 86;
c.W                    = 87;
c.X                    = 88;
c.Y                    = 89;
c.Z                    = 90;
c.SQUARE_BRACKET_LEFT  = 91;
c.BACKSLASH            = 92;
c.SQUARE_BRACKET_RIGHT = 93;
c.CARET                = 94;
c.UNDERSCORE           = 95;
c.BACKTICK             = 96;
c.a                    = 97;
c.b                    = 98;
c.c                    = 99;
c.d                    = 100;
c.e                    = 101;
c.f                    = 102;
c.g                    = 103;
c.h                    = 104;
c.i                    = 105;
c.j                    = 106;
c.k                    = 107;
c.l                    = 108;
c.m                    = 109;
c.n                    = 110;
c.o                    = 111;
c.p                    = 112;
c.q                    = 113;
c.r                    = 114;
c.s                    = 115;
c.t                    = 116;
c.u                    = 117;
c.v                    = 118;
c.w                    = 119;
c.x                    = 120;
c.y                    = 121;
c.z                    = 122;
c.CURLY_BRACKET_LEFT   = 123;
c.VERTICAL_BAR         = 124;
c.CURLY_BRACKET_RIGHT  = 125;
c.TILDE                = 126;
% c.127                = NOT_IMPLEMENTED;

c.CHAR_176             = 176;
c.CHAR_177             = 177;
c.CHAR_178             = 178;
c.CHAR_179             = 179;
c.CHAR_181             = 181;
c.CHAR_181             = 181;
c.CHAR_182             = 182;
c.CHAR_183             = 183;
c.CHAR_184             = 184;
c.CHAR_185             = 185;
c.CHAR_186             = 186;
c.CHAR_187             = 187;
c.CHAR_188             = 188;
c.CHAR_189             = 189;
c.CHAR_191             = 191;
c.CHAR_191             = 191;
c.CHAR_192             = 192;
c.CHAR_193             = 193;
c.CHAR_194             = 194;
c.CHAR_195             = 195;
c.CHAR_196             = 196;
c.CHAR_197             = 197;
c.CHAR_198             = 198;
c.CHAR_199             = 199;
c.CHAR_200             = 200;
c.CHAR_201             = 201;
c.CHAR_202             = 202;
c.CHAR_203             = 203;
c.CHAR_204             = 204;
c.CHAR_205             = 205;
c.CHAR_206             = 206;
c.CHAR_207             = 207;
c.CHAR_208             = 208;
c.CHAR_209             = 209;
c.CHAR_210             = 210;
c.CHAR_211             = 211;
c.CHAR_212             = 212;
c.CHAR_213             = 213;
c.CHAR_214             = 214;
c.CHAR_215             = 215;
c.CHAR_216             = 216;
c.CHAR_217             = 217;
c.CHAR_218             = 218;
c.CHAR_219             = 219;
c.CHAR_220             = 220;
c.CHAR_221             = 221;
c.CHAR_222             = 222;
c.CHAR_223             = 223;

% c.CROSS               = 39;
% c.ARROW_UP            = 48;
% c.ARROW_DOWN          = 49;
% c.ARROW_LEFT          = 50;
% c.ARROW_RIGHT         = 51;
% c.CURSOR              = 63;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Various Non-Alphanumerical Symbols
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c.char_7x5(:, :, c.SPACE) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.EXCLAMATION_MARK) = ...
[
    0 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
];


c.char_7x5(:, :, c.DOUBLE_QUOTES) = ...
[
    0 0 0 0 0 0 0 0
    0 1 0 1 0 0 0 0
    0 1 0 1 0 0 0 0
    0 1 0 1 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.HASH) = ...
[
    0 0 0 0 0 0 0 0
    0 1 0 1 0 0 0 0
    0 1 0 1 0 0 0 0
    1 1 1 1 1 0 0 0
    0 1 0 1 0 0 0 0
    1 1 1 1 1 0 0 0
    0 1 0 1 0 0 0 0
    0 1 0 1 0 0 0 0
];


c.char_7x5(:, :, c.DOLLAR) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 1 1 1 1 1 0 0
    1 1 0 1 0 0 0 0
    0 1 1 1 1 1 0 0
    0 0 0 1 0 1 1 0
    1 1 1 1 1 1 0 0
    0 0 0 1 0 0 0 0
];


c.char_7x5(:, :, c.PERCENT) = ...
[
    0 0 0 0 0 0 0 0
    1 1 0 0 0 0 0 0
    1 1 0 0 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    1 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.AMPERSAND) = ...
[
    0 0 0 0 0 0 0 0
    0 0 1 1 1 0 0 0
    0 1 0 0 1 1 0 0
    0 0 1 1 1 0 0 0
    0 1 1 1 1 0 0 0
    1 1 0 0 1 1 1 0
    1 1 0 0 1 1 0 0
    0 1 1 1 1 0 1 0
];


c.char_7x5(:, :, c.APOSTROPHE) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.ROUND_BRACKET_LEFT) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
];


c.char_7x5(:, :, c.ROUND_BRACKET_RIGHT) = ...
[
    0 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
];


c.char_7x5(:, :, c.ASTERISK) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    1 0 1 0 1 0 0 0
    0 1 1 1 0 0 0 0
    1 0 1 0 1 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.PLUS) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.COMMA) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
];


c.char_7x5(:, :, c.MINUS) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.DOT) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 1 1 0 0 0 0 0
];


c.char_7x5(:, :, c.SLASH) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                   Digits
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c.char_7x5(:, :, c.d0) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 1 1 0 0 0
    1 0 1 0 1 0 0 0
    1 1 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.d1) = ...
[
    0 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.d2) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
];


c.char_7x5(:, :, c.d3) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.d4) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 1 0 0 0 0
    0 1 0 1 0 0 0 0
    1 0 0 1 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
];


c.char_7x5(:, :, c.d5) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    1 0 0 0 0 0 0 0
    1 1 1 1 0 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.d6) = ...
[
    0 0 0 0 0 0 0 0
    0 0 1 1 0 0 0 0
    0 1 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.d7) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
];


c.char_7x5(:, :, c.d8) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.d9) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 1 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 1 0 0 0 0
    0 1 1 0 0 0 0 0
];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Various Non-Alphanumerical Symbols
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c.char_7x5(:, :, c.COLON) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.SEMICOLON) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
];


c.char_7x5(:, :, c.LESS_THAN) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
];


c.char_7x5(:, :, c.EQUALS) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.GREATER_THAN) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.QUESTION_MARK) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
];


c.char_7x5(:, :, c.AT) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 1 1 0 0
    1 0 0 0 0 0 1 0
    1 0 0 1 1 1 1 0
    1 0 1 0 0 1 1 0
    1 0 0 1 1 1 1 0
    1 0 0 0 0 0 0 0
    0 1 1 1 1 1 0 0
];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Upper Case Letters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c.char_7x5(:, :, c.A) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 1 1 1 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.B) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.C) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.D) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 0 0 0 0 0
    1 0 0 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 1 0 0 0 0
    1 1 1 0 0 0 0 0
];


c.char_7x5(:, :, c.E) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
];


c.char_7x5(:, :, c.F) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.G) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 0 0 0 0
    1 0 1 1 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 1 0 0 0
];


c.char_7x5(:, :, c.H) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 1 1 1 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.I) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.J) = ...
[
    0 0 0 0 0 0 0 0
    0 0 1 1 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    1 0 0 1 0 0 0 0
    0 1 1 0 0 0 0 0
];


c.char_7x5(:, :, c.K) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 1 0 0 0 0
    1 0 1 0 0 0 0 0
    1 1 0 0 0 0 0 0
    1 0 1 0 0 0 0 0
    1 0 0 1 0 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.L) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
];


c.char_7x5(:, :, c.M) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 1 0 1 1 0 0 0
    1 0 1 0 1 0 0 0
    1 0 1 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.N) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 1 0 0 1 0 0 0
    1 0 1 0 1 0 0 0
    1 0 0 1 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.O) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.P) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.R) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 1 1 1 0 0 0 0
    1 0 1 0 0 0 0 0
    1 0 0 1 0 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.S) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.T) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
];


c.char_7x5(:, :, c.U) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.V) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
];


c.char_7x5(:, :, c.Q) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 1 0 1 0 0 0
    1 0 0 1 0 0 0 0
    0 1 1 0 1 0 0 0
];


c.char_7x5(:, :, c.W) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 1 0 1 0 0 0
    1 0 1 0 1 0 0 0
    1 1 0 1 1 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.X) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.Y) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
];


c.char_7x5(:, :, c.Z) = ...
[
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Various Non-Alphanumerical Symbols
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
char_7x5(:, :, c.SQUARE_BRACKET_LEFT) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.BACKSLASH) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 0 0 0 0 0
];


char_7x5(:, :, c.SQUARE_BRACKET_RIGHT) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.CARET) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 1 1 0 0 0
    0 1 1 0 1 1 0 0
    1 1 0 0 0 1 1 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.UNDERSCORE) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
];


c.char_7x5(:, :, c.BACKTICK) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%             Lower Case Letters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c.char_7x5(:, :, c.a) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 0 0 0 1 0 0 0
    0 1 1 1 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 1 0 0 0
];


c.char_7x5(:, :, c.b) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 1 1 0 0 0 0
    1 1 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.c) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.d) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 0 1 0 0 0
    0 1 1 0 1 0 0 0
    1 0 0 1 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 1 0 0 0
];


c.char_7x5(:, :, c.e) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 1 1 1 1 0 0 0
    1 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.f) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 1 0 0 0
    0 0 1 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
];


c.char_7x5(:, :, c.g) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 1 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 1 0 0 0
    0 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.h) = ...
[
    0 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 1 1 0 0 0 0
    1 1 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.i) = ...
[
    0 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.j) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    0 0 0 1 0 0 0 0
    1 0 0 1 0 0 0 0
    0 1 1 0 0 0 0 0
];


c.char_7x5(:, :, c.k) = ...
[
    0 0 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 1 0 0 0
    0 1 0 1 0 0 0 0
    0 1 1 0 0 0 0 0
    0 1 0 1 0 0 0 0
    0 1 0 0 1 0 0 0
];


c.char_7x5(:, :, c.l) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.m) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 0 1 0 0 0 0
    1 0 1 0 1 0 0 0
    1 0 1 0 1 0 0 0
    1 0 1 0 1 0 0 0
    1 0 1 0 1 0 0 0
];


c.char_7x5(:, :, c.n) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 0 1 1 0 0 0 0
    1 1 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.o) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.p) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 1 0 0 0
    1 1 1 1 0 0 0 0
    1 0 0 0 0 0 0 0
    1 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.r) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 0 1 1 0 0 0
    0 1 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
    0 1 0 0 0 0 0 0
];


c.char_7x5(:, :, c.q) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 1 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 1 1 1 0 0 0
    0 0 0 0 1 0 0 0
    0 0 0 0 1 0 0 0
];


c.char_7x5(:, :, c.s) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 1 1 0 0 0
    1 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 0 0 0 1 0 0 0
    1 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.t) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 0 0 0 0
    0 0 1 0 1 0 0 0
    0 0 0 1 0 0 0 0
];


c.char_7x5(:, :, c.u) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 1 1 0 0 0
    0 1 1 0 1 0 0 0
];


c.char_7x5(:, :, c.v) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    0 1 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
];


c.char_7x5(:, :, c.w) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    1 0 0 0 1 0 0 0
    1 0 1 0 1 0 0 0
    1 0 1 0 1 0 0 0
    0 1 0 1 0 0 0 0
];


c.char_7x5(:, :, c.x) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 0 0 1 0 0 0
    0 0 1 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 1 0 0 0 0 0
    1 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.y) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 0 0 0 1 0 0 0
    0 1 0 0 1 0 0 0
    0 0 1 1 0 0 0 0
    0 0 1 0 0 0 0 0
    1 1 0 0 0 0 0 0
];


c.char_7x5(:, :, c.z) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 0 0 0 0
    0 0 1 0 0 0 0 0
    0 1 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Various Non-Alphanumerical Symbols
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c.char_7x5(:, :, c.CURLY_BRACKET_LEFT) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 1 1 0 0
    0 0 1 1 0 0 0 0
    0 0 1 1 0 0 0 0
    0 1 1 0 0 0 0 0
    0 0 1 1 0 0 0 0
    0 0 1 1 0 0 0 0
    0 0 0 1 1 1 0 0
];


c.char_7x5(:, :, c.VERTICAL_BAR) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CURLY_BRACKET_RIGHT) = ...
[
    0 0 0 0 0 0 0 0
    0 1 1 1 0 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 0 1 1 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.TILDE) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 1 1 1 0 1 1 0
    1 1 0 1 1 1 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


% c.char_7x5(:, :, c.NOT_IMPLEMENTED) = ...
% [
%     . . . . . . . .
%     . . . . . . . .
%     . . . . . . . .
%     . . . . . . . .
%     . . . . . . . .
%     . . . . . . . .
%     . . . . . . . .
%     . . . . . . . .
% ]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            Non-ASCII Char_7x5acters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% c.char_7x5(:, :, c.ARROW_UP) = ...
% [
%     0 0 0 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 1 1 1 0 0 0 0
%     1 0 1 0 1 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 1 0 0 0 0 0
% ];


% c.char_7x5(:, :, c.ARROW_DOWN) = ...
% [
%     0 0 0 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     1 0 1 0 1 0 0 0
%     0 1 1 1 0 0 0 0
%     0 0 1 0 0 0 0 0
% ];


% c.char_7x5(:, :, c.ARROW_LEFT) = ...
% [
%     0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 1 0 0 0 0 0 0
%     1 1 1 1 1 0 0 0
%     0 1 0 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 0 0 0 0 0 0
% ];


% c.char_7x5(:, :, c.ARROW_RIGHT) = ...
% [
%     0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 0 1 0 0 0 0
%     1 1 1 1 1 0 0 0
%     0 0 0 1 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 0 0 0 0 0 0 0
% ];


% c.char_7x5(:, :, c.CROSS) = ...
% [
%     0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0
%     1 0 0 0 1 0 0 0
%     0 1 0 1 0 0 0 0
%     0 0 1 0 0 0 0 0
%     0 1 0 1 0 0 0 0
%     1 0 0 0 1 0 0 0
%     0 0 0 0 0 0 0 0
% ];


% c.char_7x5(:, :, c.CURSOR) = ...
% [
%     0 0 0 0 0 0 0 0
%     1 1 1 1 1 0 0 0
%     1 1 1 1 1 0 0 0
%     1 1 1 1 1 0 0 0
%     1 1 1 1 1 0 0 0
%     1 1 1 1 1 0 0 0
%     1 1 1 1 1 0 0 0
%     1 1 1 1 1 0 0 0
% ];


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%        Upper-ASCII characters (IBM437)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
c.char_7x5(:, :, c.CHAR_176) = ...
[
    0 0 0 1 0 0 0 1
    0 1 0 0 0 1 0 0
    0 0 0 1 0 0 0 1
    0 1 0 0 0 1 0 0
    0 0 0 1 0 0 0 1
    0 1 0 0 0 1 0 0
    0 0 0 1 0 0 0 1
    0 1 0 0 0 1 0 0
];


c.char_7x5(:, :, c.CHAR_177) = ...
[
    0 1 0 1 0 1 0 1
    1 0 1 0 1 0 1 0
    0 1 0 1 0 1 0 1
    1 0 1 0 1 0 1 0
    0 1 0 1 0 1 0 1
    1 0 1 0 1 0 1 0
    0 1 0 1 0 1 0 1
    1 0 1 0 1 0 1 0
];


c.char_7x5(:, :, c.CHAR_178) = ...
[
    1 1 0 1 1 0 1 1
    0 1 1 1 0 1 1 1
    1 1 0 1 1 0 1 1
    1 1 1 0 1 1 1 0
    1 1 0 1 1 0 1 1
    0 1 1 1 0 1 1 1
    1 1 0 1 1 0 1 1
    1 1 1 0 1 1 1 0
];


c.char_7x5(:, :, c.CHAR_179) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_181) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_181) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_182) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    1 1 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_183) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_184) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_185) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    1 1 1 1 0 1 1 0
    0 0 0 0 0 1 1 0
    1 1 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_186) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_187) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 0
    0 0 0 0 0 1 1 0
    1 1 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_188) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    1 1 1 1 0 1 1 0
    0 0 0 0 0 1 1 0
    1 1 1 1 1 1 1 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_189) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    1 1 1 1 1 1 1 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_191) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_191) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_192) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_193) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_194) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_195) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_196) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_197) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_198) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_199) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 1
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_200) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 1
    0 0 1 1 0 0 0 0
    0 0 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_201) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 1 1 1 1 1 1
    0 0 1 1 0 0 0 0
    0 0 1 1 0 1 1 1
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_202) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    1 1 1 1 0 1 1 1
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_203) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    1 1 1 1 0 1 1 1
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_204) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 1 
    0 0 1 1 0 0 0 0
    0 0 1 1 0 1 1 1
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_205) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_206) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    1 1 1 1 0 1 1 1 
    0 0 0 0 0 0 0 0
    1 1 1 1 0 1 1 1
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_207) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 1 1 1 
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_208) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_209) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1 
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_210) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_211) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_212) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 1 1 1 
    0 0 0 1 1 0 0 0
    0 0 0 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_213) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 1 1 1 1 1 
    0 0 0 1 1 0 0 0
    0 0 0 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_214) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 1 1 1 1 1 1
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_215) = ...
[
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    1 1 1 1 1 1 1 1
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
    0 0 1 1 0 1 1 0
];


c.char_7x5(:, :, c.CHAR_216) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    1 1 1 1 1 1 1 1 
    0 0 0 1 1 0 0 0
    1 1 1 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_217) = ...
[
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0 
    0 0 0 1 1 0 0 0
    1 1 1 1 1 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_218) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 1 1 1 1 1
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
    0 0 0 1 1 0 0 0
];


c.char_7x5(:, :, c.CHAR_219) = ...
[
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
];


c.char_7x5(:, :, c.CHAR_220) = ...
[
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
];


c.char_7x5(:, :, c.CHAR_221) = ...
[
    1 1 1 1 0 0 0 0
    1 1 1 1 0 0 0 0
    1 1 1 1 0 0 0 0
    1 1 1 1 0 0 0 0
    1 1 1 1 0 0 0 0
    1 1 1 1 0 0 0 0
    1 1 1 1 0 0 0 0
    1 1 1 1 0 0 0 0
];


c.char_7x5(:, :, c.CHAR_222) = ...
[
    0 0 0 0 1 1 1 1
    0 0 0 0 1 1 1 1
    0 0 0 0 1 1 1 1
    0 0 0 0 1 1 1 1
    0 0 0 0 1 1 1 1
    0 0 0 0 1 1 1 1
    0 0 0 0 1 1 1 1
    0 0 0 0 1 1 1 1
];


c.char_7x5(:, :, c.CHAR_223) = ...
[
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0
];

