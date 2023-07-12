%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction LDLI system test.
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
                MOVL        r0                      hAA                     ... % Assign data to store/load.
                MOVU        r0                      hBB                     ...
                                                                            ...
                OFST        msb(c.RAM_START + 5)                            ... % Assign memory address.
                STLI        lsb(c.RAM_START + 5)    r0                      ...
                                                                            ...
                LDLI        r1                      lsb(c.RAM_START + 5)    ... % Expected value: r1 == 0x00AA
                                                                            ...
    LABEL_      JMP         LABEL                                           ...
];

