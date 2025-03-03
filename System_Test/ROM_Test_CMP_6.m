%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction CMP system test.
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
                MOVL        r0          0xFF        ... % r0 = -1
                MOVU        r0          0xFF        ...
                                                    ...
                MOVL        r1          0x58        ... % r1 = 32600
                MOVU        r1          0x7F        ...
                                                    ...
                CMP         r0          r1          ... % Expected result for signed data:   r0 < r1
                                                    ... % Expected result for unsigned data: r0 > r1
    LABEL_      JMP         LABEL                   ...
];
end
