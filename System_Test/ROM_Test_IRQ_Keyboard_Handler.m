%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Keyboard interrupt system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
SourceCode = ...
[
                ADDI        r6          1        ... r6 counts how many times was the IRQ handler called.
                RET                              ... Return to main program.
];
