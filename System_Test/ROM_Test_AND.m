%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Instruction AND system test.
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
                MOVL        r0          0x00        ... % Test 1, expected result: r0 == 0x0000
                MOVU        r0          0x00        ...
                AND         r0          r0          ...
                                                    ...
                MOVL        r1          0xFF        ... % Test 2, expected result: r1 == 0xFFFF
                MOVU        r1          0xFF        ...
                AND         r1          r1          ...
                                                    ...
                MOVL        r2          0x00        ... % Test 3, expected result: r2 == 0x0000
                MOVU        r2          0x00        ...
                MOVL        r3          0xFF        ...
                MOVU        r3          0xFF        ...
                AND         r2          r3          ...
                                                    ...
                MOVL        r4          0xAA        ... % Test 4, expected result: r5 == 0xAAAA
                MOVU        r4          0xAA        ...
                MOVL        r5          0xFF        ...
                MOVU        r5          0xFF        ...
                AND         r5          r4          ...
                                                    ...
    LABEL_      JMP         LABEL                   ...
];
end
