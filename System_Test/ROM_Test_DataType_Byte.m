%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data ROM system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch section
case 'LABEL'
Label = ...
{
    'LOOP',
    'WAIT'
};


case 'CONST'
ConstData = ...
{
    BYTE    'DONT_COPY_ME_0'        48;
    BYTE    'DONT_COPY_ME_1'        48;
    BYTE    'DONT_COPY_ME_2'        48;
    BYTE    'DONT_COPY_ME_3'        48;
    BYTE    'CONST_0'       int8(-128);
    BYTE    'CONST_1'       int8(  -1);
    BYTE    'CONST_2'                1;
    BYTE    'CONST_3'              127;
    BYTE    'CONST_4'              128;
    BYTE    'CONST_5'              255;
};


case 'CODE'
NUM_OF_BYTES = size(ConstData, 1);
SourceCode = ...
[                                                                           ...
                MOVL        r0                      lsb(CONST_0)            ... Assign source address.
                MOVU        r0                      msb(CONST_0)            ...
                MOVL        r1                      lsb(RAM_START)          ... Assign destination address.
                MOVU        r1                      msb(RAM_START)          ...
                                                                            ...
    LOOP_       LDL         r2                      m(r0)                   ... Copy one byte from ROM to RAM.
                STL         r1                      r2                      ...
                                                                            ...
                ADDI        r0                      1                       ... Move pointer to next byte.
                ADDI        r1                      1                       ...
                                                                            ...
                CMPI        r0                      NUM_OF_BYTES            ... % Check if all bytes were already sent...
                JLT         LOOP                                            ... % ...If not then send another character.
                                                                            ...
    WAIT_       JMP         WAIT                                            ...
];
end
