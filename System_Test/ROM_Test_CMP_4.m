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
                MOVL        r0          0x00        ... % r0 = 0
                MOVU        r0          0x00        ...
                                                    ...
                MOVL        r1          0xFF        ... % r1 = -1
                MOVU        r1          0xFF        ...
                                                    ...
                CMP         r0          r1          ... % Expected result for signed data:   r0 > r1
                                                    ... % Expected result for unsigned data: r0 < r1
    LABEL_      JMP         LABEL                   ...
];
end
