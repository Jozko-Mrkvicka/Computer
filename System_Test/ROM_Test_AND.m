%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction AND system test.
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
                MOVL        r0          h00         ... % Test 1, expected result: r0 == 0x0000
                MOVU        r0          h00         ...
                AND         r0          r0          ...
                                                    ...
                MOVL        r1          hFF         ... % Test 2, expected result: r1 == 0xFFFF
                MOVU        r1          hFF         ...
                AND         r1          r1          ...
                                                    ...
                MOVL        r2          h00         ... % Test 3, expected result: r2 == 0x0000
                MOVU        r2          h00         ...
                MOVL        r3          hFF         ...
                MOVU        r3          hFF         ...
                AND         r2          r3          ...
                                                    ...
                MOVL        r4          hAA         ... % Test 4, expected result: r5 == 0xAAAA
                MOVU        r4          hAA         ...
                MOVL        r5          hFF         ...
                MOVU        r5          hFF         ...
                AND         r5          r4          ...
                                                    ...
    LABEL_      JMP         LABEL                   ...
];

