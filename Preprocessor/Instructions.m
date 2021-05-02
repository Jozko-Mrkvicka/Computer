%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction formats:
%
% 0.) FF|OO|IIII   IIIIIIII
%
% 1.) FF|OO|DDD|S  SS|IIIIII
%
% 2.) FF|OOO|DDD   IIIIIIII
%
% 3.) FF|OOOO|RR   RR|DDD|SSS
%
%   F - Format
%   O - Operation code
%   D - Register 1 (Destination)
%   S - Register 2 (Source)
%   I - Immediate value
%   R - Reserved
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      SPX (Set PiXel) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand: 
%     Horizontal position (X) in range 0..15
%
% Second operand:
%     Vertical position (Y) in range 0..23
%
% Third operand:
%     Pixel to set (switch off = 0 / switch on = 1)
%
% Type of operands:        Example:
%     SPX REG REG IMM      SPX r0 r1 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPX0 = bin2dec('11 1101 00');
c.SPX0 = SPX0;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      SPX (Set PiXel) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand: 
%     Horizontal position (X) in range 0..15
%
% Second operand:
%     Vertical position (Y) in range 0..23
%
% Third operand:
%     Pixel to set (switch off = 0 / switch on = 1)
%
% Type of operands:        Example:
%     SPX REG REG IMM      SPX r0 r1 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SPX1 = bin2dec('11 1100 00');
c.SPX1 = SPX1;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RET instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand:
%     First value to compare.
%
% Second operand:
%     Second value to compare.
%
% Note: 
%   The result is stored in status register.
%
% Type of operands:        Example:
%     CMP  REG  REG          CMP  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CMP = bin2dec('11 1011 00');
c.CMP = CMP;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RET instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand:
%     Not used.
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     N/A                    RET
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
RET = bin2dec('11 1010 00');
c.RET = RET;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      POP instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand:
%     Destination register to pop from stack. 
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     POP  REG               POP  r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
POP = bin2dec('11 1001 00');
c.POP = POP;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      PUSH instruction (not finished)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand:
%     Not used.
%
% Second operand:
%     Source register to push on stack.
%
% Type of operands:        Example:
%     PUSH  REG  REG         PUSH  r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PUSH = bin2dec('11 1000 00');
c.PUSH = PUSH;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      GCH (Get CHar) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand:
%     Destination for read button code.
%
% Second operand:
%     Not used.
%
% Type of operands:        Example:
%     GCH  REG  REG          GCH  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GCH = bin2dec('11 0111 00');
c.GCH = GCH;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      ADD (ADD registers) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand:
%     In: First value to add.
%     Out: Destination for result.
%
% Second operand:
%     Value to add.
%
% Type of operands:        Example:
%     ADD  REG  REG          ADD  r0  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADD = bin2dec('11 0110 00');
c.ADD = ADD;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      GPX (Get PiXel) instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand: 
%     In: Horizontal position (X) in range 0..15.
%     Out: Read pixel value is stored here. 
%
% Second operand:
%     Vertical position (Y) in range 0..23
%
% Type of operands:        Example:
%     DIS REG REG          DIS r0 r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
GPX = bin2dec('11 0101 00');
c.GPX = GPX;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     TXT (print TeXT character) instructions (TRR, TMR)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% First operand: 
%     Character to print.
%
% Second operand:
%     Position on display.
%
% Type of operands:        Example:
%     TRR  REG  REG          TRR  r0     r1
%     TMR  REG  REG          TMR  a(r0)  r1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TRR = bin2dec('11 0100 00');
TMR = bin2dec('11 0011 00');
c.TRR = TRR;
c.TMR = TMR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      MOV instructions (MMR, MRM, MOV)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 3: FF|OOOO|RR DDDD|SSSS
%
% The MMR instruction moves data stored in source
% register to memory (pointed by destination register).
% 
% The MRM instruction moves data stored in memory
% (pointed by source register) to destination register.
% 
% The MOV instruction moves data between two registers.
% 
% First operand:
%     Destination.
%
% Second operand:
%     Source of data.
%
% Type of operands:        Example:
%     MMR   REG  REG         MMR   a(r1)  r3
%     MRM   REG  REG         MRM   r2     a(r1)
%     MOV   REG  REG         MOV   r1     r0
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MMR =  bin2dec('11 0010 00');
MRM =  bin2dec('11 0001 00');
MOV =  bin2dec('11 0000 00');
c.MMR = MMR;
c.MRM = MRM;
c.MOV = MOV;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      ADDI (ADD Immediate) Instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
% 
% Description:
%     The ADDI instruction adds an immediate value
%     to a register. The result is stored in the
%     same register. Immediate value is signed and 
%     must be from range <-128 .. +127>.
%
% First operand:
%     In: Value (stored in a register) to be added.
%     Out: Destination of the sum.
%
% Second operand:
%     Immediate value to be added.
%
% Type of operands:        Example:
%     ADDI  REG  IMM          ADDI  r0  25
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ADDI = bin2dec('10 11 0000');
c.ADDI = ADDI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      MMRI Instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 1: FF|OO|SSSS IIIIIIII
%
% Description:
%     The MMRI instruction moves value (stored 
%     in register) to memory (pointed by immediate value).
% 
% First operand:
%     Source register to be saved into RAM.
%
% Second operand:
%     Destination address of RAM.
%
% Type of operands:        Example:
%     MMRI  REG  IMM         MMRI  r3  a(11)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MMRI = bin2dec('01 01 0000');
c.MMRI = MMRI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      MRMI Instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
%
% Description:
%     The MRMI instruction moves a value stored 
%     in RAM (pointed by immediate value) to a register.
% 
% First operand:
%     Destination register.
%
% Second operand:
%     Source address of RAM. 
%
% Type of operands:        Example:
%     MRMI  REG  IMM         MRMI  r2  a(10)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MRMI = bin2dec('10 01 0000');
c.MRMI = MRMI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Move Lower Byte instruction (MOVL)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
%
% Description:
%     The MOVL instruction movess an immediate
%     value into lower byte of a register. 
%     Immediate value is signed and it is from
%     range <-128 .. +127>. The sign bit is copied
%     to upper byte of the register.
% 
% First operand:
%     Destination register.
%
% Second operand:
%     Immediate value to be moved to register.
%
% Type of operands:        Example:
%     MOVL  REG  IMM         MOVL  r0  10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MOVL =  bin2dec('10 00 0000');
c.MOVL = MOVL;


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%      TIR (Print immediate text character) instruction
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Format 1: 				FF|OOO|DDD IIIIIIII
	%
	% First operand: 
	%     Character to print.
	%
	% Second operand:
	%     Position on display.
	%
	% Type of operands:        Example:
	%     TIR  IMM  REG          TIR  J      r1
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% NOT_USED = bin2dec('10 011 000');
% c.NOT_USED = NOT_USED;


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%      MOV instructions (MMRI, MRMI, MRC)
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Format 1: FF|OO|SSSS IIIIIIII
	%
	% First operand:
	%     Destination.
	%
	% Second operand:
	%     Source of data.
	%
	% Type of operands:        Example:
	%     MMRI  REG  IMM         MMRI  r3  a(11) -> ulozi hodnotu(REG) na adresu(IMM) v pamati
	%     MRMI  REG  IMM         MRMI  r2  a(10)
	%     MRC   REG  IMM         MRC   r0  10
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TIR = bin2dec('01 10 0000');
c.TIR = TIR;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      Move Upper Byte instruction (MOVU)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 2: FF|OO|DDDD IIIIIIII
%
% Description:
%     The MOVU instruction moves an immediate
%     value to upper byte of register. 
%     The value is from range <0 .. 255>.
% 
% First operand:
%     Destination register.
%
% Second operand:
%     Immediate value to be moved to register.
%
% Type of operands:        Example:
%     MOVU  REG  IMM         MOVU  r0  255
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MOVU =  bin2dec('10 10 0000');
c.MOVU = MOVU;


	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	%      MOV instructions (MMRI, MRMI, MRC)
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	% Format 1: FF|OO|SSSS IIIIIIII
	%
	% First operand:
	%     Destination.
	%
	% Second operand:
	%     Source of data.
	%
	% Type of operands:        Example:
	%     MMRI  REG  IMM         MMRI  r3  a(11) -> ulozi hodnotu(REG) na adresu(IMM) v pamati
	%     MRMI  REG  IMM         MRMI  r2  a(10)
	%     MRC   REG  IMM         MRC   r0  10
	%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CMPI = bin2dec('01 00 0000');
c.CMPI = CMPI;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      JMP instructions (JPE, JNE)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|DDD|S SS|IIIIII
%
% First operand:
%     Value to compare.
%
% Second operand:
%     Value to compare.
%
% Third operand:
%     Address to jump.
%
% Type of operands:        Example:
%     JNE  REG  REG  IMM     JPE  r0  r1  16
%     JPE  REG  REG  IMM     JPE  r0  r1  16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JNE = bin2dec('00 11 000 0');
c.JNE = JNE;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      JPE instruction (not finished)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address of a subroutine to call.
%
% Type of operands:        Example:
%     CALL  REG  IMM         CALL  r0  LABEL  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JPE = bin2dec('00 10 0000');
c.JPE = JPE;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      CALL instruction (not finished)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address of a subroutine to call.
%
% Type of operands:        Example:
%     CALL  REG  IMM         CALL  r0  LABEL  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
CALL = bin2dec('00 01 0000');
c.CALL = CALL;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      JMP instruction (unconditional JuMP) (not finished)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Format 0: FF|OO|IIII IIIIIIII
%
% First operand:
%     Not used.
%
% Second operand:
%     Address to jump.
%
% Type of operands:        Example:
%     JMP  REG  IMM          JMP  r0  LABEL   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
JMP = bin2dec('00 00 0000');
c.JMP = JMP;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      LSH instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      RSH instruction
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 14
% Type of operands:
%     ORcr  CONST  REG    (000)
%     ORrr  REG    REG    (001)
%     ORmr  MEM    REG    (010)  (Not implemented)
%     ORcm  CONST  MEM    (011)  (Not implemented)
%     ORrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ORcr = bin2dec('1110 0000');
% ORrr = bin2dec('1110 0001');
% OR = bin2dec('1110 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 13
% Type of operands:
%     XORcr  CONST  REG    (000)
%     XORrr  REG    REG    (001)
%     XORmr  MEM    REG    (010)  (Not implemented)
%     XORcm  CONST  MEM    (011)  (Not implemented)
%     XORrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% XORcr = bin2dec('1101 0000');
% XORrr = bin2dec('1101 0001');
% XOR = bin2dec('1101 0000');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% operation code = 12
% Type of operands:
%     NOTcr  CONST  REG    (000)
%     NOTrr  REG    REG    (001)
%     NOTmr  MEM    REG    (010)  (Not implemented)
%     NOTcm  CONST  MEM    (011)  (Not implemented)
%     NOTrm  REG    MEM    (100)  (Not implemented)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%NOT = bin2dec('1100 0000');

