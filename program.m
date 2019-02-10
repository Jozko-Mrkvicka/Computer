Instructions
Addresses

test_01 =             ...
[
   MOV  768    8
   MOV  8      768
   MOV  REG_A  0
   MOV  a10h   REG_B
   MOV  a03h   aF0h
   MOV  REG_D  aF1h
   17   REG_A  REG_B
];

test_02 =             ...
[
   MOV  0      REG_A
   MOV  REG_A  REG_A
   MOV  a00h   REG_A
   MOV  0      a00h
   MOV  REG_A  a00h
];


machine_code = Preprocessor(test_02)

