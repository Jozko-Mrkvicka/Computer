%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction CMP system test.
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
                MOVL        r0          0x00        ... % r0 = 0
                MOVU        r0          0x00        ...
                                                    ...
                MOVL        r1          0xFF        ... % r1 = -1
                MOVU        r1          0xFF        ...
                                                    ...
                CMP         r0          r1          ... % Expected result for signed data:   r0 > r1
                                                    ... % Expected result for unsigned data: r0 < r1
    LABEL_      JMP         LABEL                   ...
];

