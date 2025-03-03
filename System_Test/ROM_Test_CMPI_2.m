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
                MOVL        r0          -1          ... 
                CMPI        r0          -1          ... % Expected value: r0 == -1
                                                    ...
    LABEL_      JMP         LABEL                   ...
];
end
