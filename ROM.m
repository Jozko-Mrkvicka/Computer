clc
% Load symbolic constants (instructions)
Instructions
% Addresses
% Video_Adapter
% CharTable



% Demo: Delete whole screen (bottom -> up -> bottom)
LABEL_DEST_PREFIX = hex2dec('FF80');
LABEL_SRC_PREFIX =  hex2dec('FF40');

UPROW_ = bitor(LABEL_DEST_PREFIX, 1);
UPROW  = bitor(LABEL_SRC_PREFIX,  1);

UPCOL_ = bitor(LABEL_DEST_PREFIX, 2);
UPCOL  = bitor(LABEL_SRC_PREFIX,  2);

DNROW_ = bitor(LABEL_DEST_PREFIX, 3);
DNROW  = bitor(LABEL_SRC_PREFIX,  3);

DNCOL_ = bitor(LABEL_DEST_PREFIX, 4);
DNCOL  = bitor(LABEL_SRC_PREFIX,  4);

RomCode = ...
[
		MRC		r1		24					...
		MRC		r2		16					...
											...
UPCOL_	SUBI	r1		1					...
		MRC		r0		MIN_X				...
UPROW_	SPX		r0		r1		ON			...
		ADDI	r0		1					...
		JNE		r0		r2		UPROW		...
		JNE		r1		r3  	UPCOL		...
											...
		MRC		r1		0					...
		MRC		r3		24					...
											...
DNCOL_	MRC		r0		MIN_X				...
DNROW_	SPX		r0		r1		OFF			...
		ADDI	r0		1					...
		JNE		r0		r2  	DNROW		...
		ADDI	r1		1					...
		JNE		r1		r3  	DNCOL		...
]





% RomCode = reshape(transpose(RomCode), [], 1)
RomCode = Preprocessor(RomCode);
transpose(RomCode)

% % Demo: When button "6" is pressed then cursor (pixel) moves to the right.
% LABEL_DEST_PREFIX = hex2dec('FF80');
% LABEL_SRC_PREFIX =  hex2dec('FF40');

% LOOP_ = bitor(LABEL_DEST_PREFIX, 1);
% LOOP  = bitor(LABEL_SRC_PREFIX,  1);

% RomCode = ...
% [                           % Address
% 		MRC   r0  8         ... % 00
% 		MRC   r1  12		... % 02
% 		MRC   r2  6			... % 04
% 							...
% LOOP_	GCH   r3  r3		... % 06
% 		SPX   r0  r1  ON	... % 08
% 		JNE   r3  r2  LOOP	... % 10
% 							...
% 		SPX   r0  r1  OFF	... % 12
% 		ADDI  r0  1			... % 14
% 		ADDI  r0  0         ... % 16  Delay
% 		ADDI  r0  0         ... % 18  Delay
% 		ADDI  r0  0         ... % 20  Delay
% 		ADDI  r0  0         ... % 22  Delay
% 		JPE   r0  r0  LOOP	... % 24
% 							...
% 		ADDI  r0  0         ... % 26
% 		ADDI  r0  0         ... % 28
% 		ADDI  r0  0         ... % 30
% ]

% % Demo: Nakresli 4 pixely
% RomCode = ...
% [                           % Address
% 	MRC   r0  0      ... % 0
% 	MRC   r1  0      ... % 2
% 	                ...
% 	MRC   r2  5      ... % 4
% 	SPX   r0  r1 1   ... % 6
% 	ADDI  r0  1      ... % 8
% 	ADDI  r1  1      ... % 10
% 	JNE   r0  r2 6   ... % 12
% 	ADDI  r0  0      ... % 14
% ]



