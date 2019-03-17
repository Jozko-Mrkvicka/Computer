Instructions
Addresses

External_Memory =             ...
[
   100 101 102
];

Pointer_to_External_Memory = 1;

test_02 =             ...
[
   MOV  0      REG_A
   MOV  REG_A  REG_A
   MOV  a00h   REG_A
   MOV  0      a00h
   MOV  REG_A  a00h
];


machine_code = Preprocessor(test_02)

