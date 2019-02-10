% Load symbolic constants (instructions)
Instructions
Addresses

% ROM code definition
RomCode =                        ...
[
    MOV  10     REG_A
    MOV  3      REG_B
    ADD  50     REG_B
    ADD  REG_A  REG_B
    ADD  0      REG_B
    ADD  0      REG_B
];

RomCode = Preprocessor(RomCode)

