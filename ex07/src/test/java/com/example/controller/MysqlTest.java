package com.example.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.mapper.MessageMapper;
import com.example.mapper.MysqlMapper;
import com.example.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class) //���� SpringJUnit4ClassRunner.class import�Ѵ�.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class MysqlTest {
	@Autowired
	private UserMapper mapper;
	@Autowired
	private MessageMapper Mmapper;
	
	@Test
	public void list() { mapper.list(); }
	
}
