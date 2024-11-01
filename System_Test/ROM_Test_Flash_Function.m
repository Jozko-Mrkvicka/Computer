%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
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
                MOVL        r1          0xEF        ... r0 = BEEF
                MOVU        r1          0xBE        ...
                JMP         0x0006                  ... Return to main program.
];

