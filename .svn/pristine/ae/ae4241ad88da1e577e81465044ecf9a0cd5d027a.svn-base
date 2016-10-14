package com.mtc.zljk.util.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mtc.zljk.util.common.PageData;
import com.mtc.zljk.util.dao.impl.DaoSupport;
import com.mtc.zljk.util.service.OrganService;

@Service
public class OrganServiceImpl implements OrganService {
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	public List<PageData> getOrgList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("SDOrganizationMapper.getOrgList", pd);
	}
	
	public List<PageData> getOrgListByRoleId(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("SDOrganizationMapper.getOrgListByRoleId", pd);
	}
	
	

}
