%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction CMPI system test.
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
                CMPI        r0          -128        ... % Expected result for signed data:   r0 > -128
                                                    ... % Expected result for unsigned data: r0 > -128
    LABEL_      JMP         LABEL                   ...
];

