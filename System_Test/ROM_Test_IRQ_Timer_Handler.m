%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Timer interrupt system test
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
switch section
case 'CODE'
SourceCode = ...
[
                ADDI        r5          1        ... r5 counts how many times was the IRQ handler called.
                RET                              ... Return to main program.
];
end
