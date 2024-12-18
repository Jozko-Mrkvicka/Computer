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
                MOVL        r7                      0b00001000      ... Interrupts enabling.
                SGMT        msb(c.IRQ_ENBL_REG)                     ...
                STLI        lsb(c.IRQ_ENBL_REG)     r7              ...
                                                                    ...
                MOVL        r1                      0xFF            ... Set r1 to some value just to show that this code is executed.
                MOVU        r1                      0xFF            ...
                                                                    ...
    LABEL_      JMP         LABEL                                   ... Expected value: r6 = 1 (r6 should be set by the keyboard IRQ handler placed on address IRQ_ADDR_KEYBOARD).
];

