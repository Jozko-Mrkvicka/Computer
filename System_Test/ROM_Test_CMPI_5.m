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
                MOVL        r0          0x58        ... % r0 = 32600
                MOVU        r0          0x7F        ...
                CMPI        r0          -1          ... % Expected result for signed data:   r0 > -1
                                                    ... % Expected result for unsigned data: r0 < 0xFFFF
    LABEL_      JMP         LABEL                   ...
];

