%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction MOV system test.
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
                MOVL        r0          0xAA        ... % Assign test value.
                MOVU        r0          0xBB        ...
                                                    ...
                MOV         r1          r0          ... % Expected value: r1 == 0xBBAA
                                                    ...
    LABEL_      JMP         LABEL                   ...
];
end
