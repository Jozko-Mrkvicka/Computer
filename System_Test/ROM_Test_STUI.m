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
				OFST		msb(c.RAM_START + 5)							... % Assign memory address.
				STUI		lsb(c.RAM_START + 5)	r0						... % Expected value: m(c.RAM_START + 5) == 0xBB
																			...
	LABEL_		JMP			LABEL											...
];

