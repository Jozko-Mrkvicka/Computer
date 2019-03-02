% include instruction definitions
Instructions

Time =            [  0,   1,   2,   3,   4];
Data_In =         [ADD,  15,  12,   0,   0];
Process =         [  0,   0,   0,   1,   0];
Register_Select = [  2,   1,   0,   0,   0];

Input_Vector = [Time; Data_In; Process; Register_Select];

save('Test/Test_ALU.mat', 'Input_Vector');
