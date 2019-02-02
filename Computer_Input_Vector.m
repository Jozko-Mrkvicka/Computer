% include  instruction definitions
Instructions

Time =            [  0,   1,   2,   3,   4];
Process =         [  0,   0,   0,   1,   0];
Register_Select = [  2,   1,   0,   0,   0];

Input_Vector = [Time; Process; Register_Select];

save('Computer_Input_Vector.mat', 'Input_Vector');
