%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GP Timer system test.
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
                SGMT        msb(c.TIMER_BASE_ADDR)                                          ... % Store Timer base address.
                                                                                            ...
                MOVL        r0                                      0x05                    ... % Configure start value.
                STLI        lsb(c.CMD_TIMER_SET_START_VALUE)        r0                      ...
                                                                                            ...
                MOVL        r0                                      0xFF                    ... % Configure stop value.
                STLI        lsb(c.CMD_TIMER_SET_STOP_VALUE)         r0                      ...
                                                                                            ...                
                MOVL        r0                                      c.TIMER_FREE_RUN        ... % Configure free run mode.
                STLI        lsb(c.CMD_TIMER_MODE)                   r0                      ...
                                                                                            ...
                MOVL        r0                                      c.TIMER_RUN             ... % Start timer.
                STLI        lsb(c.CMD_TIMER_RUN)                    r0                      ...
                                                                                            ...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                ADDI        r0                                      0x00                    ... % Do nothing, wait...
                                                                                            ...
                LDLI        r0                                      lsb(c.TIMER_BASE_ADDR)  ... % Expected result r0 = 14.
                                                                                            ...
    LABEL_      JMP         LABEL                                                           ...
];
