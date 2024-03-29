%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction STL system test.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
label = ...
{
    'LABEL'
};
for (idx = 1:size(label))
    eval([char(label(idx)),'  = bitor(c.LABEL_SRC_PREFIX,  idx);']);
    eval([char(label(idx)),'_ = bitor(c.LABEL_DEST_PREFIX, idx);']);
end
c.LBL_CNT = idx;


SourceCode = ...
[
                MOVL        r0          h11                     ... % Init test data.
                MOVU        r0          h22                     ...
                MOVL        r1          h33                     ...
                MOVU        r1          h44                     ...
                MOVL        r2          h55                     ...
                MOVU        r2          h66                     ...
                MOVL        r3          h77                     ...
                MOVU        r3          h88                     ...
                                                                ...
                MOVL        r4          lsb(c.RAM_START + 0)    ... % Set memory to value 0x11.
                MOVU        r4          msb(c.RAM_START + 0)    ...
                STL         m(r4)       r0                      ...
                                                                ...
                MOVL        r4          lsb(c.RAM_START + 255)  ... % Set memory to value 0x33.
                MOVU        r4          msb(c.RAM_START + 255)  ...
                STL         m(r4)       r1                      ...
                                                                ...
                MOVL        r4          lsb(c.RAM_START + 256)  ... % Set memory to value 0x55.
                MOVU        r4          msb(c.RAM_START + 256)  ...
                STL         m(r4)       r2                      ...
                                                                ...
                MOVL        r4          lsb(c.RAM_START + 511)  ... % Set memory to value 0x77.
                MOVU        r4          msb(c.RAM_START + 511)  ...
                STL         m(r4)       r3                      ...
                                                                ...
    LABEL_      JMP         LABEL                               ...
];
