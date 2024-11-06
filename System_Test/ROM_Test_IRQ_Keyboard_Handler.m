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
                ADDI        r0          1        ... r0 counts how many times was the IRQ handler called.
                RET                              ... Return to main program.
];

