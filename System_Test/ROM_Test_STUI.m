label = ...
{
	'LABEL'
};
for (idx = 1:size(label))
	eval([char(label(idx)),'  = bitor(c.LABEL_SRC_PREFIX,  idx);']);
	eval([char(label(idx)),'_ = bitor(c.LABEL_DEST_PREFIX, idx);']);
end
c.LBL_CNT = idx;


SourceCode = ...
[
				MOVL		r0						hAA						... % Assign data to store.
				MOVU		r0						hBB						...
																			...
				MOVL		r1						c.RAM_START + h05		... % Assign memory address.
				MOVU		r1						h00						...
																			...
				STOREI		m(c.RAM_START + h05)	r0						... % Expected value: m(c.RAM_START + h05) == 0xBBAA
																			...
	LABEL_		JMP			LABEL											...
];
