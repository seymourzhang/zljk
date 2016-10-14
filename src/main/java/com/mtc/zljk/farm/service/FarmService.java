package com.mtc.zljk.farm.service;

import java.util.List;

import com.mtc.zljk.util.common.Page;
import com.mtc.zljk.util.common.PageData;

/**
 * Created by LeLe on 6/30/2016.
 */
public interface FarmService {
    
    /**
     * 按条件查询
     * @param pd
     * @return List<SDFarm>
     * @throws Exception
     */
	List<PageData> selectByCondition(PageData pd) throws Exception;
	
	/**
     * 查询全部
     * @param pd
     * @return List<SDFarm>
     * @throws Exception
     */
	List<PageData> selectAll() throws Exception;
	
	/**
     * 根据条件查询栋舍
     * @param pd
     * @return List<SDFarm>
     * @throws Exception
     */
	List<PageData> selectHouseByCondition(PageData pd) throws Exception;
	
	/**
     * 根据ID查询栋舍
     * @param pd
     * @return List<SDFarm>
     * @throws Exception
     */
	List<PageData> selectHouseById(PageData pd) throws Exception;
	
	/**
     * 查询农场栋舍批次
     * @param pd
     * @return List<SDFarm>
     * @throws Exception
     */
	List<PageData> selectBatchByCondition(PageData pd) throws Exception;
	
	public List<PageData> findFarm(PageData pd) throws Exception;
	public List<PageData> findHouse(PageData pd) throws Exception;
	
	public List<PageData> findBatchlistPage(Page page) throws Exception;
	
	public List<PageData> findCode(PageData pd) throws Exception;
	
	public List<PageData> findAreaChina(PageData pd) throws Exception;
	
	public List<PageData> findDevice(PageData pd) throws Exception;
	
	public List<PageData> findHouseDevice(PageData pd) throws Exception;
	
	public PageData isBatchHouseNull(PageData pd) throws Exception;
	
	
	
	public int saveFarm(PageData pd)throws Exception;
	
	public void editFarm(PageData pd) throws Exception;
	
	public int saveBatch(PageData pd)throws Exception;
	
	public void editBatch(PageData pd) throws Exception;
	
	public int saveHouse(PageData pd)throws Exception;
	
	public void editHouse(PageData pd) throws Exception;
	
	public int saveHouseAlarm(PageData pd)throws Exception;
	
	public int saveDeviHouse(PageData pd)throws Exception;
	
	public void delDeviHouse(PageData pd) throws Exception;
	
	
	
	
	
	
	
	
	
	

}
