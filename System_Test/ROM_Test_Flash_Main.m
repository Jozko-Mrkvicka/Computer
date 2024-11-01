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
                MOVL        r0          0xBA        ... r0 = ABBA
                MOVU        r0          0xAB        ...
                                                    ...
                MOVL        r1          0x00        ... r1 should be overwritten with the function placed on address 0xFF.
                MOVU        r1          0x00        ...
                                                    ...
                JMP         0x00FF                  ... Jump to absolute address 0xFF where is placed second part of the test.
                                                    ...
    LABEL_      JMP         LABEL                   ...
];

