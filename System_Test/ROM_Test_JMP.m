%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction JMP system test.
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
                MOVL        r0          0x11        ... % r0 = 0x1111
                MOVU        r0          0x11        ...
                JMP         LABEL                   ...
                                                    ...
                MOVL        r0          0xFF        ... % r0 = 0xFFFF
                MOVU        r0          0xFF        ...
                                                    ...
    LABEL_      JMP         LABEL                   ... % Expected result: r0 == 0x1111
];
end
