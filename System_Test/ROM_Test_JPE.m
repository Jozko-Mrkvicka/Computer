%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction JPE system test.
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
                MOVL        r0          0x11        ... % r0 = 0x1111
                MOVU        r0          0x11        ...
                CMP         r0          r0          ...
                JPE         LABEL                   ...
                                                    ...
                MOVL        r0          0xFF        ... % r0 = 0xFFFF
                MOVU        r0          0xFF        ...
                                                    ...
    LABEL_      JMP         LABEL                   ... % Expected result: r0 == 0x1111
];

