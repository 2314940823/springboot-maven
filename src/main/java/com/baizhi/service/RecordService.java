package com.baizhi.service;


import com.baizhi.entity.Record;

import java.util.List;

public interface RecordService {
	
	public List<Record> selectAll(int aid);
	
	public void add(Record record);

	public void delete(int id);
}
