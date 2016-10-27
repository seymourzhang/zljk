package com.mtc.zljk.util.service;

import com.mtc.zljk.util.common.PageData;

import java.util.List;

public interface OrganService {
	List<PageData> getOrgList(PageData pd) throws Exception;
	List<PageData> getOrgListByRoleId(PageData pd) throws Exception;
	List<PageData> getFarmByUserId(PageData pd) throws Exception;
	List<PageData> getHouseListByUserId(PageData pd) throws Exception;

	/**
	 * 按user_id查询
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	List<PageData> selectOrgByUser(PageData pd) throws Exception;

    /***
     * 按user_id查询其下所有农场
     * @param pd
     * @return
     * @throws Exception
     */
    List<PageData> getFarmListByUserId(PageData pd) throws Exception;
}
