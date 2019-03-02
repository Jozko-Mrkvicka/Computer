%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This function tests a simulink model. It passes an input
% vector to the model, then takes output vector from the model
% and finally compare these two vectors. If vectors are
% same then the test passed else failed. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function result = test(Test_Name, Input_Vect, Expected_Vect)
	fprintf('### %s: ', Test_Name)
	show_results = 0;
	
	load_system(Test_Name);
	len = length(Input_Vect(1,:)) - 1;
	num_of_rows = length(Input_Vect(:, 1));
	set_param(Test_Name, 'StopTime', 'len')

	Output_Vect = 0;
	Input_Vect = transpose(Input_Vect);
	options = simset('SrcWorkspace', 'current');
    sim(Test_Name, [], options);
	Input_Vect = transpose(Input_Vect);
	Output_Vect = transpose(Output_Vect);
	result = isequal(Output_Vect, Expected_Vect);
	close_system(Test_Name);

	border2 = repmat('-', 1, length(Input_Vect)*6 + 1);
	if (1 == result)
		fprintf('PASS\n')
	else
		fprintf('FAIL')
	end

	if ((1 == show_results) || (0 == result))
		if (3 == num_of_rows)
			fprintf('\n+-----------------+%s+', border2)
			fprintf('\n| Address Vector  | ')
			fprintf('%5d ', Input_Vect(2, :))
			fprintf('|')
			fprintf('\n| Data Vector     | ')
			fprintf('%5d ', Input_Vect(3, :))
			fprintf('|')
		else
			fprintf('\n+-----------------+%s+', border2)
			fprintf('\n| Input Vector    | ')
			fprintf('%5d ', Input_Vect(2, :))
			fprintf('|')
		end
		fprintf('\n+-----------------+%s+', border2)
		fprintf('\n| Output Vector   | ')
		fprintf('%5d ', Output_Vect(:))
		fprintf('|')
		fprintf('\n| Expected Vector | ')
		fprintf('%5d ', Expected_Vect(:))
		fprintf('|')
		fprintf('\n+-----------------+%s+', border2)
		fprintf('\n\n')
	end
end

