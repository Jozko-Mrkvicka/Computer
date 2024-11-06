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
                MOVL        r0          0xFF        ... 
                MOVU        r0          0xFF        ... Expected value r0 = 0xFFFF
                                                    ...
    LABEL_      JMP         LABEL                   ... Expected value r0 = 0xABBA (r0 should be overwritten with the keyboard IRQ handler placed on address 0xFF).
];

