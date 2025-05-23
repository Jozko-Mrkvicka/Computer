%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction MOVU system test.
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
                MOVL        r0          0x00        ... 
                MOVU        r0          0x00        ...
                MOVU        r0          0xBB        ... % Expected value: r0 == 0xBB00
                                                    ...
                MOVL        r1          0xFF        ...
                MOVU        r1          0xFF        ...
                MOVU        r1          0xBB        ... % Expected value: r1 == 0xBBFF
                                                    ...
    LABEL_      JMP         LABEL                   ...
];
end
