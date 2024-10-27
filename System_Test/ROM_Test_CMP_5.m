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
                MOVL        r0          0xFF        ... % r0 = -1
                MOVU        r0          0xFF        ...
                                                    ...
                MOVL        r1          0x58        ... % r1 = 32600
                MOVU        r1          0x7F        ...
                                                    ...
                CMP         r1          r0          ... % Expected result for signed data:   r1 > r0
                                                    ... % Expected result for unsigned data: r1 < r0
    LABEL_      JMP         LABEL                   ...
];

