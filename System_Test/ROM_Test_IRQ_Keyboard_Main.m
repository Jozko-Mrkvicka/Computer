%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Keyboard interrupt system test
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
                MOVL        r1          0xFF        ... Set r1 to some value just to show that this code is executed.
                MOVU        r1          0xFF        ...
                                                    ...
    LABEL_      JMP         LABEL                   ... Expected value: r0 = 1 (r0 should be set by the keyboard IRQ handler placed on address 0xFF).
];

