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
                CMPI        r0          0           ... % Expected value: r0 == 0
                                                    ...
    LABEL_      JMP         LABEL                   ...
];
end
