%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Keyboard interrupt system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch section
case 'LABEL'
Label = ...
{
    'LABEL'
};


case 'CODE'
SourceCode = ...
[
                MOVL        r7                      0b00001000      ... Interrupts enabling.
                SGMT        msb(IRQ_ENBL_REG)                       ...
                STLI        lsb(IRQ_ENBL_REG)       r7              ...
                                                                    ...
                MOVL        r1                      0xFF            ... Set r1 to some value just to show that this code is executed.
                MOVU        r1                      0xFF            ...
                                                                    ...
    LABEL_      JMP         LABEL                                   ... Expected value: r6 = 1 (r6 should be set by the keyboard IRQ handler placed on address IRQ_ADDR_KEYBOARD).
];
end
