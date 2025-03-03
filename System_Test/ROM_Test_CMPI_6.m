%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction CMPI system test.
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
                CMPI        r0          -128        ... % Expected result for signed data:   r0 > -128
                                                    ... % Expected result for unsigned data: r0 > -128
    LABEL_      JMP         LABEL                   ...
];
end
