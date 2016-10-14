/**
 *
 * MTC-上海农汇信息科技有限公司
 * Copyright © 2015 农汇 版权所有
 */
package com.mtc.zljk.Alidayu.service;

import java.util.List;

import com.mtc.zljk.Alidayu.entity.SBCallMain;
import com.mtc.zljk.Alidayu.entity.mapper.SBCallMainMapper;
import com.mtc.zljk.Alidayu.entity.mapper.SBCallMainMapperCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 
 * @author lx
 *
 */
@Service
public class SBCallMainService {
	
	@Autowired
	private SBCallMainMapper mainMapper;
	@Autowired
	private SBCallMainMapperCustom mainMapperCustom;
	
	
	public SBCallMain selectCallMainByParams(int farmId, int houseId, String tempId){
		return mainMapperCustom.selectCallMainByParams( farmId, houseId, tempId);
	}


	public int insert(SBCallMain callMain) {
		// TODO Auto-generated method stub
		return mainMapper.insert(callMain);
	}


	public List<SBCallMain> getNeedCallMainInfo() {
		// TODO Auto-generated method stub
		return mainMapperCustom.getNeedCallMainInfo();
	}


	public int updateSBCallMain(SBCallMain main) {
		// TODO Auto-generated method stub
		return mainMapperCustom.updateByPrimaryKey(main);
	}


	public int updateSBCallMainCallTimes(SBCallMain main) {
		// TODO Auto-generated method stub
		return mainMapperCustom.updateSBCallMainCallTimes(main);
	}
	
}









