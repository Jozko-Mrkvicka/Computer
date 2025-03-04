%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction STLI system test.
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
                MOVL        r0                      0xAA                    ... % Assign data to store.
                MOVU        r0                      0xBB                    ...
                                                                            ...
                SGMT        msb(RAM_START + 5)                              ... % Assign memory address.
                STLI        lsb(RAM_START + 5)      r0                      ... % Expected value: m(RAM_START + 5) == 0xAA
                                                                            ...
    LABEL_      JMP         LABEL                                           ...
];
end
