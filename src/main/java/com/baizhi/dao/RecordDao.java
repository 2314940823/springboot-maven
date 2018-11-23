package com.baizhi.dao;


import com.baizhi.entity.Record;

import java.util.List;

public interface RecordDao {
	
	public List<Record> selectAll(int aid);
	
	public void insert(Record record);


}
