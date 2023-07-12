%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% System test runner.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear
global gDebug
% gDebug = true;  % Check also Preprocessor.m for "gDebug"
gDebug = false;

Test_NOT
Test_XOR
Test_OR
Test_AND

Test_LDLI
Test_LDUI
Test_LDL
Test_LDU
Test_STLI
Test_STUI
Test_STL
Test_STU
Test_MOV
Test_MOVL
Test_MOVU

Test_CMP_1
Test_CMP_2
Test_CMP_3
Test_CMP_4
Test_CMP_5
Test_CMP_6
Test_CMPI_1
Test_CMPI_2
Test_CMPI_3
Test_CMPI_4
Test_CMPI_5
Test_CMPI_6
Test_ADD
Test_ADDI
Test_SHIFT
Test_SHIFTI

Test_JMP
Test_JPE
Test_JLT

Test_PUSH_POP
Test_CALL_RET

% Test_U16
% Test_S16
% Test_CHR