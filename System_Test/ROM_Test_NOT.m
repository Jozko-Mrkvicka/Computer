%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction NOT system test.
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
                MOVL        r0          0x00        ... % Test 1, expected result: r0 == 0xFFFF
                MOVU        r0          0x00        ...
                NOT         r0                      ...
                                                    ...
                MOVL        r1          0x55        ... % Test 2, expected result: r0 == 0xAAAA
                MOVU        r1          0x55        ...
                NOT         r1                      ...
                                                    ...
                MOVL        r2          0xFF        ... % Test 3, expected result: r0 == 0x0000
                MOVU        r2          0xFF        ...
                NOT         r2                      ...
                                                    ...
    LABEL_      JMP         LABEL                   ...
];
end
