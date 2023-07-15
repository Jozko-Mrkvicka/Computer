for (idx = 1:size(Label))
    eval([char(Label(idx)),'  = bitor(c.LABEL_SRC_PREFIX,  idx);']);
    eval([char(Label(idx)),'_ = bitor(c.LABEL_DEST_PREFIX, idx);']);
end
c.LBL_CNT = idx;