% Load symbolic constants (instructions)
Instructions
Addresses

% ROM code definition
RomCode =                        ...
[
 %    MOV  55     REG_A
 %    MOV  REG_A  REG_B
 %    MOV  66     a10h
 %    MOV  a10h   REG_C
 %    MOV  REG_C  a11h

    % MOV   B     REG_A
    % MOV   3     a10h
    % MOV   4     a11h
    % TPR   A     a10h
    % TPR   REG_A a11h

    IN    

    MOV   REG_A  REG_A
];
  % TPR   a(10) a(REG_A)

RomCode = Preprocessor(RomCode)

