%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The BYTE datatype system test
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
    BYTE    'DONT_COPY_ME_0'  {48};
    BYTE    'DONT_COPY_ME_1'  {48};
    BYTE    'DONT_COPY_ME_2'  {48};
    BYTE    'DONT_COPY_ME_3'  {48};

    BYTE    'CONST_0'         {101};
    BYTE    'CONST_1'         {102};
    BYTE    'CONST_2'         {103};
    BYTE    'CONST_3'         {int8(-128), int8(-1), 1, 127, 128, 255};
    BYTE    'CONST_4'         {104};
    BYTE    'CONST_5'         {105};

    TEXT    'TXT1'            {'The 9000 series is the most reliable computer ever made.'};
};


case 'CODE'
NUM_OF_BYTES = 6;
SourceCode = ...
[                                                                           ...
                MOVL        r0                      lsb(CONST_3)            ... Assign source address.
                MOVU        r0                      msb(CONST_3)            ...
                MOVL        r1                      lsb(RAM_START)          ... Assign destination address.
                MOVU        r1                      msb(RAM_START)          ...
                MOVL        r4                      0                       ... Counter
                                                                            ...
    LOOP_       LDL         r2                      m(r0)                   ... Copy one byte from ROM to RAM.
                STL         r1                      r2                      ...
                                                                            ...
                ADDI        r0                      1                       ... Move pointer to next byte.
                ADDI        r1                      1                       ...
                ADDI        r4                      1                       ...
                                                                            ...
                CMPI        r4                      NUM_OF_BYTES            ... % Check if all bytes were already sent...
                JLT         LOOP                                            ... % ...If not then send another character.
                                                                            ...
    WAIT_       JMP         WAIT                                            ...
];
end
