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
                MOVL        r4          0x58        ... 
                MOVU        r4          0x7F        ...
                                                    ...
                MOVL        r5          0x58        ...
                MOVU        r5          0x7F        ...
                                                    ...
                CMP         r4          r5          ... % Expected value: r4 == r5
                                                    ...
    LABEL_      JMP         LABEL                   ...
];

