package com.hs.main.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.hs.home.controller.UserInfo;

@Service("mainService")
public class MainService {
	
	@Inject
	private SqlSession sqlSession; 
	
}