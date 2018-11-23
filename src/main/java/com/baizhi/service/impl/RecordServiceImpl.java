package com.baizhi.service.impl;

import com.baizhi.dao.RecordDao;
import com.baizhi.entity.Record;
import com.baizhi.service.RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
@Transactional
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordDao recordDao;


	public List<Record> selectAll(int aid) {
		return recordDao.selectAll(aid);
	}

	public void add(Record record) {
		recordDao.insert(record);
	}

	@Override
	public void delete(int id) {

	}
}
