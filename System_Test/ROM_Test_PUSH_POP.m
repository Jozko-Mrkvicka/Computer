%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% System test for instructions PUSH and POP.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch section
case 'LABEL'
Label = ...
{
    'LABEL'
};


case 'CODE'
SourceCode = ...
[
                MOVL        r0          0xAA        ... % Init registers r0 .. r3 to test values.
                MOVU        r0          0xAA        ...
                                                    ...
                MOVL        r1          0xBB        ...
                MOVU        r1          0xBB        ...
                                                    ...
                MOVL        r2          0xCC        ...
                MOVU        r2          0xCC        ...
                                                    ...
                MOVL        r3          0xDD        ...
                MOVU        r3          0xDD        ...
                                                    ...
                                                    ...
                PUSH        r0                      ... % Stash original values on stack.
                PUSH        r1                      ...
                PUSH        r2                      ...
                PUSH        r3                      ...
                                                    ...
                                                    ...
                MOVL        r0          0x44        ... % Set values of registers r0, r1, r2 and r3 to 0x4444.
                MOVU        r0          0x44        ...
                                                    ...
                MOVL        r1          0x44        ...
                MOVU        r1          0x44        ...
                                                    ...
                MOVL        r2          0x44        ...
                MOVU        r2          0x44        ...
                                                    ...
                MOVL        r3          0x44        ...
                MOVU        r3          0x44        ...
                                                    ...
                                                    ...
                POP         r3                      ... % Restore original values from stack.
                POP         r2                      ...
                POP         r1                      ...
                POP         r0                      ...
                                                    ...
                                                    ...
    LABEL_      JMP         LABEL                   ... % Expected results: r0 == 0xAAAA, r1 == 0xBBBB, r2 == 0xCCCC, r3 == 0xDDDD
];
end
