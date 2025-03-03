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
                MOVL        r0          0           ... 
                MOVU        r0          0           ...
                CMPI        r0          -1          ... % Expected result for signed data:   r0 > -1
                                                    ... % Expected result for unsigned data: r0 < 0xFFFF
    LABEL_      JMP         LABEL                   ...
];
end
