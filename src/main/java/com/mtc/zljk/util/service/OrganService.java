package com.mtc.zljk.util.service;

import java.util.List;

import com.mtc.zljk.util.common.PageData;

public interface OrganService {
	public List<PageData> getOrgList(PageData pd) throws Exception;
	public List<PageData> getOrgListByRoleId(PageData pd) throws Exception;
}