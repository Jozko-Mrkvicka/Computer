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
	set_param(Test_Name, 'StopTime', 'len')

	Output_Vect = 0;
	Input_Vect = transpose(Input_Vect);
	options = simset('SrcWorkspace', 'current');
    sim(Test_Name, [], options);
	Input_Vect = transpose(Input_Vect);
	Output_Vect = transpose(Output_Vect);
	result = isequal(Output_Vect, Expected_Vect);
	close_system(Test_Name);

	num_of_input_rows =  length(Input_Vect(:, 1));
	num_of_output_rows = length(Output_Vect(:, 1));
	num_of_expected_rows = num_of_output_rows;
	border = repmat('-', 1, length(Input_Vect(num_of_input_rows,:))*6 + 1);
	
	if (1 ~= num_of_output_rows)
		Output_Vect = transpose(Output_Vect);
	end

	if (1 == result)
		fprintf('PASS\n')
	else
		fprintf('FAIL')
	end

	if ((1 == show_results) || (0 == result))
		fprintf('\n+--------------------+%s+', border)
		for (i = 2:num_of_input_rows)
			fprintf('\n|    Input Vector %2d | ', i - 1)
			fprintf('%5d ', Input_Vect(i, :))
			fprintf('|')
		end

		fprintf('\n+--------------------+%s+', border)
		for (i = 1:num_of_output_rows)
			fprintf('\n|   Output Vector %2d | ', i)
			fprintf('%5d ', Output_Vect(i, :))
			fprintf('|')
		end

		fprintf('\n+--------------------+%s+', border)
		for (i = 1:num_of_expected_rows)
			fprintf('\n| Expected Vector %2d | ', i)
			fprintf('%5d ', Expected_Vect(i, :))
			fprintf('|')
		end

		fprintf('\n+--------------------+%s+', border)
		fprintf('\n\n')
	end
end

