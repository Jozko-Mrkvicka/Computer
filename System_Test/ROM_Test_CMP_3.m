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
                MOVL        r4          0x58        ... 
                MOVU        r4          0x7F        ...
                                                    ...
                MOVL        r5          0x58        ...
                MOVU        r5          0x7F        ...
                                                    ...
                CMP         r4          r5          ... % Expected value: r4 == r5
                                                    ...
    LABEL_      JMP         LABEL                   ...
];
end
