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
                MOVL        r0          0x58        ... % r0 = 32600
                MOVU        r0          0x7F        ...
                CMPI        r0          -1          ... % Expected result for signed data:   r0 > -1
                                                    ... % Expected result for unsigned data: r0 < 0xFFFF
    LABEL_      JMP         LABEL                   ...
];
end
